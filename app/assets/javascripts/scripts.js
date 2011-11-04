
window.onerror=function(desc,page,line,chr){
/* alert('JavaScript error occurred! \n'
  +'\nError description: \t'+desc
  +'\nPage address:      \t'+page
  +'\nLine number:       \t'+line
 );*/
}

var mc={
 flag:0,
 auto_open:true,
 auto_play:true,
 pulse_go:false,
 hov_html:'<div id="mcdivhover"></div>',
 init:function(){
  if(!$('#media-centre').length)
   return;

  if(mc.auto_open && !get_cookie('id_visited')){
   $(window).load(function(){
     setTimeout(function(){mc.toggle(0);},500);
   });
  }
  set_cookie('id_visited','true',365,'/');
  if(!get_cookie('id_pclicked')){
   mc.pulse_go=true;
   mc.pulse(1);
  }
  $('#media-centre').css({top:-419});
  $('#media-centre-holder').css({height:0}).show();
  $('#media-centre-tabs a:first').addClass('on');
  $('#'+$('#media-centre-tabs a:first').attr('rel')).show();

  $('#media-centre-tabs a').click(function(){
   $('#media-centre-tabs a').removeClass('on');
   $(this).addClass('on');

   $('div#media-centre-videos div').hide();
   $('#'+$(this).attr('rel')).show();
  });

  $('div#media-centre-videos div p.video').hover(function(){
   $(this).append(mc.hov_html);
   var o=$(this).find('img').offset();
   $('#mcdivhover').show();
  },function(){
   $('#mcdivhover').remove();
  }).click(function(){
   $('div#media-centre-videos div p.video').removeClass('playing');
   $(this).addClass('playing');
   mc.play($(this).find('span.file').html());
   if($(this).is('.ontwerp'))
    $('#ontwerp-tag').fadeIn();
   else
    $('#ontwerp-tag').fadeOut();
  });

  $('div#media-centre-videos div p.news').hover(function(){
   $(this).addClass('hover');
  },function(){
   $(this).removeClass('hover');
  }).click(function(){
   location.href=$(this).find('span.url').html();
  });
 },
 toggle:function(pulse_set){
  if(mc.flag) mc.pause();
  if(pulse_set && !get_cookie('id_pclicked')){
   mc.pulse_go=false;
   set_cookie('id_pclicked','true',365,'/');
  }
  $('.mca').toggleClass('t');

  $('#media-centre-holder').stop().animate({height:mc.flag?0:419},1000,'swing');
  $('#media-centre').stop().animate({top:mc.flag?-419:0},1000,'swing',function(){try{
   if(mc.flag && mc.auto_play){
    var f=$('div#media-centre-videos div p.video:first');
    $('div#media-centre-videos div p.video').removeClass('playing');
    f.addClass('playing');
    mc.play($(this).find('span.file').html());
    if(f.is('.ontwerp')) $('#ontwerp-tag').fadeIn();
    else $('#ontwerp-tag').fadeOut();
    mc.auto_play=false;
   }
  }catch(e){}});
  if($('#pusher').length){
   $('.tml_open').hide();
   $('#pusher div').stop().animate({height:mc.flag?0:419},1000,'swing',function(){
    $('.tml_open').each(function(){
     $(this).show().css({top:$(this).offset().top+((mc.flag?1:-1)*120)});
    });
   });
  }
  set_cookie('id_mc',mc.flag?'closed':'open',30,'/');
  mc.flag=!mc.flag;
 },
 play:function(src){
  if(!document.getElementById || !document.getElementById('objectmc'))
   return false;
  document.getElementById('objectmc').playVideo(_siteRoot+src);
 },
 pause:function(){
  if(!document.getElementById || !document.getElementById('objectmc'))
   return false;
  document.getElementById('objectmc').pauseVideo();
 },
 pulse:function(s){
  if(!mc.pulse_go)
   $('#mc-pulse').fadeOut(750);
  else if(s)
   $('#mc-pulse').fadeIn(750,function(){mc.pulse(0);});
  else
   $('#mc-pulse').fadeOut(750,function(){mc.pulse(1);});
 },
 checkHash:function(){
  if(!document.getElementById || !document.getElementById('objectvp'))
   return false;
  var id=location.hash.replace(/[^0-9]/,'');
  if(id!=''){
   setTimeout(function(){
    document.getElementById('objectvp').moveId(id);
    load_comments(id);
   },750);
  }
 },
 live:function(){
  mc.toggle(0);
  if(mc.flag){
   window.setTimeout(function(){mc.play($('p.video:first').attr('rel'));},1100);
   window.setTimeout('mc.live();',42*1000);
  }else
   window.setTimeout('mc.live();',2.5*60*1000);
 }
};


