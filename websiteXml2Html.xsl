<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:key name="Group-by-Widgets" match="widget" use="@id"/>
    <xsl:template match="website">
        <html>
            <body>
                <h1>Website</h1>
                <h2>Pages</h2>

                <ol type="1">
                    <xsl:for-each select="page">
                        <li>
                            <xsl:value-of select="@name"/> ,
                            <xsl:value-of select="description"/>
                        </li>
                    </xsl:for-each>
                </ol>

                <h2>Widgets</h2>
                <table border="1" cellpadding="2" cellspacing = "2">
                    <tr>
                        <th>id</th>
                        <th>type</th>
                        <th>text</th>
                        <th>src</th>
                        <th>url</th>
                        <th>label</th>
                    </tr>
                    <xsl:apply-templates select="page"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="page">
        <xsl:apply-templates
                select="widget[generate-id() = generate-id(key('Group-by-Widgets', @id)[1])]"
                mode="group"/>
    </xsl:template>

    <xsl:template match="widget" mode="group">
        <tr>
            <td>
                <xsl:value-of select="@id"/>
            </td>
            <td>
                <xsl:value-of select="@type"/>
            </td>
            <td>
                <xsl:if test="text">
                    <xsl:value-of select="text"/>
                </xsl:if>
            </td>

            <td>
                <xsl:if test="@type = 'IMG'">
                    <xsl:value-of select="@src"/>
                </xsl:if>
            </td>

            <td>
                <xsl:if test="@type = 'YOUTUBE'">
                    <xsl:value-of select="@url"/>
                </xsl:if>

            </td>

            <td>
                <xsl:if test="@type = 'BUTTON'">
                    <xsl:value-of select="@label"/>
                </xsl:if>

            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>