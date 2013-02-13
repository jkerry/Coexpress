
<%@ page import="coexpress.Transcript" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transcript.label', default: 'Transcript')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-transcript" class="content" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" />: <Strong>${transcriptInstance.name}</Strong></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="row"></div>
				<div class="span5" id="sequenceStats">
					<div id="fasta">
						<h3>Sequence</h3>
						<g:render template="fastaTextArea" model="${['sequence':transcriptInstance.sequence,'name':transcriptInstance.name]}"/>
					</div>
					<hr/>
					<div id="expressionProfile">
						<h3>Expression Profile</h3>
						<p>Expression profile dynamic view is in development.</p>
					</div>
				</div>
				<div class="span7" id="blastInfo">
					<h3>BLAST Hits</h3>
					<p>The following are (at most) the top 3 BLAST hits for this sequence against the ncbi non-redundant protein database. The hit-names are hotlinked to the appropriate ncbi fact sheet.</p>	
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Subject</th>
								<th>Identity</th>
								<th>Alignment Length</th>
								<th>E-Value</th>
								<th>Bit Score</th>
							</tr>
						</thead>
						<tbody>
							<g:each var="bhit" in="${transcriptInstance.blast_hits}">
							<tr>
								<td><a href="http://www.ncbi.nlm.nih.gov/protein/${bhit.gi_number}" target="_blank">${bhit.subject}</a></td>
								<td>${bhit.identity}</td>
								<td>${bhit.alignment_length}</td>
								<td>${bhit.e_value}</td>
								<td>${bhit.bit_score}</td>
							</tr>
							</g:each>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
