<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:param name="pays" />

<xsl:template match="/">
  <datalist id="autocomplete">		
	<xsl:for-each select="//country/name[starts-with(common,$pays)]/common">
		<option><xsl:value-of select="text()"/></option>
	</xsl:for-each>
  </datalist>
</xsl:template>
</xsl:stylesheet>
