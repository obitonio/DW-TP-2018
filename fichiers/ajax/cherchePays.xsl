<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name="pays" />

<xsl:template match="/">
  <span>
    <xsl:value-of select="//country/name[common = $pays]/official"/>,
    <xsl:value-of select="//country[name/common = $pays]/capital"/>
  </span>
</xsl:template>
</xsl:stylesheet>
