var MD_AREA = '<div class="mdArea">' +
              '  <div class="mdPreviewArea">view Area</div>' +
              '  <div class="mdBtnBox btn-group-vertical" role="group">' +
              '    <button title="edit" type="button" class="mdEditBtn btn btn-default">' +
              '      <span class="glyphicon glyphicon-pencil"></span>' +
              '    </button>' +
              '    <button title="preview" type="button" class="mdPreviewBtn btn btn-default">' +
              '      <span class="glyphicon glyphicon-eye-open"></span>' +
              '    </button>' +
              '    <button title="insert image" type="button" class="mdImgBtn btn btn-default">' +
              '      <span class="glyphicon glyphicon-picture"></span>' +
              '    </button>' +
              '  </div>' +
              '</div>';

$(document).ready(function() {
  mdInit();
  mdEditAction();
  mdPreviewAction();
  // mdImgAction();
});

// 针对每一个data-role为mdArea的元素初始化
var mdInit = function() {
  $('textarea[data-role="mdArea"]').each(function() {
    mdInitOne($(this));
  });
}

// 针对一个data-role为mdArea的元素进行初始化
var mdInitOne = function(target) {
  var newArea = $(MD_AREA);
  newArea.children('.mdPreviewArea').addClass(target.attr('class'));
  target.addClass('mdTextArea');
  newArea.prepend(target.clone());
  target.before(newArea);
  target.remove();
}

// 进入编辑模式
var mdEditAction = function() {
  $(document).delegate('.mdEditBtn', 'click', function() {
    var mdArea = $($(this).parents('.mdArea')[0]);
    var textArea = mdArea.children('.mdTextArea');
    var viewArea = mdArea.children('.mdPreviewArea');
    viewArea.hide();
    textArea.show();
  });
}

// 进入预览模式
var mdPreviewAction = function() {
  $(document).delegate('.mdPreviewBtn', 'click', function() {
    var mdArea = $($(this).parents('.mdArea')[0]);
    var textArea = mdArea.children('.mdTextArea');
    var viewArea = mdArea.children('.mdPreviewArea');
    if (viewArea.css('display') != 'none') {
      return false;
    }
    var html = text2html(textArea.val());
    viewArea.html(html);
    textArea.hide();
    viewArea.show();
  });
}

// 根据markdown的规则将一段文字(带换行)转换成一段html
var text2html = function(text) {
  var html = '';
  $.ajax({  
    type : "post",  
    url : "/api/markdown",  
    data : {'text' : text},
    async : false,  
    success : function(resp){
      if (resp['code'] != 0) {
        html = 'parse markdown failed: ' + resp['msg'];
      } else {
        html = resp['msg'];
      }
    }  
  });
  return html;
}