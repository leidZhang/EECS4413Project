from rest_framework import serializers

from data_access.serializers import ProductSerializer
from .models import Cart, CartItem


class CartItemSerializer(serializers.ModelSerializer):
    product = ProductSerializer(many=False)

    class Meta:
        model = CartItem
        fields = ['product', 'quantity']


class CartSerializer(serializers.ModelSerializer):
    products = CartItemSerializer(many=True, read_only=True, source='product_set')

    class Meta:
        model = Cart
        fields = ['customer_id', 'products', 'total']

