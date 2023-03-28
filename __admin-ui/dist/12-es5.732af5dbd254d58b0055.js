!function(){"use strict";function t(t,e){return function(t){if(Array.isArray(t))return t}(t)||function(t,e){var r=null==t?null:"undefined"!=typeof Symbol&&t[Symbol.iterator]||t["@@iterator"];if(null!=r){var n,o,i,a,c=[],d=!0,s=!1;try{if(i=(r=r.call(t)).next,0===e){if(Object(r)!==r)return;d=!1}else for(;!(d=(n=i.call(r)).done)&&(c.push(n.value),c.length!==e);d=!0);}catch(u){s=!0,o=u}finally{try{if(!d&&null!=r.return&&(a=r.return(),Object(a)!==a))return}finally{if(s)throw o}}return c}}(t,e)||n(t,e)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function e(){/*! regenerator-runtime -- Copyright (c) 2014-present, Facebook, Inc. -- license (MIT): https://github.com/facebook/regenerator/blob/main/LICENSE */e=function(){return t};var t={},r=Object.prototype,n=r.hasOwnProperty,o=Object.defineProperty||function(t,e,r){t[e]=r.value},i="function"==typeof Symbol?Symbol:{},a=i.iterator||"@@iterator",c=i.asyncIterator||"@@asyncIterator",d=i.toStringTag||"@@toStringTag";function s(t,e,r){return Object.defineProperty(t,e,{value:r,enumerable:!0,configurable:!0,writable:!0}),t[e]}try{s({},"")}catch(T){s=function(t,e,r){return t[e]=r}}function u(t,e,r,n){var i=e&&e.prototype instanceof p?e:p,a=Object.create(i.prototype),c=new k(n||[]);return o(a,"_invoke",{value:x(t,r,c)}),a}function l(t,e,r){try{return{type:"normal",arg:t.call(e,r)}}catch(T){return{type:"throw",arg:T}}}t.wrap=u;var f={};function p(){}function h(){}function g(){}var v={};s(v,a,function(){return this});var m=Object.getPrototypeOf,y=m&&m(m(_([])));y&&y!==r&&n.call(y,a)&&(v=y);var w=g.prototype=p.prototype=Object.create(v);function b(t){["next","throw","return"].forEach(function(e){s(t,e,function(t){return this._invoke(e,t)})})}function Z(t,e){function r(o,i,a,c){var d=l(t[o],t,i);if("throw"!==d.type){var s=d.arg,u=s.value;return u&&"object"==typeof u&&n.call(u,"__await")?e.resolve(u.__await).then(function(t){r("next",t,a,c)},function(t){r("throw",t,a,c)}):e.resolve(u).then(function(t){s.value=t,a(s)},function(t){return r("throw",t,a,c)})}c(d.arg)}var i;o(this,"_invoke",{value:function(t,n){function o(){return new e(function(e,o){r(t,n,e,o)})}return i=i?i.then(o,o):o()}})}function x(t,e,r){var n="suspendedStart";return function(o,i){if("executing"===n)throw new Error("Generator is already running");if("completed"===n){if("throw"===o)throw i;return C()}for(r.method=o,r.arg=i;;){var a=r.delegate;if(a){var c=A(a,r);if(c){if(c===f)continue;return c}}if("next"===r.method)r.sent=r._sent=r.arg;else if("throw"===r.method){if("suspendedStart"===n)throw n="completed",r.arg;r.dispatchException(r.arg)}else"return"===r.method&&r.abrupt("return",r.arg);n="executing";var d=l(t,e,r);if("normal"===d.type){if(n=r.done?"completed":"suspendedYield",d.arg===f)continue;return{value:d.arg,done:r.done}}"throw"===d.type&&(n="completed",r.method="throw",r.arg=d.arg)}}}function A(t,e){var r=e.method,n=t.iterator[r];if(void 0===n)return e.delegate=null,"throw"===r&&t.iterator.return&&(e.method="return",e.arg=void 0,A(t,e),"throw"===e.method)||"return"!==r&&(e.method="throw",e.arg=new TypeError("The iterator does not provide a '"+r+"' method")),f;var o=l(n,t.iterator,e.arg);if("throw"===o.type)return e.method="throw",e.arg=o.arg,e.delegate=null,f;var i=o.arg;return i?i.done?(e[t.resultName]=i.value,e.next=t.nextLoc,"return"!==e.method&&(e.method="next",e.arg=void 0),e.delegate=null,f):i:(e.method="throw",e.arg=new TypeError("iterator result is not an object"),e.delegate=null,f)}function O(t){var e={tryLoc:t[0]};1 in t&&(e.catchLoc=t[1]),2 in t&&(e.finallyLoc=t[2],e.afterLoc=t[3]),this.tryEntries.push(e)}function L(t){var e=t.completion||{};e.type="normal",delete e.arg,t.completion=e}function k(t){this.tryEntries=[{tryLoc:"root"}],t.forEach(O,this),this.reset(!0)}function _(t){if(t){var e=t[a];if(e)return e.call(t);if("function"==typeof t.next)return t;if(!isNaN(t.length)){var r=-1,o=function e(){for(;++r<t.length;)if(n.call(t,r))return e.value=t[r],e.done=!1,e;return e.value=void 0,e.done=!0,e};return o.next=o}}return{next:C}}function C(){return{value:void 0,done:!0}}return h.prototype=g,o(w,"constructor",{value:g,configurable:!0}),o(g,"constructor",{value:h,configurable:!0}),h.displayName=s(g,d,"GeneratorFunction"),t.isGeneratorFunction=function(t){var e="function"==typeof t&&t.constructor;return!!e&&(e===h||"GeneratorFunction"===(e.displayName||e.name))},t.mark=function(t){return Object.setPrototypeOf?Object.setPrototypeOf(t,g):(t.__proto__=g,s(t,d,"GeneratorFunction")),t.prototype=Object.create(w),t},t.awrap=function(t){return{__await:t}},b(Z.prototype),s(Z.prototype,c,function(){return this}),t.AsyncIterator=Z,t.async=function(e,r,n,o,i){void 0===i&&(i=Promise);var a=new Z(u(e,r,n,o),i);return t.isGeneratorFunction(r)?a:a.next().then(function(t){return t.done?t.value:a.next()})},b(w),s(w,d,"Generator"),s(w,a,function(){return this}),s(w,"toString",function(){return"[object Generator]"}),t.keys=function(t){var e=Object(t),r=[];for(var n in e)r.push(n);return r.reverse(),function t(){for(;r.length;){var n=r.pop();if(n in e)return t.value=n,t.done=!1,t}return t.done=!0,t}},t.values=_,k.prototype={constructor:k,reset:function(t){if(this.prev=0,this.next=0,this.sent=this._sent=void 0,this.done=!1,this.delegate=null,this.method="next",this.arg=void 0,this.tryEntries.forEach(L),!t)for(var e in this)"t"===e.charAt(0)&&n.call(this,e)&&!isNaN(+e.slice(1))&&(this[e]=void 0)},stop:function(){this.done=!0;var t=this.tryEntries[0].completion;if("throw"===t.type)throw t.arg;return this.rval},dispatchException:function(t){if(this.done)throw t;var e=this;function r(r,n){return a.type="throw",a.arg=t,e.next=r,n&&(e.method="next",e.arg=void 0),!!n}for(var o=this.tryEntries.length-1;o>=0;--o){var i=this.tryEntries[o],a=i.completion;if("root"===i.tryLoc)return r("end");if(i.tryLoc<=this.prev){var c=n.call(i,"catchLoc"),d=n.call(i,"finallyLoc");if(c&&d){if(this.prev<i.catchLoc)return r(i.catchLoc,!0);if(this.prev<i.finallyLoc)return r(i.finallyLoc)}else if(c){if(this.prev<i.catchLoc)return r(i.catchLoc,!0)}else{if(!d)throw new Error("try statement without catch or finally");if(this.prev<i.finallyLoc)return r(i.finallyLoc)}}}},abrupt:function(t,e){for(var r=this.tryEntries.length-1;r>=0;--r){var o=this.tryEntries[r];if(o.tryLoc<=this.prev&&n.call(o,"finallyLoc")&&this.prev<o.finallyLoc){var i=o;break}}i&&("break"===t||"continue"===t)&&i.tryLoc<=e&&e<=i.finallyLoc&&(i=null);var a=i?i.completion:{};return a.type=t,a.arg=e,i?(this.method="next",this.next=i.finallyLoc,f):this.complete(a)},complete:function(t,e){if("throw"===t.type)throw t.arg;return"break"===t.type||"continue"===t.type?this.next=t.arg:"return"===t.type?(this.rval=this.arg=t.arg,this.method="return",this.next="end"):"normal"===t.type&&e&&(this.next=e),f},finish:function(t){for(var e=this.tryEntries.length-1;e>=0;--e){var r=this.tryEntries[e];if(r.finallyLoc===t)return this.complete(r.completion,r.afterLoc),L(r),f}},catch:function(t){for(var e=this.tryEntries.length-1;e>=0;--e){var r=this.tryEntries[e];if(r.tryLoc===t){var n=r.completion;if("throw"===n.type){var o=n.arg;L(r)}return o}}throw new Error("illegal catch attempt")},delegateYield:function(t,e,r){return this.delegate={iterator:_(t),resultName:e,nextLoc:r},"next"===this.method&&(this.arg=void 0),f}},t}function r(t){return function(t){if(Array.isArray(t))return o(t)}(t)||function(t){if("undefined"!=typeof Symbol&&null!=t[Symbol.iterator]||null!=t["@@iterator"])return Array.from(t)}(t)||n(t)||function(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function n(t,e){if(t){if("string"==typeof t)return o(t,e);var r=Object.prototype.toString.call(t).slice(8,-1);return"Object"===r&&t.constructor&&(r=t.constructor.name),"Map"===r||"Set"===r?Array.from(t):"Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)?o(t,e):void 0}}function o(t,e){(null==e||e>t.length)&&(e=t.length);for(var r=0,n=new Array(e);r<e;r++)n[r]=t[r];return n}function i(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}function a(t,e){for(var r=0;r<e.length;r++){var n=e[r];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(t,(o=n.key,i=void 0,"symbol"==typeof(i=function(t,e){if("object"!=typeof t||null===t)return t;var r=t[Symbol.toPrimitive];if(void 0!==r){var n=r.call(t,e||"default");if("object"!=typeof n)return n;throw new TypeError("@@toPrimitive must return a primitive value.")}return("string"===e?String:Number)(t)}(o,"string"))?i:String(i)),n)}var o,i}function c(t,e,r){return e&&a(t.prototype,e),r&&a(t,r),Object.defineProperty(t,"prototype",{writable:!1}),t}(self.webpackChunkvendure_admin_ui=self.webpackChunkvendure_admin_ui||[]).push([[12],{49012:function(n,o,a){a.r(o),a.d(o,{DEFAULT_DASHBOARD_WIDGET_LAYOUT:function(){return K},DEFAULT_WIDGETS:function(){return ot},DashboardComponent:function(){return J},DashboardModule:function(){return it},DashboardWidgetComponent:function(){return N},LatestOrdersWidgetComponent:function(){return Y},LatestOrdersWidgetModule:function(){return B},OrderSummaryWidgetComponent:function(){return Q},OrderSummaryWidgetModule:function(){return G},TestWidgetComponent:function(){return H},TestWidgetModule:function(){return V},WelcomeWidgetComponent:function(){return X},WelcomeWidgetModule:function(){return z},dashboardRoutes:function(){return R},"\u02750":function(){return tt},"\u02751":function(){return et},"\u02752":function(){return rt},"\u02753":function(){return nt}});var d=a(71029),s=a(20576),u=a(10576),l=a(98370),f=a(21385),p=a(19614),h=a(7169),g=a(21544),v=a(78001),m=a(20233),y=a(857),w=a(37685),b=a.n(w),Z=a(45327),x=a(36508),A=a(79183),O=a(20448),L=a(70060);function k(t,e){if(1&t){var r=d.EpF();d.TgZ(0,"button",7),d.NdJ("click",function(){var t=d.CHM(r).$implicit;return d.oxw().addWidget(t)}),d._uU(1),d.qZA()}if(2&t){var n=e.$implicit;d.xp6(1),d.hij(" ",n," ")}}var _=function(t){return{width:t}};function C(t,e){if(1&t){var r=d.EpF();d.TgZ(0,"button",22),d.NdJ("click",function(){var t=d.CHM(r).$implicit,e=d.oxw(2).$implicit;return d.oxw(2).setWidgetWidth(e,t)}),d._uU(1),d.ALo(2,"translate"),d.qZA()}if(2&t){var n=e.$implicit,o=d.oxw(2).$implicit;d.Q6J("disabled",n===o.width),d.xp6(1),d.hij(" ",d.xi3(2,2,"dashboard.widget-width",d.VKq(5,_,n))," ")}}function T(t,e){if(1&t){var r=d.EpF();d.TgZ(0,"vdr-dashboard-widget",12),d.TgZ(1,"div",13),d.TgZ(2,"div",14),d._UZ(3,"clr-icon",15),d.qZA(),d.TgZ(4,"vdr-dropdown"),d.TgZ(5,"button",16),d._UZ(6,"clr-icon",17),d.qZA(),d.TgZ(7,"vdr-dropdown-menu",3),d.TgZ(8,"h4",18),d._uU(9),d.ALo(10,"translate"),d.qZA(),d.YNc(11,C,3,7,"button",19),d._UZ(12,"div",20),d.TgZ(13,"button",7),d.NdJ("click",function(){d.CHM(r);var t=d.oxw().$implicit;return d.oxw(2).removeWidget(t)}),d._UZ(14,"clr-icon",21),d._uU(15),d.ALo(16,"translate"),d.qZA(),d.qZA(),d.qZA(),d.qZA(),d.qZA()}if(2&t){var n=d.oxw().$implicit,o=d.oxw(2);d.Q6J("widgetConfig",n.config),d.xp6(9),d.Oqu(d.lcZ(10,4,"dashboard.widget-resize")),d.xp6(2),d.Q6J("ngForOf",o.getSupportedWidths(n.config)),d.xp6(4),d.hij(" ",d.lcZ(16,6,"dashboard.remove-widget")," ")}}function D(t,e){if(1&t&&(d.TgZ(0,"div",10),d.YNc(1,T,17,8,"vdr-dashboard-widget",11),d.qZA()),2&t){var r=e.$implicit,n=d.oxw(2);d.Q6J("ngClass",n.getClassForWidth(r.width))("cdkDragData",r),d.xp6(1),d.Q6J("vdrIfPermissions",r.config.requiresPermissions||null)}}var q=function(t){return{index:t}};function S(t,e){if(1&t){var r=d.EpF();d.TgZ(0,"div",8),d.NdJ("cdkDropListDropped",function(t){return d.CHM(r),d.oxw().drop(t)}),d.YNc(1,D,2,3,"div",9),d.qZA()}if(2&t){var n=e.$implicit,o=e.index,i=d.oxw();d.Q6J("cdkDropListData",d.VKq(3,q,o)),d.xp6(1),d.Q6J("ngForOf",n)("ngForTrackBy",i.trackRowItem)}}var j=["portal"];function P(t,e){if(1&t&&(d.ynx(0),d._uU(1),d.ALo(2,"translate"),d.BQk()),2&t){var r=e.ngIf;d.xp6(1),d.Oqu(d.lcZ(2,1,r))}}function I(t,e){}var W=function(t){return["/orders/",t]};function M(t,e){if(1&t&&(d.TgZ(0,"td",1),d._uU(1),d._UZ(2,"vdr-order-state-label",2),d.qZA(),d.TgZ(3,"td",1),d._UZ(4,"vdr-customer-label",3),d.qZA(),d.TgZ(5,"td",1),d._uU(6),d.ALo(7,"localeCurrency"),d.qZA(),d.TgZ(8,"td",1),d._uU(9),d.ALo(10,"timeAgo"),d.qZA(),d.TgZ(11,"td",4),d._UZ(12,"vdr-table-row-action",5),d.ALo(13,"translate"),d.qZA()),2&t){var r=e.item;d.xp6(1),d.hij(" ",r.code," "),d.xp6(1),d.Q6J("state",r.state),d.xp6(2),d.Q6J("customer",r.customer),d.xp6(2),d.Oqu(d.xi3(7,7,r.total,r.currencyCode)),d.xp6(3),d.Oqu(d.lcZ(10,10,r.orderPlacedAt)),d.xp6(3),d.Q6J("label",d.lcZ(13,12,"common.open"))("linkTo",d.VKq(14,W,r.id))}}function U(t,e){if(1&t){var r=d.EpF();d.TgZ(0,"div",7),d.TgZ(1,"button",8),d.NdJ("click",function(){d.CHM(r);var t=d.oxw();return t.selection$.next({timeframe:"day",date:t.today})}),d._uU(2),d.ALo(3,"translate"),d.qZA(),d.TgZ(4,"button",8),d.NdJ("click",function(){d.CHM(r);var t=d.oxw();return t.selection$.next({timeframe:"day",date:t.yesterday})}),d._uU(5),d.ALo(6,"translate"),d.qZA(),d.TgZ(7,"button",8),d.NdJ("click",function(){return d.CHM(r),d.oxw().selection$.next({timeframe:"week"})}),d._uU(8),d.ALo(9,"translate"),d.qZA(),d.TgZ(10,"button",8),d.NdJ("click",function(){return d.CHM(r),d.oxw().selection$.next({timeframe:"month"})}),d._uU(11),d.ALo(12,"translate"),d.qZA(),d.qZA()}if(2&t){var n=e.ngIf,o=d.oxw();d.xp6(1),d.ekj("btn-primary",n.date===o.today),d.xp6(1),d.hij(" ",d.lcZ(3,12,"dashboard.today")," "),d.xp6(2),d.ekj("btn-primary",n.date===o.yesterday),d.xp6(1),d.hij(" ",d.lcZ(6,14,"dashboard.yesterday")," "),d.xp6(2),d.ekj("btn-primary","week"===n.timeframe),d.xp6(1),d.hij(" ",d.lcZ(9,16,"dashboard.thisWeek")," "),d.xp6(2),d.ekj("btn-primary","month"===n.timeframe),d.xp6(1),d.hij(" ",d.lcZ(12,18,"dashboard.thisMonth")," ")}}function $(t,e){if(1&t&&(d.TgZ(0,"div",9),d._uU(1),d.ALo(2,"localeDate"),d.ALo(3,"localeDate"),d.qZA()),2&t){var r=e.ngIf;d.xp6(1),d.AsE(" ",d.lcZ(2,2,r.start)," - ",d.lcZ(3,4,r.end)," ")}}function E(t,e){if(1&t&&(d.TgZ(0,"p",4),d._uU(1),d.qZA()),2&t){var r=d.oxw(2);d.xp6(1),d.AsE(" ",r.hideVendureBranding?"":"Vendure"," ",r.hideVersion?"":"Admin UI v"+r.version," ")}}function F(t,e){if(1&t&&(d.TgZ(0,"div"),d.TgZ(1,"h4",3),d._uU(2),d._UZ(3,"br"),d.TgZ(4,"small",4),d._uU(5),d.ALo(6,"timeAgo"),d.qZA(),d.qZA(),d.YNc(7,E,2,2,"p",5),d.qZA()),2&t){var r=e.ngIf,n=d.oxw();d.xp6(2),d.AsE(" Welcome, ",r.firstName," ",r.lastName,""),d.xp6(3),d.hij("Last login: ",d.lcZ(6,4,r.user.lastLogin),""),d.xp6(2),d.Q6J("ngIf",!n.hideVendureBranding||!n.hideVersion)}}var J=function(){function t(e,r,n,o){i(this,t),this.dashboardWidgetService=e,this.localStorageService=r,this.changedDetectorRef=n,this.dataService=o,this.deletionMarker="__delete__"}return c(t,[{key:"ngOnInit",value:function(){var t=this;this.availableWidgetIds$=this.dataService.client.userStatus().stream$.pipe((0,l.U)(function(t){return t.userStatus.permissions}),(0,l.U)(function(e){return t.dashboardWidgetService.getAvailableIds(e)}),(0,f.b)(function(e){return t.widgetLayout=t.initLayout(e)}))}},{key:"getClassForWidth",value:function(t){switch(t){case 3:return"clr-col-12 clr-col-sm-6 clr-col-lg-3";case 4:return"clr-col-12 clr-col-sm-6 clr-col-lg-4";case 6:return"clr-col-12 clr-col-lg-6";case 8:return"clr-col-12 clr-col-lg-8";case 12:return"clr-col-12";default:(0,u.assertNever)(t)}}},{key:"getSupportedWidths",value:function(t){return t.supportedWidths||[3,4,6,8,12]}},{key:"setWidgetWidth",value:function(t,e){t.width=e,this.recalculateLayout()}},{key:"trackRow",value:function(t,e){return e.map(function(t){return"".concat(t.id,":").concat(t.width)}).join("|")}},{key:"trackRowItem",value:function(t,e){return e.config}},{key:"addWidget",value:function(t){var e,r=this.dashboardWidgetService.getWidgetById(t);if(r){var n,o={id:t,config:r,width:this.getSupportedWidths(r)[0]};this.widgetLayout&&this.widgetLayout.length?n=this.widgetLayout[this.widgetLayout.length-1]:(n=[],null===(e=this.widgetLayout)||void 0===e||e.push(n)),n.push(o),this.recalculateLayout()}}},{key:"removeWidget",value:function(t){t.id=this.deletionMarker,this.recalculateLayout()}},{key:"drop",value:function(t){var e=t.currentIndex,r=t.previousIndex,n=t.previousContainer,o=t.container;if((r!==e||n.data.index!==o.data.index)&&this.widgetLayout){var i=this.widgetLayout[n.data.index],a=this.widgetLayout[o.data.index];i.splice(r,1),a.splice(e,0,t.item.data),this.recalculateLayout()}}},{key:"initLayout",value:function(t){var e,r=this.localStorageService.get("dashboardWidgetLayout");return r&&(e=r.filter(function(e){return t.includes(e.id)})),this.dashboardWidgetService.getWidgetLayout(e)}},{key:"recalculateLayout",value:function(){var t=this;if(this.widgetLayout){var e=this.widgetLayout.reduce(function(t,e){return[].concat(r(t),r(e))},[]).filter(function(e){return e.id!==t.deletionMarker}).map(function(t){return{id:t.id,width:t.width}});this.widgetLayout=this.dashboardWidgetService.getWidgetLayout(e),this.localStorageService.set("dashboardWidgetLayout",e),setTimeout(function(){return t.changedDetectorRef.markForCheck()})}}}]),t}();J.\u0275fac=function(t){return new(t||J)(d.Y36(s.ayj),d.Y36(s.n2A),d.Y36(d.sBO),d.Y36(s.DoR))},J.\u0275cmp=d.Xpm({type:J,selectors:[["vdr-dashboard"]],decls:11,vars:8,consts:[[1,"widget-header"],["vdrDropdownTrigger","",1,"btn","btn-secondary","btn-sm"],["shape","plus"],["vdrPosition","bottom-right"],["class","button","vdrDropdownItem","",3,"click",4,"ngFor","ngForOf"],["cdkDropListGroup",""],["class","clr-row dashboard-row","cdkDropList","","cdkDropListOrientation","horizontal",3,"cdkDropListData","cdkDropListDropped",4,"ngFor","ngForOf","ngForTrackBy"],["vdrDropdownItem","",1,"button",3,"click"],["cdkDropList","","cdkDropListOrientation","horizontal",1,"clr-row","dashboard-row",3,"cdkDropListData","cdkDropListDropped"],["class","dashboard-item","cdkDrag","",3,"ngClass","cdkDragData",4,"ngFor","ngForOf","ngForTrackBy"],["cdkDrag","",1,"dashboard-item",3,"ngClass","cdkDragData"],[3,"widgetConfig",4,"vdrIfPermissions"],[3,"widgetConfig"],[1,"flex"],["cdkDragHandle","",1,"drag-handle"],["shape","drag-handle","size","24"],["vdrDropdownTrigger","",1,"icon-button"],["shape","ellipsis-vertical"],[1,"dropdown-header"],["class","button","vdrDropdownItem","",3,"disabled","click",4,"ngFor","ngForOf"],["role","separator",1,"dropdown-divider"],["shape","trash",1,"is-danger"],["vdrDropdownItem","",1,"button",3,"disabled","click"]],template:function(t,e){1&t&&(d.TgZ(0,"div",0),d.TgZ(1,"vdr-dropdown"),d.TgZ(2,"button",1),d._UZ(3,"clr-icon",2),d._uU(4),d.ALo(5,"translate"),d.qZA(),d.TgZ(6,"vdr-dropdown-menu",3),d.YNc(7,k,2,1,"button",4),d.ALo(8,"async"),d.qZA(),d.qZA(),d.qZA(),d.TgZ(9,"div",5),d.YNc(10,S,2,5,"div",6),d.qZA()),2&t&&(d.xp6(4),d.hij(" ",d.lcZ(5,4,"dashboard.add-widget")," "),d.xp6(3),d.Q6J("ngForOf",d.lcZ(8,6,e.availableWidgetIds$)),d.xp6(3),d.Q6J("ngForOf",e.widgetLayout)("ngForTrackBy",e.trackRow))},directives:function(){return[s.JOL,s.UaT,x.qvL,s.N9E,A.sg,O.Fd,x.q0d,s.HH4,O.Wj,O.Zt,A.mk,s.HAh,N,O.Bh]},pipes:function(){return[L.X$,A.Ov]},styles:["[_nghost-%COMP%]{display:block;max-width:1200px;margin:auto}.widget-header[_ngcontent-%COMP%]{display:flex;justify-content:flex-end}.placeholder[_ngcontent-%COMP%]{color:var(--color-grey-300);text-align:center}.placeholder[_ngcontent-%COMP%]   .version[_ngcontent-%COMP%]{font-size:3em;margin:24px;line-height:1em}.placeholder[_ngcontent-%COMP%]     .clr-i-outline{fill:var(--color-grey-200)}vdr-dashboard-widget[_ngcontent-%COMP%]{margin-bottom:24px}.cdk-drag-preview[_ngcontent-%COMP%]{box-sizing:border-box;border-radius:4px}.cdk-drag-placeholder[_ngcontent-%COMP%]{opacity:0}.cdk-drag-animating[_ngcontent-%COMP%]{transition:transform .25s cubic-bezier(0,0,.2,1)}.dashboard-row[_ngcontent-%COMP%]{padding:0;border-width:1;margin-bottom:6px;transition:padding .2s,margin .2s}.dashboard-row.cdk-drop-list-dragging[_ngcontent-%COMP%], .dashboard-row.cdk-drop-list-receiving[_ngcontent-%COMP%]{border:1px dashed var(--color-component-border-200);padding:6px}.dashboard-row.cdk-drop-list-dragging[_ngcontent-%COMP%]   .dashboard-item[_ngcontent-%COMP%]:not(.cdk-drag-placeholder){transition:transform .25s cubic-bezier(0,0,.2,1)}"],changeDetection:0}),J.ctorParameters=function(){return[{type:s.ayj},{type:s.n2A},{type:d.sBO},{type:s.DoR}]};var N=function(){function t(e){i(this,t),this.componentFactoryResolver=e}return c(t,[{key:"ngAfterViewInit",value:function(){this.loadWidget()}},{key:"loadWidget",value:function(){return(0,v.mG)(this,void 0,void 0,e().mark(function t(){var r,n;return e().wrap(function(t){for(;;)switch(t.prev=t.next){case 0:if(!((r=this.widgetConfig.loadComponent())instanceof Promise)){t.next=7;break}return t.next=4,r;case 4:t.t0=t.sent,t.next=8;break;case 7:t.t0=r;case 8:n=t.t0,this.componentRef=this.portal.createComponent(this.componentFactoryResolver.resolveComponentFactory(n)),this.componentRef.changeDetectorRef.detectChanges();case 10:case"end":return t.stop()}},t,this)}))}},{key:"ngOnDestroy",value:function(){this.componentRef&&this.componentRef.destroy()}}]),t}();N.\u0275fac=function(t){return new(t||N)(d.Y36(d._Vd))},N.\u0275cmp=d.Xpm({type:N,selectors:[["vdr-dashboard-widget"]],viewQuery:function(t,e){var r;(1&t&&d.Gf(j,5,d.s_b),2&t)&&(d.iGM(r=d.CRH())&&(e.portal=r.first))},inputs:{widgetConfig:"widgetConfig"},ngContentSelectors:["*"],decls:9,vars:1,consts:[[1,"card"],[1,"card-header"],[1,"title"],[4,"ngIf"],[1,"controls"],[1,"card-block"],["portal",""]],template:function(t,e){1&t&&(d.F$t(),d.TgZ(0,"div",0),d.TgZ(1,"div",1),d.TgZ(2,"div",2),d.YNc(3,P,3,3,"ng-container",3),d.qZA(),d.TgZ(4,"div",4),d.Hsn(5),d.qZA(),d.qZA(),d.TgZ(6,"div",5),d.YNc(7,I,0,0,"ng-template",null,6,d.W1O),d.qZA(),d.qZA()),2&t&&(d.xp6(3),d.Q6J("ngIf",e.widgetConfig.title))},directives:[A.O5],pipes:[L.X$],styles:["[_nghost-%COMP%]{display:block}.card[_ngcontent-%COMP%]{margin-top:0;min-height:200px}.card-header[_ngcontent-%COMP%]{display:flex;justify-content:space-between}"],changeDetection:0}),N.ctorParameters=function(){return[{type:d._Vd}]},N.propDecorators={widgetConfig:[{type:d.IIB}],portal:[{type:d.i9L,args:["portal",{read:d.s_b}]}]};var R=[{path:"",component:J,pathMatch:"full"}],Y=function(){function t(e){i(this,t),this.dataService=e}return c(t,[{key:"ngOnInit",value:function(){this.latestOrders$=this.dataService.order.getOrders({take:10,filter:{active:{eq:!1},state:{notEq:"Cancelled"}},sort:{orderPlacedAt:s.Asd.DESC}}).refetchOnChannelChange().mapStream(function(t){return t.orders.items})}}]),t}();Y.\u0275fac=function(t){return new(t||Y)(d.Y36(s.DoR))},Y.\u0275cmp=d.Xpm({type:Y,selectors:[["vdr-latest-orders-widget"]],decls:3,vars:3,consts:[[3,"items"],[1,"left","align-middle"],[3,"state"],[3,"customer"],[1,"right","align-middle"],["iconShape","shopping-cart",3,"label","linkTo"]],template:function(t,e){1&t&&(d.TgZ(0,"vdr-data-table",0),d.ALo(1,"async"),d.YNc(2,M,14,16,"ng-template"),d.qZA()),2&t&&d.Q6J("items",d.lcZ(1,1,e.latestOrders$))},directives:[s.Qj_,s.GXt,s.d$,s.v_8],pipes:[A.Ov,s.kgx,s.eGd,L.X$],styles:["vdr-data-table[_ngcontent-%COMP%]     table{margin-top:0}"],changeDetection:0}),Y.ctorParameters=function(){return[{type:s.DoR}]};var B=c(function t(){i(this,t)});B.\u0275fac=function(t){return new(t||B)},B.\u0275mod=d.oAB({type:B}),B.\u0275inj=d.cJS({imports:[[s.IR2,s.m81]]});var Q=function(){function t(e){i(this,t),this.dataService=e,this.today=new Date,this.yesterday=new Date((new Date).setDate(this.today.getDate()-1)),this.selection$=new Z.X({timeframe:"day",date:this.today})}return c(t,[{key:"ngOnInit",value:function(){var t=this;this.dateRange$=this.selection$.pipe((0,p.x)(),(0,l.U)(function(t){return{start:b()(t.date).startOf(t.timeframe).toDate(),end:b()(t.date).endOf(t.timeframe).toDate()}}),(0,h.d)(1));var e=this.dateRange$.pipe((0,g.w)(function(e){var r=e.start,n=e.end;return t.dataService.order.getOrderSummary(r,n).refetchOnChannelChange().mapStream(function(t){return t.orders})}),(0,h.d)(1));this.totalOrderCount$=e.pipe((0,l.U)(function(t){return t.totalItems})),this.totalOrderValue$=e.pipe((0,l.U)(function(t){return t.items.reduce(function(t,e){return t+e.total},0)/100})),this.currencyCode$=this.dataService.settings.getActiveChannel().refetchOnChannelChange().mapStream(function(t){return t.activeChannel.currencyCode||void 0})}}]),t}();Q.\u0275fac=function(t){return new(t||Q)(d.Y36(s.DoR))},Q.\u0275cmp=d.Xpm({type:Q,selectors:[["vdr-order-summary-widget"]],decls:22,vars:23,consts:[[1,"stats"],[1,"stat"],[1,"stat-figure"],[1,"stat-label"],[1,"footer"],["class","btn-group btn-outline-primary btn-sm",4,"ngIf"],["class","date-range p5",4,"ngIf"],[1,"btn-group","btn-outline-primary","btn-sm"],[1,"btn",3,"click"],[1,"date-range","p5"]],template:function(t,e){1&t&&(d.TgZ(0,"div",0),d.TgZ(1,"div",1),d.TgZ(2,"div",2),d._uU(3),d.ALo(4,"async"),d.qZA(),d.TgZ(5,"div",3),d._uU(6),d.ALo(7,"translate"),d.qZA(),d.qZA(),d.TgZ(8,"div",1),d.TgZ(9,"div",2),d._uU(10),d.ALo(11,"currency"),d.ALo(12,"async"),d.ALo(13,"async"),d.qZA(),d.TgZ(14,"div",3),d._uU(15),d.ALo(16,"translate"),d.qZA(),d.qZA(),d.qZA(),d.TgZ(17,"div",4),d.YNc(18,U,13,20,"div",5),d.ALo(19,"async"),d.YNc(20,$,4,6,"div",6),d.ALo(21,"async"),d.qZA()),2&t&&(d.xp6(3),d.Oqu(d.lcZ(4,6,e.totalOrderCount$)),d.xp6(3),d.Oqu(d.lcZ(7,8,"dashboard.total-orders")),d.xp6(4),d.hij(" ",d.xi3(11,10,d.lcZ(12,13,e.totalOrderValue$),d.lcZ(13,15,e.currencyCode$)||void 0)," "),d.xp6(5),d.Oqu(d.lcZ(16,17,"dashboard.total-order-value")),d.xp6(3),d.Q6J("ngIf",d.lcZ(19,19,e.selection$)),d.xp6(2),d.Q6J("ngIf",d.lcZ(21,21,e.dateRange$)))},directives:[A.O5],pipes:[A.Ov,L.X$,A.H9,s.HbD],styles:[".stats[_ngcontent-%COMP%]{display:flex;justify-content:space-evenly}.stat[_ngcontent-%COMP%]{text-align:center}.stat-figure[_ngcontent-%COMP%]{font-size:2rem;line-height:3rem}.stat-label[_ngcontent-%COMP%]{text-transform:uppercase}.date-range[_ngcontent-%COMP%]{margin-top:0}.footer[_ngcontent-%COMP%]{margin-top:24px;display:flex;flex-direction:column;justify-content:space-between}"],changeDetection:0}),Q.ctorParameters=function(){return[{type:s.DoR}]};var G=c(function t(){i(this,t)});G.\u0275fac=function(t){return new(t||G)},G.\u0275mod=d.oAB({type:G}),G.\u0275inj=d.cJS({imports:[[s.IR2]]});var H=c(function t(){i(this,t)});H.\u0275fac=function(t){return new(t||H)},H.\u0275cmp=d.Xpm({type:H,selectors:[["vdr-test-widget"]],decls:2,vars:0,template:function(t,e){1&t&&(d.TgZ(0,"p"),d._uU(1,"This is a test widget!"),d.qZA())},styles:[""],changeDetection:0});var V=c(function t(){i(this,t)});V.\u0275fac=function(t){return new(t||V)},V.\u0275mod=d.oAB({type:V}),V.\u0275inj=d.cJS({});var X=function(){function t(e){i(this,t),this.dataService=e,this.version=s.s5M,this.brand=(0,s.hq7)().brand,this.hideVendureBranding=(0,s.hq7)().hideVendureBranding,this.hideVersion=(0,s.hq7)().hideVersion}return c(t,[{key:"ngOnInit",value:function(){this.administrator$=this.dataService.administrator.getActiveAdministrator().mapStream(function(t){return t.activeAdministrator||null})}}]),t}();X.\u0275fac=function(t){return new(t||X)(d.Y36(s.DoR))},X.\u0275cmp=d.Xpm({type:X,selectors:[["vdr-welcome-widget"]],decls:4,vars:3,consts:[[4,"ngIf"],[1,"placeholder"],["shape","line-chart","size","128"],[1,"h4"],[1,"p5"],["class","p5",4,"ngIf"]],template:function(t,e){1&t&&(d.YNc(0,F,8,6,"div",0),d.ALo(1,"async"),d.TgZ(2,"div",1),d._UZ(3,"clr-icon",2),d.qZA()),2&t&&d.Q6J("ngIf",d.lcZ(1,1,e.administrator$))},directives:[A.O5,x.qvL],pipes:[A.Ov,s.eGd],styles:["[_nghost-%COMP%]{display:flex;justify-content:space-between}.placeholder[_ngcontent-%COMP%]{color:var(--color-grey-200)}"],changeDetection:0}),X.ctorParameters=function(){return[{type:s.DoR}]};var z=c(function t(){i(this,t)});z.\u0275fac=function(t){return new(t||z)},z.\u0275mod=d.oAB({type:z}),z.\u0275inj=d.cJS({imports:[[s.IR2]]});var K=[{id:"welcome",width:12},{id:"orderSummary",width:6},{id:"latestOrders",width:6}],tt=function(){return X},et=function(){return Q},rt=function(){return Y},nt=function(){return H},ot={welcome:{loadComponent:tt},orderSummary:{title:(0,y.J)("dashboard.orders-summary"),loadComponent:et,requiresPermissions:[s.y3$.ReadOrder]},latestOrders:{title:(0,y.J)("dashboard.latest-orders"),loadComponent:rt,supportedWidths:[6,8,12],requiresPermissions:[s.y3$.ReadOrder]},testWidget:{title:"Test Widget",loadComponent:nt}},it=c(function e(r){i(this,e),Object.entries(ot).map(function(e){var n=t(e,2),o=n[0],i=n[1];r.getWidgetById(o)||r.registerWidget(o,i)}),0===r.getDefaultLayout().length&&r.setDefaultLayout(K)});it.\u0275fac=function(t){return new(t||it)(d.LFG(s.ayj))},it.\u0275mod=d.oAB({type:it}),it.\u0275inj=d.cJS({imports:[[s.m81,m.Bz.forChild(R)]]}),it.ctorParameters=function(){return[{type:s.ayj}]}}}])}();
//# sourceMappingURL=12-es5.732af5dbd254d58b0055.js.map