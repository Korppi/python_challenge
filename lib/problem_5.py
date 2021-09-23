import pickle
from urllib.request import urlopen
# http://www.pythonchallenge.com/pc/def/peak.html
# This was tought one, i had to cheat a little to even know what to do (peak hell sounds like pickle? what is a pickle?!)
# 
# answer channel

# open url
response = urlopen("http://www.pythonchallenge.com/pc/def/banner.p") 

# deserialize stuff https://docs.python.org/3/library/pickle.html
pickle_stuff = pickle.load(response)

for stuff in pickle_stuff:
    for k,v in stuff:
        print(k*v, end='')
    print('') # not pretty, but works