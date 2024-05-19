from django.db import models
from django.utils import timezone


class MedicalPartner(models.Model):
    mid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=64)
    logo = models.ImageField('medical/partners/logos/')
    description = models.TextField()
    branches = models.TextField()
    # mid, name, logo, description, branches

    def __str__(self):
        return self.name


# class MedicalPartnerOfferManager(models.Manager):

class MedicalPartnerOffer(models.Model):
    offer_id = models.AutoField(primary_key=True)
    partner = models.ForeignKey(MedicalPartner, on_delete=models.CASCADE, related_name='offers')
    title = models.CharField(max_length=64)
    discount = models.FloatField()
    # objects = MedicalPartnerOfferManager()
    # offer_id, partner, title, discount, start_date, end_date

    def __str__(self):
        return self.title


class MedicalPartnerOfferApplied(models.Model):
    id = models.AutoField(primary_key=True)
    offer = models.ForeignKey(MedicalPartnerOffer, on_delete=models.CASCADE, related_name='applied_offers')
    user = models.ForeignKey('Users.User', on_delete=models.CASCADE, related_name='applied_offers')
    applied_date = models.DateTimeField(auto_now_add=True)
    # id, offer, user, applied_date

    def __str__(self):
        return self.user.get_full_name()
