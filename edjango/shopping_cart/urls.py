from django.urls import path
from .import views

urlpatterns = [
    path('cart', views.CartView.as_view()),
    path('cart/products', views.CartItemView.as_view()),
]
