
<%@ page import="coexpress.Module" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'module.label', default: 'Module')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<style type="text/css">
			div#show-module{
				padding: 0px 65px 0px 65px;
			}
			h1#modName{
				border-bottom: solid;
				border-color: ${moduleInstance.color};
			}
		</style>
	</head>
	<body>
		<div id="show-module" >
			<h1 id="modName" ><g:message code="default.show.label" args="[entityName]" />: <strong>${moduleInstance.name}</strong></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="row">
				<div class="span4">
					<h3>Composite Transcripts</h3>
					<p>The following transcripts had sufficient topological overlap to form the <em>${moduleInstance.name}</em> module. The <em>${moduleInstance.name}</em> eigengene is the first principle component of their transcript abundance profiles.</p>
					<ul>
						<g:each in="${moduleInstance.transcripts }" var="transcript">
							<li><a href="${createLink(controller:'Transcript', action:'Show', id:transcript.id) }">${transcript.name}</a></li>
						</g:each>
					</ul>
				</div>
				<div class="span6">
				<p>test</p>
				</div>
			</div>
		</div>
	</body>
</html>
