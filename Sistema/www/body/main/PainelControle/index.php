<main class="p-2 m-b-1">
    <div class="g-p grid-panel">
        <div class="p-t-2 p-l-0 p-b-2 p-r-2 sbar-1 f-left">
            <div class="p-4 color-bg-1 card sidebar-min">
                <div class='txt-center sideDados'>
                    <div class='p-1'>
                        <div class='p-2 logoIMG-Loja logoRedondo p-retive'>
                            <img src="\imagens/<?=$_SESSION['loja'][0]['LOJA_ImagemLogo']?>" />
                        </div>
                        <div class='p p-t-1 p-b-1 f-s-5 b-line'>
                            <?=$_SESSION['loja'][0]['LOJA_nome']?>
                        </div>
                    </div>
                <div>
                <div class='p-b-2'>
                    <div class='p-t-3 txt-left'>
                        <div class='p-b-2'> 
                            <span class='p f-s-3'>Olá,</span>
                            <span class='p f-s-4'><?=$_SESSION['pNome'][0];?></span>
                        </div>
                    </div>
                    <div class="card-s card-status p-2 p-l-3 p-t-3 defaul-color-bg-2 txt-left">
                        <p class='p f-s-2'>Cargo:</p>
                        <p class='p'>Gerente</p>

                        <p class='p m-t-2 f-s-2'>Plano:</p>
                        <p class='p'>Trimestral</p>
                    </div>
                </div>
                
            </div>
        </div>        
                        <a href="\PainelControle" title="Dashboard">
                            <div class="btn btn-default m-t-1 p-relative  defaul-color-bg-2 ativo">
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
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2">
                                <span class="icon-menu"><i class="fas fa-cash-register"></i>
                                    <span class="tooltiptext">
                                        PDV
                                    </span>
                                </span>
                                <p class="txt-menu">PDV</p>
                            </div>
                        </a>
                        <a href="\PainelControle/Funcionarios" title="Funcionários">
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2">   
                                <span class="icon-menu"><i class="fas fa-users"></i>
                                    <span class="tooltiptext">
                                        Funcionários
                                    </span>
                                </span>
                                <p class="txt-menu">Funcionários</p>
                            </div>
                        </a>
                        <a href="\PainelControle/Funcionarios" title="Marcação de Ponto">
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2">   
                                <span class="icon-menu"><i class="fas fa-clock
                                "></i>
                                    <span class="tooltiptext">
                                        Marcação de Ponto
                                    </span>
                                </span>
                                <p class="txt-menu">Marcação de Ponto</p>
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
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2">
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
                                    <p>Sistema / Dashboard
                                        <sub class="f-right f-600 f-s-3 ">
											Hora atual: 
											<span class=" color-f-1 p-r-4" id="hora"></span>
										</sub>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="grid-5">
                            <div class="p-1">
                                <div class="card-s card-status cor-azul">
                                    <h4 class="f-s-3 color-ft-1">Cliente cadastrados </h4>
                                    <i class="fas fa-user-friends f-left f-s-5"></i>
                                    <h1 class="f-s-6">425</h1>
                                </div>
                            </div>
                            <div class="p-1">
                                <div class="card-s card-status cor-vermelho">
                                    <h4 class="f-s-3 color-ft-1">Balanço Mensal</h4>
                                    <i class="fas fa-dollar-sign f-left f-s-5"></i>
                                    <h1 class="f-s-6">2.533,01</h1>
                                </div>
                            </div>
                            <div class="p-1">
                                <div class="card-s card-status cor-verde">
                                    <h4 class="f-s-3 color-ft-1">Mensagens</h4>
                                    <i class="fas fa-comment-alt f-left f-s-5"></i>
                                    <h1 class="f-s-6">1005</h1>
                                </div>
                            </div>
                            <div class="p-1">
                                <div class="card-s card-status cor-amarelo">
                                    <h4 class="f-s-3 color-ft-1">Mensagens nao lidas</h4>
                                    <i class="fas fa-comment-alt f-left f-s-5"></i>
                                    <h1 class="f-s-6">23</h1>
                                </div>
                            </div>
                            <div class="p-1">
                                <div class="card-s card-status cor-laranja">
                                    <h4 class="f-s-3 color-ft-1">Clientes Online</h4>
                                    <i class="fas fa-user-friends f-left f-s-5"></i>
                                    <h1 class="f-s-6">63</h1>
                                </div>
                            </div>
                            <div class="p-1">
                                <div class="card-s card-status cor-amarelo">
                                    <h4 class="f-s-3 color-ft-1">Vendas Hoje</h4>
                                    <i class="fas fa-dollar-sign f-left f-s-5"></i>
                                    <h1 class="f-s-6">98</h1>
                                </div>
                            </div>
                            <div class="p-1">
                                <div class="card-s card-status cor-verde">
                                    <h4 class="f-s-3 color-ft-1">Motoboys</h4>
                                    <i class="fas fa-motorcycle f-left f-s-5"></i>
                                    <h1 class="f-s-6">16</h1>
                                </div>
                            </div>
                            <div class="p-1">
                                <div class="card-s card-status cor-laranja">
                                    <h4 class="f-s-3 color-ft-1">Pedidos pendentes</h4>
                                    <i class="fas fa-dolly f-left f-s-5"></i>
                                    <h1 class="f-s-6">1</h1>
                                </div>
                            </div>
                            <div class="p-1">
                                <div class="card-s card-status  cor-azul">
                                    <h4 class="f-s-3 color-ft-1">Pedidos em andamento</h4>
                                    <i class="fas fa-dolly f-left f-s-5"></i>
                                    <h1 class="f-s-6">3</h1>
                                </div>
                            </div>
                            <div class="p-1">
                                <div class="card-s card-status  cor-vermelho">
                                    <h4 class="f-s-3 color-ft-1">Pedidos concluidos</h4>
                                    <i class="fas fa-dolly f-left f-s-5"></i>
                                    <h1 class="f-s-6">12</h1>
                                </div>
                            </div>
                        </div>
                        <div class="grid-auto">
                            <div class="p-1">
                                <div class="card-s card-status p-5 defaul-color-bg-2" style='min-height:380px'>

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