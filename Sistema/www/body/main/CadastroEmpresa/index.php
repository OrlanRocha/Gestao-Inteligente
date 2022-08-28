<main class=" main-login p-0 ">
        <div class="p-t-4 w-default">
            <div class="grid-5-5 login-box-bs shadow bg-branco">
                <div class="p-8">
                    <div class="p-l-8 p-r-8" style="overflow: hidden;transition: all;">
                        <div class="txt-center ">
                            <div class="p-t-8">
                                <h4 class="f-s-6 cadastro-color">Como será o cadastro <br/>da sua empresa?</h4>
                            </div>
                        </div>
                        <div class="txt-center p-t-6 p-b-8">
                            <p class="b-line color-cd-1 f-s-4">ou</p>
                            <div class="grid-2">
                                    <div class="btn-escolha m-t-4 esc-cpf escolha">
                                        CPF
                                    </div>
                                    <div class="btn-escolha m-t-4 esc-cnpj">
                                        CNPJ
                                    </div>
                            </div>
                        </div>
                        <form class="form-cadastro-cpf" style="display: inline;">
                            <div class="obs-att">
                                <p class="color-cd-2">Não se preocupe, seus dados estão seguros, será apenas para identificação e pagamento.</p>
                            </div>
                            <div class="obs-att m-t-4 p-t-0 cor-verde">
                                <div class="p-relative p-t-0">
                                    <label for="cpf" class="login-label input-label"><i class="fas fa-id-card input-ico-login"></i></label>
                                    <input type="text" id="cpf" name="cpf" class="login-input" Placeholder="CPF somente números" required/>
                                </div>
                                <div class="p-relative m-b-5">
                                    <label for="dataNascimento" class="login-label input-label"><i class="fas fa-calendar-alt input-ico-login"></i></label>
                                    <sub style="color: rgba(0, 0, 0, .8);">Data de nascimento</sub>
                                    <input type="date" id="dataNascimento" name="dataNascimento" class="login-input"  max="<?=date('Y-m-d', strtotime('-18year'));?>" required/>
                                </div>
                            </div>   
                            <div class="p-relative">
                                <label for="nomeEmpresa" class="login-label input-label"><i class="fas fa-building input-ico-login"></i></label>
                                <input type="text" id="nomeEmpresa" name="nomeEmpresa" class="login-input" Placeholder="Nome da empresa" required/>
                            </div>
                            <div class="p-8">
                                <button type="button" class="btn btn-cadastro-cpf">Continuar</button>
                            </div>
                            <input type="hidden" name="token" value="Cadastro" required/>
                            <input type="hidden" name="key" value="DadosEmpresa" required/>
                        </form>
                        <form class="form-cadastro-cnpj" style="display: none;">
                            <div class="obs-att">
                                <p class="color-cd-2">Não se preocupe, seus dados estão seguros, será apenas para identificação e pagamento.</p>
                            </div>
                            <div class="obs-att m-t-4 p-t-0 cor-verde">
                                <div class="p-relative p-t-0">
                                    <label for="cpf" class="login-label input-label"><i class="fas fa-id-card input-ico-login"></i></label>
                                    <input type="text" id="cpf" name="cpf" class="login-input" Placeholder="CPF somente números" required/>
                                </div>
                                <div class="p-relative  m-b-5">
                                    <label for="dataNascimento" class="login-label input-label"><i class="fas fa-calendar-alt input-ico-login"></i></label>
                                    <sub style="color: rgba(0, 0, 0, .8);">Data de nascimento</sub>
                                    <input type="date" id="dataNascimento" name="dataNascimento" class="login-input"  max="<?=date('Y-m-d', strtotime('-18year'));?>" required/>
                                </div>
                            </div>
                            <div class="p-relative">
                                <label for="cnpj" class="login-label input-label"><i class="fas fa-id-card input-ico-login"></i></label>
                                <input type="text" id="cnpj" name="cnpj" class="login-input" Placeholder="CNPJ somente números" required/>
                            </div>
                            <div class="p-relative">
                                <label for="ie" class="login-label input-label"><i class="fas fa-file-alt input-ico-login"></i></label>
                                <input type="text" id="ie" name="ie" class="login-input" Placeholder="Inscrição estadual" required/>
                                <label for="isento" class="p-l-8 p-relative" style="top: .4rem;"><input type="checkbox" name="isento" id="isento"> Insento</label>
                            </div>
                            <div class="p-relative">
                                <label for="nomeEmpresa" class="login-label input-label"><i class="fas fa-building input-ico-login"></i></label>
                                <input type="text" id="nomeEmpresa" name="nomeEmpresa" class="login-input" Placeholder="Nome da empresa" required/>
                            </div>
                            <div class="p-8">
                                <button type="button" class="btn btn-cadastro-cnpj">Continuar</button>
                            </div>
                            <input type="hidden" name="token" value="Cadastro" required/>
                            <input type="hidden" name="key" value="DadosEmpresa" required/>
                        </form>
                    </div>
                </div>
                <div class="bg-empresa-right"></div>
            </div>
            <!-- 1min = 60 | 1h = 3600 | 1 dia = 86400 | 1 mes = 2592000 (30 dias) | 1 ano = 31536000 (365 dias) | 18 anos = 567648000 + 432000 = 568080000 (devido ao ano 366 e media 4,5 considerando 18 anos sera adicionado 5 dias para compensação) -->
        </div>
    </main> 