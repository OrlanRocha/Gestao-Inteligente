<style>
.pdv-label{
    width: 100% !important;
    color: rgba(0,0,0,0.6);
    padding-left: .5rem;
    position: absolute;
    top: 1rem;
    left: 1rem;
    font-size: 1.2rem;
    text-align: left;
}
.pdv-size{
    max-width: 100% !important;
    height: 100%;
    max-height:initial;
    min-height: 100%;
}
body{
    overflow: hidden !important;
    user-select: none;
}
.pdv-size-panel{
  height: 100%;
  max-height:initial;
  min-height: 100%;
}
.pdv-input{
    width: 100%;
    border: none;
    padding: .75rem 2rem .75rem 1rem;
    border-radius: 1rem;
    font-size: 1.3rem;
    transition: all .5s;
    text-align: right;
}
.pdv-input:focus{
    outline: none;
    padding-right: 3rem;
}
.btn-pdv{
   padding: 1rem;
   background-color: rgba(26, 168, 142, 1); 
   color: white;
   font-size: 1rem;
   transition: all .6s;
   border-radius: 1rem !important;
}

.btn-pdv:active{
    background-color: rgb(53, 105, 105); 
}
</style>
<main class="p-2 pdv-size" style='height:100% !important;min-height:768px !important;max-height:100% !important;'>
    <span class="btn-nav-mob btn_hover animated drop_user"></span>
    <div class="g-p grid-panel-oculto" style='border-color: transparent'>
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
                            <div class="btn btn-default m-t-1 p-relative defaul-color-bg-2 ativo">
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
        <div class="p-t-2 p-l-0 p-b-2 p-r-0 sbar-2 f-right " style='height:100%;min-height:100%;max-height:100%'>
            <div class="p-3 color-bg-1 card p-relative fful">
                <div class="grid-sidebar">
                    <div class="p-2">
                        <div class="card  p-2 bar_ defaul-color-bg-1" style="text-align: center;">
                            <label class="unselect">&#9776;</label>
                        </div>
                    </div>
                    <div class="p-2">
                        <div class="card p-4 color-f-1 defaul-color-bg-1 ">
                            <p><span class="f-w-6"> Operador: </span>
                                <sub class="f-right f-600 f-s-3 ">
									Hora atual: 
									<span class=" color-f-1 p-r-4" id="hora"></span>
								</sub>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="grid-7-3">
                    <div class="p-1 pdv-size-panel">
                        <div class="card-s" style="overflow-y: auto;border: 1px solid rgba(0, 163, 117, 0.2); min-height:100%;max-height:100%;">                                
                            <table style='overflow: '>
                                    <tr>
                                        <th>UN.</th>
                                        <th>QTDE</th>
                                        <th>VL UNIT.</th>        
                                        <th>VL ITEM (R$)</th>
                                    </tr>
                                    <?php $start_ = 1;?>
                                    <?php while($start_ <= 6){ $start_++; ?>
                                    <tr>
                                        <td>Pizza Calabreza Grd</td>
                                        <td>02</td>
                                        <td>38,00</td>        
                                        <td>76,00</td>
                                    </tr>
                                    <?php } ?>  
                                </table>
                        </div>
                    </div>           
                    <div class="p-1 pdv-size-panel">
                        <div class="card-s card-status p-5 defaul-color-bg-2 p-b-8 p-relative">
                            <div class='card-s color-bg-1 p-2 m-b-4 i-center' style='height: 145px;width: 145px '>
                                Imagem indisponível
                            </div>
                            <div>
                                <div class="p-relative m-b-4 ">
                                    <label for="codProd" class="pdv-label">Cod. Produto:</label>
                                    <input type="text" id="codProd" class="pdv-input" name='codProd' required/>
                                </div>
                                <div class="p-relative m-b-4">
                                    <label for="quantidade" class="pdv-label">Quantidade:</label>
                                    <input type="text" id="quantidade" class="pdv-input" name='quantidade' required/>
                                </div>
                                <div class="p-relative m-b-4">
                                    <label for="nomeProd" class="pdv-label">Produto:</label>
                                    <input type="text" id="nomeProd" class="pdv-input" name='nomeProd' required/>
                                </div>
                                <div class="p-relative m-b-4">
                                    <label for="valorProduto" class="pdv-label">Valor Unitário:</label>
                                    <input type="text" id="valorProduto" class="pdv-input" name='valorProduto' Placeholder="0,00" required/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid-7-3">
                    <div class="grid-6 f-s-4 txt-center i-center">
                        <div class="p-l-1 p-r-1">
                            <button type="button" class="btn btn-pdv screen">Tela Cheia</button>
                        </div>
                        <div class="p-l-1 p-r-1">
                            <button type="button" class="btn btn-pdv tecla">F4 | Cod. Barras</button>
                        </div>
                        <div class="p-l-1 p-r-1">
                            <button type="button" class="btn btn-pdv">F6 | Produto</button>
                        </div>
                        <div class="p-l-1 p-r-1 screen">
                            <button type="button" class="btn btn-pdv">Selec. Ender.</button>
                        </div>
                        <div class="p-l-1 p-r-1 screen">
                            <button type="button" class="btn btn-pdv">Selec. Motoboy</button>
                        </div>
                        
                    </div>
                    <div class="grid-2 p-1">
                        <div class="p-1 txt-center">
                           <div class="btn cor-azul grid-3-7 p-t-8 p-b-8">
                               <div class="txt-left">
                                    Volume:
                               </div>
                               <div class="txt-right f-w-6 f-s-7">
                                   0
                               </div>
                           </div> 
                        </div>
                        <div class="p-1 txt-center">
                           <div class="btn cor-azul grid-3-7 p-t-8 p-b-8">
                               <div class="txt-left">
                                    Total:
                               </div>
                               <div class="txt-right f-w-6 f-s-7">
                                   0,00
                               </div>
                           </div> 
                        </div>
                    </div>
                </div>
                <div class="grid-7-3">
                    <div class="grid-5 i-center">
                        <div class="p-l-1 p-r-1">
                            <button type="button" class="btn btn-pdv">F3 | Limpar</button>
                        </div>
                        <div class="p-l-1 p-r-1">
                            <button type="button" class="btn btn-pdv">F4 | Selec. Prod.</button>
                        </div>
                        <div class="p-l-1 p-r-1">
                            <button type="button" class="btn btn-pdv">F6 | Excluir Prod.</button>
                        </div>
                        <div class="p-l-1 p-r-1">
                            <button type="button" class="btn btn-pdv">F7 | Fechar Venda</button>
                        </div>
                        <div class="p-l-1 p-r-1">
                            <button type="button" class="btn btn-pdv">F8 | Forma Pag</button>
                        </div>
                    </div>
                    <div class="grid-auto p-l-1 p-r-1 i-center">
                        <div class="txt-center">
                           <div class="btn cor-verde grid-3-7 p-t-8 p-b-8 p-2">
                               <div class="txt-left">
                                    Forma de Pagamento:
                               </div>
                               <div class="txt-right f-w-6 f-s-5">
                                   Não Selecionado
                               </div>
                           </div> 
                        </div>
                    </div>
                </div>
                <div class="btn color-bg-3 p-1 btn-top">
                </div>
            </div>
        </div>
    </div>
