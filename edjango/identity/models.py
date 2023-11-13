from django.db import models
from django.contrib.auth.models import Group
from django.contrib.auth import get_user_model


# Create your models here.
class AdministratorManager(models.Manager):
    def get_queryset(self):
        administrator_group = Group.objects.get(name="Administrator")
        return super().get_queryset().filter(groups=administrator_group)


class Administrator(get_user_model()):
    class Meta:
        proxy = True

    objects = AdministratorManager()


class CustomerManager(models.Manager):
    def get_queryset(self):
        customer_group = Group.objects.get(name='Customer')
        return super().get_queryset().filter(groups=customer_group)


class Customer(get_user_model()):
    class Meta:
        proxy = True

    objects = CustomerManager()
