from django.shortcuts import render
from web.models import ArticleModel, DiaryModel, ReadMeModel
from django.core.paginator import Paginator
from django.db.models import Q
import markdown


# Create your views here.

# /index
def index(request):
    """文章首页"""
    # 搜索
    search = request.POST.get('s')
    # 标签
    tag = request.GET.get('tag')

    if search:
        article_list = ArticleModel.objects.filter(
            Q(title__icontains=search) |
            Q(text__icontains=search)
        )
    else:
        # 获取数据库中所有的文章
        article_list = ArticleModel.objects.all()

    if tag and tag != 'None':
        article_list = article_list.filter(tags__name__in=[tag])

    # 实例化paginator对象，一页显示4篇文章
    paginator = Paginator(article_list, 10)
    # 获取url中的页面
    page = request.GET.get('page')
    # 返回第 page 页
    articles = paginator.get_page(page)

    return render(request, 'web/list.html', {"articles": articles,
                                             "search": search,
                                             'tag': tag})


# /article
def article(request, aid):
    """文章界面"""
    art = ArticleModel.objects.get(id=aid)
    # 将markdown语法渲染为html样式
    art.text = markdown.markdown(art.text,
                                 extensions=[
                                     # 缩写,表格,等常用拓展
                                     'markdown.extensions.extra',
                                     # 代码语法高亮
                                     'markdown.extensions.codehilite',
                                 ])
    return render(request, 'web/article.html', {"art": art})


def readme(request):
    art = ReadMeModel.objects.get(id=1)
    # 将markdown语法渲染为html样式
    art.text = markdown.markdown(art.text,
                                 extensions=[
                                     # 缩写,表格,等常用拓展
                                     'markdown.extensions.extra',
                                     # 代码语法高亮
                                     'markdown.extensions.codehilite',
                                 ])
    return render(request, 'web/article.html', {"art": art})


def diary_index(request):
    """日记首页"""
    # 搜索
    search = request.POST.get('s-d')
    # # 标签
    # tag = request.GET.get('tag')

    if search:
        article_list = DiaryModel.objects.filter(
            Q(title__icontains=search) |
            Q(text__icontains=search)
        )
    else:
        # 获取数据库中所有的文章
        article_list = DiaryModel.objects.all()

    # 实例化paginator对象，一页显示4篇文章
    paginator = Paginator(article_list, 10)
    # 获取url中的页面
    page = request.GET.get('page')
    # 返回第 page 页
    articles = paginator.get_page(page)

    return render(request, 'web/list_diary.html', {"articles": articles,
                                                   "search": search, })


def article_diary(request, aid):
    """文章界面"""
    art = DiaryModel.objects.get(id=aid)
    # 将markdown语法渲染为html样式
    art.text = markdown.markdown(art.text,
                                 extensions=[
                                     # 缩写,表格,等常用拓展
                                     'markdown.extensions.extra',
                                     # 代码语法高亮
                                     'markdown.extensions.codehilite',
                                 ])
    return render(request, 'web/diary.html', {"art": art})
