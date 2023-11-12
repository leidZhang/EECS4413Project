from django.shortcuts import render
from rest_framework import generics, filters

from .models import Category, Brand, Product
from .serializers import CategorySerializer, BrandSerializer, ProductSerializer


# Create your views here.
class CategoryView(generics.ListCreateAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['title']
    # permission_classes = [permissions.IsAuthenticated, IsAdminOrReadOnly]


class BrandView(generics.ListCreateAPIView):
    queryset = Brand.objects.all()
    serializer_class = BrandSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['title']
    # permission_classes = [permissions.IsAuthenticated, IsAdminOrReadOnly]


class ProductView(generics.ListCreateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['title', 'brand', 'category']
    # permission_classes = [permissions.IsAuthenticated, IsAdminOrReadOnly]


class SingleProductSerializer(generics.RetrieveUpdateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
