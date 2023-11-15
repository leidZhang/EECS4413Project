from rest_framework import serializers

from .models import Cart, CartItem
from data_access.models import Product
from data_access.serializers import ProductSerializer


class CartItemSerializer(serializers.ModelSerializer):
    # read only product, read via product detail
    product = ProductSerializer(many=False, read_only=True)
    # write only product_id, add via product id
    product_id = serializers.PrimaryKeyRelatedField(queryset=Product.objects.all(), source='product', write_only=True)

    class Meta:
        model = CartItem
        fields = ['product_id', 'product', 'quantity']


class CartSerializer(serializers.ModelSerializer):
    products = CartItemSerializer(many=True, read_only=True, source='product_set')

    class Meta:
        model = Cart
        fields = ['customer_id', 'products', 'total']

