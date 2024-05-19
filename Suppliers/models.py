from django.db import models


# Create your models here.
class Supplier(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=128)
    email = models.EmailField()
    address = models.TextField()
    logo = models.ImageField(upload_to='suppliers/images/')

    def __str__(self):
        return self.name
