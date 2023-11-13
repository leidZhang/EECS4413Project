from django.urls import path
from .import views

urlpatterns = [
    path('orders', views.OrderView.as_view()),
    path('orders/<int:pk>', views.SingleOrderView.as_view()),
    path('orders/<int:pk>/products', views.SingleOrderItemView.as_view()),
]
