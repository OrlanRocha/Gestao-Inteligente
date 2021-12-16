addEventListener("load", function() {
    document.querySelector(".load-fullsreen").style.display = "none";
    setTimeout(function() {
       
    }, 1200);
});

var msg = document.querySelector('.msg-box'), alert = document.querySelector('.msg-alert');
document.querySelector(".btn-planos").addEventListener("click", function() {
    let plano = document.querySelector('.form-planos'), r_ = "Essa requisição não funcionou.";
    let formData = new FormData(plano), object = {};

    formData.forEach((value, key) => object[key] = value);

    let json = JSON.stringify(object), 
    ajax = new XMLHttpRequest();

    ajax.open("POST", "index.php", true), 
    ajax.setRequestHeader("Content-type", "application/json"), 
    ajax.send(json), ajax.onreadystatechange = function() {
        msg.classList.add("animated");
        if (ajax.readyState == 4 && ajax.status == 200) {
            let data = JSON.parse(ajax.responseText);

            msg.style.display = 'block'; 
            alert.classList.add(data.tipo);    

            msg.classList.add("bounceInRight");
            document.getElementById("resposta").innerHTML = data.msg;

            if(data.url){
                setTimeout(function() {
                    window.location.href = data.url;
                }, 2000);
            }
        }else{
            msg.style.display = 'block'; 
            alert.classList.add("erro");
            
            msg.classList.add("bounceInRight");
            document.getElementById("resposta").innerHTML = r_;   
        }

        setTimeout(function() {
            msg.classList.remove("bounceInRight");
            msg.classList.add("bounceOutRight");

            setTimeout(function() {
                msg.style.display = 'none'; 
                msg.classList.remove("bounceOutRight");
                msg.classList.remove("animated");
                alert.classList.remove("erro");
            }, 700);   
        }, 2500);         
    }
});

var radios = document.querySelectorAll('input[name="plano"]'), s_ = '';
 
document.querySelector(".btn-planos").onclick = function() {
    
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            s_ = "Escolheu: " + radios[i].value                
        }
    }
    console.log(s_);
 };

 document.querySelector(".plano365").onclick = function() {
    var rad_ = document.getElementById('plano365');
    if(rad_.classList != 'plano-ativo'){
        document.querySelector(".plano30").classList.remove("plano-ativo");
        document.querySelector(".plano90").classList.remove("plano-ativo");
        document.querySelector(".plano365").classList.add("plano-ativo");
    }else{
        document.querySelector(".plano365").classList.remove("plano-ativo");
    }
 };
 document.querySelector(".plano90").onclick = function() {
    var rad_ = document.getElementById('plano90');
    if(rad_.classList != 'plano-ativo'){
        document.querySelector(".plano365").classList.remove("plano-ativo");
        document.querySelector(".plano30").classList.remove("plano-ativo");
        document.querySelector(".plano90").classList.add("plano-ativo");
    }else{
        document.querySelector(".plano90").classList.remove("plano-ativo");
    }
 };

 document.querySelector(".plano30").onclick = function() {
    var rad_ = document.getElementById('plano30');
    if(rad_.classList != 'plano-ativo'){
        document.querySelector(".plano365").classList.remove("plano-ativo");
        document.querySelector(".plano90").classList.remove("plano-ativo");
        document.querySelector(".plano30").classList.add("plano-ativo");
    }else{
        document.querySelector(".plano30").classList.remove("plano-ativo");
    }
 };