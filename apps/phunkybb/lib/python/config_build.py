from schematronic.modules.handlers.xml import XmlHandler

xml_file = '/tmp/config_cache.xml'
if ( open(xml_file) ):
    thexml.importDocument(xml_file)
