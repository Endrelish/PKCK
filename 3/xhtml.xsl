<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xhtml" version="1.0" encoding="utf-8"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:template match="/">
        <xsl:element name="html">
            <xsl:attribute name="xml:lang">pl</xsl:attribute>
            <xsl:attribute name="lang">pl</xsl:attribute>

            <xsl:element name="head">
                <xsl:element name="meta">
                    <xsl:attribute name="name">
                        <xsl:text>description</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="content">
                        <xsl:text>Dane o filmach</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="meta">
                    <xsl:attribute name="name">
                        <xsl:text>author</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="content">
                        <xsl:text>Bartłomiej Ciach, Paweł Purgat</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="meta">
                    <xsl:attribute name="http-equiv">
                        <xsl:text>content-type</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="content">
                        <xsl:text>text/html;charset=UTF-8</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="title">
                    <xsl:text>Raport XHTML</xsl:text>
                </xsl:element>
                <xsl:element name="link">
                    <xsl:attribute name="rel">
                        <xsl:text>stylesheet</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="type">
                        <xsl:text>text/css</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>raport.css</xsl:text>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>

            <xsl:element name="body">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="Autorzy">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>authors</xsl:text>
            </xsl:attribute>
            <xsl:text>Autorzy:&#x20;</xsl:text>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="Autor">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>author</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="./Imię"/>
            <xsl:text>&#x20;</xsl:text>
            <xsl:value-of select="./Nazwisko"/>
            <xsl:text>, nr indeksu: </xsl:text>
            <xsl:value-of select="./Indeks"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="Filmy">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>films</xsl:text>
            </xsl:attribute>
            <xsl:element name="table">
                <xsl:attribute name="border">
                    <xsl:text>2</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="align">
                    <xsl:text>center</xsl:text>
                </xsl:attribute>

                <xsl:element name="caption">
                    <xsl:element name="h2">
                        <xsl:text>Wszystkie filmy</xsl:text>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="tr">
                    <xsl:element name="th">
                        <xsl:text>Tytuł</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>Gatunek</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>Ocena</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>Cena</xsl:text>
                    </xsl:element>
                </xsl:element>
                <xsl:for-each select="./Film">
                    <xsl:sort select="@Gatunek"/>
                    <xsl:element name="tr">
                        <xsl:element name="td">
                            <xsl:value-of select="Tytuł"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:if test="@Gatunek = 'Komedia'">
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:text>komedia.png</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:text>Komedia</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="@Gatunek= 'Dramat'">
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:text>dramat.png</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:text>Dramat</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="@Gatunek = 'Sci-Fi'">
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:text>scifi.png</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:text>Sci-Fi</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:if>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="Ocena"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="Cena"/>
                            <xsl:text>&#x20; zł</xsl:text>
                        </xsl:element>

                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="Statystyki">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>stats</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


    <xsl:template match="Statystyki/DataRaportu">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>date</xsl:text>
            </xsl:attribute>
            <xsl:text>Data wygenerowania raportu: </xsl:text>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="Statystyki/Oceny">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>marks</xsl:text>
            </xsl:attribute>
            <xsl:element name="table">
                <xsl:attribute name="border">
                    <xsl:text>1</xsl:text>
                </xsl:attribute>
                <xsl:element name="caption">
                    <xsl:element name="h2">
                        <xsl:text>Oceny</xsl:text>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="tr">
                    <xsl:element name="th">
                        <xsl:text>Ocena</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>Ilość</xsl:text>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>1</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Ocena1"/>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>2</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Ocena2"/>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>3</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Ocena3"/>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>4</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Ocena4"/>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>5</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Ocena5"/>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>Wszystkie</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Wszystkie"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="Statystyki/Gatunki">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>genre</xsl:text>
            </xsl:attribute>
            <xsl:element name="table">
                <xsl:attribute name="border">
                    <xsl:text>1</xsl:text>
                </xsl:attribute>
                <xsl:element name="caption">
                    <xsl:element name="h2">
                        <xsl:text>Gatunki</xsl:text>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="tr">
                    <xsl:element name="th">
                        <xsl:text>Gatunek</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>Ilość</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>Średnia ocen</xsl:text>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>Komedia</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Komedia/Ilość"/>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Komedia/ŚredniaOcen"/>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>Dramat</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Dramat/Ilość"/>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Dramat/ŚredniaOcen"/>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>Sci-Fi</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Sci-Fi/Ilość"/>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Sci-Fi/ŚredniaOcen"/>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>Wszystkie</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Wszystkie/Ilość"/>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="Wszystkie/ŚredniaOcen"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
