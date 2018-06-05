<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:baza="http://www.example.org/baza"
                exclude-result-prefixes="baza"
>

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>


    <xsl:key use="@Id" name="GatunekKey" match="/baza:BazaFilmów/baza:Gatunki/baza:Gatunek"/>
    <xsl:key use="@IdGatunku" name="FilmGatunekKey" match="/baza:BazaFilmów/baza:Filmy/baza:Film"/>


    <xsl:template match="/baza:BazaFilmów">
        <xsl:element name="BazaFilmów">
            <xsl:apply-templates/>

            <Statystyki>
                <Oceny>
                    <Ocena1>
                        <xsl:value-of select="count(//baza:Filmy/baza:Film[@Ocena='1'])"/>
                    </Ocena1>
                    <Ocena2>
                        <xsl:value-of select="count(//baza:Filmy/baza:Film[@Ocena='2'])"/>
                    </Ocena2>
                    <Ocena3>
                        <xsl:value-of select="count(//baza:Filmy/baza:Film[@Ocena='3'])"/>
                    </Ocena3>
                    <Ocena4>
                        <xsl:value-of select="count(//baza:Filmy/baza:Film[@Ocena='4'])"/>
                    </Ocena4>
                    <Ocena5>
                        <xsl:value-of select="count(//baza:Film[@Ocena='5'])"/>
                    </Ocena5>
                    <Wszystkie>
                        <xsl:value-of select="count(//baza:Filmy/baza:Film/@Ocena)"/>
                    </Wszystkie>
                </Oceny>
                <Gatunki>
                    <Dramat>
                        <xsl:variable name="DrCount" select="count(//baza:Filmy/baza:Film[@IdGatunku='Dr'])"/>
                        <Ilość>
                            <xsl:value-of select="$DrCount"/>
                        </Ilość>
                        <ŚredniaOcen>
                            <xsl:value-of select="round(sum(/baza:BazaFilmów/baza:Filmy/baza:Film[@IdGatunku='Dr']/@Ocena)*100 div $DrCount) div 100"/>
                        </ŚredniaOcen>
                    </Dramat>
                    <Komedia>
                        <xsl:variable name="KoCount" select="count(//baza:Filmy/baza:Film[@IdGatunku='Ko'])"/>
                        <Ilość>
                            <xsl:value-of select="$KoCount"/>
                        </Ilość>
                         <ŚredniaOcen>
                             <xsl:value-of select="round(sum(/baza:BazaFilmów/baza:Filmy/baza:Film[@IdGatunku='Dr']/@Ocena)*100 div $KoCount) div 100"/>
                         </ŚredniaOcen>
                    </Komedia>
                    <Sci-Fi>
                        <xsl:variable name="SFCount" select="count(//baza:Filmy/baza:Film[@IdGatunku='SF'])"/>
                        <Ilość>
                            <xsl:value-of select="$SFCount"/>
                        </Ilość>
                         <ŚredniaOcen>
                             <xsl:value-of select="round(sum(/baza:BazaFilmów/baza:Filmy/baza:Film[@IdGatunku='Dr']/@Ocena)*100 div $SFCount) div 100"/>
                         </ŚredniaOcen>
                    </Sci-Fi>
                    <Wszystkie>
                        <xsl:variable name="FilmsCount" select="count(//baza:Filmy/baza:Film)"/>
                        <Ilość>
                            <xsl:value-of select="$FilmsCount"/>
                        </Ilość>
                         <ŚredniaOcen>
                             <xsl:value-of select="round(sum(/baza:BazaFilmów/baza:Filmy/baza:Film/@Ocena)*100 div $FilmsCount) div 100"/>
                         </ŚredniaOcen>
                    </Wszystkie>
                </Gatunki>
                <DataRaportu>
                    <xsl:value-of select="current-dateTime()"/>
                </DataRaportu>
            </Statystyki>

        </xsl:element>
    </xsl:template>
    <xsl:template match="baza:Autorzy">
        <xsl:element name="Autorzy">
            <xsl:apply-templates select="baza:Autor"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="baza:Autor">
        <xsl:element name="Autor">
            <xsl:element name="Indeks">
                <xsl:value-of select="baza:Indeks"/>
            </xsl:element>
            <xsl:element name="Imię">
                <xsl:value-of select="baza:Imię"/>
            </xsl:element>
            <xsl:element name="Nazwisko">
                <xsl:value-of select="baza:Nazwisko"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>


    <xsl:template match="baza:Filmy">
        <xsl:element name="Filmy">
            <xsl:apply-templates select="baza:Film"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="baza:Film">
        <xsl:element name="Film">
            <xsl:attribute name="Gatunek">
                <xsl:variable name="WybranyGatunek" select="key('GatunekKey', @IdGatunku)"/>
                <xsl:value-of select="$WybranyGatunek/@Nazwa"/>
            </xsl:attribute>
            <xsl:element name="Tytuł">
                <xsl:value-of select="baza:Tytuł"/>
            </xsl:element>
            <xsl:element name="Ocena">
                <xsl:value-of select="@Ocena"/>
            </xsl:element>
            <xsl:element name="Cena">
                <xsl:value-of select="baza:Cena"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>