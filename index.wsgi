import sae
sae.add_vendor_dir('packages')

from NoteSystem import wsgi

application = sae.create_wsgi_app(wsgi.application)
