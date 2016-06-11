from django.db import models

class Image(models.Model):
  url = models.ImageField(upload_to = 'images/')