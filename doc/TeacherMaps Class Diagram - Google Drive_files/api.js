var gapi=window.gapi=window.gapi||{};gapi._bs=new Date().getTime();(function(){var e=null,f=window,g="push",k="replace",m="length";var n=f,s=document,w=n.location,A=function(){},B=/\[native code\]/,C=function(a,b,c){return a[b]=a[b]||c},E=function(a){for(var b=0;b<this[m];b++)if(this[b]===a)return b;return-1},F=function(a){a=a.sort();for(var b=[],c=void 0,d=0;d<a[m];d++){var h=a[d];h!=c&&b[g](h);c=h}return b},G=function(){var a;if((a=Object.create)&&B.test(a))a=a(e);else{a={};for(var b in a)a[b]=void 0}return a},H=C(n,"gapi",{});var I;I=C(n,"___jsl",G());C(I,"I",0);C(I,"hel",10);var J=function(){var a=w.href,b;if(I.dpo)b=I.h;else{b=I.h;var c=RegExp("([#].*&|[#])jsh=([^&#]*)","g"),d=RegExp("([?#].*&|[?#])jsh=([^&#]*)","g");if(a=a&&(c.exec(a)||d.exec(a)))try{b=decodeURIComponent(a[2])}catch(h){}}return b},K=function(a){return C(C(I,"H",G()),a,G())};var M=C(I,"perf",G()),N=C(M,"g",G()),aa=C(M,"i",G());C(M,"r",[]);G();G();var O=function(a,b,c){var d=M.r;"function"===typeof d?d(a,b,c):d[g]([a,b,c])},Q=function(a,b,c){b&&0<b[m]&&(b=P(b),c&&0<c[m]&&(b+="___"+P(c)),28<b[m]&&(b=b.substr(0,28)+(b[m]-28)),c=b,b=C(aa,"_p",G()),C(b,c,G())[a]=(new Date).getTime(),O(a,"_p",c))},P=function(a){return a.join("__")[k](/\./g,"_")[k](/\-/g,"_")[k](/\,/g,"_")};var R=G(),S=[],T;T={a:"callback",e:"sync",c:"config",g:"_c",f:"h",l:"platform",i:"jsl",TIMEOUT:"timeout",d:"ontimeout",k:"mh",j:"u"};S[g]([T.i,function(a){for(var b in a)if(Object.prototype.hasOwnProperty.call(a,b)){var c=a[b];"object"==typeof c?I[b]=C(I,b,[]).concat(c):C(I,b,c)}if(b=a[T.j])a=C(I,"us",[]),a[g](b),(b=/^https:(.*)$/.exec(b))&&a[g]("http:"+b[1])}]);var U=decodeURI("%73cript");R.m=function(a){var b=I.ms||"https://apis.google.com";a=a[0];var c;if(!(c=!a))c=0<=a.indexOf("..");if(c)throw"Bad hint";return b+"/"+a[k](/^\//,"")};
var V=function(a){return a.join(",")[k](/\./g,"_")[k](/-/g,"_")},W=function(a,b){for(var c=[],d=0;d<a[m];++d){var h=a[d];h&&0>E.call(b,h)&&c[g](h)}return c},ba=function(){var a=J();if(!a)throw"Bad hint";return a},ca=function(a){var b=a.split(";"),c=R[b.shift()],b=c&&c(b);if(!b)throw"Bad hint:"+a;return b},da=/^[\/_a-zA-Z0-9,.\-!:=]+$/,ea=/^https?:\/\/[^\/\?#]+\.google\.com(:\d+)?\/[^\?#]+$/,fa=/\/cb=/g,ga=/\/\//g,ha=function(a){var b=a.match(ga),c=a.match(fa);return!!c&&1===c[m]&&ea.test(a)&&da.test(a)&&
!!b&&1===b[m]},ia=function(a){"loading"!=s.readyState?X(a):s.write("<"+U+' src="'+encodeURI(a)+'"></'+U+">")},X=function(a){var b=s.createElement(U);b.setAttribute("src",a);b.async="true";(a=s.getElementsByTagName(U)[0])?a.parentNode.insertBefore(b,a):(s.head||s.body||s.documentElement).appendChild(b)},ja=function(a,b){var c=b&&b[T.g];if(c)for(var d=0;d<S[m];d++){var h=S[d][0],l=S[d][1];l&&Object.prototype.hasOwnProperty.call(c,h)&&l(c[h],a,b)}},ka=function(a,b){Y(function(){var c;c=b===J()?C(H,"_",
G()):G();c=C(K(b),"_",c);a(c)})},$=function(a,b){var c=b||{};"function"==typeof b&&(c={},c[T.a]=b);ja(a,c);var d=a?a.split(":"):[],h=c[T.f]||ba(),l=C(I,"ah",G());if(!l["::"]||!d[m])Z(d||[],c,h);else{for(var p=[],x=e;x=d.shift();){var t=x.split("."),t=l[x]||l[t[1]&&"ns:"+t[0]||""]||h,q=p[m]&&p[p[m]-1]||e,y=q;if(!q||q.hint!=t)y={hint:t,b:[]},p[g](y);y.b[g](x)}var z=p[m];if(1<z){var D=c[T.a];D&&(c[T.a]=function(){0==--z&&D()})}for(;d=p.shift();)Z(d.b,c,d.hint)}},Z=function(a,b,c){a=F(a)||[];var d=b[T.a],
h=b[T.c],l=b[T.TIMEOUT],p=b[T.d],x=e,t=!1;if(l&&!p||!l&&p)throw"Timeout requires both the timeout parameter and ontimeout parameter to be set";var q=C(K(c),"r",[]).sort(),y=C(K(c),"L",[]).sort(),z=[].concat(q),D=function(a,b){if(t)return 0;n.clearTimeout(x);y[g].apply(y,r);var l=((H||{}).config||{}).update;l?l(h):h&&C(I,"cu",[])[g](h);if(b){Q("me0",a,z);try{ka(b,c)}finally{Q("me1",a,z)}}d&&d();return 1};0<l&&(x=n.setTimeout(function(){t=!0;p()},l));var r=W(a,y);if(r[m]){var r=W(a,q),u=C(I,"CP",[]),
v=u[m];u[v]=function(a){if(!a)return 0;Q("ml1",r,z);var b=function(){u[v]=e;return D(r,a)};if(0<v&&u[v-1])u[v]=b;else for(b();(b=u[++v])&&b(););};if(r[m]){var L="loaded_"+I.I++;H[L]=function(a){u[v](a);H[L]=e};a=ca(c);a=a[k]("__features__",V(r))[k](/\/$/,"")+(q[m]?"/ed=1/exm="+V(q):"")+("/cb=gapi."+L);if(!ha(a))throw"Bad URL "+a;q[g].apply(q,r);Q("ml0",r,z);b[T.e]||n.___gapisync?ia(a):X(a)}else u[v](A)}else D(r)};var Y=function(a){if(I.hee&&0<I.hel)try{return a()}catch(b){I.hel--,$("debug_error",function(){f.___jsl.hefn(b)})}else return a()};H.load=function(a,b){return Y(function(){return $(a,b)})};N.bs0=f.gapi._bs||(new Date).getTime();O("bs0");N.bs1=(new Date).getTime();O("bs1");delete f.gapi._bs;})();
gapi.load("",{callback:window["gapi_onload"],_c:{"jsl":{"ci":{"services":{},"deviceType":"desktop","lexps":[102,100,71,96,97,79,104,45,17,86,81,92,94,61,30,90],"inline":{"css":1},"report":{},"oauth-flow":{"authUrl":"https://accounts.google.com/o/oauth2/auth","proxyUrl":"https://accounts.google.com/o/oauth2/postmessageRelay","persist":true},"isPlusUser":true,"iframes":{"additnow":{"methods":["launchurl"],"url":"https://apis.google.com/additnow/additnow.html?bsv"},"plus":{"methods":["onauth"],"url":":socialhost:/u/:session_index:/_/pages/badge?bsv"},":socialhost:":"https://plusone.google.com","recobox":{"params":{"url":""},"url":":socialhost:/:session_prefix:_/widget/render/recobox?bsv"},"plus_followers":{"params":{"url":""},"url":":socialhost:/_/im/_/widget/render/plus/followers?bsv"},"autocomplete":{"params":{"url":""},"url":":socialhost:/:session_prefix:_/widget/render/autocomplete?bsv"},"plus_share":{"params":{"url":""},"url":":socialhost:/:session_prefix:_/+1/sharebutton?plusShare\u003dtrue\u0026bsv"},"savetowallet":{"url":"https://clients5.google.com/s2w/o/savetowallet?bsv"},"signin":{"methods":["onauth"],"params":{"url":""},"url":":socialhost:/:session_prefix:_/widget/render/signin?bsv"},"appcirclepicker":{"url":":socialhost:/:session_prefix:_/widget/render/appcirclepicker?bsv"},"hangout":{"url":"https://talkgadget.google.com/:session_prefix:talkgadget/_/widget?bsv"},"plus_circle":{"params":{"url":""},"url":":socialhost:/:session_prefix:_/widget/plus/circle?bsv"},"savetodrive":{"methods":["save"],"url":"https://drive.google.com/savetodrivebutton?bsv"},"card":{"url":":socialhost:/:session_prefix:_/hovercard/card?bsv"},"evwidget":{"params":{"url":""},"url":":socialhost:/:session_prefix:_/events/widget?bsv"},":signuphost:":"https://plus.google.com","plusone":{"preloadUrl":["https://ssl.gstatic.com/s2/oz/images/stars/po/Publisher/sprite4-a67f741843ffc4220554c34bd01bb0bb.png"],"params":{"count":"","size":"","url":""},"url":":socialhost:/:session_prefix:_/+1/fastbutton?bsv"}},"debug":{"host":"https://plusone.google.com","reportExceptionRate":0.05,"rethrowException":true},"csi":{"rate":0.0},"googleapis.config":{"mobilesignupurl":"https://m.google.com/app/plus/oob?"}},"h":"m;/_/scs/apps-static/_/js/k\u003doz.gapi.en.tdoMa4o8pXE.O/m\u003d__features__/am\u003dqQ/rt\u003dj/d\u003d1/rs\u003dAItRSTMicd-4tNH9te779tO60Mvx4_VhYg","u":"https://apis.google.com/js/api.js","hee":true,"fp":"3dd6392a1befbe31228f39d942c6fd474cf70a11","dpo":false},"fp":"3dd6392a1befbe31228f39d942c6fd474cf70a11","annotation":["autocomplete","profile","interactivepost"],"bimodal":["signin"]}});