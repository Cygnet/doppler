import urllib, urllib2

url = 'http://172.25.187.212:3000/switches/generate' # write ur URL here

values = {'model' : 'poc-14-02-38-its-N3048-02', #write ur specific key/value pair
          'hostname' : 'Aswitch',
	  'mac' : '1'          
}

try:
    data = urllib.urlencode(values)          
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read() 
    print the_page 
except Exception, detail: 
    print "Err ", detail 
