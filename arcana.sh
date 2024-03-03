echo '''
print("┏━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n┃  ╭────╮  ┃   ┏━┓ ┏┓  ┏━┓ ┏━╸ ┏━┓ ┏┓╻ ┏━┓                        ┃\n┃  │╭───╯  ┃   ┣━┫ ┣┻┓ ┣━┫ ┃   ┣━┫ ┃┃┃ ┣━┫                        ┃\n┃  ╰╯      ┃   ╹ ╹ ╹ ╹ ╹ ╹ ┗━╸ ╹ ╹ ╹┗┛ ╹ ╹                        ┃\n┡━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━┯━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩\n│                     PROGRAMMER : Sh1d0re                        │\n│                        LICENSE : GPL-v3                         │\n│                       LANGUAGE : Python                         │\n└────────────────────────────────┴────────────────────────────────┘")
print("━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n[ 1: LOADING    PyP ] ┃ \x1b[31mEnter \x1b[31;1mControl&C\x1b[0m\x1b[31m To Abort. Leave To Proceed.\x1b[0m")
def loadmsgs(status,prompt:str):
	if status=="error":print("                Error ┖╴\x1b[31m"+str(prompt)+"\nProgram aborted. Contact developer at github repository or admin.")
	if status=="success":print("    "+prompt+" Module ┠╴\x1b[32mSUCCESS\x1b[39;49m")
try:import os
except Exception as e:
	loadmsgs("error",str(e))
	quit()
loadmsgs("success","        OS")
try:import random
except Exception as e:
	loadmsgs("error",str(e))
	quit()
loadmsgs("success","    Random")
try:import getpass
except Exception as e:
	loadmsgs("error",str(e))
	quit()
loadmsgs("success","   Getpass")
try:import time
except Exception as e:
	loadmsgs("error",str(e))
	quit()
loadmsgs("success","      Time")
try:import subprocess
except Exception as e:
	loadmsgs("error",str(e))
	quit()
loadmsgs("success","Subprocess")
try:from b2eC.b2eC import b2e,arcanaid
except Exception as e:
	print("                Error ┖╴\x1b[31m"+str(e)+"\nProgram aborted. Contact developer at github repository or admin.")
	quit()
print("         B2E-C Module ┠╴\x1b[32mSUCCESS\x1b[39;49m")
try:
	from pymongo import MongoClient
except Exception as e:
	print("                Error ┠╴\x1b[31m"+str(e)+"\x1b[39;49m")
	if input("     Install? [Y/N]:  ┖╴ ") == "Y":
		os.system("""python -m pip install "pymongo[srv]" """)
	else:
		print("\x1b[31mProgram aborted. Contact developer at github repository or admin.\x1b[39;49m")
		quit()
print("       PyMongo Module ┠╴\x1b[32mSUCCESS\x1b[39;49m")
try:from datetime import datetime
except Exception as e:
	print("                Error ┖╴\x1b[31m"+str(e)+"\nProgram aborted. Contact developer at github repository or admin.")
	quit()
print("      Datetime Module ┖╴\x1b[32mSUCCESS\x1b[39;49m")
print("━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n[ 2: PING    Server ] ┃ \x1b[31mEnter \x1b[31;1mControl&C\x1b[0m\x1b[31m To Abort. Leave To Proceed.\x1b[0m")
try:
	MongoClient("mongodb+srv://arcana_user:WVV62CYB3g5eJcqL@arcana.c8ozcdl.mongodb.net/?retryWrites=true&w=majority&appName=arcana").admin.command("ping")
except Exception as e:
	print("                Error ┠╴\x1b[31m"+str(e)+"\x1b[39;49m")
	if input(" Install SSL? [Y/N]:  ┖╴ ") == "Y":
		os.system("""bash install_certifications.command""")
	else:
		print("                Error ┖╴\x1b[31m"+str(e)+"\nProgram aborted. Contact developer at github repository or admin.")
		quit()
print("        Server Module ┖╴\x1b[32mSUCCESS\x1b[39;49m")
print("━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n[ 3: LOADING ARCANA ] ┃ Run \x1b[0;1m/help\x1b[0m Or Read \x1b[0;1mREADME.md\x1b[0m For Info.")
cluster,uri="",""
cluster=MongoClient("mongodb+srv://arcana_user:WVV62CYB3g5eJcqL@arcana.c8ozcdl.mongodb.net/?retryWrites=true&w=majority&appName=arcana")
db,id_=cluster["arcana"]["messages"],""
id_ = input("           Enter Name ┃ ")
identitypass = getpass.getpass(prompt="  Enter Identity Code ┃ ")
id_=id_+" [ "+arcanaid.calculate_id(str(identitypass)+id_)+" ] "
encode = getpass.getpass(prompt="   Enter Channel Code ┃ ")
while True:
	os.system("clear")
	all = db.find({})
	deltatime = str(datetime.now().strftime("%X"))
	date = str(datetime.now().strftime("%x"))
	delimiter,spaces="",""
	for msgs in all:
		if b2e.decode(str(encode),msgs["channel"])=="VALID":
			try:
				if b2e.decode(str(encode),msgs["date"]) == str(datetime.now().strftime("%X")):dateP="Today - "+b2e.decode(str(encode),msgs["deltatime"])
				else: dateP=b2e.decode(str(encode),msgs["date"])+" - "+b2e.decode(str(encode),msgs["deltatime"])
				print(dateP+"\n"+b2e.decode(str(encode),msgs["id"])+": "+b2e.decode(str(encode), msgs["message"])+"\n")
			except: pass
		time.sleep(random.randint(1,3)/100)
	sndmsg=input(">>> ")
	if sndmsg=="/exit":
		print("Exited Chat")
		break
	if sndmsg=="/help":
		print("       Outputing Help ┖╴")
		print(str(subprocess.getouput("cat README.md")))
	if sndmsg=="/identify": #本人証明システムは開発中です。
		identify_name=input("User Name: ")
		identify_id=input("  User ID: ")
		identify_idcode = getpass.getpass(prompt="  ID CODE: ")
		if arcanaid.calculate_id(str(identify_idcode)+str(identify_name)) == identify_id:print("Valid Code.")
		else:print("Code is not valid. Try checking for mistypes.")
	msg={"id": b2e.encode(str(encode), id_), "message": b2e.encode(str(encode), str(sndmsg)), "date": b2e.encode(str(encode),date),"deltatime": b2e.encode(str(encode),deltatime) , "channel": b2e.encode(str(encode),"VALID")}
	db.insert_one(msg)''' > main.py
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
    try:
        os.remove(openssl_cafile)
    except FileNotFoundError:
        pass
    print(" -- creating symlink to certifi certificate bundle")
    os.symlink(relpath_to_certifi_cafile, openssl_cafile)
    print(" -- setting permissions")
    os.chmod(openssl_cafile, STAT_0o775)
    print(" -- update complete")

