from django_filters import rest_framework as filters
from .models import Product


class ProductFilter(filters.FilterSet):
    brand = filters.CharFilter(field_name='brand__title')
    category = filters.CharFilter(field_name='category__title')

    class Meta:
        model = Product
        fields = ['brand__title', 'category__title']
