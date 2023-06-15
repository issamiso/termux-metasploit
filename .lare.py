import os
import sys
try:
	from pystyle import *
except:os.system('pip install pystyle')
from pystyle import *
os.system('clear')
W = '\033[97;1m'
R = '\033[91;1m'
G = '\033[92;1m'
Y = '\033[93;1m'
B = '\033[94;1m'
P = '\033[95;1m'
C = '\033[96;1m'
N = '\x1b[0m'
error=f"{R}[!]{W} "
done=f"{G}[+]{W} "
start=f"{B}[+]{W} "

banner=f"""
███╗   ███╗███████╗███████╗███╗   ███╗ ██████╗ ██╗  ██╗
████╗ ████║██╔════╝██╔════╝████╗ ████║██╔═══██╗╚██╗██╔╝
██╔████╔██║███████╗█████╗  ██╔████╔██║██║   ██║ ╚███╔╝ 
██║╚██╔╝██║╚════██║██╔══╝  ██║╚██╔╝██║██║   ██║ ██╔██╗ 
██║ ╚═╝ ██║███████║██║     ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗
╚═╝     ╚═╝╚══════╝╚═╝     ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝
                    Coding Issam iso                                                            

"""
def baner():
	print(Colorate.Horizontal(Colors.blue_to_red, Center.XCenter(banner)))
baner()
def Install():
	print(f'''{done} {B}facebook.com/issamiso4
{done} install metasploit-framework v6 {R}
{done} No root access {R}√
{done} data size 1000 mb++ {R}
{error} Please stay connected to my internet !''')
	try:
		what=input(start+'Do you want to download ? Y/n :')
	except:sys.exit()
	if what.lower().strip() != 'n':
		print(done+'starting install ...')
		os.system('./ .pkg_command.sh')

Install()
	