if __name__ == "__main__":
    main()
EOF''' > install_certifications.command
mkdir b2eC
cd b2eC ; echo '''
# This script of b2eC is specifically and heavily modified for ARCANA. I would not reccomend any practical usages.
import math, random, string
def b2eRandint(seed):
	return(int(str(math.sqrt(seed*2)*10**100).replace(".","").replace("e+","").replace("0",""))**50)
class b2e():
	def encode(public_key, text:str):
		finaltxt,key="",""
		for i in range(len(public_key)):key+=str(ord(str(public_key)[i]))
		key=str(b2eRandint(int(key)))
		text=list(text)
		for i in range(int(int(str(key)[10])+5)):
			text.insert(int(int(str(key)[i+30])),str(chr(705)))
		for i in range(len(text)):text[i]=str(int(ord(text[i]))+(int(str(key)[i])+int(str(key)[i+2])**2))
		for i in range(len(text)):finaltxt+=chr(int(text[i]))
		return(finaltxt)
	def decode(public_key, text:str):
		finaltxt,key="",""
		for i in range(len(public_key)):key+=str(ord(str(public_key)[i]))
		key=str(b2eRandint(int(key)))
		text=list(text)
		for i in range(len(text)):text[i]=str(int(ord(text[i]))-(int(str(key)[i])+int(str(key)[i+2])**2))
		for i in range(len(text)):finaltxt+=chr(int(text[i]))
		return(finaltxt.replace(chr(705),""))
class arcanaid():
	def calculate_id(text:str):
		finaltxt,encodetxt="","".join(string.ascii_letters+string.digits)
		random.seed(text)
		for i in range(10):finaltxt+=random.choice(encodetxt)
		return(finaltxt)''' > b2eC.py
clear
cd ..;python3 main.py
