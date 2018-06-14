<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
  <xsl:template match="/">

    <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
    <html>
     <head>
        <link rel="stylesheet" type="text/css" href="countries_style.css"/>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css"/>
        <title>Pays du monde</title>
     </head>

     <body style="background-color:white;">
       <h1>Les pays du monde</h1>
       <span>Mise en forme par : moi, mon binôme (B3545)</span>
        <hr class="separator"/>

        <h2>Continents (regions)</h2>
        <xsl:for-each select="//country">

        </xsl:for-each>
        <hr class="separator"/>

        <table class="table">
          <tr class="thead-light">
            <th>N°</th>
						<th>Nom</th>
            <th>Capitale</th>
            <th>Continent<br/>Sous-continent</th>
            <th>Voisins</th>
            <th>Coordonnées</th>
            <th>Drapeau</th>
					</tr>
          <xsl:for-each select="//country">
            <xsl:sort select="name/common"/>

            <tr>
              <td>
                <xsl:value-of select="position()"/>
              </td>
              <xsl:element name="td">
                <xsl:attribute name="class">
                  <xsl:if test="name/native_name[@lang='fra']">
                  text-brown
                  </xsl:if>
                </xsl:attribute>
                <xsl:value-of select="name/common"/> (<xsl:value-of select="name/official"/>)
              </xsl:element>
              <td>
                <xsl:value-of select="capital"/>
              </td>
              <td>
                <xsl:value-of select="infosRegion/region"/> <br/>
                <xsl:value-of select="infosRegion/subregion"/>
              </td>
              <td>
                <xsl:for-each select="borders">
                  <xsl:value-of select="//country[codes/cca3=current()]/name/common"/>
                  <xsl:if test="not(position() = last())">
                  ,
                  </xsl:if>
                </xsl:for-each>
              </td>
              <td>
                Latitude : <xsl:value-of select="coordinates/@lat"/><br/>
                Longitude : <xsl:value-of select="coordinates/@long"/>
              </td>
              <td>
                <xsl:element name="img">
                  <xsl:attribute name="src">http://img.geonames.org/flags/x/<xsl:value-of select="translate(codes/cca2, $uppercase, $lowercase)"/>.gif</xsl:attribute>
                  <xsl:attribute name="alt"></xsl:attribute>
                  <xsl:attribute name="height">40</xsl:attribute>
                  <xsl:attribute name="width">60</xsl:attribute>
                </xsl:element>
              </td>
            </tr>

          </xsl:for-each>
        </table>
     </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
