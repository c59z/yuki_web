# User模型
from django.contrib.auth.models import User
from django.db import models
# timezone 处理时间
from django.utils import timezone
from taggit.managers import TaggableManager
from imagekit.models import ProcessedImageField
from imagekit.processors import ResizeToFit

# Create your models here.


class ArticleModel(models.Model):
    # 作者 on_delete=级联删除
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    # 文章标题
    title = models.CharField(max_length=128)
    # 副标题
    subtitle = models.CharField(max_length=1024, default='')
    # 标签
    tags = TaggableManager(blank=True)
    # 正文
    text = models.TextField()
    # text = RichTextField()
    # 文章创建时间(写于)               创建时间为当前系统时间
    created = models.DateTimeField(default=timezone.now)
    # 文章更新时间                    每次数据更新时自动写入当前时间
    updated = models.DateTimeField(auto_now=True)
    # 文章的浏览量,默认为0
    pageviews = models.PositiveIntegerField(default=0)

    class Meta:
        # ordering 指定模型返回的数据的排列顺序
        # '-created' 表明数据应该以倒序排列
        # 模型返回数据时，以文章创建时间的倒叙进行返回
        db_table = 'yuki_web'
        ordering = ('-created',)

    def __str__(self):
        # return self.title 将文章标题返回
        return self.title


class DiaryModel(models.Model):
    # 作者 on_delete=级联删除
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    # 文章标题
    title = models.CharField(max_length=128)
    # 副标题
    subtitle = models.CharField(max_length=1024, default='')
    # 图片
    image = ProcessedImageField(
        upload_to='static/diary_img/%Y%m/%Y%m%d',
        blank=True,
    )
    # 文章标题图
    image_thumbnail = ProcessedImageField(
        upload_to='static/diary_img/%Y%m/%Y%m%d/thumbnail',
        processors=[ResizeToFit(width=250)],
        format='JPEG',
        options={'quality': 100},
        blank=True,
    )
    # 正文
    text = models.TextField()
    # text = RichTextField()
    # 文章创建时间(写于)               创建时间为当前系统时间
    created = models.DateTimeField(default=timezone.now)
    # 文章更新时间                    每次数据更新时自动写入当前时间
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        # ordering 指定模型返回的数据的排列顺序
        # '-created' 表明数据应该以倒序排列
        # 模型返回数据时，以文章创建时间的倒叙进行返回
        db_table = 'yuki_diary'
        ordering = ('-created',)

    def __str__(self):
        # return self.title 将文章标题返回
        return self.title


class ReadMeModel(models.Model):
    # 作者 on_delete=级联删除
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    # 文章标题
    title = models.CharField(max_length=128)
    # 图片
    image = ProcessedImageField(
        upload_to='static/diary_img/%Y%m/%Y%m%d',
        blank=True,
    )
    # 正文
    text = models.TextField()
    # text = RichTextField()
    # 文章创建时间(写于)               创建时间为当前系统时间
    created = models.DateTimeField(default=timezone.now)
    # 文章更新时间                    每次数据更新时自动写入当前时间
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        # ordering 指定模型返回的数据的排列顺序
        # '-created' 表明数据应该以倒序排列
        # 模型返回数据时，以文章创建时间的倒叙进行返回
        db_table = 'yuki_ReadMe'
        ordering = ('-created',)

    def __str__(self):
        # return self.title 将文章标题返回
        return self.title



