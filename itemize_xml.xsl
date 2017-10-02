<?xml version="1.0" encoding="utf-8"?>

<!--
Université PARIS NANTERRE
defi2 at jpjorda.fr
M2 DEFI
DEVOIR XML 2017-2018
-->

<xsl:transform version="1.0"
	       xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="*|text()">
    <xsl:copy>
      <xsl:apply-templates select="*|text()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="text()[contains(.,'#')]" name="split">
    <xsl:param name="item" select="normalize-space(.)"/>
    <xsl:if test="$item">
      <ITEM>
	<xsl:value-of select="normalize-space(substring-before(concat($item, '#'), '#'))"/>
      </ITEM>
      <xsl:call-template name="split">
	<xsl:with-param name="item" select="normalize-space(substring-after($item,'#'))"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  
  
</xsl:transform>
