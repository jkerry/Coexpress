
<%@ page import="coexpress.Module" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'module.label', default: 'Module')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		
		<link type="text/css" rel="stylesheet" href="${resource(dir: 'css', file: 'Module/module.css')}" />
	</head>
	<body>
		<div>
			<table class="table table-condensed">
				<thead>
					<tr>
					
						<th>Module</th>
						<g:each in="${traits}" var="trait">
						<g:if test="${ trait.name.size() >= 10}">
							<th title="${trait.name}"><small>${trait.name[0..9]}...</small></th>
						</g:if>
						<g:else>
							<th title="${trait.name}"><small>${trait.name}</small></th>
						</g:else>
						</g:each>
						
					</tr>
				</thead>
				<tbody>
					<g:each in="${modules}" var="mod">
						<g:set var="moduleRow" value="${table.get(mod.name)}" />
						<tr>
							<td><a href="${createLink(action:"show",id:mod.id)}">${mod.name}</a></td>
							<g:each in="${moduleRow}" status="i" var="mt">
								<td title="${traits[i].name} x ${mod.name}" class="heatmap">${mt.correlation.round(4)} (${mt.pValue.round(4)})</td>
							</g:each>
						</tr>
					</g:each>
				</tbody>
			</table>
			<g:javascript src="Module/correlationTables/main.js"/>
			<g:render template="corTableCtl" />
			<!-- App specific control panel -->
		</div>
	</body>
</html>
