<div class="row">
    <div class="col-md-12">
        <form id="form" action="{$SERVER_ADMIN}configuracion/sede/nuevo.html" method="post" class="form-horizontal">
            <input name="txt_action" id="txt_action" type="hidden" value="nuevo">
            <section class="panel">
                {$message}
                <header class="panel-heading">
                    <h2 class="panel-title">Nueva sede</h2>
                </header>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nombre <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="txt_sed_nombre" id="txt_sed_nombre" class="form-control" placeholder="ej.: Lima" required value=""/>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Sede <span class="required">*</span></label>
                        <div class="col-sm-5">
                            <select data-plugin-selectTwo id="txt_sed_reg_id" name="txt_sed_reg_id" class="form-control populate" required>
                                <option value="">Seleccionar región</option>
                                <optgroup label="Región">
                                    {if $objRegion|@count gt 0}
                                        {section name=id loop=$objRegion}
                                    <option value="{$objRegion[id]->reg_id}">{$objRegion[id]->reg_nombre}</option>
                                        {/section}
                                    {/if}
                                </optgroup>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Central Telefónica <span class="required">*</span></label>
                        <div class="col-sm-5">
                            <input type="text" id="txt_st_num" name="txt_st_num" class="form-control populate" required=""/>
                        </div>
                    </div>
                </div>
                <footer class="panel-footer">
                    <div class="row">
                        <div class="col-sm-9 col-sm-offset-3">
                            <button class="btn btn-primary">Guardar</button>
                            <button type="button" class="btn btn-default">Cancelar</button>
                            <!--<button type="reset" class="btn btn-default">Reset</button>-->
                        </div>
                    </div>
                </footer>
            </section>
        </form>
    </div>
</div>