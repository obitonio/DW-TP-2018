<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
<xsl:param name="pays" />

<xsl:template match="/">
  <table border="1">
    <tr>
      <th>Nom</th>
      <th>Capitale</th>
      <th>Drapeau</th>
    </tr>
    <tr>
      <td>
        <xsl:value-of select="//country/name[common = $pays]/official"/>
      </td>
      <td>
        <xsl:value-of select="//country[name/common = $pays]/capital"/>
      </td>
      <td>
        <xsl:element name="img">
          <xsl:attribute name="src">http://img.geonames.org/flags/x/<xsl:value-of select="translate(//country[name/common = $pays]/codes/cca2, $uppercase, $lowercase)"/>.gif</xsl:attribute>
          <xsl:attribute name="alt"><xsl:value-of select="translate(//country[name/common = $pays]/codes/cca2, $uppercase, $lowercase)"/></xsl:attribute>
          <xsl:attribute name="height">40</xsl:attribute>
          <xsl:attribute name="width">60</xsl:attribute>
        </xsl:element>
      </td>
    </tr>
  </table>
</xsl:template>
</xsl:stylesheet>
