<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" version="1.0"
                xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="xml" media-type="image/svg" encoding="utf-8" doctype-public="-//W3C//DTD SVG 1.1//EN"
                doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"/>

    <xsl:template match="/">
        <svg:svg width="800" height="1000" font-family="Calibri">
            <svg:desc>Dane o filmach</svg:desc>
            <svg:title>Baza Filmów</svg:title>
            <defs>
                <linearGradient id="grad1" x1="0%" y1="0%" x2="0%" y2="100%">
                    <stop offset="0%" style="stop-color:rgb(255,240,220);stop-opacity:1"/>
                    <stop offset="100%" style="stop-color:rgb(235,220,200);stop-opacity:1"/>
                </linearGradient>
            </defs>

            <svg:rect x="0" y="0" width="100%" height="100%" fill="#ffdb8c"/>

            <svg:text x="50%" y="45" font-size="18" fill="black" font-weight="bold" text-anchor="middle">
                Baza Filmów
            </svg:text>

            <a xlink:href="pomocniczy.xhtml">
                <svg:g class="btn" cursor="pointer">
                    <svg:rect x="712" y="15" width="70" height="20" style="fill:rgb(130,67,0)" stroke="black"/>
                    <svg:text x="724" y="30" fill="burlywood" font-size="15">Raport</svg:text>
                </svg:g>
            </a>

            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOver(evt) {
                        var numbers = evt.target;
                        numbers.setAttribute("stroke", "chocolate");
                    }]]>
            </script>

            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOut(evt) {
                        var numbers = evt.target;
                        numbers.setAttribute("stroke", "firebrick");

                    }]]>
            </script>


            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOverVisibility(element) {
                        var elem1 = document.getElementById("elem1");
                        var elem2 = document.getElementById("elem2");
                        var elem3 = document.getElementById("elem3");
                        elem1.setAttribute("visibility", "visible");
                        elem2.setAttribute("visibility", "visible");
                        elem3.setAttribute("visibility", "visible");
                    }]]>
            </script>

            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOutVisibility(element) {
                        var elem1 = document.getElementById("elem1");
                        var elem2 = document.getElementById("elem2");
                        var elem3 = document.getElementById("elem3");
                        elem1.setAttribute("visibility", "hidden");
                        elem2.setAttribute("visibility", "hidden");
                        elem3.setAttribute("visibility", "hidden");

                    }]]>
            </script>
            <xsl:apply-templates/>
        </svg:svg>
    </xsl:template>
    

    <xsl:template match="Statystyki">
        <xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="Oceny">
        <svg:rect x="100" y="50" width="650" height="300" fill="orange" stroke="black"/>
        <svg:text x="50%" y="80" font-size="16" fill="#824300" font-weight="bold" text-anchor="middle">Oceny</svg:text>
        <svg:text x="245" y="320" font-size="16" fill="chocolate" font-weight="bold">1</svg:text>
        <svg:text x="345" y="320" font-size="16" fill="chocolate" font-weight="bold">2</svg:text>
        <svg:text x="445" y="320" font-size="16" fill="chocolate" font-weight="bold">3</svg:text>
        <svg:text x="545" y="320" font-size="16" fill="chocolate" font-weight="bold">4</svg:text>
        <svg:text x="645" y="320" font-size="16" fill="chocolate" font-weight="bold">5</svg:text>


        <!--
                <svg:rect x="200" y="340" width="530" height="120" fill="none" stroke="black" stroke-width="1"/>
        -->
        <line x1="200" y1="100" x2="730" y2="100" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="120" x2="730" y2="120" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="140" x2="730" y2="140" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="160" x2="730" y2="160" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="180" x2="730" y2="180" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="200" x2="730" y2="200" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="220" x2="730" y2="220" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="240" x2="730" y2="240" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="260" x2="730" y2="260" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="280" x2="730" y2="280" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="300" x2="730" y2="300" style="stroke:rgb(0,0,0);stroke-width:1"/>

        <svg:text x="184" y="100" font-size="10" fill="#824300">10</svg:text>
        <svg:text x="189" y="120" font-size="10" fill="#824300">9</svg:text>
        <svg:text x="189" y="140" font-size="10" fill="#824300">8</svg:text>
        <svg:text x="189" y="160" font-size="10" fill="#824300">7</svg:text>
        <svg:text x="189" y="180" font-size="10" fill="#824300">6</svg:text>
        <svg:text x="189" y="200" font-size="10" fill="#824300">5</svg:text>
        <svg:text x="189" y="220" font-size="10" fill="#824300">4</svg:text>
        <svg:text x="189" y="240" font-size="10" fill="#824300">3</svg:text>
        <svg:text x="189" y="260" font-size="10" fill="#824300">2</svg:text>
        <svg:text x="189" y="280" font-size="10" fill="#824300">1</svg:text>
        <svg:text x="189" y="300" font-size="10" fill="#824300">0</svg:text>


        <xsl:variable name="o1" select="Ocena1"/>
        <xsl:variable name="o2" select="Ocena2"/>
        <xsl:variable name="o3" select="Ocena3"/>
        <xsl:variable name="o4" select="Ocena4"/>
        <xsl:variable name="o5" select="Ocena5"/>

        <xsl:variable name="ile1" select="300-(20*$o1)"/>
        <xsl:variable name="ile2" select="300-(20*$o2)"/>
        <xsl:variable name="ile3" select="300-(20*$o3)"/>
        <xsl:variable name="ile4" select="300-(20*$o4)"/>
        <xsl:variable name="ile5" select="300-(20*$o5)"/>


        <svg:rect x="125" y="150" width="50" height="10" style="fill:rgb(130,67,0);stroke:rgb(0,0,0); stroke-width:1"/>
        <svg:text id="startOceny" x="140" y="158" font-size="10" fill="burlywood" cursor="pointer">Rysuj</svg:text>
        <xsl:element name="g">
            <xsl:attribute name="stroke">firebrick</xsl:attribute>
            <xsl:attribute name="stroke-width">20</xsl:attribute>
            <xsl:element name="line">
                <xsl:attribute name="x1">250</xsl:attribute>
                <xsl:attribute name="x2">250</xsl:attribute>
                <xsl:attribute name="y1">300</xsl:attribute>
                <xsl:attribute name="y2">
                    300
                </xsl:attribute>
                <xsl:attribute name="onmouseover">onMouseOver(evt)</xsl:attribute>
                <xsl:attribute name="onmouseout">onMouseOut(evt)</xsl:attribute>
                <xsl:element name="animate">
                    <xsl:attribute name="attributeName">y2</xsl:attribute>
                    <xsl:attribute name="attributeType">XML</xsl:attribute>
                    <xsl:attribute name="begin">startOceny.click</xsl:attribute>
                    <xsl:attribute name="dur">5s</xsl:attribute>
                    <xsl:attribute name="fill">freeze</xsl:attribute>
                    <xsl:attribute name="from">300</xsl:attribute>
                    <xsl:attribute name="to">
                        <xsl:value-of select="$ile1"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>

            <xsl:element name="line">
                <xsl:attribute name="x1">350</xsl:attribute>
                <xsl:attribute name="x2">350</xsl:attribute>
                <xsl:attribute name="y1">300</xsl:attribute>
                <xsl:attribute name="y2">
                    300
                </xsl:attribute>
                <xsl:attribute name="onmouseover">onMouseOver(evt)</xsl:attribute>
                <xsl:attribute name="onmouseout">onMouseOut(evt)</xsl:attribute>
                <xsl:element name="animate">
                    <xsl:attribute name="attributeName">start.click</xsl:attribute>
                    <xsl:attribute name="attributeName">y2</xsl:attribute>
                    <xsl:attribute name="attributeType">XML</xsl:attribute>
                    <xsl:attribute name="begin">startOceny.click</xsl:attribute>
                    <xsl:attribute name="dur">5s</xsl:attribute>
                    <xsl:attribute name="fill">freeze</xsl:attribute>
                    <xsl:attribute name="from">300</xsl:attribute>
                    <xsl:attribute name="to">
                        <xsl:value-of select="$ile2"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>

            <xsl:element name="line">
                <xsl:attribute name="x1">450</xsl:attribute>
                <xsl:attribute name="x2">450</xsl:attribute>
                <xsl:attribute name="y1">300</xsl:attribute>
                <xsl:attribute name="y2">
                    300
                </xsl:attribute>
                <xsl:attribute name="onmouseover">onMouseOver(evt)</xsl:attribute>
                <xsl:attribute name="onmouseout">onMouseOut(evt)</xsl:attribute>
                <xsl:element name="animate">
                    <xsl:attribute name="attributeName">y2</xsl:attribute>
                    <xsl:attribute name="attributeType">XML</xsl:attribute>
                    <xsl:attribute name="begin">startOceny.click</xsl:attribute>
                    <xsl:attribute name="dur">5s</xsl:attribute>
                    <xsl:attribute name="fill">freeze</xsl:attribute>
                    <xsl:attribute name="from">300</xsl:attribute>
                    <xsl:attribute name="to">
                        <xsl:value-of select="$ile3"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>

            <xsl:element name="line">
                <xsl:attribute name="x1">550</xsl:attribute>
                <xsl:attribute name="x2">550</xsl:attribute>
                <xsl:attribute name="y1">300</xsl:attribute>
                <xsl:attribute name="y2">
                    300
                </xsl:attribute>
                <xsl:attribute name="onmouseover">onMouseOver(evt)</xsl:attribute>
                <xsl:attribute name="onmouseout">onMouseOut(evt)</xsl:attribute>
                <xsl:element name="animate">

                    <xsl:attribute name="attributeName">y2</xsl:attribute>
                    <xsl:attribute name="attributeType">XML</xsl:attribute>
                    <xsl:attribute name="begin">startOceny.click</xsl:attribute>
                    <xsl:attribute name="dur">5s</xsl:attribute>
                    <xsl:attribute name="fill">freeze</xsl:attribute>
                    <xsl:attribute name="from">300</xsl:attribute>
                    <xsl:attribute name="to">
                        <xsl:value-of select="$ile4"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>

            <xsl:element name="line">
                <xsl:attribute name="x1">650</xsl:attribute>
                <xsl:attribute name="x2">650</xsl:attribute>
                <xsl:attribute name="y1">300</xsl:attribute>
                <xsl:attribute name="y2">
                    300
                </xsl:attribute>
                <xsl:attribute name="onmouseover">onMouseOver(evt)</xsl:attribute>
                <xsl:attribute name="onmouseout">onMouseOut(evt)</xsl:attribute>
                <xsl:element name="animate">
                    <xsl:attribute name="attributeName">y2</xsl:attribute>
                    <xsl:attribute name="attributeType">XML</xsl:attribute>
                    <xsl:attribute name="begin">startOceny.click</xsl:attribute>
                    <xsl:attribute name="dur">5s</xsl:attribute>
                    <xsl:attribute name="fill">freeze</xsl:attribute>
                    <xsl:attribute name="from">300</xsl:attribute>
                    <xsl:attribute name="to">
                        <xsl:value-of select="$ile5"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="Gatunki">
        <svg:rect x="100" y="350" width="650" height="300" fill="orange" stroke="black"/>
        <svg:text x="50%" y="380" font-size="16" fill="#824300" font-weight="bold" text-anchor="middle">Gatunki
        </svg:text>
        <svg:text x="225" y="620" font-size="16" fill="chocolate" font-weight="bold">Dramat</svg:text>
        <svg:text x="425" y="620" font-size="16" fill="chocolate" font-weight="bold">Komedia</svg:text>
        <svg:text x="625" y="620" font-size="16" fill="chocolate" font-weight="bold">Sci-Fi</svg:text>


        <!--
                <svg:rect x="200" y="340" width="530" height="120" fill="none" stroke="black" stroke-width="1"/>
        -->
        <line x1="200" y1="400" x2="730" y2="400" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="420" x2="730" y2="420" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="440" x2="730" y2="440" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="460" x2="730" y2="460" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="480" x2="730" y2="480" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="500" x2="730" y2="500" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="520" x2="730" y2="520" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="540" x2="730" y2="540" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="560" x2="730" y2="560" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="580" x2="730" y2="580" style="stroke:rgb(0,0,0);stroke-width:1"/>
        <line x1="200" y1="600" x2="730" y2="600" style="stroke:rgb(0,0,0);stroke-width:1"/>

        <svg:text x="186" y="400" font-size="10" fill="#824300">10</svg:text>
        <svg:text x="189" y="420" font-size="10" fill="#824300">9</svg:text>
        <svg:text x="189" y="440" font-size="10" fill="#824300">8</svg:text>
        <svg:text x="189" y="460" font-size="10" fill="#824300">7</svg:text>
        <svg:text x="189" y="480" font-size="10" fill="#824300">6</svg:text>
        <svg:text x="189" y="500" font-size="10" fill="#824300">5</svg:text>
        <svg:text x="189" y="520" font-size="10" fill="#824300">4</svg:text>
        <svg:text x="189" y="540" font-size="10" fill="#824300">3</svg:text>
        <svg:text x="189" y="560" font-size="10" fill="#824300">2</svg:text>
        <svg:text x="189" y="580" font-size="10" fill="#824300">1</svg:text>
        <svg:text x="189" y="600" font-size="10" fill="#824300">0</svg:text>


        <xsl:variable name="o1" select="Dramat/Ilość"/>
        <xsl:variable name="o2" select="Komedia/Ilość"/>
        <xsl:variable name="o3" select="Sci-Fi/Ilość"/>


        <xsl:variable name="ile1" select="600-(20*$o1)"/>
        <xsl:variable name="ile2" select="600-(20*$o2)"/>
        <xsl:variable name="ile3" select="600-(20*$o3)"/>


        <svg:rect x="125" y="450" width="50" height="10" style="fill:rgb(130,67,0);stroke:rgb(0,0,0); stroke-width:1"/>
        <svg:text id="startGatunki" x="140" y="458" font-size="10" fill="burlywood" cursor="pointer">Rysuj</svg:text>
        <xsl:element name="g">
            <xsl:attribute name="stroke">firebrick</xsl:attribute>
            <xsl:attribute name="stroke-width">50</xsl:attribute>
            <xsl:element name="line">
                <xsl:attribute name="x1">250</xsl:attribute>
                <xsl:attribute name="x2">250</xsl:attribute>
                <xsl:attribute name="y1">600</xsl:attribute>
                <xsl:attribute name="y2">
                    600
                </xsl:attribute>
                <xsl:attribute name="onmouseover">onMouseOver(evt)</xsl:attribute>
                <xsl:attribute name="onmouseout">onMouseOut(evt)</xsl:attribute>
                <xsl:element name="animate">
                    <xsl:attribute name="attributeName">y2</xsl:attribute>
                    <xsl:attribute name="attributeType">XML</xsl:attribute>
                    <xsl:attribute name="begin">startGatunki.click</xsl:attribute>
                    <xsl:attribute name="dur">5s</xsl:attribute>
                    <xsl:attribute name="fill">freeze</xsl:attribute>
                    <xsl:attribute name="from">600</xsl:attribute>
                    <xsl:attribute name="to">
                        <xsl:value-of select="$ile1"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>


            <xsl:element name="line">
                <xsl:attribute name="x1">450</xsl:attribute>
                <xsl:attribute name="x2">450</xsl:attribute>
                <xsl:attribute name="y1">600</xsl:attribute>
                <xsl:attribute name="y2">
                    600
                </xsl:attribute>
                <xsl:attribute name="onmouseover">onMouseOver(evt)</xsl:attribute>
                <xsl:attribute name="onmouseout">onMouseOut(evt)</xsl:attribute>
                <xsl:element name="animate">
                    <xsl:attribute name="attributeName">y2</xsl:attribute>
                    <xsl:attribute name="attributeType">XML</xsl:attribute>
                    <xsl:attribute name="begin">startGatunki.click</xsl:attribute>
                    <xsl:attribute name="dur">5s</xsl:attribute>
                    <xsl:attribute name="fill">freeze</xsl:attribute>
                    <xsl:attribute name="from">600</xsl:attribute>
                    <xsl:attribute name="to">
                        <xsl:value-of select="$ile2"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>

            <xsl:element name="line">
                <xsl:attribute name="x1">650</xsl:attribute>
                <xsl:attribute name="x2">650</xsl:attribute>
                <xsl:attribute name="y1">600</xsl:attribute>
                <xsl:attribute name="y2">
                    600
                </xsl:attribute>
                <xsl:attribute name="onmouseover">onMouseOver(evt)</xsl:attribute>
                <xsl:attribute name="onmouseout">onMouseOut(evt)</xsl:attribute>
                <xsl:element name="animate">
                    <xsl:attribute name="attributeName">y2</xsl:attribute>
                    <xsl:attribute name="attributeType">XML</xsl:attribute>
                    <xsl:attribute name="begin">startGatunki.click</xsl:attribute>
                    <xsl:attribute name="dur">5s</xsl:attribute>
                    <xsl:attribute name="fill">freeze</xsl:attribute>
                    <xsl:attribute name="from">600</xsl:attribute>
                    <xsl:attribute name="to">
                        <xsl:value-of select="$ile3"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>
        </xsl:element>


        <xsl:variable name="s1" select="Dramat/ŚredniaOcen"/>
        <xsl:variable name="s2" select="Komedia/ŚredniaOcen"/>
        <xsl:variable name="s3" select="Sci-Fi/ŚredniaOcen"/>


        <xsl:variable name="ile1s" select="18*$s1"/>
        <xsl:variable name="ile2s" select="18*$s2"/>
        <xsl:variable name="ile3s" select="18*$s3"/>


        <circle cx="245" cy="830" fill="burlywood" stroke="#824300" onmouseover="onMouseOverVisibility(evt)" onmouseout="onMouseOutVisibility(evt)">
            <animate attributeName="r" attributeType="XML" begin="startGatunki.click" dur="4s" fill="freeze"
                     from="0" to="{$ile1s}"/>
        </circle>
        <svg:g id="elem1" visibility="hidden">
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:value-of select="217"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="848"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>firebrick</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>50</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="$s1"/>
            </xsl:element>
        </svg:g>


        <circle cx="445" cy="830" fill="burlywood" stroke="#824300" onmouseover="onMouseOverVisibility(evt)" onmouseout="onMouseOutVisibility(evt)" >
            <animate attributeName="r" attributeType="XML" begin="startGatunki.click" dur="4s" fill="freeze"
                     from="0" to="{$ile2s}"/>
        </circle>
        <svg:g id="elem2" visibility="hidden">
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:value-of select="410"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="848"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>firebrick</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>50</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="$s2"/>
            </xsl:element>
        </svg:g>
        <circle cx="645" cy="830" fill="burlywood" stroke="#824300" onmouseover="onMouseOverVisibility(evt)" onmouseout="onMouseOutVisibility(evt)" >
            <animate attributeName="r" attributeType="XML" begin="startGatunki.click" dur="4s" fill="freeze"
                     from="0" to="{$ile3s}"/>
        </circle>
        <svg:g id="elem3" visibility="hidden">
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:value-of select="617"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="848"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>firebrick</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>50</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="$s3"/>
            </xsl:element>
        </svg:g>
        <svg:text x="50%" y="710" font-size="16" fill="#824300" font-weight="bold" text-anchor="middle">Średnia ocen dla
            gatunków
        </svg:text>
        <svg:text x="225" y="950" font-size="16" fill="chocolate" font-weight="bold">Dramat</svg:text>
        <svg:text x="425" y="950" font-size="16" fill="chocolate" font-weight="bold">Komedia</svg:text>
        <svg:text x="625" y="950" font-size="16" fill="chocolate" font-weight="bold">Sci-Fi</svg:text>

    </xsl:template>
</xsl:stylesheet>