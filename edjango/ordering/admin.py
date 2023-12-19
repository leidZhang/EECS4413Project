from django.contrib import admin

# Register your models here.
from ordering.models import Order, OrderItem


class OrderItemAdmin(admin.ModelAdmin):
    list_display = ['order_date', 'order_id', 'inventory', 'quantity']

    def order_date(self, obj):
        return obj.order.date

    def order_id(self, obj):
        return obj.order.id

    order_date.short_description = 'Order Date'
    order_id.short_description = 'Order ID'


class OrderItemInline(admin.TabularInline):
    model = OrderItem
    extra = 0  # no extra empty rows
    readonly_fields = [field.name for field in OrderItem._meta.get_fields()]  # all read only
    can_delete = False  # hide delete button
    max_num = 0  # hide add button

    def has_add_permission(self, request, obj=None):
        return False  # cannot add existed items

    def has_delete_permission(self, request, obj=None):
        return False  # cannot delete existed items


class OrderAdmin(admin.ModelAdmin):
    inlines = [OrderItemInline]
    readonly_fields = ('total', )
    list_display = ('customer', 'phone_num', 'date', 'city', 'province', 'total', 'status')


admin.site.register(Order, OrderAdmin)
admin.site.register(OrderItem, OrderItemAdmin)
