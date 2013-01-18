
<%@ page import="coexpress.Library" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'library.label', default: 'Library')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-library" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-library" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list library">
			
				<g:if test="${libraryInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="library.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${libraryInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${libraryInstance?.map}">
				<li class="fieldcontain">
					<span id="map-label" class="property-label"><g:message code="library.map.label" default="Map" /></span>
					
						<span class="property-value" aria-labelledby="map-label"><g:link controller="mapping" action="show" id="${libraryInstance?.map?.id}">${libraryInstance?.map?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${libraryInstance?.transcripts}">
				<li class="fieldcontain">
					<span id="transcripts-label" class="property-label"><g:message code="library.transcripts.label" default="Transcripts" /></span>
					
						<g:each in="${libraryInstance.transcripts}" var="t">
						<span class="property-value" aria-labelledby="transcripts-label"><g:link controller="transcript" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${libraryInstance?.id}" />
					<g:link class="edit" action="edit" id="${libraryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
