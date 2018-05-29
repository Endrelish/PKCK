<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="xml" encoding="utf-8"/>

    <xsl:template match="/BazaFilmów">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="BazaFilmów"
                                       page-height="297mm" page-width="210mm"
                                       margin-top="25" margin-bottom="45" margin-left="50" margin-right="50">
                    <fo:region-body margin="30,10"/>
                    <fo:region-before extent="5"/>
                    <fo:region-after extent="5"/>
                    <fo:region-start extent="5"/>
                    <fo:region-end extent="5"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="BazaFilmów">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="center" font-family="Calibra" font-size="10px">
                        <xsl:text>Baza Filmów</xsl:text>
                        BazaFilmów
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center" font-family="Calibra" font-size="10px">
                        <xsl:text>strona </xsl:text>
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block>
                        <xsl:apply-templates/>
                    </fo:block>

                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="Autorzy">
        <fo:block font-size="20px" text-align="left" font-family="Calibra" margin="25">
            <fo:block>
                <xsl:text>Autorzy:</xsl:text>
                <xsl:text>&#xD;&#xA;</xsl:text>
            </fo:block>
            <fo:block font-family="Calibra" font-size="10px">
                <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="Statystyki">
        <fo:block font-size="20px" text-align="left" font-family="Calibra" margin="25">
            <fo:block>
                <xsl:text>Statystyki:</xsl:text>
                <xsl:text>&#xD;&#xA;</xsl:text>
            </fo:block>
            <fo:block>
                <fo:block font-size="15px">
                    <xsl:text>Ilość gatunków i średnia ocen:</xsl:text>
                </fo:block>
                <xsl:apply-templates select="Gatunki"/>
                <fo:block font-size="15px">
                    <xsl:text>Ilość ocen</xsl:text>
                </fo:block>
                <xsl:apply-templates select="Oceny"/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="Autor">
        <fo:block font-size="20px" text-align="left" font-family="Calibra">
            <fo:block>
                <fo:block margin-left="5mm" font-family="Calibra">
                    <xsl:value-of select="./Imię"/>
                    <xsl:text>&#x20;</xsl:text>
                    <xsl:value-of select="./Nazwisko"/>
                    <xsl:text>, nr indeksu: </xsl:text>
                    <xsl:value-of select="./Indeks"/>
                </fo:block>
            </fo:block>
        </fo:block>
    </xsl:template>


    <!--<xsl:template match="Statystyki">
        <fo:block>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>-->

    <xsl:template match="Statystyki/Gatunki">
        <fo:block font-size="16px" text-align="left" font-family="Calibra">
            <fo:table border="solid black" width="50%" >

                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block font-weight="bold" text-align="center">Gatunek</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block font-weight="bold" text-align="center">Ilość</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block font-weight="bold" text-align="center">Średnia ocen</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <fo:block>Komedia</fo:block>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Komedia/Ilość"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Komedia/ŚredniaOcen"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <fo:block>Dramat</fo:block>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Dramat/Ilość"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Dramat/ŚredniaOcen"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <fo:block>SciFi</fo:block>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Sci-Fi/Ilość"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Sci-Fi/ŚredniaOcen"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <fo:block>Wszystkie</fo:block>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Wszystkie/Ilość"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Wszystkie/ŚredniaOcen"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>


    <xsl:template match="Statystyki/Oceny">
        <fo:block font-size="16px" text-align="left" font-family="Calibra">
            <fo:table border="solid black" width="50%">
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block font-weight="bold" text-align="center">Ocena</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block font-weight="bold" text-align="center">Ilość</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <fo:block>1</fo:block>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Ocena1"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <fo:block>2</fo:block>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Ocena2"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <fo:block>3</fo:block>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Ocena3"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <fo:block>4</fo:block>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Ocena4"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <fo:block>5</fo:block>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Ocena5"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <fo:block>Wszystkie</fo:block>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center">
                                <xsl:value-of select="Wszystkie"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>


    <xsl:template match="Filmy">
        <fo:block font-size="16px" 	text-align="left" font-family="Calibra">
            <fo:block>
                <fo:table border="solid black" width="100%">

                    <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell border="solid black">
                                <fo:block font-weight="bold" text-align="center">Tytuł</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black">
                                <fo:block font-weight="bold" text-align="center">Gatunek</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black">
                                <fo:block font-weight="bold" text-align="center">Ocena</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black">
                                <fo:block font-weight="bold" text-align="center">Cena</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>

                    <fo:table-body>
                        <xsl:for-each select="Film">
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block text-align="center">
                                        <xsl:value-of select="Tytuł" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block text-align="center">
                                        <xsl:value-of select="@Gatunek" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block text-align="center">
                                        <xsl:value-of select="Ocena" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block text-align="center">
                                        <xsl:value-of select="Cena" />
                                        <xsl:text> zł</xsl:text>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </xsl:for-each>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:block>
    </xsl:template>

</xsl:stylesheet>


