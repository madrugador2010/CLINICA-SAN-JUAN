<!-- start: page -->
<!--<div class="alert alert-info">
    Resize the browser to see the responsiveness in action.
</div>-->
<section class="panel">
    <header class="panel-heading">

        <h2 class="panel-title">Tipo de Administradores</h2>
    </header>
    <div class="panel-body">
            <div class="table-responsive">
                    <table class="table mb-none">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        {if $modulo|@count gt 0}
                            {section name=tipo loop=$modulo}
                            <tr class="active">
                                <td>{$modulo[tipo]->mod_nombre}</td>
                                <td>{$modulo[tipo]->mod_estado}</td>
                                <td class="actions">
                                    <a href="{$SERVER_ADMIN}configuracion/seccion/editar/{$modulo[tipo]->sec_id}.html" title="Editar {$modulo[tipo]->mod_nombre}">
                                        <i class="fa fa-pencil"></i>
                                    </a>&nbsp;&nbsp;&nbsp;
                                    <a class="delete-row" href="javascript:;" onclick="eliminar({$modulo[tipo]->sec_id})" title="Eliminar {$modulo[tipo]->mod_nombre}">
                                        <i class="fa fa-trash-o"></i>
                                    </a>
                                </td>
                            </tr>
                            {/section}
                        {else}
                            <tr>
                                <td colspan="7" class="text-center"><b>No se encontraron registros</b></td>
                            </tr>
                        {/if}
                        </tbody>
                    </table>
            </div>
    </div>
</section>
<!-- end: page -->