
<%@ page import="coexpress.Mapping" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mapping.label', default: 'Mapping')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="content">
		<h1>Select a mapping</h1>
		<p>Mapping in this context is functionally synonymous with 'experiment'. Different mappings represent different assemblies and abundance estimation  of the same data and/or assemblies and abundance estimation of different species/tissues/etc.</p>
		<hr />
		<p class="lead">Please select a mapping.</p>
		<g:form action="set">
			<select name="mapping_id">
			<g:each in="${maps}" var="mapping">
				<option value="${mapping.id}">${mapping.name}</option>
			</g:each>
			</select>
			<br/>
			<g:submitButton name="submit"/>
		</g:form>
		</div>
	</body>
</html>
