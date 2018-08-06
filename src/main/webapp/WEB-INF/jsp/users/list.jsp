<%@ include file="/WEB-INF/post-head.jsp" %>

<%@ taglib prefix="rms" uri="/WEB-INF/tags/implicit.tld" %>
<!doctype html>
<html lang="en">

<head>
  
  <%@ include file="/WEB-INF/head.jsp" %>
  <rms:link type="stylesheet" href="css/styles.css?v=1.0" />
  <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />

</head>

<body>
    <div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
      <%@ include file="/WEB-INF/navigation.jsp" %>
      <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content">
          
          <div class="demo-graphs mdl-color--white mdl-cell mdl-cell--8-col">
            
            <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
              <thead>
                <tr>
                  <th class="mdl-data-table__cell--non-numeric">User Name</th>
                  <th>Password</th>
                  <th class="mdl-data-table__cell--non-numeric">Action</th>
                </tr>
              </thead>
              
              <tbody>
              <c:forEach items = "${users}" var="user">
                  <tr>
                    <td class="mdl-data-table__cell--non-numeric"><c:out value="${user.userName}"/></td>
                    <td><c:out value="${user.password}"/></td>
                    <td class="mdl-data-table__cell--non-numeric">
						<!-- Icon button -->
						<a href="${ baseurl }/users/edit?id=<c:out value='${user.id}'/>">
						<button class="mdl-button mdl-js-button mdl-button--icon">
						  <i class="material-icons">edit</i>
						</button>
						</a>
						<!-- Colored icon button -->
						<a href="${ baseurl }/users/delete?id=<c:out value='${user.id}'/>">
						<button class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored">
							<i class="material-icons">delete</i>
						</button>
						</a>
	
					</td>
                  </tr>
              </c:forEach>
              </tbody>
              
            </table>
            
          </div>
          
          <div class="demo-cards mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet mdl-grid mdl-grid--no-spacing">
            
            <div class="demo-updates mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
              <div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
                <h2 class="mdl-card__title-text">Add User</h2>
              </div>
              <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                Non dolore elit adipisicing ea reprehenderit consectetur culpa.
              </div>
              <div class="mdl-card__actions mdl-card--border">
                <a href="${ baseurl }/users/add" class="mdl-button mdl-js-button mdl-js-ripple-effect">Add User</a>
              </div>
            </div>
            
            <div class="demo-separator mdl-cell--1-col"></div>          
          
          </div>
        
        </div>
      </main>
    </div>
	
	<svg xmlns="http://www.w3.org/2000/svg" 
	xmlns:xlink="http://www.w3.org/1999/xlink" 
	version="1.1" 
	style="position: fixed; left: -1000px; height: -1000px;"
	>
       <defs>
         <mask id="piemask" maskContentUnits="objectBoundingBox">
           <circle cx=0.5 cy=0.5 r=0.49 fill="white" />
           <circle cx=0.5 cy=0.5 r=0.40 fill="black" />
         </mask>
         <g id="piechart">
           <circle cx=0.5 cy=0.5 r=0.5 />
           <path d="M 0.5 0.5 0.5 0 A 0.5 0.5 0 0 1 0.95 0.28 z" stroke="none" fill="rgba(255, 255, 255, 0.75)" />
         </g>
       </defs>
     </svg>
    
    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 500 250" style="position: fixed; left: -1000px; height: -1000px;">
      <defs>
        <g id="chart">
          <g id="Gridlines">
            <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="27.3" x2="468.3" y2="27.3" />
            <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="66.7" x2="468.3" y2="66.7" />
            <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="105.3" x2="468.3" y2="105.3" />
            <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="144.7" x2="468.3" y2="144.7" />
            <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="184.3" x2="468.3" y2="184.3" />
          </g>
          <g id="Numbers">
            <text transform="matrix(1 0 0 1 485 29.3333)" fill="#888888" font-family="'Roboto'" font-size="9">500</text>
            <text transform="matrix(1 0 0 1 485 69)" fill="#888888" font-family="'Roboto'" font-size="9">400</text>
            <text transform="matrix(1 0 0 1 485 109.3333)" fill="#888888" font-family="'Roboto'" font-size="9">300</text>
            <text transform="matrix(1 0 0 1 485 149)" fill="#888888" font-family="'Roboto'" font-size="9">200</text>
            <text transform="matrix(1 0 0 1 485 188.3333)" fill="#888888" font-family="'Roboto'" font-size="9">100</text>
            <text transform="matrix(1 0 0 1 0 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">1</text>
            <text transform="matrix(1 0 0 1 78 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">2</text>
            <text transform="matrix(1 0 0 1 154.6667 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">3</text>
            <text transform="matrix(1 0 0 1 232.1667 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">4</text>
            <text transform="matrix(1 0 0 1 309 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">5</text>
            <text transform="matrix(1 0 0 1 386.6667 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">6</text>
            <text transform="matrix(1 0 0 1 464.3333 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">7</text>
          </g>
          <g id="Layer_5">
            <polygon opacity="0.36" stroke-miterlimit="10" points="0,223.3 48,138.5 154.7,169 211,88.5
            294.5,80.5 380,165.2 437,75.5 469.5,223.3 	"/>
          </g>
          <g id="Layer_4">
            <polygon stroke-miterlimit="10" points="469.3,222.7 1,222.7 48.7,166.7 155.7,188.3 212,132.7
            296.7,128 380.7,184.3 436.7,125 	"/>
          </g>
        </g>
      </defs>
    </svg>
    
    <a href="https://github.com/google/material-design-lite/blob/mdl-1.x/templates/dashboard/" target="_blank" id="view-source" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored mdl-color-text--white">View Source</a>
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</body>
</html>
