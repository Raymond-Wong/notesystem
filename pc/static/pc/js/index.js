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
});

// 添加一个链接
var addLinkAction = function(addLinkBtn) {
  addLinkBtn.click(function() {
    var container = $('.referBlockBox');
    container.append($(linkBlock));
  });
}

// 添加一个知识点
var addPointAction = function(addPointBtn) {
  addPointBtn.click(function() {
    var container = $('.referBlockBox');
    var newPoint = $(pointBlock);
    container.append(newPoint);
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
  $(document).delegate('.listItem[type="note"]', 'click', function() {
    var params = {'id' : $(this).attr('itemId')};
    var that = $(this);
    if (params['id'] == $('.noteInputBox').attr('id')) {
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
        var container = $('.referBlockBox');
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
      }
    });
  })
}

// 选中一个知识点后打开相应的笔记
var choosePoint = function() {
  $(document).delegate('#pointList .listRow', 'click', function() {
    var that = $(this);
    var target = $('#allFileList .listItem[itemId="' + that.attr('nid') + '"]');
    showTreeNode(target);
  });
}
