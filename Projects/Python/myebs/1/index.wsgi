import sae
from cfs import wsgi
application = sae.create_wsgi_app(wsgi.application)
