# Generated by Django 4.2.3 on 2023-11-26 00:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('data_access', '0005_product_image_url'),
    ]

    operations = [
        migrations.RenameField(
            model_name='product',
            old_name='image_url',
            new_name='image',
        ),
    ]
