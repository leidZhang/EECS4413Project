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

    def perform_create(self, serializer):
        # Set the cart field before saving the instance
        user = self.request.user  # cart_id is user_id
        product_id = self.request.data.get('product_id')
        quantity = self.request.data.get('quantity')
        cart = Cart.objects.get(customer_id=user.id)

        # Check if the item already exists in the cart
        existing_item = CartItem.objects.filter(cart=user.id, product=product_id).first()

        if existing_item:
            # If the item exists, update the quantity
            existing_item.quantity += int(quantity)
            existing_item.save()
            serializer.instance = existing_item  # Set the serializer instance for response
        else:
            # If the item does not exist, create a new one
            serializer.save(cart_id=user.id)
