
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
						<g:each in="${transcriptInstanceList}">
							<li><g:link controller="Transcript" action="show" id="${it.id}">${it.name }</g:link></a></li>
						</g:each>
					</ul>
					<g:paginate controller="Module" action="show" total="${transcriptCount}" params="${[id:params.id]}" maxsteps="6" class="pagination-mini"/>
				</div>
				<div class="span6">
					<h3>Module-Trait Relationships</h3>
					<p>Select a trait to display a module membership vs trait significance scatter plot. The x and y axes are the absolute value of the correlation between the transcript and the <em>${moduleInstance.name}</em> module eigen-gene or trait profile respectively.</p>
					<select name="trait_select" id="img_select">
						<g:each in="${traitList}" var="trait">
						<option value="${resource(dir:'images/Module/Scatterplots',file:"${session['mapping_id']}_${moduleInstance.name}_v_${trait.name}_genewiseSignificance.png")}">${trait.name}</option>
						</g:each>
					</select>
					<div class="span6 centered" id="img_block">
						<g:img id="sig_scatterplot" dir="images/Module/Scatterplots" class="vmargin_push75" file="${session['mapping_id']}_${moduleInstance.name}_v_${traitList[0].name}_genewiseSignificance.png"/>
					</div>
				</div>
			</div>
		</div>
	<g:javascript src="Module/Show/main.js"/>
	</body>
</html>
