from django.db import models


class Consultant(models.Model):
    cid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=64)
    specialization = models.IntegerField()
    experience = models.IntegerField()
    description = models.TextField(max_length=256)
    profile_picture = models.ImageField(upload_to='consultants/profile_pictures/', blank=True, null=True)

    def __str__(self):
        return self.name + ' - ' + str(self.specialization)


class ConsultancyBooking(models.Model):
    id = models.AutoField(primary_key=True)
    booked_by = models.ForeignKey('Users.User',
                                  on_delete=models.CASCADE,
                                  related_name='consultancy_bookings',
                                  blank=True, null=True)
    booked_for = models.ForeignKey('ConsultanciesServices.Consultant',
                                   on_delete=models.CASCADE,
                                   related_name='consultancy_bookings',
                                   blank=True, null=True)

    date = models.DateField(blank=True, null=True)
    time = models.TimeField(blank=True, null=True)
    # id, booked_by, booked_for, date, time

    class Meta:
        unique_together = ('booked_by', 'booked_for', 'date', 'time')

    def __str__(self):
        return self.booked_for.name + ' - ' + self.booked_by.get_full_name()
