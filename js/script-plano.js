addEventListener("load", function() {
    document.querySelector(".load-fullsreen").style.display = "none";
    setTimeout(function() {
       
    }, 1200);
});

var msg = document.querySelector('.msg-box'), alert = document.querySelector('.msg-alert');
document.querySelectorAll(".btn-cadastro").addEventListener("click", function() {
    let login = document.querySelector('.form-cadastro'), r_ = "Essa requisição não funcionou.";
    let formData = new FormData(login), object = {};

    formData.forEach((value, key) => object[key] = value);

    let json = JSON.stringify(object), 
    ajax = new XMLHttpRequest();

    ajax.open("POST", "index.php", true), 
    ajax.setRequestHeader("Content-type", "application/json"), 
    ajax.send(json), ajax.onreadystatechange = function() {
    
        if (ajax.readyState == 4 && ajax.status == 200) {
            let data = ajax.responseText;
            document.getElementsByClassName('resposta-resquest').value = data;
        }else{

            msg.classList.add("animated");
            msg.style.display = 'block'; 
            alert.classList.add("erro");
            
            msg.classList.add("bounceInRight");
            document.getElementById("resposta").innerHTML = r_;

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
    }
});