# -*- coding: utf-8 -*-
import sys
sys.path.append('..')
reload(sys)
sys.setdefaultencoding('utf-8')
import json
import markdown
import time

from django.http import HttpResponse, HttpRequest, HttpResponseServerError, Http404
from django.shortcuts import render_to_response, redirect
from django.views.decorators.csrf import csrf_exempt
from django.core import serializers

from pc.models import *
from models import *
from NoteSystem.utils import Response

# 获取文件结构
def getFolderStructure(request):
  user = User.objects.get(id=request.GET.get('id', 1))
  root = user.root
  return HttpResponse(Response(m=getChildren(root)).toJson(), content_type='application/json')

# 获取用户的知识点列表
def getPointList(request):
  targetId = request.GET.get('id', 1)
  try:
    user = User.objects.get(id=targetId)
  except:
    return HttpResponse(Response(c=-1, m='user invalided').toJson(), content_type='application/json')
  points = user.knowledge_point_set.order_by('created_time')
  ret = []
  for point in points:
    note = point.note
    item = Item.objects.get(id=note.item_ptr_id)
    ret.append([point.title, item.title, item.id])
  return HttpResponse(Response(m=ret).toJson(), content_type='application/json')

# 添加文件夹或文件
def addFolderOrNote(request):
  uid = request.GET.get('uid', None)
  pid = request.GET.get('pid', None)
  title = request.GET.get('title', '')
  tp = request.GET.get('type', 'folder')
  try:
    parent = Item.objects.get(id=pid)
  except:
    user = User.objects.get(id=uid)
    parent = user.root
  if len(parent.item_set.filter(title=title)) <= 0:
    newItem = Folder.objects.create(title=title, parent=parent) if tp == 'folder' else Note.objects.create(title=title, parent=parent)
    return HttpResponse(Response(m=newItem.item_ptr_id).toJson(), content_type='application/json')
  return HttpResponse(Response(m='name conflict', c='1').toJson(), content_type='application/json')

# 删除文件夹或笔记的处理方法
def deleteFolderOrNote(request):
  targetId = request.GET.get('id', None)
  tp = request.GET.get('type', 'folder')
  deleteItem(targetId, tp)
  return HttpResponse(Response().toJson(), content_type='application/json')

# 重命名
def renameFolderOrNote(request):
  targetId = request.GET.get('id', None)
  tp = request.GET.get('type', 'folder')
  title = request.GET.get('title', '')
  try:
    target = Item.objects.get(id=targetId)
  except:
    return HttpResponse(Response(m='folder/note is not existed', c='2').toJson(), content_type='application/json')
  if len(target.parent.item_set.filter(title=title)) > 1:
    return HttpResponse(Response(m='name conflict', c='1').toJson(), content_type='application/json')
  target.title = title
  target.save()
  return HttpResponse(Response().toJson(), content_type='application/json')

# 获取笔记的内容
def getNote(request):
  targetId = request.GET.get('id')
  try:
    item = Item.objects.get(id=targetId)
    note = getFolderOrNoteByItem(item)
    param = {'id' : item.id, 'name' : note.name, 'content' : note.content}
    param['links'] = note.links if note.links != '' else []
    param['points'] = serializers.serialize("json", note.knowledge_point_set.order_by('created_time'))
    return HttpResponse(Response(m=param).toJson(), content_type='application/json')
  except Exception, e:
    print e
    return HttpResponse(Response(c='2', m='folder/note is not existed').toJson(), content_type='application/json')

# 保存笔记内容
@csrf_exempt
def saveNote(request):
  uid = request.POST.get('uid', None)
  targetId = request.POST.get('id', None)
  name = request.POST.get('name', '')
  content = request.POST.get('content', '')
  links = json.loads(request.POST.get('links', '[]'))
  points = json.loads(request.POST.get('points'), '[]')
  item = None
  note = None
  user = None
  try:
    user = User.objects.get(id=uid)
  except:
    return HttpResponse(Response(c='-1', m='user invalided').toJson(), content_type='application/json')
  try:
    item = Item.objects.get(id=targetId)
    note = getFolderOrNoteByItem(item)
  except Exception, e:
    note = Note.objects.create()
    item = Item.objects.get(id=note.item_ptr_id)
  note.name = name
  note.content = content
  note.links = json.dumps(links)
  note.save()
  # 申明一个数组来记录这次保存的point有哪些
  cPoints = []
  for p in points:
    if p['title'] == '' or p['content'] == '':
      continue
    try:
      point = Knowledge_Point.objects.get(id=p['id'])
    except:
      point = Knowledge_Point.objects.create()
    point.title = p['title']
    point.content = p['content']
    point.note = note
    point.user = user
    point.save()
    cPoints.append(point.id)
  # 检查可能被删除的知识点,并接触关系
  for point in note.knowledge_point_set.all():
    if point.id not in cPoints:
      point.delete()
  return HttpResponse(Response().toJson(), content_type='application/json')

# 迭代删除
def deleteItem(targetId, tp):
  try:
    target = Item.objects.get(id=targetId)
    for child in target.item_set.all():
      childType = getFolderOrNoteByItem(child).item_type
      deleteItem(child.id, childType)
    itemChild = getFolderOrNoteByItem(target)
    # 如果要删除的对象是笔记的话要把笔记对应的知识点都删除
    if itemChild.item_type == 'note':
      for point in itemChild.knowledge_point_set.all():
        point.delete()
    itemChild.delete()
    target.delete()
  except:
    pass

# markdown解释器
@csrf_exempt
def mdParser(request):
  try:
    text = request.POST.get('text', '')
    text = text + '<script type="text/javascript" src="/static/common/js/MathJax.js?config=default"></script>'
    return HttpResponse(Response(m=markdown.markdown(text)).toJson(), content_type='application/json')
  except Exception, e:
    return HttpResponse(Response(c='3', m='unknown error occured(%s)' % e).toJson(), content_type='application/json')

# 获得图片的完整链接
def appendImageUrl(x):
  from django.conf import settings
  remote_media_path = "http://notesystem-images.stor.sinaapp.com/"
  IMAGE_BASE_URL = remote_media_path if not settings.REMOTE else "/media/"
  if type(x) == dict:
    x["image"] = IMAGE_BASE_URL + x.get("image", "")
  elif type(x) == str or type(x) == unicode:
    x = IMAGE_BASE_URL + x
  else:
    x = "/static/pc/icon/logo.png"
  return x

# 上传图片
@csrf_exempt
def uploadImage(request):
  image = request.FILES['image']
  image._name = '%s_%s' % (str(int(time.time())), image._name)
  image = Image(url=image)
  image.save()
  url = appendImageUrl(image.__dict__.get('url'))
  return HttpResponse(Response(m=url).toJson(), content_type='application/json')

def getChildren(root):
  children = root.item_set.order_by('created_time')
  if len(children) == 0:
    return {}
  ret = {}
  for child in children:
    arr = [child.title, getFolderOrNoteByItem(child).item_type, str(child.id)]
    ret['.'.join(arr)] = getChildren(child)
  return ret

# 根据item获取对应的子类
def getFolderOrNoteByItem(item):
  ret = None
  try:
    ret = Folder.objects.get(item_ptr_id=item.id)
  except:
    ret = Note.objects.get(item_ptr_id=item.id)
  return ret

