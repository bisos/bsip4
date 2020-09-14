#!/usr/bin/env python

import os
from urlparse import urlparse
import getopt, sys
import argparse

#uri=ftp://uSer:passWd@ftp.uu.net:8021/someBase/plusRel
uri=sys.argv[1]
result = urlparse(uri)

print "("

sys.stdout.write("[scheme]=")
print result.scheme

sys.stdout.write("[netloc]=")
print result.netloc

sys.stdout.write("[path]=")
print result.path

sys.stdout.write("[params]=")
print result.params

sys.stdout.write("[query]=")
print result.query

sys.stdout.write("[fragment]=")
print result.fragment

sys.stdout.write("[username]=")
print result.username

sys.stdout.write("[password]=")
print result.password

sys.stdout.write("[hostname]=")
print result.hostname

sys.stdout.write("[port]=")
print result.port

print ")"
