<main class=" main-login p-t-0">
        <div  class="p-t-4 p-b-1 w-default">
            <div class="grid-5-5 login-box-bs shadow bg-branco">
                <div class="bg-cadastro-left"></div>
                <div class="p-8">
                    <div class="p-l-8 p-r-8">
                        <form class="form-cadastro">
                            <input type="hidden" name="token" value="Cadastro" required/>
                            <input type="hidden" name="key" value="DadosAcesso" required/>
                            <div class="txt-center ">
                                <div style="max-width: 250px;" class="p-8">
                                    <a href="\" title="Voltar para a paginal inicial" class="">
                                        <img src="imagens/indice.png" class="" alt="Imagem não disponivel."/>
                                    </a>
                                </div>
                                <div>
                                    <h4 class="f-s-4" style="color: rgba(75,75,75,1.9);">Vamos iniciar seu cadastro para continuarmos</h4>
                                </div>
                            </div>
                            <div class="p-relative">
                                <label for="nome" class="login-label input-label"><i class="fas fa-user input-ico-login"></i></label>
                                <input type="email" id="nome" name="nome" class="login-input" Placeholder="Informe seu nome completo" required/>
                            </div>
                            <div class="p-relative">
                                <label for="email" class="login-label input-label"><i class="fas fa-envelope input-ico-login"></i></label>
                                <input type="email" id="email" name="email" class="login-input" Placeholder="Seu e-mail" required/>
                            </div>
                            <div class="m-t-8 p-4 shadow cor-verde ">
                                <p class="f-s-3">
                                    <strong class="f-w-6">Obs:</strong> 
                                    Crie uma senha que contenha no minimo 8 e maximo 10 caracteres, contendo pelo menos uma letra, um número e um caractere especial. 
                                    <br/>Exemplo 
                                    <i>#ge1n2021</i>
                                </p>
                            </div>
                            <div class="p-relative">
                                <label for="senha" class="login-label input-label"><i class="fas fa-key input-ico-login"></i></label>
                                <input type="password" id="senha" name="senha" class="login-input" Placeholder="Crie uma senha" required/>
                            </div>
                            <div class="p-relative">
                                <label for="csenha" class="login-label input-label"><i class="fas fa-key input-ico-login"></i></label>
                                <input type="password" id="csenha" name="csenha" class="login-input" Placeholder="Confirme a senha" required/>
                            </div>
                            <div class="p-8">
                                <button type="button" class="btn btn-cadastro">Continuar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>  