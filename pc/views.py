# -*- coding: utf-8 -*-
import sys
sys.path.append('..')
reload(sys)
sys.setdefaultencoding('utf-8')
import json

from django.http import HttpResponse, HttpRequest, HttpResponseServerError, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response, redirect
from django.views.decorators.csrf import csrf_exempt

from NoteSystem.decorator import login_required
from NoteSystem.utils import Response
from pc.models import *

@csrf_exempt
def login(request):
  if request.method == 'GET':
    return render_to_response('pc/login.html')
  account = request.POST.get('account')
  passwd = request.POST.get('password')
  try:
    user = User.objects.get(account=account)
    request.session['uid'] = user.id
    if user.passwd == passwd:
      return HttpResponse(Response(m='/').toJson(), content_type='application/json')
    else:
      return HttpResponse(Response(c=4, m='password is wrong').toJson(), content_type='application/json')
  except:
    return HttpResponse(Response(c=5, m='account is not existed').toJson(), content_type='application/json')

@csrf_exempt
def register(request):
  account = request.POST.get('account')
  passwd = request.POST.get('password')
  try:
    User.objects.get(account=account)
    return HttpResponse(Response(c=6, m='account is already existed').toJson(), content_type='application/json')
  except:
    root = Folder.objects.create(title='%s\'s root' % account)
    user = User.objects.create(account=account, passwd=passwd, level=0, root=root)
    root.save()
    user.save()
    request.session['uid'] = user.id
  return HttpResponse(Response(m='/').toJson(), content_type='application/json')

def logout(request):
  try:
    request.session.pop('uid')
    return HttpResponse(Response(m='/login').toJson(), content_type='application/json')
  except:
    return HttpResponse(Response(c='7', m='').toJson(), content_type='application/json')

@login_required
def index(request):
  return render_to_response('pc/index.html')