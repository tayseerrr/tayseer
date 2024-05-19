from datetime import datetime

from django.shortcuts import render
from rest_framework import viewsets, status, mixins
from rest_framework.decorators import api_view
from rest_framework.response import Response

from ConsultanciesServices.serializers import *


class ConsultingViewSet(mixins.CreateModelMixin,
                        mixins.RetrieveModelMixin,
                        mixins.ListModelMixin,
                        mixins.DestroyModelMixin,
                        viewsets.GenericViewSet):
    queryset = Consultant.objects.all()
    serializer_class = ConsultingSerializer

    def create(self, request, *args, **kwargs):
        try:
            print(request.data)
            Consultant.objects.create(name=request.data.get('name'),
                                      specialization=request.data.get('specialization'),
                                      experience=request.data.get('experience'),
                                      description=request.data.get('description'),
                                      profile_picture=request.FILES.get('profile_picture'))
            return Response({'message': 'Consultant created'}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response({'message': str(e)}, status=status.HTTP_400_BAD_REQUEST)


class ConsultancyBookingViewSet(mixins.CreateModelMixin,
                                mixins.ListModelMixin,
                                mixins.DestroyModelMixin,
                                viewsets.GenericViewSet):
    queryset = ConsultancyBooking.objects.all()
    serializer_class = ConsultancyBookingSerializer

    def post(self, request, *args, **kwargs):
        print("request.data: ", request.data)
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            # Custom validation or additional data manipulation can be done here
            self.perform_create(serializer)
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def perform_create(self, serializer):
        # Any additional actions before saving, e.g., sending notifications, logging, etc.
        serializer.save()


# @api_view(['POST'])
# def booking(request):
#     user = request.user
#     if user.is_anonymous:
#         return Response({'message': 'You are not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)
#     ticket = request.data.get('ticket')
#     consultant = request.data.get('consultant')
#     date = request.data.get('date')
#     time = request.data.get('time')
#     try:
#         ConsultancyBooking.objects.create(booked_by=user, ticket=ticket, consultant=consultant, date=date, time=time)
#         return Response({'message': 'Booking successful'}, status=status.HTTP_201_CREATED)
#     except Exception as e:
#         print(e)
#         return Response({'message': str(e)}, status=status.HTTP_400_BAD_REQUEST)
@api_view(['GET'])
def booked(request, id):
    user = request.user
    if user.is_anonymous:
        return Response({'message': 'You are not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)

    try:
        times = [2, 3, 4, 5, 6]
        date = datetime.now().date()

        booked = ConsultancyBooking.objects.filter(
            booked_for__cid=id,
            date__year=date.year,
            date__month=date.month,
            date__day=date.day,
            time__hour__in=times,

        ).values_list('time__hour', flat=True)
        return Response({'time': booked}, status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response({'message': str(e)}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def my(request):
    user = request.user
    print(user)
    if user.is_anonymous:
        return Response({'message': 'You are not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)
    try:
        bookings = ConsultancyBooking.objects.filter(booked_by=user)
        serializer = ConsultancyBookingSerializer(bookings, many=True)

        return Response(serializer.data, status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response({'message': str(e)}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def booking(request):
    # id, booked_by, booked_for, date, time
    id = request.data.get('id')
    print(request.data)
    hour = request.data.get('hour')
    if hour > 9:

        time = "0{}:00:00".format(hour)
    else:
        time = "{}:00:00".format(hour)
    print(time)

    time = datetime.strptime(time, "%H:%M:%S").time()
    # convert hour to HH:MM:SS
    # time = datetime.strptime(str(hour), "%H:%M:%S")
    consultant = Consultant.objects.get(cid=id)
    user = request.user

    if user.is_anonymous:
        return Response({'message': 'You are not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)

    try:
        today = datetime.now()
        consultant = Consultant.objects.get(cid=id)
        if ConsultancyBooking.objects.filter(
                booked_for=consultant,
                date=today,
                time=time
        ).exists():
            print('Consultant is already booked for this time')

            return Response({'message':
                                 'Consultant is already booked for this time'},
                            status=status.HTTP_400_BAD_REQUEST)

        ConsultancyBooking.objects.create(booked_for=consultant, booked_by=user, date=today, time=time)

        return Response({'message': 'Booking successful'}, status=status.HTTP_201_CREATED)
    except Exception as e:
        print(e)
        if 'Consultant' in str(e):
            return Response({'message': 'Consultant not found'}, status=status.HTTP_400_BAD_REQUEST)

        print(e)
        return Response({'message': str(e)}, status=status.HTTP_400_BAD_REQUEST)
