# -*- coding: utf-8 -*-

import os
import sys
import django.core.handlers.wsgi
os.environ['DJANGO_SETTINGS_MODULE'] = 'fetcher.settings'
app_apth = "/home/tju/Workspaces/Projects/Python/fetcher/"
sys.path.append(app_apth)
application = django.core.handlers.wsgi.WSGIHandler()
