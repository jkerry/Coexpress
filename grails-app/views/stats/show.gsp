
<%@ page import="coexpress.Stats" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stats.label', default: 'Stats')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stats" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-stats" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stats">
			
				<g:if test="${statsInstance?.componentFpkm}">
				<li class="fieldcontain">
					<span id="componentFpkm-label" class="property-label"><g:message code="stats.componentFpkm.label" default="Component Fpkm" /></span>
					
						<span class="property-value" aria-labelledby="componentFpkm-label"><g:fieldValue bean="${statsInstance}" field="componentFpkm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statsInstance?.defdr}">
				<li class="fieldcontain">
					<span id="defdr-label" class="property-label"><g:message code="stats.defdr.label" default="Defdr" /></span>
					
						<span class="property-value" aria-labelledby="defdr-label"><g:fieldValue bean="${statsInstance}" field="defdr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statsInstance?.depValue}">
				<li class="fieldcontain">
					<span id="depValue-label" class="property-label"><g:message code="stats.depValue.label" default="Dep Value" /></span>
					
						<span class="property-value" aria-labelledby="depValue-label"><g:fieldValue bean="${statsInstance}" field="depValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statsInstance?.fpkm}">
				<li class="fieldcontain">
					<span id="fpkm-label" class="property-label"><g:message code="stats.fpkm.label" default="Fpkm" /></span>
					
						<span class="property-value" aria-labelledby="fpkm-label"><g:fieldValue bean="${statsInstance}" field="fpkm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statsInstance?.library}">
				<li class="fieldcontain">
					<span id="library-label" class="property-label"><g:message code="stats.library.label" default="Library" /></span>
					
						<span class="property-value" aria-labelledby="library-label"><g:link controller="library" action="show" id="${statsInstance?.library?.id}">${statsInstance?.library?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${statsInstance?.maxExpectationCount}">
				<li class="fieldcontain">
					<span id="maxExpectationCount-label" class="property-label"><g:message code="stats.maxExpectationCount.label" default="Max Expectation Count" /></span>
					
						<span class="property-value" aria-labelledby="maxExpectationCount-label"><g:fieldValue bean="${statsInstance}" field="maxExpectationCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statsInstance?.rawCount}">
				<li class="fieldcontain">
					<span id="rawCount-label" class="property-label"><g:message code="stats.rawCount.label" default="Raw Count" /></span>
					
						<span class="property-value" aria-labelledby="rawCount-label"><g:fieldValue bean="${statsInstance}" field="rawCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statsInstance?.transcript}">
				<li class="fieldcontain">
					<span id="transcript-label" class="property-label"><g:message code="stats.transcript.label" default="Transcript" /></span>
					
						<span class="property-value" aria-labelledby="transcript-label"><g:link controller="transcript" action="show" id="${statsInstance?.transcript?.id}">${statsInstance?.transcript?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${statsInstance?.id}" />
					<g:link class="edit" action="edit" id="${statsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
