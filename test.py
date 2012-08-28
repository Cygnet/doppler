import urllib, urllib2

url = 'http://172.20.231.32:3000/switches/mac1/generate.md5' # write ur URL here

values = {'model' : 'nexus-3064', #write ur specific key/value pair
          'hostname' : 'Aswitch'
          }

try:
    data = urllib.urlencode(values)          
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read() 
    print the_page 
except Exception, detail: 
    print "Err ", detail 
