
<%@ page import="coexpress.Stats" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stats.label', default: 'Stats')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-stats" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-stats" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="componentFpkm" title="${message(code: 'stats.componentFpkm.label', default: 'Component Fpkm')}" />
					
						<g:sortableColumn property="defdr" title="${message(code: 'stats.defdr.label', default: 'Defdr')}" />
					
						<g:sortableColumn property="depValue" title="${message(code: 'stats.depValue.label', default: 'Dep Value')}" />
					
						<g:sortableColumn property="fpkm" title="${message(code: 'stats.fpkm.label', default: 'Fpkm')}" />
					
						<th><g:message code="stats.library.label" default="Library" /></th>
					
						<g:sortableColumn property="maxExpectationCount" title="${message(code: 'stats.maxExpectationCount.label', default: 'Max Expectation Count')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${statsInstanceList}" status="i" var="statsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${statsInstance.id}">${fieldValue(bean: statsInstance, field: "componentFpkm")}</g:link></td>
					
						<td>${fieldValue(bean: statsInstance, field: "defdr")}</td>
					
						<td>${fieldValue(bean: statsInstance, field: "depValue")}</td>
					
						<td>${fieldValue(bean: statsInstance, field: "fpkm")}</td>
					
						<td>${fieldValue(bean: statsInstance, field: "library")}</td>
					
						<td>${fieldValue(bean: statsInstance, field: "maxExpectationCount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${statsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
