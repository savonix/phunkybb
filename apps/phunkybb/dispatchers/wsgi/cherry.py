import cherrypy

conf = {'server.socket_port': 8000}
cherrypy.config.update(conf)

class HelloWorld:
    def index(self):
        return "Hello world!"
    index.exposed = True

cherrypy.quickstart(HelloWorld())

