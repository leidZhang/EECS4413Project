from django.db import models


# Create your models here.
class Category(models.Model):
    title = models.CharField(max_length=255)

    def __str__(self):
        return self.title


class Brand(models.Model):
    title = models.CharField(max_length=255)
    image = models.CharField(max_length=255)

    def __str__(self):
        return self.title


class Product(models.Model):
    title = models.CharField(max_length=255)
    description = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE)
    inventory = models.IntegerField(default=0)

    def __str__(self):
        return self.title


