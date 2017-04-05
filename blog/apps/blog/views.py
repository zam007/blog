# coding:utf-8
from django.shortcuts import render, get_object_or_404
from django.core.mail import send_mail
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.views.generic import ListView
from blog.apps.blog.models import Post, Comment
from blog.apps.blog.forms import EmailPostForm, CommentForm
from taggit.models import Tag
from django.db.models import Count
# 数据库调试
from django.db import connection


# 基于类的通用视图 TemplateView，ListView，DetailView
class PostListView(ListView):
    queryset = Post.published.all()
    context_object_name = 'posts'
    paginate_by = 3
    template_name = 'blog/post/list.html'


def post_list(request, tag_slug=None):
    object_list = Post.published.all()
    tag = None

    if tag_slug:
        tag = get_object_or_404(Tag, slug=tag_slug)
        object_list = object_list.filter(tags__in=[tag])

    paginator = Paginator(object_list, 3)  # 每页三篇文章
    page = request.GET.get('page')
    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        # if page is not an integer deliver the first page
        posts = paginator.page(1)
    except EmptyPage:
        # if page is out of range deliver last page of results
        posts = paginator.page(paginator.num_pages)
    return render(request,
                  'blog/post/list.html',
                  {'posts': posts,
                   'page': page,
                   'tag': tag})


# 表单成功提交后发送Email
def post_share(request, post_id):
    # 以ID形式接收post数据
    post = get_object_or_404(Post,
                             id=post_id,
                             status='published')
    sent = False
    if request.method == 'POST':
        form = EmailPostForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            post_url = request.build_absolute_uri(post.get_absolute_url())
            subject = '{} ({}) recommends you reading "{}"'.format(cd['name'], cd['email'], post.title)
            message = 'Read "{}" at {}\n\n{}\'s comments: {}'.format(post.title, post_url, cd['name'], cd['comments'])
            send_mail(subject, message, 'zabbix@stourweb.com', [cd['to']])
            sent = True
    else:
        form = EmailPostForm()
    return render(request,
                  'blog/post/share.html',
                  {'post': post, 'form': form, 'sent': sent})


def post_detail(request, year, month, day, post):
    object_detail = get_object_or_404(Post, slug=post,
                                      status='published',
                                      publish__year=year,
                                      publish__month=month,
                                      publish__day=day)

    # 显示文章所有有效评论
    comments = object_detail.comments.filter(active=True)

    if request.method == 'POST':
        # 提交一条评论
        comment_form = CommentForm(data=request.POST)
        if comment_form.is_valid():
            # 建立评论对象，但是目前并不存储
            new_commnet = comment_form.save(commit=False)
            # 为此条评论分配一个帖子
            new_commnet.post = object_detail
            #  将评论保存到数据库
            new_commnet.save()
    else:
        comment_form = CommentForm()

    # 显示近似的所有文章
    post_tags_ids = object_detail.tags.values_list('id', flat=True)
    similar_posts = Post.published.filter(tags__in=post_tags_ids).exclude(id=object_detail.id)
    similar_posts = similar_posts.annotate(same_tags=Count('tags')).order_by('-same_tags', '-publish')[:4]

    return render(request,
                  'blog/post/detail.html',
                  {'post': object_detail,
                   'comments': comments,
                   'comment_form': comment_form,
                   'similar_posts': similar_posts})
