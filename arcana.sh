#!/bin/sh
mkdir arcana_src
cd arcana_src;echo '''
def arcana():
	welcomemsg="┏━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n┃  ╭────╮  ┃   ┏━┓ ┏┓  ┏━╸ ┏━┓ ┏┓╻ ┏━┓                            ┃\n┃  │╭───╯  ┃   ┣━┫ ┣┻┓ ┃   ┣━┫ ┃┃┃ ┣━┫                            ┃\n┃  ╰╯      ┃   ╹ ╹ ╹ ╹ ┗━╸ ╹ ╹ ╹┗┛ ╹ ╹                            ┃\n┡━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━┯━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩\n│                     PROGRAMMER : Sh1d0re                        │\n│                        LICENSE : GPL-v3                         │\n│                       LANGUAGE : Python                         │\n└────────────────────────────────┴────────────────────────────────┘"
	print(welcomemsg)
	print("━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n[ 1: LOADING    PyP ] ┃ \x1b[31mEnter \x1b[31;1mControl&C\x1b[0;31m To Abort. Leave To Proceed.\x1b[0m")
	def importMsgs(status,prompt:str):
		for i in range(10-len(str(prompt))):prompt=" "+prompt
		if "error" in status:
			print("    "+prompt+" Module ┠╴\x1b[31mERROR\x1b[39;49m\n──────────────────────┸────────────────────────────────────────────\n\x1b[31m"+str(e)+"\x1b[0m")
			if "." in status:print("──────────────────────┰────────────────────────────────────────────")
			else:
				print("───────────────────────────────────────────────────────────────────\n\x1b[31;1mProgram aborted due to error. Try contacting the github repo if you see no solution.\x1b[0m\n")
				quit()
		elif "success" in status:
			if "." in status:print("    "+prompt+" Module ┖╴\x1b[32mSUCCESS\x1b[39;49m")
			else:print("    "+prompt+" Module ┠╴\x1b[32mSUCCESS\x1b[39;49m")
	try:import os
	except Exception as e:importMsgs("error","OS")
	importMsgs("success","OS")
	try:import random
	except Exception as e:importMsgs("error","Random")
	importMsgs("success","Random")
	try:import getpass
	except Exception as e:importMsgs("error","Getpass")
	importMsgs("success","Getpass")
	try:import time
	except Exception as e:importMsgs("error","Time")
	importMsgs("success","Time")
	try:import subprocess
	except Exception as e:importMsgs("error","Subprocess")
	importMsgs("success","Subprocess")
	try:from modules.b2eC import b2e,arcanaid
	except Exception as e:importMsgs("error","B2E-C")
	importMsgs("success","B2E-C")
	try:
		from pymongo.mongo_client import MongoClient
		from pymongo.server_api import ServerApi
	except Exception as e:
		importMsgs("error.","Pymongo")
		ask=input("     Install? [Y/N]:  ┠╴")
		if ask=="Y" or ask=="y":
			print("──────────────────────┸────────────────────────────────────────────")
			os.system("""python3 -m pip install "pymongo[srv]" """)
			print("──────────────────────┰────────────────────────────────────────────")
		else:importMsgs("error","Pymongo")
	importMsgs("success","Pymongo")
	try:from datetime import datetime
	except Exception as e:importMsgs("error","Datetime")
	importMsgs("success.","Datetime")
	print("━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n[ 2: PING    Server ] ┃ \x1b[31mEnter \x1b[31;1mControl&C\x1b[0m\x1b[31m To Abort. Leave To Proceed.\x1b[0m")
	uri="mongodb+srv://arcana_user:9LBprbqAJKnTfgeQ@arcana.c8ozcdl.mongodb.net/?retryWrites=true&w=majority&appName=arcana"
	try:
		client=MongoClient(uri, server_api=ServerApi("1"))
		client.admin.command("ping")
	except Exception as e:
		importMsgs("error.","Server")
		if "ssl" in str(e):
			ask=input(" Install SSLc? [Y/N]: ┠╴")
			if ask=="Y" or ask=="y":
				print("──────────────────────┸────────────────────────────────────────────")
				os.system("""bash modules/install_certifications.command""")
				print("──────────────────────┰────────────────────────────────────────────")
			else:importMsgs("error.","Server")
		print("                 Note ┖╴Check your internet, VPN, proxies, etc.\n\x1b[31;1mProgram aborted due to error. Try contacting the github repo if you see no solution.\x1b[0m\n")
		quit()
	importMsgs("success.","Server")
	while True:
		print("━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n[ 3: Arcana         ] ┃ Run \x1b[0;1m/help\x1b[0m Or Read \x1b[0;1mREADME.md\x1b[0m For Info.")
		cluster=""
		cluster=MongoClient(uri, server_api=ServerApi("1"))
		db,id_=cluster["arcana"]["messages"],""
		id_=input("           Enter Name ┃ ")
		identitypass=getpass.getpass(prompt="  Enter Identity Code ┃ ")
		id_=id_+" [ "+arcanaid.calculate_id(str(identitypass)+id_)+" ] "
		encode=getpass.getpass(prompt="   Enter Channel Code ┃ ")
		while True:
			os.system("clear")
			all,deltatime,date=db.find({}),str(datetime.now().strftime("%X")),str(datetime.now().strftime("%x"))
			delimiter,spaces="",""
			for msgs in all:
				if b2e.decode(str(encode),msgs["channel"])=="VALID":
					try:
						if b2e.decode(str(encode)+b2e.decode(str(encode),msgs["deltatime"]),msgs["date"])==str(datetime.now().strftime("%X")):dateP="Today - "+b2e.decode(str(encode),msgs["deltatime"])
						else:dateP=b2e.decode(str(encode)+b2e.decode(str(encode),msgs["deltatime"]),msgs["date"])+" - "+b2e.decode(str(encode),msgs["deltatime"])
						print(dateP+"\n"+b2e.decode(str(encode)+b2e.decode(str(encode),msgs["deltatime"]),msgs["id"])+": "+b2e.decode(str(encode)+b2e.decode(str(encode),msgs["deltatime"]),msgs["message"])+"\n")
					except:pass
				time.sleep(random.randint(10,100)/100000)
			userInput=input(">>> ")
			if userInput=="/exit":
				print("Exited Chat")
				os.system("clear")
				print(welcomemsg)
				break
			if userInput=="/help":
				print("       Outputing Help ┖╴")
				print(str(subprocess.getouput("cat README.md")))
			if userInput=="/identify":
				identify_name=input("User Name: ")
				identify_id=input("  User ID: ")
				identify_idcode=getpass.getpass(prompt="  ID CODE: ")
				if arcanaid.calculate_id(str(identify_idcode)+str(identify_name))==identify_id:print("Valid Code.")
				else:print("Code is not valid. Try checking for mistypes.")
			msg={"id": b2e.encode(str(encode)+str(deltatime),id_),"message":b2e.encode(str(encode)+str(deltatime),str(userInput)),"date":b2e.encode(str(encode)+str(deltatime),date),"deltatime":b2e.encode(str(encode),deltatime),"channel":b2e.encode(str(encode),"VALID")}
			db.insert_one(msg)
try: arcana()
except KeyboardInterrupt:print("\nAborted Program.")
except Exception as e:print("\x1b[31;1mProgram aborted due to error. This error is estimated to be caused by a program error or corruption. Please report it to the github repo [ https://github.com/sh1d0re/arcana ] for the dev team to fix the issue.\x1b[0m\n")
''' > main.py
mkdir modules
cd modules ; echo '''
# This script of b2eC is specifically and heavily modified for ARCANA. I would not reccomend any practical usages.
import math, random, string
def b2eRandint(seed):
	result=int(int(str(math.sqrt(seed)*int(seed)**5).replace(".","").replace("e+","").replace("0",""))**(6*int(str(seed)[:2])))
	return(result)
class b2e():
	def encode(public_key, text:str):
		finaltxt,key="",""
		for i in range(len(public_key)):key+=str(ord(str(public_key)[i]))
		key,text=str(b2eRandint(int(key))),list(text)
		for i in range(int(int(str(key)[10])+5)):text.insert(int(int(str(key)[i+30])),str(chr(705)))
		for i in range(len(text)):text[i]=str(int(ord(text[i]))+(int(str(key)[i])+int(str(key)[-5-i])**2))
		for i in range(len(text)):finaltxt+=chr(int(text[i]))
		return(finaltxt)
	def decode(public_key, text:str):
		finaltxt,key="",""
		for i in range(len(public_key)):key+=str(ord(str(public_key)[i]))
		key,text=str(b2eRandint(int(key))),list(text)
		for i in range(len(text)):text[i]=str(int(ord(text[i]))-(int(str(key)[i])+int(str(key)[-5-i])**2))
		for i in range(len(text)):
			try:finaltxt+=chr(int(text[i]))
			except Exception as e:break
		return(finaltxt.replace(chr(705),""))
class arcanaid():
	def calculate_id(text:str):
		finaltxt,encodetxt="","".join(string.ascii_letters+string.digits)
		random.seed(text)
		for i in range(10):finaltxt+=random.choice(encodetxt)
		return(finaltxt)''' > b2eC.py
