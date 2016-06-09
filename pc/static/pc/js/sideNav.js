$(document).ready(function() {
  loadFolder();
  toggleSideNav();
  toggleFolder();
  addFolderOrNote();
  listItemRightClick();
  rightClickDelete();
  rightClickRename();
});

// 显示或隐藏文件夹
var toggleFolder = function() {
  $(document).delegate('.toggleFolderBtn', 'click', function() {
    var item = $(this).parent();
    var fileList = item.parent().children('.fileList');
    var flag = item.children('.listRowFlag').children();
    fileList.slideToggle('fast', function() {
      $('.listItem.active').removeClass('active');
      if (flag.hasClass('glyphicon-chevron-down')) {
        flag.removeClass('glyphicon-chevron-down');
        flag.addClass('glyphicon-chevron-right')
        item.removeClass('active');
      } else if (flag.hasClass('glyphicon-chevron-right')) {
        flag.removeClass('glyphicon-chevron-right');
        flag.addClass('glyphicon-chevron-down');
        item.addClass('active');
      } else {
        $('.listItem.active').removeClass('active');
        item.addClass('active');
      }
    });
  });
  $(document).delegate('.listItem[type="folder"]', 'click', function() {
    $('.listItem.active').removeClass('active');
    $(this).addClass('active');
  });
}

// 显示或隐藏侧边栏
var toggleSideNav = function() {
  var sideNav = $('.sideNav');
  var main = $('.main');
  var triggerBtn = $('#triggerSideNavBtn');
  triggerBtn.click(function() {
    var cState = sideNav.css('left') == '0px' ? 'hide' : 'show';
    var offset = sideNav.width();
    offset += 2 * parseFloat(sideNav.css('padding-left'));
    if (cState == 'hide') {
      sideNav.animate({'left' : -1 * offset + 'px'});
      main.animate({'width' : '100%', 'margin-left' : '0px'});
    } else {
      sideNav.animate({'left' : '0px'});
      main.animate({'width' : '83.33333333%', 'margin-left' : '16.66666667%'});
    }
  });
}

// 加载文件
var loadFolder = function() {
  var domRoot = $('#allFileList');
  $.get('/api/getFolder', {'id' : 1}, function(resp) {
    var structure = resp['msg'];
    insertFileInto(domRoot, structure);
    $('.loadingBox').hide();
    $('#fileListBox').show();
  });
  var domPoint = $('#pointList');
  $.get('/api/getPointList', {'id' : 1}, function(resp) {
    var points = resp['msg'];
    for (var i = 0; i < points.length; i++) {
      var newPoint = $(pointRow);
      newPoint.children('.pointTitle').text(points[i][0]);
      newPoint.children('.pointTitle').attr('title', points[i][0]);
      newPoint.children('.noteName').text(points[i][1]);
      newPoint.children('.noteName').attr('title', points[i][1]);
      newPoint.attr('nid', points[i][2]);
      domPoint.append(newPoint);
    }
  });
}

var insertFileInto = function(dom, dict) {
  for (var title in dict) {
    var arr = title.split('.');
    var realT = arr.slice(0, arr.length - 2).join('.');
    var row = arr[arr.length - 2] == 'folder' ? folderRow : fileRow;
    var itemId = arr[arr.length - 1];
    var newDom = $(row);
    newDom.children('.listItem').children('.listRowText').text(realT);
    insertFileInto(newDom.children('.fileList'), dict[title]);
    newDom.children('.listItem').attr('itemId', itemId);
    newDom.children('.listItem').attr('type', arr[arr.length - 2]);
    dom.append(newDom);
  }
}

// 添加一个文件夹或者一个笔记的事件
var addFolderOrNote = function() {
  var addBtn = $('button[title="add folder/file"]');
  var selectTypeBox = $('.addTypeBox');
  var addFolderBtn = $('a[title="add folder"]');
  var addNoteBtn = $('a[title="add note"]');
  addBtn.mouseenter(function() {
    selectTypeBox.show();
  });
  addBtn.mouseleave(function() {
    selectTypeBox.hide();
  });
  addFolderBtn.click(function() {
    // 把已经有的名称输入框删除
    $('.addNameInputArea').remove();
    var newFolder = $('<input type="text" class="addNameInputArea" placeholder="folder name" />');
    var target = $('.listItem.active');
    if (target.attr('type') && target.attr('type') == 'note') {
      target = $(target.parents('.fileList')[0]);
    }
    target = target.parent().children('.fileList');
    target = target.length > 0 ? target : $('#allFileList');
    target.append(newFolder);
    newFolder.focus();
    newFolder.blur(function() {
      finishedNaming(target, newFolder, 'folder');
    });
  });
  addNoteBtn.click(function() {
    $('.addNameInputArea').remove();
    var newNote = $('<input type="text" class="addNameInputArea" placeholder="folder name" />');
    var target = $('.listItem.active');
    if (target.attr('type') && target.attr('type') == 'note') {
      target = $(target.parents('.fileList')[0]);
    }
    target = target.parent().children('.fileList');
    target = target.length > 0 ? target : $('#allFileList');
    target.append(newNote);
    newNote.focus();
    newNote.blur(function() {
      finishedNaming(target, newNote, 'note');
    });
  });
}

