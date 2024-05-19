from django.db import models


class Loan(models.Model):

    id = models.AutoField(primary_key=True)
    status = models.BooleanField(default=False)
    amount = models.DecimalField(max_digits=10, decimal_places=2,default=3000)
    months_paid=models.IntegerField(default=0)
    approved_date = models.DateField(null=True, blank=True)
    approved_by = models.ForeignKey('Users.User',
                                    on_delete=models.CASCADE,
                                    related_name='approved_by',
                                    null=True, blank=True)
    apply_date = models.DateField(auto_now_add=True, null=True, blank=True)


    # 10 month

    def __str__(self):
        return (self.amount.__str__() + ' ' +
                # self.duration.__str__() + ' ' +
                self.status.__str__())
