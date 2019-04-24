#!/usr/bin/python
"""
interact with an octoprint
http://docs.octoprint.org/en/master/api/index.html
curl -H 'X-Api-Key: 9999' http://octopi.local/api/logs
"""

import sys
import os.path
import requests
from pprint import pprint

if len(sys.argv) < 2:
    print "usage: octo cmd..."
    sys.exit(1)

cfgfile = os.path.join(os.environ['HOME'], '.octoprint')
for line in open(cfgfile).readlines():
    line = line[:len(line)-1]
    a = line.split("=")
    if len(a) > 1 and a[0] == "host":
        host = a[1]
    if len(a) > 1 and a[0] == "apikey":
        apikey = a[1]

api = 'http://%s/api' % (host)
headers={'X-Api-Key': apikey}

def watch1():
    pass

def do_watch():
    while True:
        watch1()

if   sys.argv[1] == 'upload': pass
if   sys.argv[1] == 'upload': pass
elif sys.argv[1] == 'print': pass
elif sys.argv[1] == 'download': pass
elif sys.argv[1] == 'fileinfo': pass
elif sys.argv[1] == 'watch':
    do_watch()
elif sys.argv[1] == 'files':
    params={'recursive': 'true'}
    r=requests.get(api+'/files', params=params, headers=headers)
    j=r.json()
    print j['total']
    print j['free']
    fnames = [f['name'] for f in j['files']]
    for f in sorted(fnames):
        print f
    #pprint(j['files'])

