
<%@ page import="coexpress.Mapping" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mapping.label', default: 'Mapping')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-mapping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mapping" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'mapping.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="timestamp" title="${message(code: 'mapping.timestamp.label', default: 'Timestamp')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${mappingInstanceList}" status="i" var="mappingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mappingInstance.id}">${fieldValue(bean: mappingInstance, field: "name")}</g:link></td>
					
						<td><g:formatDate date="${mappingInstance.timestamp}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mappingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
