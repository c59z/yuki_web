from django.contrib import admin
from django.urls import path, re_path, include
from web import views


app_name = 'article'

urlpatterns = [
    re_path('^index$', views.index, name='index'),
    re_path(r'^$', views.index, name='index'),
    re_path(r'^article/$', views.index, name='index'),
    re_path(r'^article$', views.index, name='index'),
    re_path(r'^article/(\d*)', views.article, name='article'),
    re_path(r'^readme$', views.readme, name='readme'),
    re_path(r'^diary$', views.diary_index, name='diary_index'),
    re_path(r'^diary/(\d*)', views.article_diary, name='diary'),
]