echo '''#!/bin/sh
/Library/Frameworks/Python.framework/Versions/3.10/bin/python3.10 << "EOF"
# install_certifi.py
#
# sample script to install or update a set of default Root Certificates
# for the ssl module.  Uses the certificates provided by the certifi package:
#       https://pypi.org/project/certifi/
import os
import os.path
import ssl
import stat
import subprocess
import sys
STAT_0o775 = ( stat.S_IRUSR | stat.S_IWUSR | stat.S_IXUSR
             | stat.S_IRGRP | stat.S_IWGRP | stat.S_IXGRP
             | stat.S_IROTH |                stat.S_IXOTH )
def main():
    openssl_dir, openssl_cafile = os.path.split(
        ssl.get_default_verify_paths().openssl_cafile)
    print(" -- pip install --upgrade certifi")
    subprocess.check_call([sys.executable,
        "-E", "-s", "-m", "pip", "install", "--upgrade", "certifi"])
    import certifi
    # change working directory to the default SSL directory
    os.chdir(openssl_dir)
    relpath_to_certifi_cafile = os.path.relpath(certifi.where())
    print(" -- removing any existing file or link")
    try:os.remove(openssl_cafile)
    except FileNotFoundError:pass
    print(" -- creating symlink to certifi certificate bundle")
    os.symlink(relpath_to_certifi_cafile, openssl_cafile)
    print(" -- setting permissions")
    os.chmod(openssl_cafile, STAT_0o775)
    print(" -- update complete")
if __name__ == "__main__":
    main()
EOF''' > install_certifications.command
echo '''True''' > .installation.txt
clear ; cd .. ; python3 main.py
