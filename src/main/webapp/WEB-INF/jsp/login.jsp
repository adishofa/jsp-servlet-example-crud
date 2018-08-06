<%@ include file="/WEB-INF/post-head.jsp" %>

<%@ taglib prefix="rms" uri="/WEB-INF/tags/implicit.tld" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="/WEB-INF/head.jsp" %>
  <rms:link type="stylesheet" href="css/styles.css" />
  <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />
</head>

<body>
    <div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
    	
    	<main class="mdl-layout__content mdl-color--grey-100">
    		<div class="mdl-grid demo-content">
	    		<div class="mdl-card mdl-shadow--6dp">
	    		
	    			<div class="mdl-card__title mdl-color--primary mdl-color-text--white">
	    				<h2 class="mdl-card__title-text">Acme Co.</h2>
	    			</div>
	    			
	  				<form action="login" method="post">
			    	  	
			    	  	<div class="mdl-card__supporting-text">
			  				
		  					<div class="mdl-textfield mdl-js-textfield">
		  						<input class="mdl-textfield__input" type="text" id="username" name="username" />
		  						<label class="mdl-textfield__label" for="username">Username</label>
		  					</div>
		  					<div class="mdl-textfield mdl-js-textfield">
		  						<input class="mdl-textfield__input" type="password" id="userpass" name="userpass" />
		  						<label class="mdl-textfield__label" for="userpass">Password</label>
		  					</div>
		  					
		  					<c:if test="${ not empty errorMessage }" >
		    					<p class="mdl-typography--font-regular android-alt-link">
		    						${ errorMessage }
		    					</p>
		    				</c:if>
			  				
			    		</div>
			    		
		    			<div class="mdl-card__actions mdl-card--border">
		    				<button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">Log in</button>
		    			</div>
		    			
		  			</form>
	    			
	    		</div>
    		</div>
    	</main>
    	
    </div>


</body>
</html>
