from django.contrib.auth import get_user_model
from django.db import models

USER_CLASS = get_user_model()
LEVEL_CHOICES = (
    ("1", "First Year"),
    ("2", "Second Year"),
    ("3", "Third Year"),
    ("4", "Fourth Year"),
    ("5", "Fifth Year"),
    ("6", "Sixth Year"),
    ("7", "Seventh Year"),

)


class StudentProfile(models.Model):
    salary=models.DecimalField(max_digits=10, decimal_places=2,default=850)
    user = models.OneToOneField(USER_CLASS, on_delete=models.CASCADE, )
    roll_no = models.CharField(max_length=20, unique=True, blank=True, null=True)
    specialization = models.CharField(max_length=64, blank=True, null=True)
    collage = models.CharField(max_length=64, blank=True, null=True)
    enrollment_year = models.PositiveIntegerField(
        help_text='Format: YYYY',
        blank=True, null=True
    )
    level = models.CharField(max_length=1, choices=LEVEL_CHOICES, default='1')
    average = models.FloatField(
        help_text='Average grade',
        default=0.0
    )
    STUDY_TYPE_CHOICES = (
        (1, 'Regular'),
        (2, 'Distance'),
        (3, 'Online'),
    )
    study_type = models.PositiveIntegerField(choices=STUDY_TYPE_CHOICES, default=1)
    loan = models.ForeignKey('Loans.Loan', on_delete=models.SET_NULL, blank=True, null=True)
    # #     Warning if user have warning from university
    warning = models.BooleanField(default=False)
    # is user near to graduation
    graduation = models.BooleanField(default=False)


    # user, roll_no, specialization, collage, enrollment_year, level, average, study_type,loan

    def __str__(self):
        return self.user.email