// STYLING FILE INPUTS 1.0 | Shaun Inman <http://www.shauninman.com/> | 2007-09-07
if(!window.SI){var SI={};};
SI.Files={
 htmlClass:'SI-FILES-STYLIZED',
 fileClass:'file',
 wrapClass:'cabinet',
 
 fini:false,
 able:false,
 init:function(){
  this.fini=true;
  
  var ie=0; //@cc_on+@_jscript_version
  if(window.opera || (ie && ie<5.5) || !document.getElementsByTagName){return;}
  this.able=true;
  
  var html=document.getElementsByTagName('html')[0];
  html.className+=(html.className!=''?' ':'')+this.htmlClass;
 },
 stylize:function(elem){
  if(!this.fini){this.init();};
  if(!this.able){return;};
  
  elem.parentNode.file=elem;
  elem.parentNode.onmousemove=function(e){
   if(typeof e=='undefined') e=window.event;
   if(typeof e.pageY=='undefined' &&  typeof e.clientX=='number' && document.documentElement){
    e.pageX=e.clientX+document.documentElement.scrollLeft;
    e.pageY=e.clientY+document.documentElement.scrollTop;
   };
   var ox=oy=0;
   var elem=this;
   if(elem.offsetParent){
    ox=elem.offsetLeft;
    oy=elem.offsetTop;
    while(elem=elem.offsetParent){
     ox+=elem.offsetLeft;
     oy+=elem.offsetTop;
    };
   };
   var x=e.pageX-ox;
   var y=e.pageY-oy;
   var w=this.file.offsetWidth;
   var h=this.file.offsetHeight;
   this.file.style.top=y-(h/2) +'px';
   this.file.style.left=x-(w-30)+'px';
  };
 },
 stylizeById:function(id){
  this.stylize(document.getElementById(id));
 },
 stylizeAll:function(){
  if(!this.fini){this.init();};
  if(!this.able){return;};
  
  var inputs=document.getElementsByTagName('input');
  for(var i=0;i<inputs.length;i++){
   var input=inputs[i];
   if(input.type=='file' && input.className.indexOf(this.fileClass)!=-1 && input.parentNode.className.indexOf(this.wrapClass)!=-1)
    this.stylize(input);
  };
 }
};

function set_cookie(name,value,expires,path,domain,secure){
 var today=new Date();
 today.setTime(today.getTime());
 if(expires) expires*=(1000*60*60*24);
 var expires_date=new Date(today.getTime()+expires);

 document.cookie=name+'='+escape(value)+
  ((expires)?';expires='+expires_date.toGMTString():'')+
  ((path)?';path='+path:'')+
  ((domain)?';domain='+domain:'')+
  ((secure)?';secure':'');
}

function get_cookie(check_name){
 var a_all_cookies=document.cookie.split(';');
 var a_temp_cookie='';
 var cookie_name='';
 var cookie_value='';
 var b_cookie_found=false;

 for(i=0;i<a_all_cookies.length;i++){
  a_temp_cookie=a_all_cookies[i].split('=');
  cookie_name=a_temp_cookie[0].replace(/^\s+|\s+$/g,'');

  if(cookie_name==check_name){
   b_cookie_found=true;
   if(a_temp_cookie.length>1)
    cookie_value=unescape(a_temp_cookie[1].replace(/^\s+|\s+$/g,''));
   return cookie_value;
   break;
  }
  a_temp_cookie=null;
  cookie_name='';
 }
 if(!b_cookie_found)
  return null;
}

(jQuery);