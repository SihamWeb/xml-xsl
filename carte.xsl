<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
	<!-- on declare le type de sortie générée -->
	<xsl:template match="/">
	<!-- on declare un template pour le noeud racine, notez que l'on peut declarer des templates pour d'autres noeuds et les appeler dans le template du noeud racine -->
		<html>
			
            <head>
				<title>Cartes des personnages</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="icon" type="image/ico" href="favicon.ico">
			</head>
			
            
            <body>

            	<svg xmlns="http://www.w3.org/2000/svg" width="width" height="height">

					<xsl:for-each select="/carte/parametres">
					<!-- affichage du fond en svg -->
						<xsl:for-each select="dimensions">
                            
                            <rect width="{width}" height="{height}" fill="rgba(18,74,87,1)" />
                        	
						</xsl:for-each>
					</xsl:for-each>
					
					

					<xsl:for-each select="/carte/personnages">
						<xsl:for-each select="personnage">
							<xsl:variable name="variable_x" select="@position-x" />
							<xsl:variable name="variable_y" select="@position-y" />
							
								<rect x="{$variable_x}" y="{$variable_y}" width="{width}" height="{height}" fill="{color}"/>
							
						</xsl:for-each>
					</xsl:for-each>

					

	                <xsl:for-each select="/carte/regions">
						<xsl:for-each select="region">
							<xsl:variable name="variable_x_region" select="@position-x" />
							<xsl:variable name="variable_y_region" select="@position-y" />
								
								<rect x="{$variable_x_region}" y="{$variable_y_region}" width="{width}" height="{height}" stroke="{@border-color}" fill="none" stroke-width="{@border-width}"/>
								
						</xsl:for-each>
					</xsl:for-each>


					<xsl:for-each select="/carte/regions/region/nom">
						
						<text x="{@position-x}" y="{@position-y}" fill="{@color}"><xsl:value-of select="current()" /></text>
		
					</xsl:for-each>

					
				</svg>

			</body>


		</html>
	</xsl:template>
</xsl:stylesheet>