addEventListener("load", function() {
    setTimeout(function() {
        document.querySelector(".load-fullsreen").style.display = "none";
    }, 1200);
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