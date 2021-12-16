<div class="nav-mobile">
    <ul class="nav">
        <li class="btn-nav p-6 m-b-4 ativo">Início</li>
        <li class="btn-nav p-6 m-b-4">Meu Plano</li>
        <li class="btn-nav p-6 m-b-4">Configurações de perfil</li>
        <li class="btn-nav p-6 m-b-4">Suporte</li>
        <li class="btn-nav p-6 m-b-4 cor-verde">Deslogar</li>
    </ul>
</div> 
<div class="main">
    <header class="p-2 p-b-0 txt-center color-bg-vd">
        <div style="max-width: 980px;">
            <span class="f-left btn-nav-mob">
                <label class="unselect f-s-6 cor-f-branco">&#9776;</label>
            </span>
            <div class="p-t-6">
                <a class="p-4 nav-branco starter" href="\Planos" title="Planos" > Comece agora</a>
                <a class="p-4 nav-branco ativo-h" href="\" title="Início"> Início</a>
                <a class="p-4 nav-branco" href="\#contato" title="Contato"> Contato</a>
                <!-- <span class="cursor f-right ativo-h">ORLAN</span> -->
                <?php 
                    if (!empty($_SESSION['sessionUser'][0]['USER_Status'])) {
                ?>      
                <span class="dropdown">
                    <span class="btn-nav p-4 m-l-2 f-right r-circle btn_hover ativo">OR</span>
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
            <div class="grid-5-5">
                <div class="txt-left">
                    <div class="" style="max-width: 250px;display: inline-block;">
                        <img src="imagens/ideia.png" />
                    </div>
                    <div class="txt-center" style="max-width: 200px;display: inline-block;">
                        <h1 class="sensei cor-f-branco f-400" style="font-size: 7rem;">GEIN</h1>
                        <p class="sensei cor-f-branco" style="position: relative;top: -1rem;left:1rem;font-size: 1.4rem;">GESTÃO INTELIGENTE</p>
                    </div>
                    <div class="txt-center">
                        <h3 class="sensei cor-f-branco f-s-8">CUIDANDO DO SEU NEGÓCIO</h3>
                    </div>
                </div>
                <div class="p-8 animate "><img src="imagens/hero-img.png" /></div>
            </div>
        </div>       
    </header>