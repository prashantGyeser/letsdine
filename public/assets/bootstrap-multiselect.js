/**
 * bootstrap-multiselect.js 1.0.0
 * https://github.com/davidstutz/bootstrap-multiselect
 *
 * Copyright 2012 David Stutz
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
!function(t){"use strict";function e(e,i){this.options=this.getOptions(i),this.$select=t(e),this.originalOptions=this.$select.clone()[0].options,this.query="",this.searchTimeout=null,this.options.multiple="multiple"==this.$select.attr("multiple"),this.$container=t(this.options.buttonContainer).append('<ul class="multiselect-container dropdown-menu'+(this.options.dropRight?" pull-right":"")+'" style="position:absolute; list-style-type: none;margin:0;padding:0;"></ul>').append('<button type="button" class="multiselect dropdown-toggle '+this.options.buttonClass+'" data-toggle="dropdown">'+this.options.buttonText(this.getSelected(),this.$select)+"</button>"),this.options.buttonWidth&&t("button",this.$container).css({width:this.options.buttonWidth}),this.options.maxHeight&&(t(".multiselect-container",this.$container).css({"max-height":this.options.maxHeight+"px","overflow-y":"auto","overflow-x":"hidden"}),t('input[type="text"]',this.$container).width("75%")),this.options.enableFiltering&&(t(".multiselect-container",this.$container).prepend('<div class="input-prepend" style="padding:3px;"><span class="add-on"><i class="icon-search"></i></span><input class="multiselect-search" type="text" placeholder="'+this.options.filterPlaceholder+'"></div>'),t(".multiselect-search",this.$container).val(this.query).on("click",function(t){t.stopPropagation()}).on("keydown",t.proxy(function(e){clearTimeout(this.searchTimeout),this.searchTimeout=this.asyncFunction(t.proxy(function(){this.query!=e.target.value&&(this.query=e.target.value,t.each(t(".multiselect-container li",this.$container),t.proxy(function(e,i){var s=t("input",i).val();if(s!=this.options.selectAllValue){var n=t("label",i).text(),s=t("input",i).val();if(s&&n&&s!=this.options.selectAllValue){var o=!1;("text"==this.options.filterBehavior||"both"==this.options.filterBehavior)&&n.indexOf(this.query)>-1&&(o=!0),("value"==this.options.filterBehavior||"both"==this.options.filterBehavior)&&s.indexOf(this.query)>-1&&(o=!0),o?t(i).show():t(i).hide()}}},this)))},this),300,this)},this))),this.buildDropdown(),this.updateButtonText(),this.$select.hide().after(this.$container)}"undefined"!=typeof ko&&ko.bindingHandlers&&!ko.bindingHandlers.multiselect&&(ko.bindingHandlers.multiselect={init:function(){},update:function(e,i,s){var n=t(e).data("multiselect");n?s().options&&s().options().length!==n.originalOptions.length&&(n.updateOriginalOptions(),t(e).multiselect("rebuild")):t(e).multiselect(ko.utils.unwrapObservable(i()))}}),e.prototype={defaults:{buttonText:function(e){if(0==e.length)return'None selected <b class="caret"></b>';if(e.length>3)return e.length+' selected <b class="caret"></b>';var i="";return e.each(function(){var e=void 0!==t(this).attr("label")?t(this).attr("label"):t(this).text();i+=e+", "}),i.substr(0,i.length-2)+' <b class="caret"></b>'},onChange:function(){},buttonClass:"btn",dropRight:!1,selectedClass:"active",buttonWidth:"auto",buttonContainer:'<div class="btn-group" />',maxHeight:!1,includeSelectAllOption:!1,selectAllText:" Select all",selectAllValue:"multiselect-all",enableFiltering:!1,filterPlaceholder:"Search",filterBehavior:"text"},constructor:e,createOptionValue:function(e){t(e).is(":selected")&&t(e).attr("selected","selected").prop("selected",!0);var i=t(e).attr("label")||t(e).text(),s=t(e).val(),n=this.options.multiple?"checkbox":"radio",o=t('<li><a href="javascript:void(0);" style="padding:0;"><label style="margin:0;padding:3px 20px 3px 20px;height:100%;cursor:pointer;"><input style="margin-bottom:5px;" type="'+n+'" /></label></a></li>'),l=t(e).prop("selected")||!1,a=t("input",o);a.val(s),s==this.options.selectAllValue&&a.parent().parent().addClass("multiselect-all"),t("label",o).append(" "+i),t(".multiselect-container",this.$container).append(o),t(e).is(":disabled")&&a.attr("disabled","disabled").prop("disabled",!0).parents("li").addClass("disabled"),a.prop("checked",l),l&&this.options.selectedClass&&a.parents("li").addClass(this.options.selectedClass)},toggleActiveState:function(){void 0==this.$select.attr("disabled")?t("button.multiselect.dropdown-toggle",this.$container).removeClass("disabled"):t("button.multiselect.dropdown-toggle",this.$container).addClass("disabled")},buildDropdown:function(){var e=this.$select[0][0]?this.$select[0][0].value==this.options.selectAllValue:!1;this.options.includeSelectAllOption&&this.options.multiple&&!e&&this.$select.prepend('<option value="'+this.options.selectAllValue+'">'+this.options.selectAllText+"</option>"),this.toggleActiveState(),this.$select.children().each(t.proxy(function(e,i){var s=t(i).prop("tagName").toLowerCase();if("optgroup"==s){var n=i,o=t(n).prop("label"),l=t('<li><label style="margin:0;padding:3px 20px 3px 20px;height:100%;" class="multiselect-group"></label></li>');t("label",l).text(o),t(".multiselect-container",this.$container).append(l),t("option",n).each(t.proxy(function(t,e){this.createOptionValue(e)},this))}else"option"==s&&this.createOptionValue(i)},this)),t(".multiselect-container li input",this.$container).on("change",t.proxy(function(e){var i=t(e.target).prop("checked")||!1,s=t(e.target).val()==this.options.selectAllValue;this.options.selectedClass&&(i?t(e.target).parents("li").addClass(this.options.selectedClass):t(e.target).parents("li").removeClass(this.options.selectedClass));var n=t("option",this.$select).filter(function(){return t(this).val()==t(e.target).val()}),o=t("option",this.$select).not(n),l=t("input",this.$container).not(t(e.target));s&&l.filter(function(){return t(this).is(":checked")!=i}).trigger("click"),i?(n.prop("selected",!0),this.options.multiple?n.attr("selected","selected"):(this.options.selectedClass&&t(l).parents("li").removeClass(this.options.selectedClass),t(l).prop("checked",!1),o.removeAttr("selected").prop("selected",!1),t(this.$container).find(".multiselect.dropdown-toggle").click()),"active"==this.options.selectedClass&&o.parents("a").css("outline","")):n.removeAttr("selected").prop("selected",!1),this.updateButtonText(),this.options.onChange(n,i),this.$select.change()},this)),t(".multiselect-container li a",this.$container).on("touchstart click",function(t){t.stopPropagation()}),this.$container.on("keydown",t.proxy(function(e){if(!t('input[type="text"]',this.$container).is(":focus"))if(9!=e.keyCode&&27!=e.keyCode||!this.$container.hasClass("open")){var i=t(this.$container).find("li:not(.divider):visible a");if(!i.length)return;var s=i.index(i.filter(":focus"));38==e.keyCode&&s>0?s--:40==e.keyCode&&i.length-1>s?s++:~s||(s=0);var n=i.eq(s);if(n.focus(),"active"==this.options.selectedClass&&(n.css("outline","thin dotted #333").css("outline","5px auto -webkit-focus-ring-color"),i.not(n).css("outline","")),32==e.keyCode||13==e.keyCode){var o=n.find("input");o.prop("checked",!o.prop("checked")),o.change()}e.stopPropagation(),e.preventDefault()}else t(this.$container).find(".multiselect.dropdown-toggle").click()},this))},destroy:function(){this.$container.remove(),this.$select.show()},refresh:function(){t("option",this.$select).each(t.proxy(function(e,i){var s=t(".multiselect-container li input",this.$container).filter(function(){return t(this).val()==t(i).val()});t(i).is(":selected")?(s.prop("checked",!0),this.options.selectedClass&&s.parents("li").addClass(this.options.selectedClass)):(s.prop("checked",!1),this.options.selectedClass&&s.parents("li").removeClass(this.options.selectedClass)),t(i).is(":disabled")?s.attr("disabled","disabled").prop("disabled",!0).parents("li").addClass("disabled"):s.removeAttr("disabled").prop("disabled",!1).parents("li").removeClass("disabled")},this)),this.updateButtonText()},select:function(e){var i=t("option",this.$select).filter(function(){return t(this).val()==e}),s=t(".multiselect-container li input",this.$container).filter(function(){return t(this).val()==e});this.options.selectedClass&&s.parents("li").addClass(this.options.selectedClass),s.prop("checked",!0),i.attr("selected","selected").prop("selected",!0),this.updateButtonText()},deselect:function(e){var i=t("option",this.$select).filter(function(){return t(this).val()==e}),s=t(".multiselect-container li input",this.$container).filter(function(){return t(this).val()==e});this.options.selectedClass&&s.parents("li").removeClass(this.options.selectedClass),s.prop("checked",!1),i.removeAttr("selected").prop("selected",!1),this.updateButtonText()},rebuild:function(){t(".multiselect-container",this.$container).html(""),this.buildDropdown(this.$select,this.options),this.updateButtonText()},getOptions:function(e){return t.extend({},this.defaults,e)},updateButtonText:function(){var e=this.getSelected();t("button",this.$container).html(this.options.buttonText(e,this.$select))},getSelected:function(){return t('option:selected[value!="'+this.options.selectAllValue+'"]',this.$select)},updateOriginalOptions:function(){this.originalOptions=this.$select.clone()[0].options},asyncFunction:function(t,e,i){var s=Array.prototype.slice.call(arguments,3);return setTimeout(function(){t.apply(i||window,s)},e)}},t.fn.multiselect=function(i,s){return this.each(function(){var n=t(this).data("multiselect"),o="object"==typeof i&&i;n||t(this).data("multiselect",n=new e(this,o)),"string"==typeof i&&n[i](s)})},t.fn.multiselect.Constructor=e,t(function(){t("select[data-role=multiselect]").multiselect()})}(window.jQuery);