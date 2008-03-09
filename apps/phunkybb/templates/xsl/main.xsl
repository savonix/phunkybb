<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes" encoding="UTF-8" 
omit-xml-declaration="yes" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
<xsl:template match="/">
<html>
<head>
<link rel="stylesheet" type="text/css" href="s/style/Oxygen.css" />
<title>
    <xsl:value-of select="/__ROOT__/board_config/o_board_title"/>
    <xsl:if test="//forum_get_by_id/forum_name">
        : <xsl:value-of select="//forum_get_by_id/forum_name"/>
    </xsl:if>
    <xsl:if test="//topic_get_by_id/subject">
        : <xsl:value-of select="//topic_get_by_id/subject"/>
    </xsl:if>
</title>
<xsl:for-each select="//in_head">
    <xsl:sort select="priority"/>
    <xsl:value-of select="string" disable-output-escaping="yes"/>
</xsl:for-each>
</head>
<body>
<xsl:for-each select="//pre_body_content">
    <xsl:sort select="priority"/>
    <xsl:value-of select="string" disable-output-escaping="yes"/>
</xsl:for-each>

<div id="punwrap">
<div id="" class="pun">

<div id="brdheader" class="block">
	<div class="box">
		<div id="brdtitle" class="inbox">
        <h1><span><xsl:value-of select="//o_board_title"/></span></h1>
		<p><span><xsl:value-of select="//o_board_desc"/></span></p>
		</div>
		<div id="brdmenu" class="inbox">
            <xsl:for-each select="//navlinks">
            </xsl:for-each>
            <a href="{//link_prefix}welcome" style="padding: 4px;">
                <xsl:value-of select="//label[key='index']/value"/>
            </a>
            
            
            <xsl:if test="not(//runtime/username)">
            <a href="{//link_prefix}register" style="padding: 4px;"><xsl:value-of select="//label[key='register']/value"/></a>
            <a href="{//link_prefix}login" style="padding: 4px;"><xsl:value-of select="//label[key='login']/value"/></a>
            </xsl:if>
            
            <xsl:if test="//runtime/group_id='1'">
            <a href="{//link_prefix}admin" style="padding: 4px;"><xsl:value-of select="//label[key='administration']/value"/></a>
            </xsl:if>
            <xsl:if test="//runtime/username">
            <a href="{//link_prefix}profile" style="padding: 4px;">Profile</a>
            <a href="{//link_prefix}logout" style="padding: 4px;">Logout</a>
            </xsl:if>
        </div>
		<div id="brdwelcome" class="inbox">
            <xsl:if test="not(//runtime/username)">
			<p>You are not logged in.</p>
            </xsl:if>
            <xsl:if test="//runtime/username">
            Logged in as <b><xsl:value-of select="//runtime/username"/></b>
            </xsl:if>
		</div>
	</div>
</div>

<div id="" class="blocktable">
    <xsl:call-template name="content"/>
</div>

<div id="brdfooter" class="block">
	<h2><span>Board footer</span></h2>
	<div class="box">
		<div class="inbox">
			<dl id="searchlinks" class="conl">
			</dl>
			<p class="conr">Powered by <a href="http://www.phunkybb.docunext.com/blog/">PhunkyBB</a>, a fork of punbb.
            </p>
			<div class="clearer"></div>
		</div>
	</div>
</div>
</div>
</div>
<xsl:for-each select="//footer">
    <xsl:sort select="priority"/>
    <xsl:value-of select="string" disable-output-escaping="yes"/>
</xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
