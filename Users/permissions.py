from rest_framework import permissions


class BlockCertainActions(permissions.BasePermission):
    def has_permission(self, request, view):
        # Deny access to 'POST', 'DELETE', etc.
        if view.action == 'create':
            return True
        if view.action in ['list', 'retrieve', ]:
            return False
        # check if the user is authenticated and is owner of the object


class IsOwner(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return obj == request.user
