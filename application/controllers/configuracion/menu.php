<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of menu
 *
 * @author VMC-D02
 */
class Menu extends CI_Controller{
    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->model('configuracion/menu_model', 'menu');
        $this->smartyci->assign('listado', 'Menú principal');
        $this->smartyci->assign('js_script', $this->_carpeta.'/'.$this->_class.'.js');
    }
    
    public function index(){
        $where['men_padre'] = 0;
        $objMenu = $this->menu->getAll($where);
        if($objMenu){
            foreach ($objMenu as $id=>$value){
                $icon_estado = 'fa-ban';
                if($value->men_estado == 1){
                    $icon_estado = 'fa-check';
                }
                $objMenu[$id]->icon_estado = $icon_estado;
            }
        }
        $this->smartyci->assign('objmenu', $objMenu);
        $this->smartyci->assign('padre', 0);
        $this->smartyci->assign('detalle_menu', 'Principal');
        $this->smartyci->show_page(NULL, uniqid());
    }
    
    public function nuevo($padre = 0){
        $action = $this->input->post('txt_action');
        if(isset($action) && $action == 'nuevo'){
            $padre = $this->input->post('txt_men_padre');
            if($padre > 0){/*sub_menu*/
                $isPadre = $this->menu->padre_exists($padre);
                if($isPadre > 0){
                    $this->menu->getValsForm($this->input->post());
                    $this->menu->men_ruta = quitarAcentos($this->input->post('txt_men_nombre'));
                    if($this->menu->insert()){
                        $this->writeLog("Registro menú {$this->menu->men_nombre}(id::{$this->menu->men_id})");
                        redirect('configuracion/menu/submenu/'.$padre);
                    }else{
                        redirect('configuracion/menu/submenu/'.$padre);
                    }
                }else{
                    redirect('configuracion/menu/submenu/'.$padre);
                }
            }else{
                $this->menu->getValsForm($this->input->post());
                $this->menu->ruta = quitarAcentos($this->input->post('txt_men_nombre'));
                if($this->menu->insert()){
                    $this->writeLog("Registro menú {$this->menu->men_nombre}(id::{$this->menu->men_id})");
                    redirect('configuracion/menu/index');
                }else{
                    redirect('configuracion/menu/nuevo');
                }
            }
        }else{
            $action = 'nuevo.html';
            if($padre > 0){
                $this->menu->getRow($padre);
                if($this->menu->men_id > 0){
                    $action = 'nuevo/'.$padre.'.html';
                }else{
                    redirect('configuracion/menu/submenu/'.$padre);
                }
            }
            $this->smartyci->assign('details', 'Menú');
            $this->smartyci->assign('url_back', $this->_carpeta.'/'.$this->_class.'/index');
            $this->smartyci->assign('action', $action);
            $this->smartyci->assign('padre', $padre);
            $this->smartyci->show_page(NULL, uniqid());
        }
    }
    
    public function submenu($padre){
        $this->menu->getRow($padre);
        if($this->menu->men_id > 0){
            $where['men_padre'] = $padre;
            $objMenu = $this->menu->getAll($where);
            if($objMenu){
                foreach ($objMenu as $id=>$value){
                    $icon_estado = 'fa-ban';
                    if($value->men_estado == 1){
                        $icon_estado = 'fa-check';
                    }
                    $objMenu[$id]->icon_estado = $icon_estado;
                }
            }
            $this->smartyci->assign('details', 'Menú');
            $this->smartyci->assign('detalle_menu', $this->menu->men_nombre);
            $this->smartyci->assign('url_back', $this->_carpeta.'/'.$this->_class.'/index');
            $this->smartyci->assign('objmenu', $objMenu);
            $this->smartyci->assign('padre', $padre);
            $this->smartyci->show_page($this->_carpeta."/menu_index.tpl", uniqid());
        }else{
            redirect($this->_carpeta.'/'.$this->_class.'/index');
        }
    }
    
    public function editar($id){
        $this->menu->getRow($id);
        if($this->menu->men_id > 0){
            $action = $this->input->post('txt_action');
            if(isset($action) && $action == "editar"){
                $this->menu->getValsForm($this->input->post());
                $url = quitarAcentos($this->input->post('txt_men_nombre'));
                if($url != $this->menu->men_ruta){
                    
                }
                $this->menu->men_ruta = $url;
                if($this->menu->update()){
                    $this->session->set_userdata('message_id', 1);
                    $this->session->set_userdata('message', 'MSG1');
                    $this->writeLog("Editó menu {$this->menu->men_nombre} (id::{$this->menu->men_nombre})");
                    redirect('configuracion/menu/index');
                }else{
                    $this->session->set_userdata('message_id', 2);
                    $this->session->set_userdata('message', 'ERR1');
                    redirect('configuracion/menu/editar/'.$id);
                }
            }  else {
                $this->smartyci->assign('stdMenu', $this->menu);
                $this->smartyci->assign('id', $id);
                $this->smartyci->show_page(NULL, uniqid());
            }
        }else{
            redirect('configuracion/menu/index');
        }
    }
}
