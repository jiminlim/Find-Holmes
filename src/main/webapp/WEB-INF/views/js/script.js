
Change();

function Change(){
    
    var windowTop = $(window).scrollTop();

    if(windowTop <= $('#main').position().top){
    	$('#main').find('.vertical-center').animate({opacity : 1, top : 0},1000);
    }
    
}
