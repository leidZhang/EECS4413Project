from djoser.signals import user_registered
from django.contrib.auth.models import Group


def add_user_to_group(sender, user, request, **kwargs):
    group, created = Group.objects.get_or_create(name="Customer")
    user.groups.add(group)
    user.save()


user_registered.connect(add_user_to_group)  # assign to customer
