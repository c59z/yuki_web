# Generated by Django 4.0.3 on 2022-05-15 10:10

import ckeditor.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0004_articlemodel_pageviews'),
    ]

    operations = [
        migrations.AlterField(
            model_name='articlemodel',
            name='text',
            field=ckeditor.fields.RichTextField(),
        ),
    ]
