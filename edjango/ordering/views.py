from django.shortcuts import render, get_object_or_404
from rest_framework import status
from rest_framework.response import Response
from rest_framework import generics, filters

from shopping_cart.models import Cart
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
        date = request.data['date']
        customer = self.request.user
        cart = Cart.objects.get(customer_id=customer.id)

        order = Order.objects.create(customer=customer, total=cart.total, date=date)
        order.items.set(cart.items.all())
        order.save()

        cart.items.clear()
        cart.total = 0.00
        cart.save()

        return Response(data={'message': 'order placed'}, status=status.HTTP_201_CREATED)


class SingleOrderView(generics.RetrieveUpdateAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

    def get_queryset(self):
        user = self.request.user
        return Order.objects.filter(customer=user)


class SingleOrderItemView(generics.ListAPIView):
    queryset = OrderItem.objects.all()
    serializer_class = OrderItemSerializer

    def get_queryset(self):
        order = self.get_object()
        return OrderItem.objects.filter(order=order)

    def get_object(self):
        orders = Order.objects.all()
        filter_kwargs = {'pk': self.kwargs['pk']}
        obj = get_object_or_404(orders, **filter_kwargs)
        return obj
