
def arcana():
    welcomemsg = "┏━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n┃  ╭────╮  ┃   ┏━┓ ┏┓  ┏━╸ ┏━┓ ┏┓╻ ┏━┓                            ┃\n┃  │╭───╯  ┃   ┣━┫ ┣┻┓ ┃   ┣━┫ ┃┃┃ ┣━┫                            ┃\n┃  ╰╯      ┃   ╹ ╹ ╹ ╹ ┗━╸ ╹ ╹ ╹┗┛ ╹ ╹                            ┃\n┡━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━┯━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩\n│                     PROGRAMMER : Sh1d0re                        │\n│                        LICENSE : GPL-v3                         │\n│                       LANGUAGE : Python                         │\n└────────────────────────────────┴────────────────────────────────┘"
    print(welcomemsg)
    print(
        "━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n[ 1: LOADING    PyP ] ┃ \x1b[31mEnter \x1b[31;1mControl&C\x1b[0;31m To Abort. Leave To Proceed.\x1b[0m")

    def splitLines(connector:str) -> str:
        return("".join(["─" for i in range(22)]) + connector + "".join(["─" for i in range(44)]))

    def importMsg(status, prompt: str):
        for i in range(10 - len(str(prompt))):
            prompt = " " + prompt
        if "error" in status:
            print(f"""    {prompt} Module ┠╴\x1b[31mERROR\x1b[0m\n{splitLines("┸")}\n\x1b[31m{str(e)}\x1b[0m""")
            if "." in status:
                print(splitLines("┰"))
            else:
                print(splitLines("─"))
                print("x1b[31;1mProgram aborted due to error. Try contacting the github repo if you see no solution.\x1b[0m\n")
                exit()
        elif "success" in status:
            if "." in status:
                connector = "┖"
            else:
                connector = "┠"
            print(f"    {prompt} Module ┠╴\x1b[32mSUCCESS\x1b[0m")
    try:
        import os
    except Exception as e:
        importMsg("error", "OS")
    importMsg("success", "OS")
    try:
        import random
    except Exception as e:
        importMsg("error", "Random")
    importMsg("success", "Random")
    try:
        import getpass
    except Exception as e:
        importMsg("error", "Getpass")
    importMsg("success", "Getpass")
    try:
        import time
    except Exception as e:
        importMsg("error", "Time")
    importMsg("success", "Time")
    try:
        import subprocess
    except Exception as e:
        importMsg("error", "Subprocess")
    importMsg("success", "Subprocess")
    from utils.b2eC import b2e, arcanaid
    try:
        pass#from utils.b2eC import b2e, arcanaid
    except Exception as e:
        importMsg("error", "B2E-C")
    importMsg("success", "B2E-C")
    try:
        from pymongo.mongo_client import MongoClient
        from pymongo.server_api import ServerApi
    except Exception as e:
        importMsg("error.", "Pymongo")
        ask = input("     Install? [Y/N]:  ┠╴")
        if ask == "Y" or ask == "y":
            print("──────────────────────┸────────────────────────────────────────────")
            os.system("""python3 -m pip install "pymongo[srv]" """)
            print("──────────────────────┰────────────────────────────────────────────")
        else:
            importMsg("error", "Pymongo")
    importMsg("success", "Pymongo")
    try:
        from datetime import datetime
    except Exception as e:
        importMsg("error", "Datetime")
    importMsg("success.", "Datetime")
    print(
        "━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n[ 2: PING    Server ] ┃ \x1b[31mEnter \x1b[31;1mControl&C\x1b[0m\x1b[31m To Abort. Leave To Proceed.\x1b[0m")
    uri = "mongodb+srv://arcana_user:9LBprbqAJKnTfgeQ@arcana.c8ozcdl.mongodb.net/?retryWrites=true&w=majority&appName=arcana"
    try:
        client = MongoClient(uri, server_api=ServerApi("1"))
        client.admin.command("ping")
    except Exception as e:
        importMsg("error.", "Server")
        if "ssl" in str(e):
            ask = input(" Install SSLc? [Y/N]: ┠╴")
            if ask == "Y" or ask == "y":
                print(
                    "──────────────────────┸────────────────────────────────────────────")
                os.system("""bash modules/install_certifications.command""")
                print(
                    "──────────────────────┰────────────────────────────────────────────")
            else:
                importMsg("error.", "Server")
        print(
            "                 Note ┖╴Check your internet, VPN, proxies, etc.\n\x1b[31;1mProgram aborted due to error. Try contacting the github repo if you see no solution.\x1b[0m\n")
        quit()
    importMsg("success.", "Server")
    while True:
        print(
            "━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n[ 3: Arcana         ] ┃ Run \x1b[0;1m/help\x1b[0m Or Read \x1b[0;1mREADME.md\x1b[0m For Info.")
        cluster = ""
        cluster = MongoClient(uri, server_api=ServerApi("1"))
        db, id_ = cluster["arcana"]["messages"], ""
        id_ = input("           Enter Name ┃ ")
        identitypass = getpass.getpass(prompt="  Enter Identity Code ┃ ")
        id_ = id_ + \
            " [ " + arcanaid.calculate_id(str(identitypass) + id_) + " ] "
        encode = getpass.getpass(prompt="   Enter Channel Code ┃ ")
        while True:
            os.system("clear")
            all, deltatime, date = db.find(
                {}), str(
                datetime.now().strftime("%X")), str(
                datetime.now().strftime("%x"))
            delimiter, spaces = "", ""
            for msgs in all:
                if b2e.decode(str(encode), msgs["channel"]) == "VALID":
                    try:
                        if b2e.decode(str(encode) + b2e.decode(str(encode), msgs["deltatime"]), msgs["date"]) == str(datetime.now().strftime("%X")):
                            dateP = "Today - " + b2e.decode(str(encode), msgs["deltatime"])
                        else:
                            dateP = b2e.decode(str(encode) + b2e.decode(str(encode), msgs["deltatime"]), msgs["date"]) + " - " + b2e.decode(str(encode), msgs["deltatime"])
                        print(f"""{dateP}\n{b2e.decode(str(encode) + b2e.decode(str(encode), msgs["deltatime"]), msgs["id"])}: {b2e.decode(str(encode) + b2e.decode(str(encode), msgs["deltatime"]), msgs["message"])}\n""")
                    except BaseException:
                        pass
                time.sleep(random.randint(10, 100) / 10000)
            userInput = input(">>> ")
            if userInput == "/exit":
                print("Exited Chat")
                os.system("clear")
                print(welcomemsg)
                break
            if userInput == "/help":
                print("       Outputing Help ┖╴")
                print(str(subprocess.getouput("cat README.md")))
            if userInput == "/identify":
                identify_name = input("User Name: ")
                identify_id = input("  User ID: ")
                identify_idcode = getpass.getpass(prompt="  ID CODE: ")
                if arcanaid.calculate_id(
                        str(identify_idcode) +
                        str(identify_name)) == identify_id:
                    print("Valid Code.")
                else:
                    print("Code is not valid. Try checking for mistypes.")
            msg = {
                "id": b2e.encode(
                    str(encode) +
                    str(deltatime),
                    id_),
                "message": b2e.encode(
                    str(encode) +
                    str(deltatime),
                    str(userInput)),
                "date": b2e.encode(
                    str(encode) +
                    str(deltatime),
                    date),
                "deltatime": b2e.encode(
                    str(encode),
                    deltatime),
                "channel": b2e.encode(
                    str(encode),
                    "VALID")}
            db.insert_one(msg)


try:
    arcana()
except KeyboardInterrupt:
    print("\nAborted Program.")
except Exception as e:
    print("\x1b[31;1mProgram aborted due to error. This error is estimated to be caused by a program error or corruption. Please report it to the github repo [ https://github.com/sh1d0re/arcana ] for the dev team to fix the issue.\x1b[0m\n")
