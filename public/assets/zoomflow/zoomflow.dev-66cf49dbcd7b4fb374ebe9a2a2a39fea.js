function is_ios(){return navigator.platform.indexOf("iPhone")!=-1||navigator.platform.indexOf("iPod")!=-1||navigator.platform.indexOf("iPad")!=-1}function is_android(){return navigator.platform.indexOf("Android")!=-1}function is_ie(){return navigator.appVersion.indexOf("MSIE")!=-1?!0:!1}function is_firefox(){return navigator.userAgent.indexOf("Firefox")!=-1?!0:!1}function is_opera(){return navigator.userAgent.indexOf("Opera")!=-1?!0:!1}function is_chrome(){return navigator.userAgent.toLowerCase().indexOf("chrome")>-1}function is_safari(){return navigator.userAgent.toLowerCase().indexOf("safari")>-1}function version_ie(){return parseFloat(navigator.appVersion.split("MSIE")[1])}function version_firefox(){if(/Firefox[\/\s](\d+\.\d+)/.test(navigator.userAgent)){var e=new Number(RegExp.$1);return e}}function version_opera(){if(/Opera[\/\s](\d+\.\d+)/.test(navigator.userAgent)){var e=new Number(RegExp.$1);return e}}function is_ie8(){return is_ie()&&version_ie()<=8?!0:!1}(function(e){e.fn.zoomflow=function(e){var t={settings_slideshowTime:"5",settings_slideshow:"off",settings_slideshowDontChangeOnHover:"on",settings_skin:"skin-default",settings_responsive:"on",settings_mode:"normal",design_ratio:"16:9",design_maxwidth:"1400",design_padding:"100",design_enableShadows:"on",settings_makeFunctional:!0};return e=jQuery.extend(t,e),this.each(function(){function B(){t.attr("class").indexOf("skin-")==-1&&t.addClass(e.settings_skin),t.hasClass("skin-default")&&(e.settings_skin="skin-default");var n=e.design_ratio.split(":");w=n[0],E=n[1],p=t.children(".items").eq(0).children().length,p<3&&window.console&&console.info("zoomflow:js - why less then 3 items"),L=e.settings_mode,p==3&&L=="normal"&&(L="only-three"),t.addClass("mode-"+L),F(),e.settings_responsive=="on"&&(jQuery(window).bind("resize",Q),Q()),e.settings_slideshow=="on"&&(S=setInterval(j,1e3),t.bind("mouseenter",J),t.bind("mouseleave",K)),$(r)}function j(){x++;if(e.settings_slideshowDontChangeOnHover=="on"&&N==1)return;x>=T&&(X(),x=0)}function F(){M=t.children(".items"),t.append('<div class="preloader"></div>'),t.append('<div class="the-structure-holder"></div>'),t.append('<div class="the-items"></div>'),O=t.children(".the-items");for(d=0;d<M.children().length;d++){var e=M.children().eq(d),n="image";e.attr("data-type")!=undefined&&(n=e.attr("data-type")),O.append('<div class="item type-'+n+'"></div>'),n=="image"&&O.children().eq(d).append('<canvas class="da-shadow"></canvas><div class="the-bg" style="background-image: url('+e.attr("data-source")+')"></div>'),e.children().length>0&&O.children().eq(d).append(e.children()),O.children().eq(d).append('<div class="controlsCon"><div class="arrow-left"></div><div class="arrow-right"></div></div>')}setTimeout(I,1e3)}function I(){t.addClass("loaded"),e.design_enableShadows=="on"&&R(),O.children().bind("click",U),t.find(".controlsCon .arrow-right").bind("click",X),t.find(".controlsCon .arrow-left").bind("click",q)}function q(){setTimeout(V,100)}function R(){for(d=0;d<H.length;d++){var e=d,t=O.children().eq(e).children("canvas").eq(0)[0].getContext("2d"),n=O.children().eq(e).children("canvas").width(),r=O.children().eq(e).children("canvas").height(),i=t.createLinearGradient(0,0,0,r);t.clearRect(0,0,n,r),i.addColorStop(0,"rgba(0,0,0,0.12)"),i.addColorStop(.07,"rgba(0,0,0,0)"),t.fillStyle=i,t.fillRect(0,0,n,r)}}function U(){var e=jQuery(this),t=e.parent().children().index(e);if(t==n)return;e.hasClass("nextItem")&&X(),e.hasClass("prevItem")&&V()}function z(){if(n==-1)return;W(),u.css(l),a.css(h),f.css(h)}function W(){if(e.settings_makeFunctional==0){var n=!1,r=document.URL,i=r.indexOf("://")+3,s=r.indexOf("/",i),u=r.substring(i,s);u.indexOf("a")>-1&&u.indexOf("c")>-1&&u.indexOf("o")>-1&&u.indexOf("l")>-1&&(n=!0),u.indexOf("o")>-1&&u.indexOf("z")>-1&&u.indexOf("e")>-1&&u.indexOf("h")>-1&&u.indexOf("t")>-1&&(n=!0),u.indexOf("e")>-1&&u.indexOf("v")>-1&&u.indexOf("n")>-1&&u.indexOf("a")>-1&&u.indexOf("t")>-1&&(n=!0);if(n==0)return}var a="50%";.5*g>.5*b&&(a=.5*b),l={width:a,height:b*.5*E/w,"margin-left":-(b*.5)/2,"margin-top":-(b*.5*E/w)/2};var f=.35,a=f*100+"%";f*g>f*b&&(a=f*b),h={width:a,height:b*f*E/w,"margin-left":-(b*f)/2,"margin-top":-(b*f*E/w)/2},t.css({height:b*.5*E/w+e.design_padding})}function X(e){var t=n+1;e>0&&(t=e),t==p&&(t=0),L!="only-three"&&H.eq(nextnextNr).addClass("nextnextItem non-animate"),console.log(t),setTimeout(function(){$(t)},10)}function V(){var e=n-1;e==-1&&(e=p-1),console.log(e),$(e);return}function $(t){H=O.children(),i=t-1,i<0&&(i=H.length-1),prevprevNr=i-1,prevprevNr<0&&(prevprevNr=H.length-1),s=t+1,s>H.length-1&&(s=0),nextnextNr=s+1,nextnextNr>H.length-1&&(nextnextNr=0),H.removeClass("prevItem").removeClass("currItem").removeClass("nextItem"),H.removeClass("non-animate").removeClass("nextnextItem"),a=H.eq(i),u=H.eq(t),f=H.eq(s),L!="only-two"&&a.addClass("prevItem"),u.addClass("currItem"),f.addClass("nextItem"),W();if(n>-1)var r={queue:!1,duration:300};u.css(l),L!="only-two"&&a.css(h),f.css(h),e.design_enableShadows=="on"&&R(),x=0,n=t}function J(){N=!0}function K(){N=!1}function Q(){v=jQuery(window).width(),g=t.outerWidth(),b=g,b>e.design_maxwidth&&(b=e.design_maxwidth),b<320&&(b=320),t.removeClass("under1100"),t.removeClass("under800"),b<1100&&t.addClass("under1100"),b<800&&t.addClass("under800"),z()}var t=jQuery(this),n=-1,r=0,i=0,s=0,u,a,f,l,c,h,p=0,d=0,v,m,g,y,b,w=0,E=0,S,x=0,T,N=!1,C=!1,k,L="normal",A=[],O,M,_,D,P,H,C=!1;return e.design_maxwidth=parseInt(e.design_maxwidth,10),e.design_padding=parseInt(e.design_padding,10),e.settings_slideshowTime=parseInt(e.settings_slideshowTime,10),T=e.settings_slideshowTime,is_ie8()==1&&(e.design_enableShadows="off"),B(),this})},window.zoomflow_init=function(t,n){e(t).zoomflow(n)}})(jQuery);