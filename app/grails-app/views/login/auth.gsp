<html>
<head>
	<meta name='layout' content='venera'/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>

<body>

<section class="section-wrapper login-page-w">
	<div class="container">
    <div class="row">
      <div class="span9">
        <div class="white-card extra-padding">
        	<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
        		<fieldset>
              <div class="row-fluid">
                <div class="span12">
                	<h1 class="form-header">
                		Entra ahora
                	</h1>
                	<g:if test='${flash.message}'>
										<div class="alert alert-error">
											${flash.message}
										</div>
									</g:if>
                </div>
              </div>
              <div class="row-fluid">
                <div class="span6">
                	<div class="control-group">
                			<label for='username'>
                				Correo electrónico :
                			</label>
                			<div class="input-prepend">
                				<span class="add-on"><i class="icon-envelope"></i></span>
												<input type='text' class='input-xlarge' name='j_username' id='j_username'/>
											</div>
                	</div>
                	<div class="control-group">
                			<label for='password'>
                				Contraseña : 
                			</label>
                			<div class="input-prepend">
                				<span class="add-on"><i class="icon-lock"></i></span>
												<input type='password' class='input-xlarge' name='j_password' id='j_password'/>
											</div>
                	</div>
                	<div class="control-group">
										<label for='remember_me' class="checkbox">
											<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
											Recuérdame en este equipo
										</label>
                	</div>
                  <button type="submit" id="submit" class="btn btn-large">
                   <i class="icon icon-smile"></i> Ingresa ahora
                  </button>
                  <label>
                    ${g.link([controller:'forgot',action:'index']){'¿Olvidaste tu contraseña?'}}
                  </label>
                </div>
                <div class="span6">
                	<h3>¿Aún no tienes cuenta?</h3>
                	<div class="well">
                	<g:link controller="signUp" class="btn btn-large btn-block btn-primary">
                		<i class="icon-thumbs-up"></i>
                		Crea una cuenta
                	</g:link>
                	</div>
                  <sec:ifNotGranted roles="ROLE_USER">
                    <facebookAuth:connect permissions="email,user_about_me"/>
                  </sec:ifNotGranted>
                  <sec:ifAllGranted roles="ROLE_USER">
                    Welcome <sec:username/>! (<g:link uri="/j_spring_security_logout">Logout</g:link>)
                  </sec:ifAllGranted>
                  <a href="${createLink(controller:'twitterLogin')}" class="btn btn-primary btn-sm"><i class="icon-twitter"></i> twitter</a>
                  <a href="${createLink(controller:'githubLogin')}" class="btn btn-default btn-sm"><i class="icon-github"></i> github</a>
                  <g:render template="/gmailLogin/buttonGmail"/>
                </div>
              </div>
            </fieldset>
        	</form>
        </div>
      </div>
      <div class="span3">
        <g:render template="/registration/tips" />
      </div>
    </div>
  </div>
</section>

<r:script>
	$(function(){
		$("form#loginForm #j_username").focus();
	});
</r:script>
</body>
</html>
