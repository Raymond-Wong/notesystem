from django.conf.urls import patterns, include, url
import views

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
  url(r'^$', views.index, name='index'),
  url(r'^login$', views.login, name='login'),
  url(r'^register$', views.register, name='register'),
  url(r'^logout$', views.logout, name='logout'),
)
