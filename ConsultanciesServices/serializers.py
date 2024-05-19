from rest_framework import serializers
from .models import *


class ConsultingSerializer(serializers.ModelSerializer):
    profile_picture = serializers.ImageField(use_url=True)
    class Meta:
        model = Consultant
        fields = '__all__'


class ConsultancyBookingSerializer(serializers.ModelSerializer):
    booked_for = serializers.StringRelatedField(source='booked_for.name')
    avatar = serializers.SerializerMethodField()

    def get_avatar(self, obj):
        if obj.booked_for.profile_picture:

            return "http://127.0.0.1:8000" + obj.booked_for.profile_picture.url
        else:
            return None
    class Meta:
        model = ConsultancyBooking
        fields = '__all__'
