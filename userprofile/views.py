from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponse
from userprofile.forms import UserLoginForm


# Create your views here.

def userLogin(request):
    # 如果请求时post请求
    if request.method == "POST":
        # 获取用户提交的请求
        user_login_form = UserLoginForm(data=request.POST)
        # 如果用户提交的请求数据合法
        if user_login_form.is_valid():
            # .cleaned_data 清洗出合法数据
            data = user_login_form.cleaned_data
            # 验证输入的用户名和密码在数据库中是否一致
            user = authenticate(username=data['username'], password=data['password'])
            if user:
                # 登录成功
                login(request, user)
                return redirect('userprofile:info')
            else:
                # 登录失败
                return HttpResponse("登录失败，用户名或密码错误")
        else:
            return HttpResponse("登录失败，用户名或密码不合法")
    elif request.method == "GET":
        # 如果是get请求
        user_login_form = UserLoginForm()
        content = {'form': user_login_form}
        return render(request, 'userprofile/login.html', content)
    else:
        return HttpResponse("请使用post/get请求")


# 用户登出
def userLogout(request):
    logout(request)
    return redirect("article:index")


def userInfo(request):
    return render(request, "userprofile/info.html")
