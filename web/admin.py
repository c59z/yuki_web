from django.contrib import admin
from web.models import ArticleModel, DiaryModel, ReadMeModel

# Register your models here.
admin.site.register(ArticleModel)
admin.site.register(DiaryModel)
admin.site.register(ReadMeModel)
