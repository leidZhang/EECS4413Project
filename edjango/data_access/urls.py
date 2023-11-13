from .import views
from django.urls import path

urlpatterns = [
    path('categories', views.CategoryView.as_view()),
    path('brands', views.BrandView.as_view()),
    path('products', views.ProductView.as_view()),
    path('products/<int:pk>', views.SingleProductSerializer.as_view())
]
