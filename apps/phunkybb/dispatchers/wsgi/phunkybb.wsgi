"""
Loader for Phunkybb to use Schematronic

Copyright: Savonix Corporation
Author: Albert Lash
License: Affero GPL v3 or later
"""
import cgi
from time import gmtime, strftime
from StringIO import StringIO
import time
import os

# Import classes
from schematronic import Singleton as Singleton
from schematronic.kernel.flow import Flow
from schematronic.kernel.initializer import Initializer
from schematronic.kernel.config import Config
from schematronic.kernel.fence import Fence
from schematronic.modules.handlers.xsl import XslHandler
from schematronic.modules.handlers.xml import XmlHandler
from schematronic.modules.handlers.query import Query
import schematronic.kernel.flow


thexsl   = XslHandler()
thexml   = XmlHandler()
thequery = Query()
myinit   = Initializer(thexsl,thexml,thequery)


def application(environ, start_response):

    myinit.start()

    theflow = Flow()

    qs_dict = cgi.parse_qs(environ["QUERY_STRING"], \
        keep_blank_values = True, strict_parsing = False)


    theflow.start(qs_dict)

    mynid = qs_dict.get('nid','index')[0]


    myinit.process_gate(mynid)




    output = myinit.display()

    if(qs_dict.get('view_flow','none')[0] == "true"):
        flowdump = theflow.toXml()
        output = output + "<textarea rows='14' cols='200'>"+flowdump+"</textarea>"

    content_type  = myinit.content_type
    cache_control = myinit.cache_control

    """Simplest possible application object"""
    status = '200 OK'
    response_headers = [('Content-type',content_type),('Cache-Control',cache_control)]
    start_response(status, response_headers)
    return output

