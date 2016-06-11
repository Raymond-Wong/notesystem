$(document).ready(function() {
  var addLinkBtn = $($('.referBtnContainer').find('button[title="add link"]')[0]);
  var addPointBtn = $($('.referBtnContainer').find('button[title="add knowledge point"]')[0]);
  var saveNoteBtn = $($('.referBtnContainer').find('button[title="save to server"]')[0]);
  addLinkAction(addLinkBtn);
  addPointAction(addPointBtn);
  saveNoteAction(saveNoteBtn);
  deleteLinkOrPoint();
  showNote(addLinkBtn, addPointBtn);
  choosePoint();
  insertTab();
  switchModel();
  showNotePoint();
  uploadImage();
});

// 添加一个链接
var addLinkAction = function(addLinkBtn) {
  addLinkBtn.click(function() {
    var container = $('#referLinkBox');
    container.prepend($(linkBlock));
  });
}

// 添加一个知识点
var addPointAction = function(addPointBtn) {
  addPointBtn.click(function() {
    var container = $('#referPointBox');
    var newPoint = $(pointBlock);
    container.prepend(newPoint);
    mdInitOne(newPoint.children('.referContent'));
  });
}

// 删除一个链接或者知识点
var deleteLinkOrPoint = function() {
  $(document).delegate('.deleteBlockBtn', 'click', function() {
    var target = $(this).parent();
    target.remove();
  });
}

// 保存笔记
var saveNoteAction = function(saveNoteBtn) {
  saveNoteBtn.click(function() {
    var params = {'id' : $('.noteInputBox').attr('id'), 'name' : $('.noteTitle').val(), 'content' : $('.noteInputArea').val()};
    if (params['id'] == undefined) {
      alert("note id cannot be null");
      return false;
    }
    params['links'] = [];
    var links = $('.referBlock[type="link"]');
    for (var i = 0; i < links.length; i++) {
      params['links'].push($(links[i]).children('.referContent').val());
    }
    params['links'] = JSON.stringify(params['links']);
    params['points'] = [];
    var points = $('.referBlock[type="point"]');
    for (var i = 0; i < points.length; i++) {
      var point = $(points[i]);
      pointDict = {};
      pointDict['title'] = point.children('.referHead').val();
      pointDict['content'] = $(point.find('.referContent')[0]).val();
      pointDict['id'] = point.attr('id');
      params['points'].push(pointDict);
    }
    params['points'] = JSON.stringify(params['points']);
    params['uid'] = $('body').attr('uid');
    console.log(params);
    $.post('/api/saveNote', params, function(resp) {
      if (resp['code'] != 0) {
        alert('save note failed: ' + resp['msg']);
      } else {
        alert('save successed');
      }
    });
  });
}


var showNote = function(addLinkBtn, addPointBtn) {
  var mainContent = $('#mainContent');
  var loading = $('#mainContentLoading');
  var mindMap = $('#mindMapContainer');
  $(document).delegate('.listItem[type="note"]', 'click', function() {
    mainContent.hide();
    mindMap.hide();
    loading.show();
    var params = {'id' : $(this).attr('itemId')};
    var that = $(this);
    if (params['id'] == $('.noteInputBox').attr('id')) {
      loading.hide();
      mainContent.show();
      return false;
    }
    $.get('/api/getNote', params, function(resp) {
      if (resp['code'] != 0) {
        alert(resp['msg']);
      } else {
        // 把笔记的内容放到显示区域内
        $('.noteInputBox').attr('id', resp['msg']['id']);
        $('.noteInputBox').children('.noteTitle').val(resp['msg']['name']);
        $($('.noteInputBox').find('.noteInputArea')[0]).val(resp['msg']['content']);
        var container = $('#referLinkBox');
        container.html('');
        try {
          var links = $.parseJSON(resp['msg']['links']);
          for (var i = 0; i < links.length; i++) {
            var link = links[i];
            var newLinkBlock = $(linkBlock);
            newLinkBlock.children('.referContent').val(link);
            container.append(newLinkBlock);
          }
        } catch (err) {
          addLinkBtn.trigger('click');
        }
        container = $('#referPointBox');
        container.html('');
        var points = $.parseJSON(resp['msg']['points']);
        if (points.length > 0) {
          for (var i = 0; i < points.length; i++) {
            var pid = points[i]['pk'];
            var point = points[i]['fields'];
            var newPointBlock = $(pointBlock);
            newPointBlock.attr('id', pid);
            newPointBlock.children('.referHead').val(point['title']);
            newPointBlock.children('.referContent').html(point['content']);
            container.append(newPointBlock);
            mdInitOne(newPointBlock.children('.referContent'));
          }
        } else {
          addPointBtn.trigger('click');
        }
        // 将笔记放在打开的文件中
        $($('#openingFileList').find('.listRowText')[0]).text(that.children('.listRowText').text());
        loading.hide();
        mainContent.show();
      }
    });
  })
}

