
<%@ page import="coexpress.Module" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'module.label', default: 'Module')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div>
			<table class="table table-condensed">
				<thead>
					<tr>
					
						<th>Module</th>
						<g:each in="${traits}" var="trait">
						<th><small>${trait.name}</small></th>
						</g:each>
					
					</tr>
				</thead>
				<tbody>
					<g:each in="${modules}" var="mod">
						<g:set var="moduleRow" value="${table.get(mod.name)}" />
						<tr>
							<td>${mod.name}</td>
							<g:each in="${moduleRow}" var="mt">
								<td>${mt.correlation} (${mt.pValue})</td>
							</g:each>
						</tr>
					</g:each>
				</tbody>
			</table>
			
		</div>
	</body>
</html>
