from django.conf.urls import patterns, include, url
import views

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
  url(r'^/getFolder$', views.getFolderStructure),
  url(r'^/addFolderOrNote$', views.addFolderOrNote),
  url(r'^/deleteFolderOrNote$', views.deleteFolderOrNote),
  url(r'^/renameFolderOrNote$', views.renameFolderOrNote),
  url(r'^/getNote$', views.getNote),
  url(r'^/saveNote$', views.saveNote),
  url(r'^/getPointList$', views.getPointList),
  url(r'^/markdown$', views.mdParser),
  url(r'^/upload/image$', views.uploadImage),
)
