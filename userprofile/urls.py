from django.contrib import admin
from django.urls import path, re_path, include
from userprofile import views

app_name = 'userprofile'

urlpatterns = [
    # re_path('', views.userLogin, name='login'),
    re_path('login/', views.userLogin, name='login'),
    re_path('logout/', views.userLogout, name='logout'),
    re_path('info/', views.userInfo, name='info'),
]

