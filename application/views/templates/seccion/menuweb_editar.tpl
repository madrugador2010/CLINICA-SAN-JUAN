<div class="row">
    {$message}
    <div class="col-md-12">
        <form id="form" action="{$SERVER_ADMIN}seccion/menuweb/configuracion/{$sede_id}/{$menu_id}" method="post" class="form-horizontal" enctype="multipart/form-data">
            <input name="txt_action" id="txt_action" type="hidden" value="configurar">
            <section class="panel">
                <header class="panel-heading">
                    <h2 class="panel-title">Configuración menú - <b>{$menu_nombre}</b></h2>
                </header>
                <div class="panel-body">
                    {if $stdMenuWeb->mw_imagen neq ""}
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Imagen</label>
                        <div class="col-sm-1">
                            <a class="image-popup-no-margins" href="{$SERVER_GALLERY}{$stdMenuWeb->mw_imagen}">
                                <img class="img-responsive" width="75" src="{$SERVER_GALLERY}{$stdMenuWeb->mw_imagen}">
                            </a>
                        </div>
                    </div>
                    {/if}
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Imagen<b>(.jpeg, .jpg, .gif, .png)</b><span class="required">*</span></label>
                        <div class="col-sm-9">
                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                <div class="input-append">
                                    <div class="uneditable-input">
                                        <i class="fa fa-file fileupload-exists"></i>
                                        <span class="fileupload-preview"></span>
                                    </div>
                                    <span class="btn btn-default btn-file">
                                        <span class="fileupload-exists">Cambiar</span>
                                        <span class="fileupload-new">Seleccionar Archivo</span>
                                        <input type="file" name="txt_mw_imagen" id="txt_mw_imagen" required=""/>
                                    </span>
                                    <a href="#" class="btn btn-default fileupload-exists" data-dismiss="fileupload">Eliminar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="panel-footer">
                    <div class="row">
                        <div class="col-sm-9 col-sm-offset-3">
                            <button class="btn btn-primary" id="guardar">Guardar</button>
                            <button type="button" class="btn btn-default" id="cancelar">Cancelar</button>
                            <!--<button type="reset" class="btn btn-default">Reset</button>-->
                        </div>
                    </div>
                </footer>
            </section>
        </form>
    </div>
</div>