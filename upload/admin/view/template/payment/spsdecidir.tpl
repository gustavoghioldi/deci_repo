<?php echo $header; ?>
<?php $statues = $order_statuses; ?>
<div id="content">
  <div class="box">
    <div id="mi_prueba"></div>
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>

    <div class="content">

      <div id="htabs" class="htabs">
        <a href="#tab-general">GENERAL</a>
        <a href="#tab-ambientes">AMBIENTES</a>
        <a href="#tab-mediosdepago">MEDIOS DE PAGO</a>
        <a href="#tab-entidadesfinancieras">ENTIDADES FINACIERAS</a>
        <a href="#tab-promociones">PROMOCIONES</a> 
      </div>
  <!-- TAB GENERAL-->
      <div id="prueba"></div>

      <div id="tab-general">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
          <h4 align="center">General</h4>
          <table>
            <tr>
              <td>
                <label>
                  Estado
                </label>
              </td>
              <td>
                <select name="spsdecidir_status">
                  <?php if ($spsdecidir_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </td>
            </tr>
            <tr>
              <td><label for="">
                Segmento del Comercio
              </label></td>
              <td>
                <select name="spsdecidir_segmento" >
                  <option value="0" <?php if ($spsdecidir_segmento==0) {echo 'selected="selected"';} ?>>Retail</option>
                  <option value="1" <?php if ($spsdecidir_segmento==1) {echo 'selected="selected"';} ?>>Servicies</option>
                  <option value="2" <?php if ($spsdecidir_segmento==2) {echo 'selected="selected"';} ?>>Digital Goods</option>
                  <option value="3" <?php if ($spsdecidir_segmento==2) {echo 'selected="selected"';} ?>>Ticketing</option>
              </select>
              </td>
            </tr>
            <tr>
              <td><label for="">Dead Line</label></td>
              <td><input type="text" name="spsdecidir_deadline"></td>
            </tr>
            <tr>
              <td><label for="">Modo test o Producción</label></td>
              <td><select name="spsdecidir_mode">
                <?php if ($spsdecidir_mode) { ?>
                <option value="1" selected="selected">Test</option>
                <option value="0">Producción</option>
                <?php } else { ?>
                <option value="1">Test</option>
                <option value="0" selected="selected">Producción</option>
                <?php } ?>
              </select>
            </td>
          </tr>
          <tr>
              <td><label for="">Cybersource</label></td>
              <td><select name="spsdecidir_cs">
                <?php if ($spsdecidir_cs) { ?>
                <option value="1" selected="selected">on</option>
                <option value="0">off</option>
                <?php } else { ?>
                <option value="1">on</option>
                <option value="0" selected="selected">off</option>
                <?php } ?>
              </select>
            </td>
          </tr>
        </table>
        <h4 align="center">Estados</h4>
        <table>
          <tr>
            <td>
              <label for="">Estado cuando la transaccion ha sido iniciada</label>
               <td><select name="spsdecidir_order_status_iniciada">
                <?php foreach ($statues as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $spsdecidir_order_status_iniciada) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            </td>
          </tr>
          <tr>
            <td>
              <label for="">Estado cuando la transaccion ha sido aprobada</label>
              <td><select name="spsdecidir_order_status_aprobada">
                <?php foreach ($statues as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $spsdecidir_order_status_aprobada) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            </td>
          </tr>
          <tr>
            <td>
              <label for="">Estado cuando la transaccion ha sido Rechazada</label>
              <td><select name="spsdecidir_order_status_rechazada">
                <?php foreach ($statues as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $spsdecidir_order_status_rechazada) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            </td>
          </tr>
          <tr>
            <td>
              <label for="">Estado cuando la transaccion ha sido Offline</label>
              <td><select name="spsdecidir_order_status_offline">
                <?php foreach ($statues as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $spsdecidir_order_status_offline) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            </td>
          </tr>
          <tr>
            <td>
              <label for="">Estado cuando la transaccion ha sido devuelta</label>
              <td><select name="spsdecidir_order_status_devuelta">
                <?php foreach ($statues as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $spsdecidir_order_status_devuelta) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            </td>
          </tr>
        </table>
      </div>

      <div id="tab-ambientes">

        <table>
          <h4  align="center">Ambiente Test</h4>
          <tr>
            <td>Api Key</td>
            <td><input type="text" name="spsdecidir_authorization_test"></td>
          </tr>
          <tr>
            <td>ID Site Decidir</td>
            <td><input type="text" name="spsdecidir_siteid_test"></td>
          </tr>
          <tr>
            <td>Security Code</td>
            <td><input type="text" name="spsdecidir_securitycode_test"></td>
          </tr>
        </table>


        <table>
          <h4  align="center">Ambiente Producción</h4>
          <tr>
            <td>Api Key</td>
            <td><input type="text" name="spsdecidir_authorization_produccion"></td>
          </tr>
          <tr>
            <td>ID Site Decidir</td>
            <td><input type="text" name="spsdecidir_siteid_produccion"></td>
          </tr>
          <tr>
            <td>Security Code</td>
            <td><input type="text" name="spsdecidir_securitycode_produccion"></td>
          </tr>
        </table>
      </form>
    </div>
  <!-- TAB MEDIOS DE PAGO-->
    <div id="tab-mediosdepago">
      <table id="tab-mediosdepago-table">
        <tr>
          <th>CODIGO</th><th>Medio de Pago</th><th>ACTION</th>
        </tr>
        <tr>
          <td colspan="3"><button onclick="add_mediodepago_dialog()">ADD MEDIO DE PAGO</button>
          </tr>
        </table>
        <div align="center"><a href="https://decidir.gitbooks.io/documentacion/content/Anexos/TablasReferencia/MediosDePago.html">Acceda a este link para conocer los códigos de cada medio de pago</a></div>
      </div>
  <!-- FIN TAB MEDIOS DE PAGO-->

  <!-- TAB ENTIDADES FINANCIERAS-->
      <div id="tab-entidadesfinancieras">


        <table id="tab-entidadesfinancieras-table">
          <tr>
            <th>NAME</th><th>ACTION</th>
          </tr>
          <tr>
          <td  colspan="2">
              <button onclick="add_entidadfinanciera_dialog()">ADD ENTIDAD FINANCIERA</button>
              </td>
          </tr>
            </table>
          </div>
    <!-- FIN TAB ENTIDADES FINANCIERAS-->
    
    <!-- PROMOCIONES -->
          <div id="tab-promociones">
            <table id="tab-promociones-table">
              <tr>
                <th>Medios de Pago</th>
                <th>Entidades Financieras</th>
                <th>Cuotas</th>
                <th>Porcentajes</th>
                <th>Desde</th>
                <th>Hasta</th>
                <th>ACTION</th>
              </tr>
              <tr>
                <td colspan="7">
          <button onclick="add_promocion_dialog()">ADD PROMOCION</button></td>
              </tr>
            </table>
            
          </div>
      <!-- FIN PROMOCIONES -->

        </div>
      </div>

    </div>
    <!-- END TABS -->

    <!--ADD MEDIO de PAGO-->
    <div id="add-mediodepago-dialog" title="ADD MEDIO DE PAGO" hidden>
      <table>
        <tr>
          <td>CODE:</td><td><input type="text" id="mediodepago-dialog-code" /></td>
        </tr>
        <tr>
          <td>NAME:</td><td><input type="text" id="mediodepago-dialog-name" /></td>
        </tr>
        <tr>
          <td colspan="2"><button onclick="add_mediodepago_table()">SAVE</button></td>
        </tr>
      </table>
    </div>
    <!--END ADD MEDIO DE PAGO-->

    <!-- ADD ENTIDAD FINANCIERA -->
    <div id="add-entidadfinanciera-dialog" title="ADD ENTIDAD FINANCIERA" hidden>
      <table>
        <tr>
          <td>NAME:</td><td><input type="text" id="entidadfinanciera-dialog-name" /></td>
        </tr>
        <tr>
          <td colspan="2"><button onclick="add_entidadfinanciera_table()">SAVE</button></td>
        </tr>
      </table>
    </div>
    <!-- END ADD ENTIDAD FINANCIERA -->

    <!-- ADD PROMOCION -->
    <div id="add-promocion-dialog" title="ADD PROMOCION" hidden>
      <table>

        <tr>
          <td>MEDIO DE PAGO:</td>
          <td>
            <select id="promocion-mediodepago-val">
            
            </select>
          </td>
        </tr>
        <tr>
          <td>ENTIDAD FINANCIERA:</td>
          <td>
            <select id="promocion-entidadfinanciera-val">
            

            </select>
          </td>
        </tr>
        <tr>
          <td>INTERES:</td><td><input type="text" id="promocion-porcentaje-val" /></td>
        </tr>
        <tr>
          <td>CUOTAS:</td><td><input type="text" id="promocion-cuotas-val" /></td>
        </tr>
        <tr>
          <td>DESDE:</td><td><input type="date" id="promocion-desde-val" /></td>
        </tr>
        <tr>
          <td>HASTA:</td><td><input type="date" id="promocion-hasta-val" /></td>
        </tr>
        <tr>
          <td colspan="2"><button onclick="add_promocion()">SAVE</button></td>
        </tr>
      </table>
    </div>
    <!-- END ADD PROMOCION -->
  
    <script type="text/javascript">
      
      $('#htabs a').tabs();
      
      $(function() {
        $("#row-entidadesfinancieras").hide();
        
        //show  los medios de pagode la tabla
        $.ajax({
          url:   get_url("getAllMediosdepago"),
          type:  'get',
          success:  function (response) {
              var medios_de_pago = JSON.parse(response);
              for (var i = 0; i < medios_de_pago.length; i++) {
                $("#tab-mediosdepago-table").append('<tr><td>'+medios_de_pago[i].code+'</td><td>'+medios_de_pago[i].name+'</td><td><a class="remove">delete</a></td></tr>'); 
              };
          }
        }); 

        //show las entidades financieras de la tabla
        $.ajax({
          url:   get_url("getAllEntidadesfinancieras"),
          type:  'get',
          success:  function (response) {
              var entidadesfinancieras = JSON.parse(response);
              for (var i = 0; i < entidadesfinancieras.length; i++) {
                
                $("#tab-entidadesfinancieras-table").append('<tr><td>'+entidadesfinancieras[i].name+'</td><td><a class="remove">delete</a></td></tr>');  
              };
          }
        }); 

        //show las promociones cargadas
        $.ajax({
          url:   get_url("getAllPromociones"),
          type:  'get',
          success:  function (response) {
              var promociones = JSON.parse(response);
              for (var i = 0; i < promociones.length; i++) {
                row = "<tr>";
                row += "<td>"+promociones[i].mediodepago+"</td>";
                row += "<td>"+promociones[i].entidadfinanciera+"</td>";
                row += "<td>"+promociones[i].cuotas+"</td>";
                row += "<td>"+promociones[i].porcentaje+"</td>";
                row += "<td>"+promociones[i].desde+"</td>";
                row += "<td>"+promociones[i].hasta+"</td>";
                row += '<td><a class="remove">delete</a></td>';
                row +="</tr>"
                  $("#tab-promociones-table").append(row);
              };
          }
        });
      });

      function get_query_string_value (key) {  
        return unescape(window.location.search.replace(new RegExp("^(?:.*[&\\?]" + escape(key).replace(/[\.\+\*]/g, "\\$&") + "(?:\\=([^&]*))?)?.*$", "i"), "$1"));  
      }

      function get_url(action){
        return location.origin+location.pathname+'?route=payment/spsdecidir/'+action+'&token='+get_query_string_value('token')
      }

      //abre dialogo medio de pago
      function add_mediodepago_dialog() {
        $( "#add-mediodepago-dialog" ).dialog();

      };  

      //hace post a la base y agrega medio de pago
      function add_mediodepago_table(){
        var code = $("#mediodepago-dialog-code").val();
        var name = $("#mediodepago-dialog-name").val();
          $.ajax({
          url: get_url("saveMediodepago"),
          type: 'POST',
          data: {code: code, name: name},
          success: function(response)
          {
          if (response==1){ 
          $("#tab-mediosdepago-table").append('<tr><td>'+code+'</td><td>'+name+'</td><td><a class="remove">delete</a></td></tr>');
          $("#mediodepago-dialog-code").val("");
          $("#mediodepago-dialog-name").val("");
          }
        }
        });
      }

      //abre dialogo entidad financiera
      function add_entidadfinanciera_dialog(){
        $("#add-entidadfinanciera-dialog").dialog();

      }

      //hace post a la base entidad financiera
      function add_entidadfinanciera_table(){
        var name = $("#entidadfinanciera-dialog-name").val();
        $.ajax({
          url: get_url("saveEntidadfinanciera"),
          type : 'POST',
          data: {name : name},
          success: function(response){
            if(response==1){
              $("#tab-entidadesfinancieras-table").append('<tr><td>'+name+'</td><td><a class="remove">delete</a></td></tr>')
            }
          }
        });
      }

      //abre dialogo promociones
      function add_promocion_dialog(){
        $("#add-promocion-dialog").dialog(); 
        $("#add-promocion-dialog").dialog("option", "width", 600);
        $("#add-promocion-dialog").dialog("option", "height", 300);
        $.ajax({
          url:   get_url("getAllMediosdepago"),
          type:  'get',
          success:  function (response) {
              var medios_de_pago = JSON.parse(response);
              for (var i = 0; i < medios_de_pago.length; i++) {
                         $("#promocion-mediodepago-val").append('<option value="'+medios_de_pago[i].id+'">'+medios_de_pago[i].name+"</option>");
              };
          }
        });

        $.ajax({
          url:   get_url("getAllEntidadesfinancieras"),
          type:  'get',
          success:  function (response) {
              var entidad_financiera = JSON.parse(response);
              for (var i = 0; i < entidad_financiera.length; i++) {
                         $("#promocion-entidadfinanciera-val").append('<option value="'+entidad_financiera[i].id+'">'+entidad_financiera[i].name+"</option>");
              };
          }
        });        
        
      }

      //TODO: hace post a la base tbla promociones
      function add_promocion(){
        var mediodepago = $("#promocion-mediodepago-val option:selected");
        var entidadfinanciera = $("#promocion-entidadfinanciera-val option:selected");

        var mediodepago_id = mediodepago.val();
        var entidadfinanciera_id = entidadfinanciera.val();

        var porcentaje_val = $("#promocion-porcentaje-val").val();   
        var cuotas_val = $("#promocion-cuotas-val").val();   
        var desde_val = $("#promocion-desde-val").val();   
        var hasta_val = $("#promocion-hasta-val").val();

        $.ajax({
          url: get_url("savePromocion"),
          type : 'POST',
          data: {ef_id: entidadfinanciera_id, mp_id: mediodepago_id, cuotas: cuotas_val, porcentaje: porcentaje_val},
          success: function(response){
              var table_html = "<tr><td>"+mediodepago.text()+"</td><td>"+entidadfinanciera.text()+"</td><td>"+cuotas_val;
              table_html += "</td><td>"+porcentaje_val+"</td><td>"+desde_val+"</td><td>"+hasta_val+"</td>";
              table_html += "<td><a class='remove'>delete</a></td></tr>"
              $("#tab-promociones-table").append(table_html);     
          }
        });    

        

      }

      $(document).on('click', '.remove', function() {
        var confirmacion = confirm("Esta seguro que desea eliminar esta fila");
        if(confirmacion==true){
          $(this).parents("tr").remove();}
          else{
            return null;
          }
        });

    </script> 
    <?php echo $footer; ?>

    <style type="text/css">
      table {
        margin: auto;
      }
      table, table td, table tr {
        padding:0px;
        border-spacing: 0px;
      }

      table {
        border:1px black solid;
        border-radius:5px;
        min-width:400px;
        font-family: Helvetica,Arial;
      }

      table td {
        padding:6px;
      }

      table tr:first-child td:first-child {
        border-radius:5px 0px 0px 0px;
      }

      table tr:first-child td:last-child {
        border-radius:0px 5px 0px 0px;
      }

      table tr:last-child td:first-child {
        border-radius:0px 0px 0px 5px;
      }

      table tr:last-child td:last-child {
        border-radius:0px 0px 5px 0px;
      }

      table td:not(:last-child) {
        border-right:1px #666 solid;
      }


      table tr:nth-child(2n) {
        background: #87CEEB;
      }

      table tr:nth-child(2n+1){
        background: #ADD8E6;
      }

      table.header tr:not(:first-child):hover, table:not(.header) tr:hover {
        background:#E0FFFF;
      }

      table:not(.header) tr {
        text-align: left;
      }

      table.header tr:first-child {
        font-weight: bold;
        color:#fff;
        background-color: #444;
        border-bottom:1px #000 solid;
      }

      table.header tr:nth-child(n+2) {
        text-align: right;
      }
    </style>
