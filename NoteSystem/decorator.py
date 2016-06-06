# -*- coding: utf-8 -*-
import sys

from django.http import HttpResponse, HttpRequest, HttpResponseServerError, Http404
from django.shortcuts import redirect

def login_required(view):
  def verified(request, *args, **kwargs):
    try:
      request.session['uid']
      return view(request, *args, **kwargs)
    except:
      return redirect('/login')
  return verified
