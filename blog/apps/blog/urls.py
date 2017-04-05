from django.conf.urls import url
from  blog.apps.blog import views as blog_views
from blog.apps.blog.feeds import LatestPostsFeed

urlpatterns = [
    # blog_views.post_list
    url(r'^$',
        blog_views.post_list,
        name='post_list'),
    url(r'^tag/(?P<tag_slug>[-\w]+)/$', blog_views.post_list,
        name='post_list_by_tag'),
    # url(r'^$', blog_views.PostListView.as_view(), name='post_list'),

    # blog_views.post_share
    url(r'^(?P<post_id>\d+)/share/$',
        blog_views.post_share,
        name='post_share'),

    # blog_views.post_detail
    url(r'^(?P<year>\d{4})/(?P<month>\d{2})/(?P<day>\d{2})/' \
        r'(?P<post>[-\w]+)/$',
        blog_views.post_detail,
        name='post_detail'),

    # Feed
    url(r'^feed/$', LatestPostsFeed(), name='post_feed'),
]
