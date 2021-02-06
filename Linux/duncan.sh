#!/bin/bash

if [ $(id -u) = 0 ]; then
    echo "Please don't run using sudo"
    exit
fi

outDir="$HOME/research"
outFile="${outDir}/sys_info.txt"
execFile="${outDir}/exec_list.txt"
suidFile="${outDir}/suid_list.txt"
auxFile="${outDir}/top_processes.txt"
sudoFile="${outDir}/sudo_users.txt"

dashedLine="---------------------------------------------------------------" 

if [ ! -d $outDir ]; then
    mkdir $outDir
    echo "Creating ${outDir} directory"
fi
# Printing title and date in next line doesn't append, implicitly overwrites previous output
echo "System Info - $(date)" > $outFile
echo "$dashedLine" >> $outFile

echo "Uname Info: $(uname -a)" >> $outFile
echo "IP Address: $(ip address | grep inet | grep -v 'inet6\|scope host\|docker')" >> $outFile
echo "Hostname: $(hostname -s)" >> $outFile

echo -e "$dashedLine" >> $outFile
echo "DNS info: " >> $outFile
cat /etc/resolv.conf | grep "nameserver " >> $outFile

echo -e "$dashedLine" >> $outFile
echo "Memory Info:" >> $outFile
echo -e "$(free -t)" >> $outFile

echo -e "$dashedLine" >> $outFile
echo "CPU Info:" >> $outFile
echo -e "$(lscpu)" >> $outFile

echo -e "$dashedLine" >> $outFile
echo "Disk Info:" >> $outFile
echo -e "$(df -h)" >> $outFile

echo -e "$dashedLine" >> ${outFile}
echo "Users Logged In:" >> ${outFile}
echo -e "$(who)" >> ${outFile}

find /home -type f -perm -a+x > $execFile && echo "$(cat ${execFile} | wc -l) lines written to ${execFile}"
find / -type f -perm -4000 2> /dev/null > $suidFile; echo "$(cat ${suidFile} | wc -l) lines written to ${suidFile}" 

echo -e "$dashedLine" >> $outFile
ps aux --sort -%mem | head -n 11 | awk -F ' ' '{printf "%10s\t%s\t%s\t%s\t%s\n", $1,$2,$3,$4,$11}' | tee $auxFile >> $outFile


echo -e "$dashedLine" >> $outFile
#make list of files to check permissions on
files=( 
    "/etc/passwd" 
    "/etc/shadow" 
)
for file in ${files[@]}; do 
    perms=$(ls -l $file | awk '{print $1}') # get permissions for file
    echo $perms $file >> $outFile # ouptput permissions and file 
done

echo -e "$dashedLine" >> $outFile
# run id and list all sudo abilities on all users with a home directory
for folder in $(ls -d /home/*/); do # for each directory in home 
    echo -e "$dashedLine" | tee -a $outFile $sudoFile > /dev/null
    echo $folder  | tee -a $outFile $sudoFile > /dev/null
    user=$(echo $folder | awk -F"/" '{print $3}') #get username from folder path
    if getent passwd $user > /dev/null 2>&1; then # if the user has an account
        id $user | tee -a $outFile $sudoFile > /dev/null
        sudo -l -U $user | tee -a $outFile $sudoFile > /dev/null
    else
        echo "Has no user account" | tee -a $outFile $sudoFile > /dev/null
    fi
done



echo "$(cat ${outFile} | wc -l) lines written to ${outFile}"
