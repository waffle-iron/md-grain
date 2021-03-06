<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="description" content="Impulsamos la carrera de los desarrolladores de software a través de Técnicas, métodos. metodologías y tecnología" />
  <meta name="keywords" content="agile,groovy,grails,spring,jquery,desarrollo de software,entrenamiento,cursos" />
  <title>. : MakingDevs - <g:layoutTitle default="Welcome"/> : .</title>
  <meta name="viewport" content="width=device-width">
  <r:require module="venera"/>
  <link href="http://fonts.googleapis.com/css?family=Abel:400|Oswald:300,400,700" media="all" rel="stylesheet" type="text/css" />
  <g:layoutHead/>
  <r:layoutResources/>
</head>
<body>

  <g:render template="/common/topMenu" />

  <header class="jumbotron subhead" id="overview">
    <div class="container">
      <div class="docs-header-icon">
        <h1><i class="${pageIco ?: 'icon-laptop'}"></i> · ${mainTitle ?: 'Mi entrenamiento'}</h1>
        <g:set var="username" value="${sec.loggedInUserInfo(field:'username')}"/> 
        <p class="lead">${username ?: 'Desarrollador de software'}</p>
      </div>
    </div>
  </header>

  <g:render template="/common/messages" />

  <section class="section-wrapper">
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span2 well well-small">
          <ul class="nav nav-list">
            <li class="">
              <g:link controller="myTraining">
                <i class="icon-fixed-width icon-book"></i> Mis registros
              </g:link>
            </li>
            <li class="">
              <g:link controller="payment" action="myPayments">
                <i class="icon-fixed-width icon-usd"></i> Mis pagos
              </g:link>
            </li>
            <li class="">
              <g:link controller="attendee" action="mySessions">
                <i class="icon-fixed-width icon-calendar"></i> Mis sesiones
              </g:link>
            </li>
            <!--li class="">
              <a href="#"><i class="icon-fixed-width icon-road"></i> Historial académico</a>
            </li-->
          </ul>
        </div>
        <div class="span10">
          <div class="white-card extra-padding">
            <g:layoutBody/>
          </div>
        </div>
      </div>
    </div>
  </section>

  <g:render template="/common/footer" />

  <r:layoutResources/>
  <g:googleAnalyticsTracker/>
  </body>
</html>
