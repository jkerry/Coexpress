
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
				<h3>Module-Trait Relationships</h3>
					<p>Select a trait to display a module membership vs trait significance scatter plot. The x and y axes are the absolute value of the correlation between the transcript and the <em>${moduleInstance.name}</em> module eigen-gene or trait profile respectively.</p>
					<select name="trait_select" id="img_select">
						<g:each in="${traitList}" var="trait">
						<option value="${session['mapping_id']}_${moduleInstance.name}_v_${trait.name}">${trait.name}</option>
						</g:each>
				</select>
			</div>
			<div class="row">
				<div class="span7">
					<div class="span5 centered" id="img_block1">
						<g:img id="sig_scatterplot" dir="images/Module_Trait/ModuleTraitMembership" class="vmargin_push75" file="${session['mapping_id']}_${moduleInstance.name}_v_${traitList[0].name}_genewiseSignificance.png"/>
					</div>
				</div>
				<div class="span5">
					<div class="span7 centered" id="img_block2">
						<g:img id="transcriptProfile" dir="images/Module_Trait/ModuleTAProfiles" class="vmargin_push75" file="${session['mapping_id']}_${moduleInstance.name}_v_${traitList[0].name}_TA_profile.png"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div id="transcriptList" class="span12">
					<h3>Composite Transcripts</h3>
					<p>The following transcripts had sufficient topological overlap to form the <em>${moduleInstance.name}</em> module. The <em>${moduleInstance.name}</em> eigengene is the first principle component of their transcript abundance profiles.</p>
					<table class="table table-bordered table-striped span12">
						<thead>
							<tr>
								<th>Transcript</th>
								<th>Best Blast Hit</th>
								<th>E-Value</th>
								<th>Organism</th>
								<th>Definition</th>
							</tr>
						</thead>
						<tbody>
						<g:each in="${transcriptInstanceList}">
						<tr>
							<td><g:link controller="Transcript" action="show" id="${it.id}">${it.name }</g:link></a></td>
							<g:if test="${blastHitList[it]}">
								<g:set var="bhit" value="${blastHitList[it]}"/>
								<td><a href="http://www.ncbi.nlm.nih.gov/protein/${bhit.gi_number}" target="_blank">${bhit.subject}</a></td>
								<td>${bhit.e_value}</td>
								<td>${bhit.organism}</td>
								<td>${bhit.defline}</td>
							</g:if>
							<g:else>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</g:else>
						</tr>
						</g:each>
						</tbody>
					</table>
					<g:paginate controller="Module" action="show" total="${transcriptCount}" params="${[id:params.id]}" maxsteps="6" class="pagination-mini"/>
				</div>
			</div>
			<div class="row">
				<div class="span6">
					<div id="BLASTcloud">
						<h3>BLAST hit description cloud</h3>
						<p>The tag cloud below is asynchronously generated from the highest bit-score BLAST match for each of the first 2,000 transcripts within this module.</p>
						<br/>
						<p><em>Dev Note: This may take a while and can be ignored if necessary. Some modules do not have a sufficient number of BLAST hits with keywords to make this function meaningful. Please report any errors, questions, or requests to <a href="mailto:john@kerryhouse.net">John</a></em></p>
						<div id="tagCloud">
							<a id="buildTag" class="btn btn-success">Build Tag Cloud</a>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<div class="row"><div id="result" class="span12"></div></div>
	<g:javascript src="jquery/TagCloud.js"/>
	<g:javascript src="Module/Show/main.js"/>
	<g:javascript>
		var url = "${createLink(action:'getHitsAsJson',id:moduleInstance.id,absolute:true)}"
		var spinner = "${resource(dir:'images',file:'spinner.gif') }"
		var modId = ${moduleInstance.id};
		var taUrlBase = "${resource(dir:'images/Module_Trait/ModuleTAProfiles')}";
		var mmUrlBase = "${resource(dir:'images/Module_Trait/ModuleTraitMembership')}";
		$(document).ready(function(){
			$('a#buildTag').click(function(){
				displayTagCloud(modId,url,spinner)
			});
			$('select#img_select').change(function(){
				$('img#sig_scatterplot').attr('src',mmUrlBase+"/"+$(this).val()+"_genewiseSignificance.png");
				$('img#transcriptProfile').attr('src',taUrlBase+"/"+$(this).val()+"_TA_profile.png");
			});
			
		});
	</g:javascript>
	</body>
</html>
