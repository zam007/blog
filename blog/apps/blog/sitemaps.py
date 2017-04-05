from django.contrib.sitemaps import Sitemap
from blog.apps.blog.models import Post


class PostSitemap(Sitemap):
    changefreq = 'weekly'
    prioritu = 0.9

    def items(self):
        return Post.published.all()

    def lastmod(self, obj):
        return obj.publish
