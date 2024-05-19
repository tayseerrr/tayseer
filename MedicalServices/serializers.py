from rest_framework import serializers

from Users.models import StudentProfile
from Users.serializer import StudentProfileSerializer
from .models import MedicalPartner, MedicalPartnerOffer, MedicalPartnerOfferApplied


class MedicalPartnerOfferSerializer(serializers.ModelSerializer):
    partner = serializers.StringRelatedField(source='partner.name')
    class Meta:
        model = MedicalPartnerOffer
        fields = '__all__'


class MedicalPartnerSerializer(serializers.ModelSerializer):
    offers = MedicalPartnerOfferSerializer(many=True, read_only=True)
    logo = serializers.ImageField(use_url=True)

    class Meta:
        model = MedicalPartner
        fields = '__all__'


class MedicalPartnerOfferAppliedSerializer(serializers.ModelSerializer):
    offer = MedicalPartnerOfferSerializer()
    profile = serializers.SerializerMethodField()

    def get_profile(self, obj):
        profile = StudentProfile.objects.get(user=obj.user)
        return StudentProfileSerializer(profile).data

    class Meta:
        model = MedicalPartnerOfferApplied
        fields = '__all__'
