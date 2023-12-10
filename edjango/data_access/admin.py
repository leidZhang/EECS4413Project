from django.contrib import admin
from .models import Category, Brand, Product, Color, Size

# Register your models here.
admin.site.register(Category)
admin.site.register(Brand)
admin.site.register(Product)
admin.site.register(Color)
admin.site.register(Size)
