
# I am surprised its OK to just reference thexml here.
xml_file = '/tmp/config_cache.xml'
if ( open(xml_file) ):
    thexml.importDocument(xml_file)
