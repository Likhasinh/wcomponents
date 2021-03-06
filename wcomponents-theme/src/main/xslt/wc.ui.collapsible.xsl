<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ui="https://github.com/bordertech/wcomponents/namespace/ui/v1.0"
	xmlns:html="http://www.w3.org/1999/xhtml" version="2.0">
	<xsl:import href="wc.common.attributes.xsl"/>
	<xsl:import href="wc.common.icon.xsl"/>
	<!-- WCollapsible -->
	<xsl:template match="ui:collapsible">
		<details id="{@id}">
			<xsl:call-template name="makeCommonClass"/>
			<xsl:if test="not(@collapsed)">
				<xsl:attribute name="open">
					<xsl:text>open</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@groupName and @groupName != @id">
				<xsl:attribute name="data-wc-group">
					<xsl:value-of select="@groupName"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:call-template name="hideElementIfHiddenSet"/>
			<summary tabindex="0">
				<xsl:call-template name="icon">
					<xsl:with-param name="class">
						<xsl:text>fa-caret-</xsl:text>
						<xsl:choose>
						<xsl:when test="@collapsed">right</xsl:when>
						<xsl:otherwise>down</xsl:otherwise>
					</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
				<xsl:choose>
					<xsl:when test="@level">
						<xsl:element name="h{@level}">
							<xsl:apply-templates select="ui:decoratedlabel"/>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="ui:decoratedlabel"/>
					</xsl:otherwise>
				</xsl:choose>
			</summary>
			<xsl:variable name="isAjax">
				<xsl:choose>
					<xsl:when test="@mode eq 'dynamic' or @mode eq 'eager' or (@mode eq 'lazy' and @collapsed)">
						<xsl:number value="1"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:number value="0"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:apply-templates select="ui:content">
				<xsl:with-param name="class">
					<xsl:if test="number($isAjax) eq 1">
						<xsl:text>wc_magic</xsl:text>
						<xsl:if test="@mode eq 'dynamic'">
							<xsl:text> wc_dynamic</xsl:text>
						</xsl:if>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="ajaxId">
					<xsl:if test="number($isAjax) eq 1">
						<xsl:value-of select="@id"/>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="labelId" select="ui:decoratedlabel/@id"/>
			</xsl:apply-templates>
		</details>
	</xsl:template>
</xsl:stylesheet>
