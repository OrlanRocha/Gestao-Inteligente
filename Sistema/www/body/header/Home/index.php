<div class="nav-mobile color-bg-vd">
        <ul class="nav" style='background: #3DBFA7 !important'>
            <a href="\Planos" title="Planos" ><li class='p-4 nav-branco starter r-radius-3'> Veja nossos Planos</li></a>
            <br/>
            <a title='Início' href='\'><li class="btn-nav p-6 m-b-6 corNavBtn ativo">Início</li></a>
            <a title='Contato' href='#Contato'><li class="btn-nav p-6 m-b-4 corNavBtn">Contato</li></a>
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
            <a href="\Login" ><span class="btn-nav p-3 m-l-2 f-right r-circle btn_hover ativo" title="Ir para a Pagina de Acesso"><i class="fas fa-user-lock f-s-3"></i></span></a>
            <?php 
                }
            ?> 
        </ul>
    </div>
<div class="main">
    <header class="p-2 p-b-0 txt-center color-bg-vd">
        <div style="max-width: 980px;">
            <span class="f-left btn-nav-mob">
                <label class="unselect f-s-6 cor-f-branco">&#9776;</label>
            </span>
            <div class="p-t-6 navBarP">
                <a class="p-4 nav-branco starter" href="\Planos" title="Planos" > Veja nossos Planos</a>
                <a class="p-4 nav-branco ativo-h" href="\" title="Início"> Início</a>
                <a class="p-4 nav-branco" href="#contato" title="Contato"> Contato</a>
                <!-- <span class="cursor f-right ativo-h">ORLAN</span> -->
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
                <a href="\Login" ><span class="btn-nav p-3 m-l-2 f-right r-circle btn_hover ativo" title="Ir para a Pagina de Acesso"><i class="fas fa-user-lock f-s-3"></i></span></a>
                <?php 
                    }
                ?>
            </div>
            <div class="grid-5-5">
                <div class="txt-left">
                    <div class="imgSiteLogo">
                        <img src="imagens/ideia.png" />
                    </div>
                    <div class="txt-center cx-LogoNome">
                        <h1 class="sensei cor-f-branco f-400" style="font-size: 7rem;">GEIN</h1>
                        <p class="sensei cor-f-branco nomeLogoP">GESTÃO INTELIGENTE</p>
                    </div>
                    <div class="txt-center">
                        <h3 class="sensei cor-f-branco f-s-8">CUIDANDO DO SEU NEGÓCIO</h3>
                    </div>
                </div>
                <div class="p-8 animate "><img src="imagens/hero-img.png" /></div>
            </div>
        </div>       
    </header>