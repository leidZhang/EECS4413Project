from django.db import models

# Create your models here.
from data_access.models import Product
from identity.models import Customer


class Cart(models.Model):
    customer = models.OneToOneField(Customer, on_delete=models.CASCADE, primary_key=True)
    products = models.ManyToManyField(Product, through='CartItem')
    total = models.DecimalField(max_digits=6, decimal_places=2)

    def __str__(self):
        return str(self.customer.username)

    def update_total(self):
        cart_items = CartItem.objects.filter(cart=self)
        total = sum(item.quantity * item.product.price for item in cart_items)

        self.total = total
        self.save()


class CartItem(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)

    def __str__(self):
        return 'product'
