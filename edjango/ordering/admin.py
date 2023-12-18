from django.contrib import admin

# Register your models here.
from ordering.models import Order, OrderItem


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
    list_display = ('customer', 'phone_num', 'date', 'city', 'province', 'total', 'status')


admin.site.register(Order, OrderAdmin)
