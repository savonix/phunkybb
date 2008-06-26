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
import auth
import path
import config
import debug
import flow

import datasources.adodbdatasource

__author__ = 'Albert Lash'
__version__ = '0.01'

class Schematronic:
    
    def __init__(self, conf = '/tmp/test.xconf', sitemap = '/tmp/sitemap.xmap'):
        """ Start up the application. The statements in here will only be run
        when the application is started, not for every request. The configuration
        and sitemap should be opened and created as objects. Should they be XML
        objects or custom objects? I'm leaning towards XML objects, but custom
        python objects might be and easier to access - yes go with XML objects,
        and access via XPath.

        It probably makes sense to parse the sitemap into a tuple of gates - that
        would be fastest for matching. """

        """ There are some settings in WSGI / Fast_CGI that affect when a daemon
        process will be destroyed and will need to be instantiated. Therefore
        this function will most likely be called again before the web server is
        restarted. The web server keepalive and which process responds to each
        request will also affect whether or not this function is called. """

        # obviously these should be set by the configuration file.
        self.mode = 'dev'
        self.prepend = ''
        self.default = 'welcome'
        self.confExists = True

        self.status = '200 OK'
        self.startTime = strftime("%a, %d %b %Y %H:%M:%S +0000")

        # Parse the sitemap file into objects
        self.siteroot = ElementTree(file=sitemap)



        # Connect to database - better to connect only once.
        myConn = datasources.adodbdatasource.connect()

        # Just doing this here to test out cursor
        self.cursor = myConn.Execute('select * from data')


    def __call__(self, environ, start_response):

        # StartTimer
        self.startTime = time.time()
        # Check to make sure the conf file exists
        if self.confExists:
            pass
        else:
            status = "500 Error"
            output = "Can't find configuration file: " + self.confFile
            response_headers = [('Content-type', 'text/html'),
                    ('Content-Length', str(len(output)))]
            start_response(status, response_headers)
            return [output]

        """
        Instatiate flow - an XML document
        Start with a string, concatenate all XML sources, then close it, and
        convert it to an XML tree object.
        """
        myFlow = flow.Flow()
        # You'll likely add XML and data from various datasources to the XML dom
        # Iterate through the sitemap and instantiate components as necessary?
        # End flow?


        # Process prepend resources

        # Find gate resources by environ url request
        # Process gate resources

        # Test output
        if "B"=="A":
            return self.notcall(environ, start_response)
        else:
            myXsl = components.xsl
            output = myXsl.applyTransform('',myFlow.flowDoc)
            status = self.status
            """
            self.cursor.MoveNext()
            askjdh = self.cursor.fields 
            output = output + str(askjdh[2])
            
            
            # Stop Timer
            self.stopTime = time.time()
            self.duration = self.stopTime - self.startTime
            """
            #output = output + "<br/><br/>"  + str(self.duration)
            response_headers = [('Content-type', 'text/html'),
                                ('Content-Length', str(len(output)))]
            start_response(status, response_headers)
            return [output]



    def notcall(self, environ, start_response):
        """
        TODO:
            * Need parameter for whether to test for modifications
            * Test for modification time of conf or sitemap(s). If mod, reload
            object?
            * Parse request - get nid to match against gate - while you may want
            to use paste or something similar for parsing GET and POST requests,
            hardcoding the nid here might be OK.
            * Caching?
        """
        """
        /*
         * @flow: an xml document containing the runtime data
         *
         */
        """

        status = self.status
        if self.output == "Error" :
            output=self.output
        else:
            output = 'Started - ' + self.startTime + '<br/>Last run - ' +
                strftime("%a, %d %b %Y %H:%M:%S +0000") + "<br/>"

        """ Debug for the conf """
        nodes = self.xconf.xpath('//handler/args/arg')
        #output = output + nodes[0].text

        """ This just outputs the gates for debugging"""
        gates = self.xmap.xpath("//*/@name")
        #for gate in gates:
        #    output = output + '<br/>' + gate


        qs_dict = cgi.parse_qs(environ["QUERY_STRING"], 
            keep_blank_values = True, strict_parsing = False)

        #defaultNid must be a list to jive with the CGI parser result
        defaultNid = [self.default]
        mynid = qs_dict.get('nid',defaultNid)
        meme = mynid[0]

        myXpath = "//*[@name='" + meme + "']/*"
        myGate = self.xmap.xpath(myXpath)
        output = output + "<br/>"

        # For my own reference of the etree API
        for resource in myGate :
            # tag is either a query, xml, xsl... "gates" without a src attribute
            # cause an error
            # for resource.get without a default, hence the "none"
            output = output + "&nbsp;" + resource.tag + "&nbsp;" +
                resource.get("src","none") + "<br/>"

        output = output + '<br/>'

        output = mynid[0] + "<br/>" + environ["QUERY_STRING"] + "<br/>" +
            environ["SERVER_NAME"] + output

        myaction = components.query.Query('data/sql/select_account_stats.xml')

        #output = mynid + "<br/>" + output
        response_headers = [('Content-type', 'text/html'),
                            ('Content-Length', str(len(output)))]
        start_response(status, response_headers)

        return [output]









    """ I'm not sure whether its better to use __call__ """
    def application(self, environ, start_response):
        """Issue the application request. The statements here will be run for 
        every request? 

        Requests will pass different uris and based upon the matched relationship
        with the sitemap, different resources will be accessed. I'm now wondering
        how those resources should be instantiated and cached, if necessary or 
        possible.

        It is here where the reflection happens - depending upon the request uri
        and the resources specified in the sitemap, certain objects will be
        created. I don't think they require persistence, because of the stateless
        nature of HTTP and the way I've been building web apps, so objects can be
        destroyed after each request. I do think that the results should be cached,
        when and if possible.

        For example, if /imaginary-url is requested, the sitemap will be checked,
        and then objects created for its contents. It actually might be helpful
        to persist objects, and simply pass them parameters as needed.

        /imaginary-url
            sitemap contains action redirect

        application creates new object called imaginary-url, based on action
        redirect, and whenever it is called, it is passed the target.
        """
        status = self.status
        if self.output == "Error":
            output=self.output
        else:
            output = 'Started - ' + self.startTime + '<br/>Last run - ' +
            strftime("%a, %d %b %Y %H:%M:%S +0000") + "<br/>"

        output = output + "<br/>" + environ["QUERY_STRING"]

        root = ET.Element("html")
        head = ET.SubElement(root, "head")
        title = ET.SubElement(head, "title")
        title.text = "Page Title"
        body = ET.SubElement(root, "body")
        body.set("bgcolor", "#ffffff")

        body.text = "Hello, World!"

        # wrap it in an ElementTree instance, and save as XML
        tree = ET.ElementTree(root)
        #output=ET.tostring(tree)
        response_headers = [('Content-type', 'text/html'),
                            ('Content-Length', str(len(output)))]
        start_response(status, response_headers)

        return [output]

class Singleton:
    __single = None
    def __init__( self ):
        if Singleton.__single:
            raise Singleton.__single
        Singleton.__single = self