</main>                

<style>
    main .fful{ 
        height: 100%;
        min-height:100%;
        max-height: 100%;
    }
  /* main .fful:fullscreen, .fful:-webkit-full-screen, .fful:-moz-full-screen{ 
        height: 100%;
        min-height:100%;
        max-height: 100%;
        float: none !important;
    } */
/* *:fullscreen, *:-webkit-full-screen, *:-moz-full-screen {
    background-color: rgba(0, 150, 126, .09) !important;
    padding: 4rem;
    height: 100%;
    min-height:100%;
    max-height: 100%;
    float: none !important;
} */

::backdrop{
    background-color: rgba(0, 150, 126, .09);
}
</style>
<script>
    
    
    var body = document.querySelector("body"), screen = document.querySelector(".screen");
screen.addEventListener("click", function() {
    body.classList.add('i-center');
    if (body.requestFullscreen) {
        body.requestFullscreen();
      } else if (body.mozRequestFullScreen) { /* Firefox */
        body.mozRequestFullScreen();
      } else if (body.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
        body.webkitRequestFullscreen();
      } else if (body.msRequestFullscreen) { /* IE/Edge */
        body = window.top.document.body; //To break out of frame in IE
        body.msRequestFullscreen();
      }
});
</script>

<script >
    document.querySelector("main").addEventListener("keydown", applyKey);
    
    KEY_DOWN = 40;
    KEY_UP = 38;
    KEY_LEFT = 37;
    KEY_RIGHT = 39;
    KEY_END = 35;
    KEY_BEGIN = 36;
    KEY_BACK_TAB = 8;
    KEY_TAB = 9;
    KEY_SH_TAB = 16;
    KEY_ENTER = 13;
    KEY_ESC = 27;
    KEY_SPACE = 32;
    KEY_DEL = 46;
    KEY_A = 65;
    KEY_B = 66;
    KEY_C = 67;
    KEY_D = 68;
    KEY_E = 69;
    KEY_F = 70;
    KEY_G = 71;
    KEY_H = 72;
    KEY_I = 73;
    KEY_J = 74;
    KEY_K = 75;
    KEY_L = 76;
    KEY_M = 77;
    KEY_N = 78;
    KEY_O = 79;
    KEY_P = 80;
    KEY_Q = 81;
    KEY_R = 82;
    KEY_S = 83;
    KEY_T = 84;
    KEY_U = 85;
    KEY_V = 86;
    KEY_W = 87;
    KEY_X = 88;
    KEY_Y = 89;
    KEY_Z = 90;
    KEY_PF1 = 112;
    KEY_PF2 = 113;
    KEY_PF3 = 114;
    KEY_PF4 = 115;
    KEY_PF5 = 116;
    KEY_PF6 = 117;
    KEY_PF7 = 118;
    KEY_PF8 = 119;
    KEY_PF9 = 120;
    KEY_PF10 = 121;
    KEY_PF11 = 122;
    KEY_PF12 = 123;
    REMAP_KEY_T = 5019;

    function applyKey (_event_){

        var winObj = checkEventObj(_event_),
            intKeyCode  = winObj.keyCode,
            intAltKey   = winObj.altKey,
            intCtrlKey  = winObj.ctrlKey;
        
        // 1° --- Acesso com [ALT/CTRL+Key]
        if (intAltKey || intCtrlKey) {

            switch(intKeyCode){
                case KEY_DOWN:      alert(0);       break;
                case KEY_UP:        alert(0);       break;
                case KEY_LEFT:      alert(0);       break;
                case KEY_RIGHT:     alert(0);       break;
                case KEY_END:       alert(0);       break;
                case KEY_BEGIN:     alert(0);       break;
                case KEY_BACK_TAB:  alert(0);       break;
                case KEY_TAB:       alert(0);       break;
                case KEY_SH_TAB:    alert("Tab");   break;
                case KEY_ENTER:     alert("Enter"); break;
                case KEY_ESC:       alert(0);       break;
                case KEY_SPACE:     alert(0);       break;
                case KEY_DEL:       alert("Del");   break;
                case KEY_A:         alert(0);       break;
                case KEY_B:         alert(0);       break;
                case KEY_C:         alert(0);       break;
                case KEY_D:         alert(0);       break;
                case KEY_E:         alert(0);       break;
                case KEY_F:         alert(0);       break;
                case KEY_G:         alert(0);       break;
                case KEY_H:         alert(0);       break;
                case KEY_I:         alert(0);       break;
                case KEY_J:         alert(0);       break;
                case KEY_K:         alert(0);       break;
                case KEY_L:         alert(0);       break;
                case KEY_M:         alert(0);       break;
                case KEY_N:         alert(0);       break;
                case KEY_O:         alert(0);       break;
                case KEY_P:         alert(0);       break;
                case KEY_Q:         alert(0);       break;
                case KEY_R:         alert(0);       break;
                case KEY_S:         alert(0);       break;
                case KEY_T:         alert(0);       break;
                case KEY_U:         alert(0);       break;
                case KEY_V:         alert(0);       break;
                case KEY_W:         alert(0);       break;
                case KEY_X:         alert(0);       break;
                case KEY_Y:         alert(0);       break;
                case KEY_Z:         alert(0);       break;
                case KEY_PF1:       alert(0);       break;
                case KEY_PF2:       alert(0);       break;
                case KEY_PF3:       alert(0);       break;
                case KEY_PF4:       alert(0);       break;
                case KEY_PF5:       alert("F5");       break;
                case KEY_PF6:       alert("F6");       break;
                case KEY_PF7:       alert("F7");       break;
                case KEY_PF8:       alert("F8");       break;
                default: alert("Tecla inválida!"); break;
            }
        
            // 3° --- Mapeie o keyCode em outro keyCode não usado
            winObj.keyCode = intKeyCode = REMAP_KEY_T;
            winObj.returnValue = false;
            return false;
             
            // 2 ° --- Acesso sem [ALT/CTRL+Key]
        }else {
            switch(intKeyCode){
                case KEY_DOWN:      alert(0);       break;
                case KEY_UP:        alert(0);       break;
                case KEY_LEFT:      alert(0);       break;
                case KEY_RIGHT:     alert(0);       break;
                case KEY_END:       alert(0);       break;
                case KEY_BEGIN:     alert(0);       break;
                case KEY_BACK_TAB:  alert(0);       break;
                case KEY_TAB:       alert(0);       break;
                case KEY_SH_TAB:    alert("Tab");   break;
                case KEY_ENTER:     alert("Enter"); break;
                case KEY_ESC:       alert(0);       break;
                case KEY_SPACE:     alert(0);       break;
                case KEY_DEL:       alert("Del");   break;
                case KEY_A:         alert(0);       break;
                case KEY_B:         alert(0);       break;
                case KEY_C:         alert(0);       break;
                case KEY_D:         alert(0);       break;
                case KEY_E:         alert(0);       break;
                case KEY_F:         alert(0);       break;
                case KEY_G:         alert(0);       break;
                case KEY_H:         alert(0);       break;
                case KEY_I:         alert(0);       break;
                case KEY_J:         alert(0);       break;
                case KEY_K:         alert(0);       break;
                case KEY_L:         alert(0);       break;
                case KEY_M:         alert(0);       break;
                case KEY_N:         alert(0);       break;
                case KEY_O:         alert(0);       break;
                case KEY_P:         alert(0);       break;
                case KEY_Q:         alert(0);       break;
                case KEY_R:         alert(0);       break;
                case KEY_S:         alert(0);       break;
                case KEY_T:         alert(0);       break;
                case KEY_U:         alert(0);       break;
                case KEY_V:         alert(0);       break;
                case KEY_W:         alert(0);       break;
                case KEY_X:         alert(0);       break;
                case KEY_Y:         alert(0);       break;
                case KEY_Z:         alert(0);       break;
                case KEY_PF1:       alert(0);       break;
                case KEY_PF2:       alert(0);       break;
                case KEY_PF3:       alert(0);       break;
                case KEY_PF4:       alert(0);       break;
                case KEY_PF5:       alert(0);       break;
                case KEY_PF6:       alert(0);       break;
                case KEY_PF7:       alert(0);       break;
                case KEY_PF8:       alert(0);       break;
                default: alert("Tecla inválida!");  break;
            }
            winObj.keyCode = intKeyCode = REMAP_KEY_T;
            winObj.returnValue = false;
            return false;
        }
    }   

    function checkEventObj ( _event_ ){
        
        // --- IE explorer
        if ( window.event )
            return window.event;
        
            // --- Netscape and other explorers
        else
            return _event_;
    } 

    

</script>