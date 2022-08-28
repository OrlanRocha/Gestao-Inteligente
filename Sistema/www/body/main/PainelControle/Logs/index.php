<main class='p-2'>
    <div class="g-p grid-panel">
        <div class="p-t-2 p-l-0 p-b-2 p-r-2 sbar-1 f-left">
            <div class="p-4 color-bg-1 card sidebar-min">
                <a href="\PainelControle" title="Dashboard">
                    <div class="btn btn-default m-t-1 p-relative  defaul-color-bg-2 ">
                                <span class="icon-menu"> 
                                    <i class="fas fa-chart-line"></i>
									<span class="tooltiptext">
										Dashboard									
									</span>
                                </span>
                                <p class="txt-menu">Dashboard</p>
                            </div>
                        </a>
                        <a href="\PainelControle/PDV" title="PDF">
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2 ">
                                <span class="icon-menu"><i class="fas fa-cash-register"></i>
                                    <span class="tooltiptext">
                                        PDV
                                    </span>
                                </span>
                                <p class="txt-menu">PDV</p>
                            </div>
                        </a>
                        <a href="\PainelControle/Funcionarios" title="Funcionários">
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2 ">   
                                <span class="icon-menu"><i class="fas fa-users"></i>
                                    <span class="tooltiptext">
                                        Funcionários
                                    </span>
                                </span>
                                <p class="txt-menu">Funcionários</p>
                            </div>
                        </a>
                        <a href="\PainelControle/Configuracoes" title="Configurações">
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2">
                                <span class="icon-menu"><i class="fas fa-cogs"></i>
                                    <span class="tooltiptext">
                                        Configurações
                                    </span>
                                </span>
                                <p class="txt-menu">Configurações</p>
                            </div>
                        </a>
                        <a href="\PainelControle/Seguranca" title="Segurança">
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2">
                                <span class="icon-menu"><i class="fas fa-shield-alt"></i>
                                    <span class="tooltiptext">
                                        Segurança
                                    </span>
                                </span>
                                <p class="txt-menu">Segurança</p>
                            </div>
                        </a>
                        <a href="\PainelControle/Clientes" title="Clientes">
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2">
                                <span class="icon-menu"><i class="fas fa-user-friends"></i>
                                    <span class="tooltiptext">
                                        Clientes
                                    </span>
                                </span>
                                <p class="txt-menu">Clientes</p>
                            </div>
                        </a>
                        <a href="\PainelControle/Pedidos" title="Pedidos">
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2">
                                <span class="icon-menu"><i class="fas fa-dolly"></i>
                                    <span class="tooltiptext">
                                        Pedidos
                                    </span>
                                </span>
                                <p class="txt-menu">Pedidos</p>
                            </div>
                        </a>
                        <a href="\PainelControle/Mensagens" title="Mensagens">
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2">
                                <span class="icon-menu"><i class="fas fa-comment-alt"></i>
                                    <span class="tooltiptext">
                                        Mensagens
                                    </span>
                                </span>
                                <p class="txt-menu">Mensagens</p>
                            </div>
                        </a>
                        <a href="\PainelControle/Relatorios">
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2">
                                <span class="icon-menu"><i class="fas fa-clipboard-list"></i>
                                    <span class="tooltiptext">
                                        Relatórios
                                    </span>
                                </span>
                                <p class="txt-menu">Relatórios</p>
                            </div>
                        </a>
                        <a href="\PainelControle/Logs">
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2 ativo">
                                <span class="icon-menu"><i class="fas fa-file-invoice"></i>
                                    <span class="tooltiptext">
                                        Logs
                                    </span>
                                </span>
                                <p class="txt-menu">Logs</p>
                            </div>
                        </a>
            </div>
        </div>
        <div class="p-t-2 p-l-0 p-b-2 p-r-0 sbar-2 f-right">
            <div class="p-3 color-bg-1 card">
                <div class="grid-sidebar">
                    <div class="p-2">
                        <div class="card  p-2 bar_ defaul-color-bg-1" style="text-align: center;">
                            <label class="unselect">&#9776;</label>
                        </div>
                    </div>
                    <div class="p-2">
                        <div class="card p-4 color-f-1 defaul-color-bg-1">
                            <p>Sistema / Funcionários
                                <sub class="f-right f-600 f-s-3 ">
									Hora atual: 
									<span class=" color-f-1 p-r-4" id="hora"></span>
								</sub>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="grid-auto">
                    <div class="p-1">
                        <div class="card-s" style="overflow: auto; max-height: 580px;">                            
                            <table style='overflow: auto;min-width:300px !important;width:100% !important;'>
                                <tr>
                                    <th>ID Usuário</th>
                                    <th>ID Loja</th>
                                    <th>IP</th>
                                    <th>Navegador</th>
                                    <th>Mensagem</th>
                                    <th>Data</th>
                                    <th>Hora</th>
                                </tr>
                                <?php 
                                $sql_ = new \Sistema\Select\SQL();
                                $start_ = $sql_->exe_('LOGS');
                                ?>
                                <?php 
                                if (is_array($start_) || is_object($start_)){
                                foreach($start_ as $v_){  ?>
                                <tr>
                                    <td><?=$v_['LOG_ID_USER'];?></td>
                                    <td><?=$v_['LOG_ID_LOJA'];?></td>
                                    <td><?=$v_['LOG_IP_SOLIC'];?></td>
                                    <td><?=$v_['LOG_TP_SOLIC'];?></td>
                                    <td><?=$v_['LOG_DESCRICAO'];?></td>
                                    <td><?=date('d/m/Y', strtotime($v_['LOG_DATAHORA']));?></td>
                                    <td><?=date('H:i:s', strtotime($v_['LOG_DATAHORA']));?></td>
                                </tr>
                                <?php } } ?>  
                            </table>
                        </div>
                    </div>
                </div>
                <div class="btn color-bg-3 p-1 btn-top">
                    <span class="" style="font-size: 1.6em; color: white;">&#8593;</span>
                </div>
            </div>
        </div>
    </div>
</main>