# Generated by Django 4.2.3 on 2023-12-17 21:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('identity', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CustomerInfo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('phone_num', models.CharField(default='', max_length=10)),
                ('address_1', models.CharField(default='', max_length=255)),
                ('address_2', models.CharField(default='', max_length=255)),
                ('city', models.CharField(default='', max_length=255)),
                ('province', models.CharField(default='', max_length=2)),
                ('postal_code', models.CharField(default='', max_length=7)),
                ('customer', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='identity.customer')),
            ],
        ),
    ]
