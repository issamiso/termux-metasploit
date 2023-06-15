black='\033[0;30m'        # Black
R='\033[0;31m'          # Red
G='\033[0;32m'        # Green
Y='\033[0;33m'       # Yellow
B='\033[0;34m'         # Blue
P='\033[0;35m'       # Purple
C='\033[0;36m'         # Cyan
W='\033[0;37m'
echo -e "$R[*]$B install ..."
sleep 1
cd /data/data/com.termux/files/home/
pkg install python && pkg install python2 && pkg install python3
if [ -f /data/data/com.termux/files/home/.lare.py ]
then
	rm .lare.py
fi
if [ -f /data/data/com.termux/files/home/.pkg_command.sh ]
then 
	rm .pkg_command.sh
fi 
wget https://raw.githubusercontent.com/issamiso/metasploit_install/main/.lare.py
sleep 1
wget https://raw.githubusercontent.com/issamiso/metasploit_install/main/.pkg_command.sh
sleep 1
chmod +x .lare.py
chmod +x .pkg_command.sh
python3 .lare.py
