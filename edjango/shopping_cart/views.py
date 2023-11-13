from rest_framework import generics, filters
from django.shortcuts import render

# Create your views here.
from shopping_cart.models import Cart, CartItem
from .serializers import CartSerializer, CartItemSerializer


class CartView(generics.ListCreateAPIView):
    queryset = Cart.objects.all()
    serializer_class = CartSerializer

    def get_queryset(self):
        user = self.request.user
        return Cart.objects.filter(customer_id=user.id)


class CartItemView(generics.ListCreateAPIView):
    queryset = CartItem.objects.all()
    serializer_class = CartItemSerializer

    def get_queryset(self):
        user = self.request.user
        return CartItem.objects.filter(cart_id=user.id)
