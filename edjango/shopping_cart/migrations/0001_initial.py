# Generated by Django 4.2.6 on 2023-11-04 21:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('identity', '0001_initial'),
        ('data_access', '0003_product'),
    ]

    operations = [
        migrations.CreateModel(
            name='Checkout',
            fields=[
                ('customer', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='identity.customer')),
                ('total', models.DecimalField(decimal_places=2, max_digits=6)),
            ],
        ),
        migrations.CreateModel(
            name='CartItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField(default=1)),
                ('cart', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopping_cart.cart')),
                ('item', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='data_access.product')),
            ],
        ),
        migrations.AddField(
            model_name='cart',
            name='items',
            field=models.ManyToManyField(through='shopping_cart.CartItem', to='data_access.product'),
        ),
    ]
