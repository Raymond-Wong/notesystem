var fileRow = '<div class="row listRow" draggable="true">' +
                '<div class="listItem">' +
                  '<div class="listRowFlag"><div class="glyphicon glyphicon-list-alt"></div></div>' +
                  '<div class="listRowText textEllipsis"></div>' +
                '</div>' +
                '<div class="row fileList"></div>' +
              '</div>';

var folderRow = '<div class="row listRow" draggable="true">' +
                  '<div class="listItem">' +
                    '<div class="listRowFlag"><div class="glyphicon glyphicon-chevron-right"></div></div>' +
                    '<div class="listRowText textEllipsis"></div>' +
                  '</div>' +
                  '<div class="row fileList"></div>' +
                '</div>';

var linkBlock = '<div class="referBlock" type="link">' +
                '  <div class="deleteBlockBtn"><span class="glyphicon glyphicon-remove"></span></div>' +
                '  <input class="referContent" placeholder="link address" type="text"/>' +
                '</div>';

var pointBlock = '<div class="referBlock" type="point">' +
                          '  <div class="deleteBlockBtn"><span class="glyphicon glyphicon-remove"></span></div>'+
                          '  <input class="referHead" placeholder="knowledge point title" type="text" />' +
                          '  <textarea class="referContent pointContent" data-role="mdArea"></textarea>' +
                          '</div>';

var pointRow = '<div class="row listRow">' +
               '  <div class="textEllipsis col-md-5 pointTitle nopadding">point 1.1.1</div>' +
               '  <div class="col-md-2 nopadding centerText">--</div>' +
               '  <div class="textEllipsis col-md-5 noteName nopadding">note 1.1</div>' +
               '</div>';