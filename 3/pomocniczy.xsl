<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                extension-element-prefixes="date">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" media-type="text/xml" omit-xml-declaration="no"
                indent="yes"/>


    <xsl:key use="@Id" name="GatunekKey" match="//BazaFilmów/Gatunki/Gatunek"/>
    <xsl:key use="@IdGatunku" name="FilmGatunekKey" match="//BazaFilmów/Filmy/Film"/>


    <xsl:template match="/">
        <xsl:element name="BazaFilmów">
            <xsl:apply-templates/>

            <Statystyki>
                <Oceny>
                    <Ocena1>
                        <xsl:value-of select="count(//Filmy/Film[@Ocena='1'])"/>
                    </Ocena1>
                    <Ocena2>
                        <xsl:value-of select="count(//Filmy/Film[@Ocena='2'])"/>
                    </Ocena2>
                    <Ocena3>
                        <xsl:value-of select="count(//Filmy/Film[@Ocena='3'])"/>
                    </Ocena3>
                    <Ocena4>
                        <xsl:value-of select="count(//Filmy/Film[@Ocena='4'])"/>
                    </Ocena4>
                    <Ocena5>
                        <xsl:value-of select="count(//Filmy/Film[@Ocena='5'])"/>
                    </Ocena5>
                    <Wszystkie>
                        <xsl:value-of select="count(//Filmy/Film/@Ocena)"/>
                    </Wszystkie>
                </Oceny>
                <Gatunki>
                    <Dramat>
                        <xsl:variable name="DrCount" select="count(//Filmy/Film[@IdGatunku='Dr'])"/>
                        <Ilość>
                            <xsl:value-of select="$DrCount"/>
                        </Ilość>
                        <ŚredniaOcen>
                            <xsl:value-of select="sum(//Filmy/Film[@IdGatunku='Dr']/@Ocena) div $DrCount"/>
                        </ŚredniaOcen>
                    </Dramat>
                    <Komedia>
                        <xsl:variable name="KoCount" select="count(//Filmy/Film[@IdGatunku='Ko'])"/>
                        <Ilość>
                            <xsl:value-of select="$KoCount"/>
                        </Ilość>
                        <ŚredniaOcen>
                            <xsl:value-of select="sum(//Filmy/Film[@IdGatunku='Ko']/@Ocena) div $KoCount"/>
                        </ŚredniaOcen>
                    </Komedia>
                    <Sci-Fi>
                        <xsl:variable name="SFCount" select="count(//Filmy/Film[@IdGatunku='SF'])"/>
                        <Ilość>
                            <xsl:value-of select="$SFCount"/>
                        </Ilość>
                        <ŚredniaOcen>
                            <xsl:value-of select="sum(//Filmy/Film[@IdGatunku='SF']/@Ocena) div $SFCount"/>
                        </ŚredniaOcen>
                    </Sci-Fi>
                    <Wszystkie>
                        <xsl:variable name="FilmsCount" select="count(//Filmy/Film)"/>
                        <Ilość>
                            <xsl:value-of select="$FilmsCount"/>
                        </Ilość>
                        <ŚredniaOcen>
                            <xsl:value-of select="sum(//Filmy/Film/@Ocena) div $FilmsCount"/>
                        </ŚredniaOcen>
                    </Wszystkie>
                </Gatunki>
                <DataRaportu>
                    <xsl:value-of select="date:date-time()"/>
                </DataRaportu>
            </Statystyki>

        </xsl:element>
    </xsl:template>
    <xsl:template match="//Autorzy">
        <xsl:element name="Autorzy">
            <xsl:apply-templates select="Autor"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="//Autor">
        <xsl:element name="Autor">
            <xsl:element name="Indeks">
                <xsl:value-of select="./Indeks"/>
            </xsl:element>
            <xsl:element name="Imię">
                <xsl:value-of select="./Imię"/>
            </xsl:element>
            <xsl:element name="Nazwisko">
                <xsl:value-of select="./Nazwisko"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>


    <!--    <xsl:template match="//Film">
            <xsl:element name="Gatunek">
                <xsl:variable name="WybranyGatunek" select="key('FilmGatunekKey', @IdGatunku)" />
                <xsl:attribute name="Nazwa">
                    <xsl:value-of select="WybranyGatunek/@Nazwa"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:template>-->

    <xsl:template match="//Filmy">
        <xsl:element name="Filmy">
            <xsl:apply-templates select="Film"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="//Film">
        <xsl:copy>
            <xsl:attribute name="Gatunek">
                <xsl:variable name="WybranyGatunek" select="key('GatunekKey', @IdGatunku)"/>
                <xsl:value-of select="$WybranyGatunek/@Nazwa"/>
            </xsl:attribute>
            <xsl:element name="Tytuł">
            <xsl:value-of select="Tytuł"/>
            </xsl:element>
            <xsl:element name="Ocena">
                <xsl:value-of select="./@Ocena"/>
            </xsl:element>
            <xsl:element name="Cena">
                <xsl:value-of select="Cena"/>
            </xsl:element>
        </xsl:copy>
    </xsl:template>


</xsl:stylesheet>