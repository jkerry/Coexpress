<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		
		<!-- Stylesheet Integration -->
		<link type="text/css" rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" />
		<!-- Layout Header -->
		<g:layoutHead/>
		
		<!-- critical js includes -->
		<g:javascript library='jquery' />
		<r:require modules="bootstrap"/>
		<r:layoutResources />
		
	</head>
	<body>
		
				<div class="navbar navbar-fixed-top">
  					<div class="navbar-inner">
    					<a class="brand" href="${createLink(uri: '/')}">Coexpress</a>
    					<ul class="nav">
      						<li><a href="${createLink(uri: '/')}">Home</a></li>
      						<li><g:link controller="Module">Modules</g:link></li>
      						<li><g:link controller="Transcript">Transcripts</g:link></li>
      					</ul>
      					<g:if test="${session['mapping_id']==null}" >
      						<g:link controller="Mapping" action="set" class="btn btn-warning pull-right">Set Mapping</g:link>
      					</g:if>
      					<g:else>
      						<g:link controller="Mapping" action="select" class="btn btn-success pull-right">Change Mapping</g:link>
      					</g:else>
      					
  					</div>
				</div>
			
		<!--[if lt IE 7]>
            <div class="row"><p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p></div>
        <![endif]-->
		<g:layoutBody/>
		
		<!-- noncritical js includes -->
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
