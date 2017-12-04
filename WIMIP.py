#This script displays machine's external ip address
#!/usr/bin/python

from bs4 import BeautifulSoup
import requests

url = 'http://whatismyip.org/'
r = requests.get(url)
soup = BeautifulSoup(r.text, 'html5lib')
scraped = soup.span
print (scraped.text)      #using web element


