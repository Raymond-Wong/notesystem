# -*- coding: utf-8 -*-
from django.db import models

class Item(models.Model):
  title = models.CharField(max_length=50)
  created_time = models.DateTimeField(auto_now_add=True)
  parent = models.ForeignKey('self', null=True)

  def __unicode__(self):
    return self.title

# 文件夹
class Folder(Item):
  # 类型
  item_type = models.CharField(max_length=20, default='folder', editable=False)

# 笔记
class Note(Item):
  # 类型
  item_type = models.CharField(max_length=20, default='note', editable=False)
  # 当前笔记的内容
  content = models.TextField(blank=False)
  # 当前笔记的超链接
  links = models.TextField()
  # 笔记标题
  name = models.CharField(max_length=50)

class User(models.Model):
  # 昵称
  nickname = models.CharField(max_length=50)
  # 级别
  level = models.IntegerField()
  # 根文件
  root = models.OneToOneField(Folder, null=True)
  # 账号
  account = models.CharField(max_length=50)
  # 密码
  passwd = models.CharField(max_length=50)

  def __unicode__(self):
    return self.nickname

# 知识点
class Knowledge_Point(models.Model):
  # 所属用户
  user = models.ForeignKey(User, null=True)
  # 名字
  title = models.CharField(max_length=50)
  # 创建时间
  created_time = models.DateTimeField(auto_now_add=True)
  # 当前知识点的内容
  content = models.TextField(blank=False)
  # 当前知识点所属的笔记
  note = models.ForeignKey(Note, null=True)
