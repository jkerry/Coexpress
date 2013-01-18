
<%@ page import="coexpress.Transcript" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transcript.label', default: 'Transcript')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-transcript" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-transcript" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list transcript">
			
				<g:if test="${transcriptInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="transcript.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${transcriptInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transcriptInstance?.sequence}">
				<li class="fieldcontain">
					<span id="sequence-label" class="property-label"><g:message code="transcript.sequence.label" default="Sequence" /></span>
					
						<span class="property-value" aria-labelledby="sequence-label"><g:fieldValue bean="${transcriptInstance}" field="sequence"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transcriptInstance?.libraries}">
				<li class="fieldcontain">
					<span id="libraries-label" class="property-label"><g:message code="transcript.libraries.label" default="Libraries" /></span>
					
						<g:each in="${transcriptInstance.libraries}" var="l">
						<span class="property-value" aria-labelledby="libraries-label"><g:link controller="library" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${transcriptInstance?.id}" />
					<g:link class="edit" action="edit" id="${transcriptInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