// 给新文件命名完成后
var finishedNaming = function(target, folderNameDom, type) {
  var folderName = folderNameDom.val();
  if (folderName.length == 0) {
    folderNameDom.remove()
    return false;
  }
  // 获取父目录的id
  var param = {};
  var parent = target.parent().children('.listItem');
  if (parent.length > 0) {
    param['pid'] = parent.attr('itemId');
  }
  param['uid'] = $('body').attr('uid');
  param['title'] = folderName;
  param['type'] = type;
  console.log(param);
  $.get('/api/addFolderOrNote', param, function(resp) {
    if (resp['code'] == 0) {
      var newFolder = type == 'folder' ? $(folderRow) : $(fileRow);
      newFolder.children('.listItem').attr('itemId', resp['msg']);
      newFolder.children('.listItem').children('.listRowText').text(folderName);
      newFolder.children('.listItem').attr('type', type);
      folderNameDom.remove();
      target.append(newFolder);
    } else {
      alert('create folder/note failed: ' + resp['msg']);
    }
  });
}

// 点击鼠标右键时显出重命名,删除,添加文件,添加文件夹四个选项
var listItemRightClick = function() {
  var menu = $('#sideNavRightClickMenu');
  // 阻止系统默认的鼠标右键菜单
  $('.sideNav').bind("contextmenu",function(){
    return false;
  });
  // 弹出鼠标右键菜单
  $(document).delegate('.listItem', 'mousedown', function(e) {
    if (e.which == 3) {
      // 判断点击右键的对象是否是文件夹，如果不是的话隐藏两个按钮
      if ($(this).attr('type') == "note") {
        $(menu.find('button[title="add folder"]')[0]).hide();
        $(menu.find('button[title="add note"]')[0]).hide();
      } else if ($(this).attr('type') == 'folder') {
        $(menu.find('button[title="add folder"]')[0]).show();
        $(menu.find('button[title="add note"]')[0]).show();
      } else {
        e.preventDefault();
        e.stopPropagation();
        return false;
      }
      e.preventDefault();
      e.stopPropagation();
      menu.css('left', e.pageX + 'px');
      menu.css('top', e.pageY - 55 + 'px');
      menu.show();
      $(this).attr('rightClick', 'true');
      return false;
    }
  });
  // 点击页面任何位置都把菜单隐藏
  $(window).click(function() {
    $('.listItem[rightClick="true"]').attr('rightClick', 'false');
    menu.hide();
  })
}

// 右键删除
var rightClickDelete = function() {
  $('#rightClickDeleteBtn').click(function() {
    var target = $('.listItem[rightClick="true"]');
    if (!confirm('sure to delete ' + target.children('.listRowText').text()))
      return false;
    var params = {'id' : target.attr('itemId'), 'type' : target.attr('type')};
    $.get('/api/deleteFolderOrNote', params, function(resp) {
      if (resp['code'] != 0) {
        alert('delete failed: ' + resp['msg'])
      } else {
        target.parent().remove();
      }
    });
  });
}

// 右键重命名
var rightClickRename = function() {
  $('#rightClickRenameBtn').click(function() {
    var target = $('.listItem[rightClick="true"]');
    var cNameDom = target.children('.listRowText');
    var inputArea = $('<input type="text" class="addNameInputArea" placeholder="folder name" />');
    inputArea.val(cNameDom.text());
    target.hide();
    target.before(inputArea);
    inputArea.focus();
    inputArea.blur(function() {
      var params = {'id' : target.attr('itemId'), 'title' : inputArea.val(), 'type' : target.attr('type`')};
      $.get('/api/renameFolderOrNote', params, function(resp) {
        if (resp['code'] != 0) {
          alert('rename failed: ' + resp['msg']);
        } else {
          cNameDom.text(inputArea.val());
          inputArea.remove();
          target.show();
        }
      })
    });
  });
}