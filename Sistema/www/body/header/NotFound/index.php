<div class="nav-mobile">
    <ul class="nav">
        <li class="btn-nav p-6 m-b-4 ativo">Início</li>
        <li class="btn-nav p-6 m-b-4">Meu Plano</li>
        <li class="btn-nav p-6 m-b-4 cor-verde">Deslogar</li>
    </ul>
</div> 
<div class="main">
    <header class="p-2 p-b-2 txt-center">
        <div style="max-width: 980px;">
            <span class="f-left btn-nav-mob">
                <label class="unselect f-s-6 cor-f-branco">&#9776;</label>
            </span>
            <div class="p-t-6"> 
                <a href="\">
                    <div class="i-center" style="max-width:250px">
                        <img src="\imagens/icon.png" alt="Gestão Inteligente" />
                    </div>
                </a>
                <?php 
                    if (!empty($_SESSION['sessionUser'][0]['USER_Status'])) {
                ?>      
                <span class="dropdown">
                    <span class="btn-nav p-4 m-l-2 f-right r-circle btn_hover ativo"><?=$siglaUser;?></span>
                    <span class='drop_user d_hide txt-left' >
                        <a href='\PainelControle' class='btn-nav m-b-1 p-4 ativo '>Dashboard <i class='fas fa-chart-line f-right'></i></a>
                        <a href='\PainelControle\Perfil' class='btn-nav m-b-1 p-4 ativo '>Perfil <i class='fas fa-user-cog f-right'></i></a>
                        <a href='\sair' class='btn-nav p-4 m-b-1 at_vermelho'>Sair <i class='fas fa-external-link-alt f-right'></i></a>
                    </span>
                </span>
                <?php 			
                    }else{
                ?>      
                <a href="\Login" ><span class="cursor f-right nav-branco" title="Ir para a Pagina de Acesso"><i class="fas fa-user-lock f-s-5"></i></span></a>
                <?php 
                    }
                ?>
            </div>
        </div>       
    </header>