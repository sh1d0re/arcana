
# This script of b2eC is heavily modified for ARCANA. I would not
# reccomend any practical usages.
import math
import random
import string


def b2eRandint(seed):
    result = int(int(str(math.sqrt(seed) * int(seed)**5).replace(".",
                 "").replace("e+", "").replace("0", ""))**(6 * int(str(seed)[:2])))
    return (result)


class b2e():
    def encode(public_key, text: str):
        finaltxt, key = "", ""
        for i in range(len(public_key)):
            key += str(ord(str(public_key)[i]))
        key, text = str(b2eRandint(int(key))), list(text)
        for i in range(int(int(str(key)[10]) + 5)):
            text.insert(int(int(str(key)[i + 30])), str(chr(705)))
        for i in range(len(text)):
            text[i] = str(int(ord(text[i])) +
                          (int(str(key)[i]) + int(str(key)[-5 - i])**2))
        for i in range(len(text)):
            finaltxt += chr(int(text[i]))
        return (finaltxt)

    def decode(public_key, text: str):
        finaltxt, key = "", ""
        for i in range(len(public_key)):
            key += str(ord(str(public_key)[i]))
        key, text = str(b2eRandint(int(key))), list(text)
        for i in range(len(text)):
            text[i] = str(int(ord(text[i])) -
                          (int(str(key)[i]) + int(str(key)[-5 - i])**2))
        for i in range(len(text)):
            try:
                finaltxt += chr(int(text[i]))
            except Exception as e:
                break
        return (finaltxt.replace(chr(705), ""))


class arcanaid():
    def calculate_id(text: str):
        finaltxt, encodetxt = "", "".join(string.ascii_letters + string.digits)
        random.seed(text)
        for i in range(10):
            finaltxt += random.choice(encodetxt)
        return (finaltxt)
