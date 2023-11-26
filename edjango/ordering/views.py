from datetime import date
from django.shortcuts import render, get_object_or_404
from rest_framework import status
from rest_framework.response import Response
from rest_framework import generics, filters

from shopping_cart.models import Cart, CartItem
from .serializers import OrderSerializer, OrderItemSerializer

# Create your views here.
from ordering.models import Order, OrderItem


class OrderView(generics.ListCreateAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

    def get_queryset(self):
        user = self.request.user
        return Order.objects.filter(customer=user)

    def create(self, request):
        today = date.today()
        customer = self.request.user
        cart = Cart.objects.get(customer_id=customer.id)

        # create new order
        order = Order.objects.create(customer=customer, total=cart.total, date=today)
        # transfer item to order
        cart_items = CartItem.objects.filter(cart=cart)
        for item in cart_items:
            OrderItem.objects.create(order=order, product=item.product, quantity=item.quantity)
            item.delete()

        # update cart and order
        cart.total = 0.00
        cart.save()

        return Response(data={'message': 'order placed', 'id': order.id}, status=status.HTTP_201_CREATED)


class SingleOrderView(generics.RetrieveUpdateAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

    def get_queryset(self):
        user = self.request.user
        return Order.objects.filter(customer=user)


class SingleOrderItemView(generics.ListAPIView):
    queryset = OrderItem.objects.all()
    serializer_class = OrderItemSerializer
    pagination_class = None

    def get_queryset(self):
        order = self.get_object()
        return OrderItem.objects.filter(order=order)

    def get_object(self):
        orders = Order.objects.all()
        filter_kwargs = {'pk': self.kwargs['pk']}
        obj = get_object_or_404(orders, **filter_kwargs)
        return obj
