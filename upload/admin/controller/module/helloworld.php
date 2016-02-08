<?php
class ControllerModuleHelloworld extends Controller {
	private $error = array(); // Se utiliza para establecer los errores, si los hay.
 
public function index() {   // Función Por Defecto
    $this->language->load('module/helloworld'); // Cargar el archivo de Idioma de helloworld 
 
  $this->document->setTitle($this->language->get('heading_title')); // Establecer el título de la página en el título de encabezado en el archivo del Idioma, es decir, Hello World (Hola Mundo)
 
    $this->load->model('setting/setting'); // Cargar el modelo de Configuración (Todos los otros Módulos de OpenCart y Configuraciones Generales son guardadas usando este Modelo )
 
 
 
    if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) { // Comenzar si: Valida y chequea si los datos vienen por un método POST a salvo
        $this->model_setting_setting->editSetting('helloworld', $this->request->post);      // Analiza todo los datos que vienen al Modelo de Configuración para guardarlo en la Base de Datos.
 
        $this->session->data['success'] = $this->language->get('text_success'); // Mostrar texto exitoso cuando garda los datos
 
        $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')); // Redireccionar al Listado de Módulo.
    } // Fin del If
 
    /* Asignar los datos de idioma para ser pasado a la vista */
    $this->data['heading_title'] = $this->language->get('heading_title');
 
    $this->data['text_enabled'] = $this->language->get('text_enabled');
    $this->data['text_disabled'] = $this->language->get('text_disabled');
    $this->data['text_content_top'] = $this->language->get('text_content_top');
    $this->data['text_content_bottom'] = $this->language->get('text_content_bottom');      
    $this->data['text_column_left'] = $this->language->get('text_column_left');
    $this->data['text_column_right'] = $this->language->get('text_column_right');
 
    $this->data['entry_code'] = $this->language->get('entry_code');
    $this->data['entry_layout'] = $this->language->get('entry_layout');
    $this->data['entry_position'] = $this->language->get('entry_position');
    $this->data['entry_status'] = $this->language->get('entry_status');
    $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
 
    $this->data['button_save'] = $this->language->get('button_save');
    $this->data['button_cancel'] = $this->language->get('button_cancel');
    $this->data['button_add_module'] = $this->language->get('button_add_module');
    $this->data['button_remove'] = $this->language->get('button_remove');
     
 
    /* Este bloque retorna avisos si los hay */
    if (isset($this->error['warning'])) {
        $this->data['error_warning'] = $this->error['warning'];
    } else {
        $this->data['error_warning'] = '';
    }
    /* Fin del Bloque */
 
    /* Este bloque retorna código de error si los hay */
    if (isset($this->error['code'])) {
        $this->data['error_code'] = $this->error['code'];
    } else {
        $this->data['error_code'] = '';
    }
    /* Fin del bloque */
 
 
    /* Hacer que el menú de navegacion "Breadcrumbs" sea mostrado en el sitio */
    $this->data['breadcrumbs'] = array();
 
    $this->data['breadcrumbs'][] = array(
        'text'      => $this->language->get('text_home'),
        'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
        'separator' => false
    );
 
    $this->data['breadcrumbs'][] = array(
        'text'      => $this->language->get('text_module'),
        'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
        'separator' => ' :: '
    );
 
    $this->data['breadcrumbs'][] = array(
        'text'      => $this->language->get('heading_title'),
        'href'      => $this->url->link('module/helloworld', 'token=' . $this->session->data['token'], 'SSL'),
        'separator' => ' :: '
    );
 
    /* Fin del bloque Breadcrumb */
 
    $this->data['action'] = $this->url->link('module/helloworld', 'token=' . $this->session->data['token'], 'SSL'); // URL que direccionada cuando se presione el botón de guardar
 
    $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'); // URL que direccionada cuando se presione el botón de cancelar
 
     
    /* Este bloque chequea, si el campo de texto de hello world está establecido lo pasa a la vista, si no es así, toma el campo de texto por defecto de hello world de la base de datos y lo pasa */
     
    if (isset($this->request->post['helloworld_text_field'])) {
        $this->data['helloworld_text_field'] = $this->request->post['helloworld_text_field'];
    } else {
        $this->data['helloworld_text_field'] = $this->config->get('helloworld_text_field');
    }   
    /* Fin del bloque */
 
    $this->data['modules'] = array();
 
    /* This block parses the Module Settings such as Layout, Position,Status & Order Status to the view*/
    /* Este bloque pasa la Configuración del Módulo como el diseño, Posición, Estado y Estado de la Orden a la vista */
     
    if (isset($this->request->post['helloworld_module'])) {
        $this->data['modules'] = $this->request->post['helloworld_module'];
    } elseif ($this->config->get('helloworld_module')) { 
        $this->data['modules'] = $this->config->get('helloworld_module');
    }
    /* Fin del bloque */           
 
    $this->load->model('design/layout'); // Cargando los modelos de diseño 
 
    $this->data['layouts'] = $this->model_design_layout->getLayouts(); // Obteniendo todos los diseños disponibles en el sistema
 
    $this->template = 'module/helloworld.tpl'; // Cargando la plantilla helloworld.tpl
    $this->children = array(
        'common/header',
        'common/footer'
    );  // Agregar hijo a nuestra plantilla por defecto ejemploplate como es, helloworld.tpl 
 
    $this->response->setOutput($this->render()); // Reproduciendo la salida en pantalla
}
/* Función que valida los datos cuando el botón de Guardar es presionado */
    protected function validate() {
 
        /* Bloque que chequea los permisos de usuario para manipular el módule */
        if (!$this->user->hasPermission('modify', 'module/helloworld')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        /*  Fin del Bloque */
 
        /* Bloque que chequea si el helloworld_text_field está configurado correctamente para guardar en la base de datos, de olo contrario devuelve un error */
        if (!$this->request->post['helloworld_text_field']) {
            $this->error['code'] = $this->language->get('error_code');
        }
        /*  Fin del Bloque */
 
        /* Este bloque devuelve verdadero si ningún error fue encontrado, de otro modo devuelve falso si se detectó cualquier error */
        if (!$this->error) {
            return true;
        } else {
            return false;
        }   
        /*  Fin del Bloque */
    }
    /* Fin de la función de Validoación*/
}