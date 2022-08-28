<div class="nav-mobile">
        <ul class="nav">
            <a title='' href='\'><li class="btn-nav p-6 m-b-4 ativo">Início</li></a>
            <a title='' href='\PainelControle\MeuPlano'><li class="btn-nav p-6 m-b-4">Meu Plano</li></a>
            <a title='' href='\PainelControle\Suporte'><li class="btn-nav p-6 m-b-4">Suporte</li></a>
            <a title='' href='\PainelControle\Suporte'><li class="btn-nav p-6 m-b-4 cor-vermelho">Sair</li></a>
        </ul>
    </div>
    <div class="main">
        <header class="p-2 p-b-0 ">
            <nav class="p-4 p-t-6  p-relative">
                <div class="btn-nav-mob">
                    <div class="card p-1">
                        <label class="unselect f-s-6 color-f-1">&#9776;</label>
                    </div>
                </div>
                <div class="logo m-r-2">
                    <img src="\imagens/icon.png" />
                </div>
                <span class="btn-nav m-r-2 p-4 ativo"><a href="\" title="Início"> Início</a></span>
                <span class="btn-nav m-r-2 p-4 "><a href="\Contato" title="Contato"> Meu plano</a></span>
                <span class="btn-nav p-4 "><a href="\Suporte" title="Suporte"> Suporte</a></span>
                <span class="dropdown">
                    <span class="btn-nav p-4 m-l-2 f-right r-circle btn_hover ativo"><?=$siglaUser;?></span>
                    <span class='drop_user d_hide txt-left' >
                        <a href='\PainelControle\Perfil' class='btn-nav m-b-1 p-4 ativo '>Perfil <i class='fas fa-user-cog f-right'></i></a>
                        <a href='\sair' class='btn-nav p-4 m-b-1 at_vermelho'>Sair <i class='fas fa-external-link-alt f-right'></i></a>
                    </span>
                </span>
                <span class="f-right">
					<input type="search" name="busca" class="color-bg-2 input-s-nav" id="busca" placeholder="Pesquisar..."  autocomplete="off" />
				</span>
            </nav>
        </header>