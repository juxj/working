from django.conf.urls import patterns, include, url
from django.views.generic import TemplateView

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'web_apps.views.home', name='home'),
    # url(r'^web_apps/', include('web_apps.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
 	#url(r'^$',TemplateView.as_view(template_name="fetcher/index.html")),
 	url(r'^$','web_apps.main.index'),
 	url(r'^treeBuilder.do','fetcher.views.build_tree'),
 	url(r'^get_tree_data','fetcher.views.get_tree_data'),
    url(r'^admin/', include(admin.site.urls)),
)