var showNotePoint = function() {
  $(document).delegate('.listItem[type="point"]', 'click', function() {
    var nid = $(this).attr('nid');
    var note = $('.listItem[itemId="' + nid + '"]');
    note.trigger('click');
  });
}

// 选中一个知识点后打开相应的笔记
var choosePoint = function() {
  $(document).delegate('#pointList .listRow', 'click', function() {
    var that = $(this);
    var target = $('#allFileList .listItem[itemId="' + that.attr('nid') + '"]');
    showTreeNode(target);
  });
}

// 在树结构中显示某个节点
var showTreeNode = function(target) {
  $(target.parents('.fileList')).each(function() {
    if ($(this).css('display') == 'none') {
      var item = $(this).parent().children('.listItem');
      item.children('.toggleFolderBtn').trigger('click');
    }
  });
  target.trigger('click');
}

// 在一个textarea中按Tab按钮时候不切换工作区
var insertTab = function() {
  $('textarea').keydown(function(e) {
    if (e.keyCode == 9) {
      insertIntoCaret($(this)[0], '	');
      return false;
    }
  });
}

var insertIntoCaret = function(obj, str) {
  if (document.selection) {
    var sel = document.selection.createRange();
    sel.text = str;
  } else if (typeof obj.selectionStart === 'number' && typeof obj.selectionEnd === 'number') {
    var startPos = obj.selectionStart, endPos = obj.selectionEnd, cursorPos = startPos, tmpStr = obj.value;
    obj.value = tmpStr.substring(0, startPos) + str + tmpStr.substring(endPos, tmpStr.length);
    cursorPos += str.length;
    obj.selectionStart = obj.selectionEnd = cursorPos;
  } else {
    obj.value += str;
  }
}

var MODEL = 'files';

var switchModel = function() {
  $('button[title="switch model"]').click(function() {
    if (MODEL == 'files')
      switch2NotesModel();
    else if (MODEL == 'notes')
      switch2FilesModel();
  });
}

// 将当前模式转换为知识点模式
var switch2NotesModel = function() {
  $('.listItem[type="note"]').each(function() {
    var note = $(this);
    var noteBox = note.parent();
    noteBox.hide();
    $('#pointList').children('.listRow[nid="' + note.attr('itemId') + '"]').each(function() {
      var newPoint = $(filePointRow);
      $(newPoint.find('.listRowText')).text($(this).children('.pointTitle').text());
      newPoint.children('.listItem').attr('nid', note.attr('itemId'));
      noteBox.before(newPoint);
    });
    MODEL = 'notes';
  });
}

// 将当前模式转换为文件夹模式
var switch2FilesModel = function() {
  $('.listItem[type="point"]').each(function() {
    $(this).parent().remove();
  });
  $('.listItem[type="note"').parent().show();
  MODEL = 'files';
}

var uploadImage = function() {
  var inputStr = '<input type="file" name="image" multiple="multiple" accept="image/*" class="hide" />';
  $(document).delegate('.mdImgBtn', 'click', function() {
    var inputDom = $(inputStr);
    $(this).before(inputDom);
    autoUpload(inputDom);
  });
}

var autoUpload = function(dom) {
  dom.trigger('click');
  var url = '/api/upload/image';
  dom.fileupload({
    autoUpload: true,//是否自动上传
    url: url,//上传地址
    sequentialUploads: true,
    done: function (e, resp) {
      resp = resp['result'];
      if (resp['code'] != 0) {
        alert(resp['msg']);
      } else {
        var textarea = $($(this).parents('.mdArea')[0]).find('.mdTextArea')[0];
        insertIntoCaret(textarea, '<img src="' + resp['msg'] + '" />');
      }
      $(this).remove();
    },
  });
}