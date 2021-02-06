path= pwd
echo "$path"

var= ip addr | grep inet | tail -2 | head -1
echo "$var"

var2= find /home -type f -perm 777
echo "$var2"


if [ $(whoami) = "root" ]
then
echo "You should not be the the root user!"
exit
fi

if [ ! -d ~/Desktop/research ]
then
	mkdir ~/Desktop/research
fi

if [ -f ~/Desktop/research/sys_info.txt ]
then
	rm -f ~/Desktop/research/sys_info.txt
fi
