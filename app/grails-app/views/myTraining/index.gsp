<%@ page import="com.makingdevs.RegistrationStatus" %>
<%@ page import="com.payable.DescuentoAplicableStatus" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="veneraWithMenu"/>
  <title>Mi entrenamiento</title>
  <r:require module="buttonLoader"/>
</head>

<body>

  <div class="row-fluid">
    <h3 class="section-header">Mis registros</h3>
    <div class="accordion" id="accordion">
      <g:each in="${registrations}" var="registration" status="i">
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse" href="#collapse${i}">${registration.scheduledCourse.course.name}</h5></a>
          </div>
          <g:if test="${i==0}">
            <g:set var="a" value="in collapse"/>
            <g:set var="b" value="auto"/>
          </g:if>
          <g:else>
            <g:set var="a" value="collapse"/>
            <g:set var="b" value="0"/>
          </g:else>
          <div class="accordion-body ${a}" id="collapse${i}" style="height: ${b};">
            <div class="accordion-inner">
              <p>
                <strong>Promociones vigentes:</strong>
                <ul>
                  <g:each in="${registration.pagos*.descuentosAplicables.flatten().sort{ it.id }}" var="descuentoAplicable">
                    <li>
                      ${descuentoAplicable.descuento.nombreDeDescuento}
                      <g:set var="label" value="label-success"/>
                      <g:if test="${descuentoAplicable.descuentoAplicableStatus == DescuentoAplicableStatus.EXPIRADO}">
                        <g:set var="label" value="label-warning"/>
                      </g:if>
                      <span class="label ${label}">
                        ${descuentoAplicable.descuentoAplicableStatus}
                      </span>
                    </li>
                  </g:each>
                </ul>
              </p>
              <hr>  
              <p>
              <g:if test="${registration.registrationStatus == RegistrationStatus.REGISTERED || registration.registrationStatus == RegistrationStatus.INSCRIBED_AND_WITH_DEBTH}">
                <g:remoteLink name="paymentRegistration${registration.id}" controller="myTraining" action="sendPaymentInstructions" params="[registrationId:registration.id]" class="btn btn-success" onLoading="var loader${registration.id} = new ButtonLoader(${registration.id},'paymentRegistration'); loader${registration.id}.preload()" onSuccess="loader${registration.id}.success('Te hemos enviado la información de los datos bancarios para el pago del entrenamiento: ${registration.scheduledCourse.course.name}.')" onComplete="loader${registration.id}.complete()"><i class="icon-money"></i> Pagar con SPEI $ <g:formatNumber number="${registration.pagos*.cantidadDePago.sum(0) + registration.pagos*.recargosAcumulados.sum(0) - registration.pagos*.descuentoAplicable.sum(0)}" format="###,##0.00" locale="es_MX"></g:formatNumber>
                </g:remoteLink>
                <paypal:pay registration="${registration}"></paypal:pay>
              </g:if>
              </p>
              <g:if test="${registration.registrationStatus == RegistrationStatus.INSCRIBED_AND_WITH_DEBTH_IN_GROUP}">
                <span class="label label-info"><i class="icon-gears"></i> Estamos validando tu pago.</span>
              </g:if>
              <g:if test="${registration.registrationStatus == RegistrationStatus.INSCRIBED_AND_PAYED || registration.registrationStatus == RegistrationStatus.INSCRIBED_AND_PAYED_IN_GROUP }">
                <p>
                  <span class="label label-success"><i class="icon-thumbs-up-alt"></i> Todo listo para comenzar el curso.</span>
                </p>
              </g:if>
              
              <g:if test="${registration.registrationStatus == RegistrationStatus.FINISHED}">
                <a class="btn btn-primary" href="finishedCoursesReport?id=${registration.id}">
                <i class="icon-certificate"></i> 
                  Obtener certificado 
                </a>
              </g:if>

              <g:if test="${registration.registrationStatus == RegistrationStatus.CANCELLED}">
                <p>
                  <span class="label label-inverse"><i class="icon-remove"></i> Este registro se ha cancelado.</span>
                </p>
              </g:if>
            </div>
          </div>
        </div>
      </g:each>
    </div>
  </div>

  </div>

</body>
</html>
