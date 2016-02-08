  <div class="right" id="mensaje"></div>
  <div class="buttons">
    <div id="botones" class="right">
      
      <input id="boton_planes" class="button" onclick="mostarPlanes()" value="Debe seleccionar un plan"  />
      <input id="boton_pagar" class="button" onclick="datosTarjeta()" value="Pagar" hidden/>
    </div>
  </div>
  <!-- $order_info === array con datos de la orden-->
  <?php
   //var_dump($order_info)
  ?>
  <script>

    var total = <?php echo $order_info['total']; ?>
    
    function get_url(action){
        return location.origin+location.pathname+'?route=payment/spsdecidir/'+action;
      }

    $(function () {
      $("#dialog_1").dialog({
        autoOpen: false,
        modal: true,
        buttons: {
          "Aceptar": function () {
            if($("#plan_option").val()=="-1"){
              alert("debe seleccionar un plan");
              return null;
            }
            else
            {
              plan_porc = parseInt($("#plan_option").val())/100;
              $("#boton_pagar").val("Pagar $"+total*(1+plan_porc));
              $("#boton_pagar").show();
              $("#boton_planes").val("cambiar plan");
              $("#boton_planes").show();
              mensajePlan($("#plan_option").val());
              $(this).dialog("close");}
            },
            "Cerrar": function () {
              $(this).dialog("close");
            }
          }
        });

      $("#dialog_2").dialog({
        autoOpen: false,
        modal: true,
        buttons: {
          "PAGAR": function () {
            alert("Su pago Fue realizado con exito!!! (redireccionar)");
            window.location.replace("http://localhost:8888/opencart-1.5.6/upload/index.php?route=checkout/success");
            $(this).dialog("close");

          }
        }
      });
      
      
      mostarPlanes()      
      
    });

  function mostarPlanes(){
    $("#dialog_1").dialog("option", "width", 600);
    $("#dialog_1").dialog("option", "height", 300);
    $("#dialog_1").dialog("option", "resizable", false);
    $("#dialog_1").dialog("open");
  }

  function datosTarjeta()
  {
    $("#dialog_2").dialog("option", "width", 600);
    $("#dialog_2").dialog("option", "height", 300);
    $("#dialog_2").dialog("option", "resizable", false);
    $("#dialog_2").dialog("open");
    

  }

  function mensajePlan(valor){
    var mensaje = "<h3>Su compra tiene un "+valor+"% de intereses por financiacion</h3>";
    $("#mensaje").html(mensaje);
  }

  $.ajax({
    url: get_url("getMediosDePago"),
    success: function(response){
      var medios_de_pago = JSON.parse(response);
      for (var i = 0; i < medios_de_pago.length; i++) {
          $("#medio_de_pago").append('<option value="'+medios_de_pago[i].mp_id+'">'+medios_de_pago[i].name+'</option>');
      }
    }
  });


  $("#medio_de_pago").change(function() {
   var medio_de_pago = $("#medio_de_pago").val();
   
   $.ajax({
     url: get_url("getEntidadFinanciera&mp_id="+medio_de_pago),
     success: function(response)
     {
      var entidad_emisora = JSON.parse(response);
      for (var i = 0; i < entidad_emisora.length; i++) {
        $("#entidad_emisora").append('<option value="'+entidad_emisora[i].ef_id+'">'+entidad_emisora[i].name+'</option>')
      }
     }
   });
   
  //cierra el srcipt 
  });

</script>


<div id="dialog_1" title="Dialogo básico">
  <table>
    <tr>  
      <td>MEDIO DE PAGO:</td>
      <td>
      <select name="" id="medio_de_pago" >

        <option value="-1">--seleccionar--</option>

      </select>
      </td>
    </tr>
    <tr>  
      <td>ENTIDAD EMISORA:</td>
      <td>
        <select name="" id="entidad_emisora">

          <option value="">--seleccionar--</option>
          
      </select>
      </td>
    </tr>
    <tr> 
      <td>PLAN:</td>
      <td>
        <select name="" id="plan_option">
          <option value="-1">--seleccionar--</option>
          <option value="0">1 cuota sin interes</option>
          <option value="10">3 cuotas 10 % de interes</option>
          <option value="15">6 cuotas 15 % de interes</option>
          <option value="20">12 cuotas 20 % de interes</option>

        </select>
      </td>
    </tr>
  </table>
</div>

<div id="dialog_2" title="Dialogo básico">
  <table>
    <tr>  
      <td>Numero de tarjeta:</td><td><input type="text" id="el_nombre" value="" /></td>
    </tr>
    <tr>  
      <td>Nombre y Apellido:</td><td><input type="text" id="el_nombre" value="" /></td>
    </tr>
    <tr> 
      <td>Codigo de seguridad:</td><td><input type="text" id="el_nombre" value="" /></td>
    </tr>
  </table>

</div>