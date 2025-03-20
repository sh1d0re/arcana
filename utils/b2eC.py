#This script of b2eC is heavily modified for ARCANA. I would not
# reccomend any practical usages.

import random
import string
import json
import time
import os

from statistics import Counter

class debug:
    def showAllVariables(initialVariables:dict):
        ignoreVars = ["__name__", "__doc__", "__package__", "__loader__", "__spec__", "__annotations__", "__builtins__", "__file__", "__cached__", "showAllVariables"]
        print("".join([f"""|\x1b[30;47;1m{type(variable)}) {variable}: \x1b[30;47m{initialVariables[variable]} \x1b[0m|""" for variable in list(initialVariables.keys()) if not variable in ignoreVars]))

primeNumbers = []#json.load(open("../data/primeNumbers.json"))["primeNumbers"]

config = json.load(open("config.json"))

recursionLimit = 100
recursionCount = 0
maximumNumericalLengthUsed = 300
class b2eRandom:
    def shuffle(text: str, order = None, directionMode = 0) -> str:
        if order == None:
            order = b2eRandom.randint("")
        if directionMode == 0:
            for n in list(str(order)):
                text = text[:int(n)] + text[int(n)+1:] + text[int(n)]
        elif directionMode == 1:
            for n in reversed(list(str(order))):
                text = text[:int(n)] + text[-1] + text[int(n):len(text)-1]
        return(text)

    def convertTextToNumeric(text:str) -> int:
        returnNumber = 1
        for character in list(text):
            returnNumber = returnNumber * (ord(character))
        return(returnNumber)
    
    def getTime() -> int:
        return(int(str(time.time()).replace(".", "")[8:]))

    def recursion(initialValue: int) -> int:
        global recursionCount, recursionLimit
        recursionCount += 1
        checkRecursion = recursionCount >= recursionLimit
        magicNumber = int(str(int(initialValue // 7) ** (int(str(initialValue)[0])) * b2eRandom.getTime())[:100].replace("9", "")) // 2
        byChance = (magicNumber % recursionLimit) >= 5

        returnVal = 0
        if checkRecursion or byChance:
            returnVal = (initialValue + b2eRandom.getTime() * magicNumber)
        else:
            returnVal = b2eRandom.recursion(int(str(magicNumber)[:maximumNumericalLengthUsed]))
        recursionCount = 0
        return(returnVal)
    
    def limitStringToLimit(text: str, length: int) -> int:
        textLength = len(text)
        margin = 1
        if textLength > length and textLength >= 3:
            return(int(text[textLength - length - margin:textLength - margin]))
        else:
            return(int(text))

    def randrange(seed: str, iStart: int, iEnd: int):
        if iStart <= iEnd:
            return(int(b2eRandom.randint(seed, maximumNumericalLengthUsed) % (iEnd - iStart + 1)) + iStart)
        else:
            raise IndexError("Start value is larger than End value.")

    def randint(seed: str, length: int) -> int:
        seed = b2eRandom.convertTextToNumeric(seed)
        resultText = seed
        timeSeed = abs(b2eRandom.getTime() - resultText)
        timeStamp = int(timeSeed)
        for _ in range(int((timeSeed * resultText) ** 2 + timeSeed) % 100):
            resultText += int(b2eRandom.limitStringToLimit(str(b2eRandom.recursion(timeSeed * resultText * length + seed) * _ + seed + resultText), maximumNumericalLengthUsed)) + resultText * _
        timeStamp += b2eRandom.getTime()
        return(b2eRandom.limitStringToLimit(
            b2eRandom.shuffle(
                str(int(str((resultText ** 5) * timeStamp).replace("0", "")) + resultText), resultText, True
            ), length)
        )


class b2eAssymetric():
    def gcd(a: int, b: int) -> int:
        while b != 0:
            a, b = b, a % b
        return(abs(a))

    def generate_hash():
        primeNumbers[int(b2eRandom.randint("ArcanaIsSafe", 1))]

class b2e():
    def encode(privateKey, text: str):
        finaltxt, key = "", ""
        for i in range(len(privateKey)):
            key += str(ord(str(privateKey)[i]))
        key, text = str(random.b2eRandint(int(key))), list(text)
        for i in range(int(str(key)[10]) + 5):
            text.insert(int(str(key)[i + 30]), str(chr(705)))
        for i in range(len(text)):
            text[i] = str(int(ord(text[i])) + (int(str(key)[i]) + int(str(key)[-5 - i])**2))
        for i in range(len(text)):
            finaltxt += chr(int(text[i]))
        return (finaltxt)

    def decode(privateKey, text: str):
        finaltxt, key = "", ""
        for i in range(len(privateKey)):
            key += str(ord(str(privateKey)[i]))
        key, text = str(random.b2eRandint(int(key))), list(text)
        for i in range(len(text)):
            text[i] = str(ord(text[i])) - (int(str(key)[i]) + int(str(key)[-5 - i])**2)
        for i in range(len(text)):
            try:
                finaltxt += chr(int(text[i]))
            except Exception as e:
                break
        return (finaltxt.replace(chr(705), ""))

class arcanaid():
    def calculate_id(text: str):
        finaltxt, encodetxt = "", "".join(string.ascii_letters + string.digits)
        for i in range(10):
            finaltxt += random.choice(encodetxt)
        return (finaltxt)

print(b2eRandom.shuffle("abcdefghijklmnopqrstvuxyz", 5129123827034053, True))

#for i in range(200):
#    print(b2eRandom.randint("asd", 15))

