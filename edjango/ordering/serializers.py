from rest_framework import serializers
from django.contrib.auth.models import User
from django.contrib.auth import authenticate

from data_access.serializers import ProductSerializer
from .models import Order, OrderItem


class OrderItemSerializer(serializers.ModelSerializer):
    product = ProductSerializer(many=False, read_only=True)

    class Meta:
        model = OrderItem
        fields = ['product', 'quantity']


class OrderSerializer(serializers.ModelSerializer):
    products = OrderItemSerializer(many=True, read_only=True, source='product_set')

    class Meta:
        model = Order
        fields = ['id', 'customer_id', 'products', 'status', 'total', 'date']
