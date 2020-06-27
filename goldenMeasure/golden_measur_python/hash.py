from __future__ import print_function
import hashlib
import datetime
#  hash.py
#  Blackjack & Blackjack21
#  Used to convert strings to hashes
#  MD5, SHA1, SHA256, SHA512
#
#  Email: anivsante2@gmail.com
#
#  Links:
#  	https://github.com/MichaelDim02/BlackJack
#  	https://github.com/MichaelDim02/BlackJack21

def converter():
	string = raw_input("String: ")
        
	print("\nMD5:    ",hashlib.md5(string).hexdigest())
        
	start_time = datetime.datetime.now()
        print("\nSHA1:   ",hashlib.sha1(string).hexdigest())
        end_time = datetime.datetime.now()
        time_diff = (end_time - start_time)
        execution_time = time_diff.total_seconds()
        print(execution_time)

	print("\nSHA256: ",hashlib.sha256(string).hexdigest())
	print("\nSHA512: ",hashlib.sha512(string).hexdigest())
converter()



