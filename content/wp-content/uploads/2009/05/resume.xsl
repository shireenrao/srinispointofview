<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="resume">
   <xsl:apply-templates select="contactInformation"/>
   <P />
   <xsl:apply-templates select="introduction"/>
   <P />
   <TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">
   <xsl:apply-templates select="skillsTree"/>
   <TR><TD COLSPAN="3"><BR /></TD></TR>
   <xsl:apply-templates select="experienceTree"/>
   <TR><TD COLSPAN="3"><BR /></TD></TR>
   <xsl:apply-templates select="educationTree"/>
   </TABLE>
   <BR /><BR />
</xsl:template>

<xsl:template match="contactInformation">
   <HR SIZE="1" /><CENTER>
   <SPAN CLASS="contentheader2"><font size="+1"><B><xsl:value-of select="name"/></B></font></SPAN><BR />
   <xsl:value-of select="address"/>
   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
   <IMG SRC="images/bulletCircle.gif" ALT="*" WIDTH="8" HEIGHT="6" />
   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
   <xsl:value-of select="city"/>
   <xsl:text>, </xsl:text>
   <xsl:value-of select="state"/>
   <xsl:text>  </xsl:text>
   <xsl:value-of select="zip"/><BR />
   <xsl:value-of select="phone"/>
   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
   <IMG SRC="images/bulletCircle.gif" ALT="*" WIDTH="8" HEIGHT="6" />
   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
   <xsl:value-of select="email"/><BR />
   <xsl:for-each select="site">
      <A ><xsl:attribute name="HREF">http://<xsl:value-of select="."/>/</xsl:attribute><xsl:value-of select="."/></A>
      <xsl:if test="position() &lt; last()">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <IMG SRC="images/bulletCircle.gif" ALT="*" WIDTH="8" HEIGHT="6" />
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </xsl:if>
   </xsl:for-each>
   </CENTER><HR SIZE="1" />
</xsl:template>

<xsl:template match="introduction">
   <B><xsl:value-of select="title"/></B>
   <xsl:text> </xsl:text>
   <xsl:value-of select="description"/>
</xsl:template>

<xsl:template match="skillsTree">
   <TR VALIGN="TOP">
   <TD><B>SKILLS</B></TD>
   <TD><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text></TD>
   <TD>
     <TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
     <xsl:apply-templates select="skillSet" />
     </TABLE>
   </TD>
   </TR>
</xsl:template>

<xsl:template match="skillSet">
   <TR>
   <TD VALIGN="TOP">
   <IMG SRC="images/bulletCircle.gif" ALT="*" WIDTH="8" HEIGHT="6" />
   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
   </TD>
   <TD VALIGN="TOP">
   <xsl:value-of select="@type"/>
   <xsl:text>: </xsl:text>
   <xsl:for-each select="skill">
      <xsl:value-of select="."/>
      <xsl:if test="position() &lt; last()">
         <xsl:text>, </xsl:text>
      </xsl:if>
   </xsl:for-each>
   </TD>
   </TR>
</xsl:template>

<xsl:template match="experienceTree">
   <TR VALIGN="TOP">
   <TD><B>EXPERIENCE</B></TD>
   <TD><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text></TD>
   <TD>
   <xsl:apply-templates select="experience" />
   </TD>
   </TR>
</xsl:template>

<xsl:template match="experience">
   <B><xsl:value-of select="organization"/></B>
   <xsl:text>, </xsl:text>
   <xsl:value-of select="location"/>
   <BR />
   <xsl:for-each select="roles/role">
      <I><xsl:value-of select="title"/></I>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="dateBegin"/>
      <xsl:if test="dateEnd">
         <xsl:text> - </xsl:text>
         <xsl:value-of select="dateEnd"/>
      </xsl:if>
      <BR />
   </xsl:for-each>
   <TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
   <xsl:for-each select="tasks/task">
      <TR>
      <TD VALIGN="TOP">
      <IMG SRC="images/bulletCircle.gif" ALT="*" WIDTH="8" HEIGHT="6" />
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </TD>
      <TD VALIGN="TOP"><xsl:value-of select="."/></TD>
      </TR>
   </xsl:for-each>
   <TR>
   <TD VALIGN="TOP">
   <IMG SRC="images/bulletCircle.gif" ALT="*" WIDTH="8" HEIGHT="6" />
   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
   </TD>
   <TD VALIGN="TOP">
   <I>
   <xsl:text>Technologies: </xsl:text>
   <xsl:for-each select="technologies/technology">
      <xsl:value-of select="."/>
      <xsl:if test="position() &lt; last()">
         <xsl:text>, </xsl:text>
      </xsl:if>      
   </xsl:for-each>
   </I>
   </TD>
   </TR>
   <TR>
   <TD VALIGN="TOP">
   <IMG SRC="images/bulletCircle.gif" ALT="*" WIDTH="8" HEIGHT="6" />
   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
   </TD>
   <TD VALIGN="TOP">
   <A ><xsl:attribute name="HREF"><xsl:value-of select="url"/></xsl:attribute><xsl:value-of select="url"/></A>
   </TD>
   </TR>
   </TABLE>
   <xsl:if test="position() &lt; last()">
      <P />
   </xsl:if>
</xsl:template>

<xsl:template match="educationTree">
   <TR VALIGN="TOP">
   <TD><B>EDUCATION</B></TD>
   <TD><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text></TD>
   <TD>
   <xsl:apply-templates select="education" />
   </TD>
   </TR>
</xsl:template>

<xsl:template match="education">
   <B><xsl:value-of select="institution"/></B>
   <xsl:text>, </xsl:text>
   <xsl:value-of select="location"/>
   <BR />
   <xsl:value-of select="achievement"/>
   <xsl:text>, </xsl:text>
   <xsl:value-of select="date"/>
   <BR />
   <xsl:value-of select="additionalInfo"/>
   <xsl:if test="position() &lt; last()">
      <P />
   </xsl:if>
</xsl:template>

</xsl:stylesheet>
