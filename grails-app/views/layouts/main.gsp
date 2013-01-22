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
		
		<!-- Layout Header -->
		<g:layoutHead/>
		
		<!-- critical js includes -->
		<g:javascript library='jquery' />
		<r:require modules="bootstrap"/>
		<r:layoutResources />
	</head>
	<body>
		<div class="row">
			<div class="span12">
				<div class="navbar .navbar-static-to">
  					<div class="navbar-inner">
    					<a class="brand" href="#">Coexpress</a>
    					<ul class="nav">
      						<li class="active"><a href="#">Home</a></li>
      						<li><a href="#">Link</a></li>
      						<li><a href="#">Link</a></li>
    					</ul>
  					</div>
				</div>
			</div>
		</div>
		<!--[if lt IE 7]>
            <div class="row"><p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p></div>
        <![endif]-->
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		
		<!-- noncritical js includes -->
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
