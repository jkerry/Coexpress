
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
			<table class="table table-condensed sortable">
				<thead>
					<tr>
					
						<th>Module/Trait</th>
						<g:each in="${traits}" var="trait">
						<g:if test="${ trait.name.size() >= 10}">
							<th title="${trait.name}"><a><small>${trait.name[0..9]}...</small></a></th>
						</g:if>
						<g:else>
							<th title="${trait.name}"><a><small>${trait.name}</small></a></th>
						</g:else>
						</g:each>
						
					</tr>
				</thead>
				<tbody>
					<g:each in="${modules}" var="mod" status="modIdx">
						<g:set var="moduleRow" value="${table.get(mod.name)}" />
						<g:if test="${significance[modIdx]}">
							<tr class="not_significant">
						</g:if>
						<g:else>
							<tr>
						</g:else>
							<td><a href="${createLink(action:"show",id:mod.id)}">${mod.name}</a></td>
							<g:each in="${moduleRow}" status="i" var="mt">
								<td title="${traits[i].name} x ${mod.name}" class="heatmap" sorttable_customkey="${mt.correlation}">${mt.correlation.round(4)} (${mt.pValue.round(4)})</td>
							</g:each>
						</tr>
					</g:each>
				</tbody>
			</table>
			<g:javascript src="Module/correlationTables/main.js"/>
			<g:javascript src="Module/correlationTables/sorttable.js"/>
			<g:render template="corTableCtl" />
			<!-- App specific control panel -->
		</div>
	</body>
</html>
