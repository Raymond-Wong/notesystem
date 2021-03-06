from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static


# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
  url(r'', include('pc.urls')),
  url(r'api', include('api.urls')),
)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)