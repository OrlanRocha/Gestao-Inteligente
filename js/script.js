var bar_0 = document.querySelector(".bar_"),
    grid = document.querySelector(".g-p"),
    sba_1 = document.querySelector(".sbar-1"),
    sba_2 = document.querySelector(".sbar-2"),
    sideDados = document.querySelector(".sideDados");

    bar_0.addEventListener("click", function() {
    if (grid.style.borderColor != 'transparent') {
        grid.classList.remove("grid-panel"), grid.classList.add("grid-panel-oculto"), grid.style.borderColor = "transparent", sideDados.style.display = 'none';
    } else if (grid.style.borderColor == 'transparent') {
        grid.classList.remove("grid-panel-oculto"), grid.classList.add("grid-panel"), grid.style.borderColor = "white", sideDados.style.display = 'block';
    }
});

addEventListener("load", function() {
    setTimeout(function() {
        document.querySelector(".load-fullsreen").style.display = "none";
    }, 1200);

    setInterval(function() {
        var d = new Date(),
            n1 = d.getHours(),
            n2 = d.getMinutes(),
            n3 = d.getSeconds();
        document.getElementById("hora").innerHTML = n1 + ':' + n2 + ':' + n3;
    }, 1100);

});

document.querySelector(".btn-nav-mob").addEventListener("click", function() {
    var main = document.querySelector(".main"),
        nav = document.querySelector(".nav-mobile");
    if (nav.style.width != "250px") {
        nav.style.visibility = "visible", nav.style.width = "250px", main.style.marginLeft = "250px";
    } else {
        nav.style.width = "0", main.style.marginLeft = "0", nav.style.visibility = "hidden";
    }
});

var btn_Top = document.querySelector(".btn-top");
window.onscroll = function() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        btn_Top.style.display = "block";
    } else {
        btn_Top.style.display = "none";
    }
};

document.querySelector(".btn-top").addEventListener("click", function() {
    document.body.scrollTop = 0, document.documentElement.scrollTop = 0;
});

var drop_0 = document.querySelector(".drop_user"), drop_1 = document.querySelector(".btn_hover");
drop_0.classList.add("animated"), drop_0.classList.add("delay---25s");

drop_1.addEventListener("click", function() {
    if(drop_0.classList.contains('d_hide')){
        drop_0.classList.remove('fadeOutRight'); 
        
        drop_0.classList.add('d_show');
        drop_0.classList.add('fadeInRight');        

        drop_1.classList.add('ativo');
        drop_0.classList.remove('d_hide');
    }else{

        drop_0.classList.remove('d_show');
        drop_0.classList.add('d_hide');

        drop_1.classList.remove('ativo');
        drop_0.classList.remove('fadeInRight');    
    }
});
window.onclick = function(ev_){
    if (!ev_.target.matches('.btn_hover')) {
        if (drop_0.classList.contains('d_show')) {
            drop_0.classList.remove('d_show');
            drop_0.classList.add('d_hide');
        }
    }
}      
