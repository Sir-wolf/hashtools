#!/usr/bin/python3

from hashlib import sha256
enter = input("enter file name : ")
exit = input("enter final file name : ")
key = input("enter key : ")
keys = sha256(key.encode('utf-8')).digest()
with open(enter,'rb') as f_enter:
    with open(exit,'wb') as f_exit:
        i = 0 
        while f_enter.peek():
            c = ord(f_enter.read(1))
            j = i % len(keys)
            b = bytes([c^keys[j]])
            f_exit.write(b)
            i = i + 1
            