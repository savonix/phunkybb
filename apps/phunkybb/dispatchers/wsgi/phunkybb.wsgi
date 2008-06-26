"""
Loader for Phunkybb to use Schematronic

Copyright: Savonix Corporation
Author: Albert Lash
License: Affero GPL v3 or later
"""
import cgi
import lxml.etree as ET
from time import gmtime, strftime
from StringIO import StringIO
import time
import os

# Import classes
from schematronic.kernel.GateKeeper import GateKeeper
import schematronic.kernel.flow

def application(environ, start_response):

    myinit = GateKeeper()
    flow = schematronic.kernel.flow












    output = myinit.process_gate('index')


    """Simplest possible application object"""
    status = '200 OK'
    response_headers = [('Content-type','text/plain')]
    start_response(status, response_headers)
    return output

