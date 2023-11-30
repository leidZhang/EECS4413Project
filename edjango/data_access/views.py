from django.shortcuts import render
from rest_framework import generics, filters
from django_filters.rest_framework import DjangoFilterBackend

from .models import Category, Brand, Product
from .serializers import CategorySerializer, BrandSerializer, ProductSerializer
from .filters import ProductFilter


# Create your views here.
class CategoryView(generics.ListCreateAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['title']
    pagination_class = None
    # permission_classes = [permissions.IsAuthenticated, IsAdminOrReadOnly]


class BrandView(generics.ListCreateAPIView):
    queryset = Brand.objects.all()
    serializer_class = BrandSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['title']
    pagination_class = None
    # permission_classes = [permissions.IsAuthenticated, IsAdminOrReadOnly]


class ProductView(generics.ListCreateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    filter_backends = [filters.SearchFilter, DjangoFilterBackend, filters.OrderingFilter]
    filterset_class = ProductFilter  # This line associates your custom filter class

    search_fields = ['title', 'brand__title', 'category__title']  # fuzzy search
    ordering_fields = ['price', 'title']  # Specify fields for ordering
    # permission_classes = [permissions.IsAuthenticated, IsAdminOrReadOnly]


class SingleProductSerializer(generics.RetrieveUpdateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
