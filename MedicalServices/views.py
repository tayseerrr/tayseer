import json

from django.shortcuts import render

from rest_framework import viewsets, status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from .models import MedicalPartner, MedicalPartnerOffer, MedicalPartnerOfferApplied
from .serializers import MedicalPartnerSerializer, MedicalPartnerOfferSerializer, MedicalPartnerOfferAppliedSerializer


@api_view(['POST'])
def apply_offer(request):
    try:
        offer_id = request.data.get('offer_id')
        user = request.user
        #  partner, title, discount, start_date, end_date

        offer = MedicalPartnerOffer.objects.get(offer_id=offer_id)
        partner = offer.partner
        #  # id, offer, user, applied_date
        obj = MedicalPartnerOfferApplied.objects.create(offer=offer, user=user)


        return Response({'message': 'Offer applied'}, status=status.HTTP_201_CREATED)
    except Exception as e:
        print(e)
        return Response({'message': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET'])
def applications(request):
    try:
        user = request.user
        if user.is_anonymous:
            return Response(status=status.HTTP_401_UNAUTHORIZED)
        data = {}
        offers = MedicalPartnerOfferApplied.objects.filter(user=user)
        serializer = MedicalPartnerOfferAppliedSerializer(offers, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response(status=status.HTTP_400_BAD_REQUEST)

class MedicalPartnerViewSet(viewsets.ModelViewSet):
    queryset = MedicalPartner.objects.all()
    serializer_class = MedicalPartnerSerializer

    def create(self, request, *args, **kwargs):
        try:
            # Extract the data for the medical partner
            partner_data = request.data.copy()
            print(partner_data)

            # Extract offers data if provided, and remove from partner data
            # {'mid': None, 'name': 'www', 'logo': None, 'description': 'ww', 'branches': 'ww', 'offers': [{'title': 'rrr', 'discount': 30}]}
            partner = MedicalPartner.objects.create(name=partner_data['name'],
                                                    logo=request.FILES.get('logo'),
                                                    description=partner_data['description'],
                                                    branches=partner_data['branches'])
            # mid, name, logo, description, branches
            offers = partner_data.pop('offers', [])
            for offer in offers:
                offer = json.loads(offer)[0]
                print(offer)
                MedicalPartnerOffer.objects.create(partner=partner, **offer)

            return Response({'message': 'Medical Partner created'}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response({'message': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class MedicalPartnerOfferAppliedViewSet(viewsets.ModelViewSet):
    queryset = MedicalPartnerOfferApplied.objects.all()
    serializer_class = MedicalPartnerOfferAppliedSerializer
