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
			 <div style="text-align:center">
	       <h1>Les pays du monde</h1>
				 <hr class="separator"/>
	       <span>Mise en forme par : moi, mon binôme (B3545)</span>
			 </div>


        <h2>Continents (regions)</h2>
        <xsl:for-each select="//country/infosRegion/region[text() and not(text() = preceding::text())]">
					<h4><xsl:value-of select="text()"/></h4>
					<p>Sous-régions :
  				<xsl:for-each select="//country/infosRegion[not(subregion = following::subregion)]/subregion[../region = current()]">
						<xsl:value-of select="text()"/> (<xsl:value-of select="count(//country/infosRegion/subregion[text() = current()])"/>)
						<xsl:if test="not(position() = last())">
						,
						</xsl:if>
					</xsl:for-each>
					</p>
        </xsl:for-each>

				<h4>Sans continent</h4>

				<xsl:value-of select="count(//region[. = ''])"/> pays

        <hr class="separator"/>
				<p> Pays avec 7 voisins :
				<xsl:for-each select="//country[count(borders) = 7]/name/common">
					<xsl:value-of select="text()"/>
					<xsl:if test="not(position() = last())">
					,
					</xsl:if>
				</xsl:for-each>
				</p>

				<p>Pays ayant le plus long nom :
					<xsl:for-each select="//country">
			      <xsl:sort select="string-length(name/common/.)" data-type="number" order="descending" />
						<xsl:if test="position() = 1">
			        <xsl:value-of select="./name/common/text()"/>
						</xsl:if>
			    </xsl:for-each>
				</p>

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
