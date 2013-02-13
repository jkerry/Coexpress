
<%@ page import="coexpress.Transcript" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>${ grailsApplication.metadata['app.name'] }</title>
		<!-- css resources -->
		
	</head>
	<body>
	<div class="row">
		<div class="span12">
		<h2>Coexpress:</h2>
		<h4>What is it?</h4>
		<p>Coexpress is a web-app with the aim to make co-expression analysis and interpretation easier. Much of the analysis is driven by the <a href="http://labs.genetics.ucla.edu/horvath/CoexpressionNetwork/Rpackages/WGCNA/">WGCNA</a> analysis pipeline.</p>
		<h4>How do I use it?</h4>
		<p>For now accounts for the service must be created by <a href="mailto:john@kerryhouse.net">John</a> so fire off an e-mail if you think you should have one.</p>
		<ol>
		<li>First: <a href="${createLink(controller:'login',action:'auth')}">Log in</a></li>
		<li>Second: Select a <a href="${createLink(controller:'mapping',action:'select')}">Mapping</a></li>
		<li>Finally: <a href="${createLink(controller:'module',action:'correlationTables')}">Start browsing!</a></li>
		</ol>
		<h4>Things to note:</h4>
		<p>Some functions such as the correlation table take a while to build. This is because of the heavy data load being marshaled between our servers and your browsers.  Be patient!</p>
		<p> This service was written and tested on Ubuntu 12.10 and Mac osx with the latest chrome browser. It is unknown if the functionality holds across browsers so if you find something that breaks please <a href="mailto:john@kerryhouse.net">Report It</a>.</p>
		<h4>Questions, Concerns, Bugs, Requests?</h4>
		<p>E-mail <a href="mailto:john@kerryhouse.net">John</a>. There are quite a few site functions such as xsl export and whole module fasta file export that are in the queue but there are more pressing matters at hand. If there is a feature that you think is critical e-mail <a href="mailto:john@kerryhouse.net">John</a> and we'll elevate it's priority.</p>
		</div>
	</div>
		<!-- javascript resources -->
	</body>
</html>
