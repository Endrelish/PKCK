<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <xsl:template match="Autorzy">
        <xsl:text>&#x9;AUTORZY:&#xA;</xsl:text>
        <xsl:apply-templates select="Autor"/>
    </xsl:template>

    <xsl:template match="Autor">
        <xsl:variable name="label" select="concat(Imię,' ',Nazwisko,'&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;')"/>
        <xsl:value-of select="substring($label,0,20)"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="Indeks" />
        <xsl:text>)&#xA;</xsl:text>
    </xsl:template>

    <xsl:template match="Filmy">
        <xsl:text>Tytuł&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;Gatunek&#x9;&#x9;&#x9;&#x9;Ocena&#x9;&#x9;Cena&#xA;</xsl:text>


        <xsl:apply-templates select="Film"/>
    </xsl:template>

    <xsl:template match="Film">
        <xsl:variable name="label" select="concat(Tytuł,'&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;')"/>
        <xsl:value-of select="substring($label,0,45)" />
        <xsl:value-of select="concat(@Gatunek,  '&#x9;&#x9;&#x9;&#x9;')" />
        <xsl:value-of select="concat(Ocena,     '&#x9;&#x9;&#x9;')" />
        <xsl:value-of select="concat(Cena,      '&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#xA;')" />
    </xsl:template>

    <xsl:template match="Statystyki">
        <xsl:text>&#xA;&#xA;Statystyki:&#xA;</xsl:text>
        <xsl:apply-templates select="Oceny"/>
        <xsl:text>&#xA;&#xA;</xsl:text>
        <xsl:apply-templates select="Gatunki"/>
        <xsl:text>&#xA;&#xA;</xsl:text>
        <xsl:apply-templates select="DataRaportu"/>
    </xsl:template>

    <xsl:template match="Oceny">
        <xsl:text>OCENA&#x9;&#x9;&#x9;ILOŚĆ&#xA;</xsl:text>
        <xsl:value-of select="concat('1:&#x9;&#x9;&#x9;&#x9;',Ocena1,'&#xA;')" />
        <xsl:value-of select="concat('2:&#x9;&#x9;&#x9;&#x9;',Ocena2,'&#xA;')" />
        <xsl:value-of select="concat('3:&#x9;&#x9;&#x9;&#x9;',Ocena3,'&#xA;')" />
        <xsl:value-of select="concat('4:&#x9;&#x9;&#x9;&#x9;',Ocena4,'&#xA;')" />
        <xsl:value-of select="concat('5:&#x9;&#x9;&#x9;&#x9;',Ocena5,'&#xA;')" />
        <xsl:text>----------------------------------------&#xA;</xsl:text>
        <xsl:value-of select="concat('WSZYSTKIE:&#x9;&#x9;',Wszystkie,'&#xA;')" />
    </xsl:template>

    <xsl:template match="Gatunki">
        <xsl:text>GATUNEK&#x9;&#x9;&#x9;ILOŚĆ&#x9;&#x9;ŚREDNIA&#xA;</xsl:text>
        <xsl:value-of select="concat('Komedia:&#x9;&#x9;',Komedia/Ilość,'&#x9;&#x9;&#x9;',Komedia/ŚredniaOcen,'&#xA;')" />
        <xsl:value-of select="concat('Dramat:&#x9;&#x9;&#x9;',Dramat/Ilość,'&#x9;&#x9;&#x9;',Dramat/ŚredniaOcen,'&#xA;')" />
        <xsl:value-of select="concat('Sci-Fi:&#x9;&#x9;&#x9;',Sci-Fi/Ilość,'&#x9;&#x9;&#x9;',Sci-Fi/ŚredniaOcen,'&#xA;')" />
        <xsl:text>----------------------------------------&#xA;</xsl:text>
        <xsl:value-of select="concat('WSZYSTKIE:&#x9;&#x9;',Wszystkie/Ilość,'&#x9;&#x9;&#x9;',Wszystkie/ŚredniaOcen,'&#xA;')" />
    </xsl:template>



    <xsl:template match="DataRaportu">
        <xsl:text>Raport wygenerowano dnia </xsl:text>
        <xsl:value-of select="substring(.,0,11)" />
        <xsl:text> o godzinie </xsl:text>
        <xsl:value-of select="substring(.,12,8)" />
    </xsl:template>

</xsl:stylesheet>

