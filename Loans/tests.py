# import os
# from datetime import datetime
#
# from django.utils import timezone
#
# from utilities import month_diff
#
# os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Root.settings')
#
# import django
#
# django.setup()
#
# from Users.models import User, StudentProfile
# from Products.models import Order
# from Products.serializer import OrderSerializer
# from Loans.serializer import LoanSerializer
#
# from Loans.models import Loan
#
#
#
# def installment_info():
#     data = {}
#     user=request.user
#     student = StudentProfile.objects.get(user=user)
#     salary = student.salary
#     monthly_installment = float(salary) * 0.4
#     loan = student.loan
#     if student.loan is None:
#         orders = Order.objects.filter(bill__customer=user)
#         if orders:
#             data['type'] = 'order'
#
#             order = Order.objects.filter(bill__customer=user)[0]
#             month = float(order.bill.price) // float(monthly_installment)
#             last_month = float(order.bill.price) % float(monthly_installment)
#             if last_month > 0:
#                 month = month + 1
#             today = datetime.now()
#             months_paid = month_diff(today, loan.apply_date)
#             month -= months_paid
#             data['month'] = month
#             data['installment'] = monthly_installment
#             data['last_month'] = last_month
#             data['amount'] = loan.amount.__str__()
#             data['start_date'] = loan.apply_date
#
#
#
#
#     else:
#         data['type'] = 'loan'
#         month = float(loan.amount) // float(monthly_installment)
#
#         last_month = float(loan.amount) % float(monthly_installment)
#         data['installment'] = monthly_installment
#         if last_month > 0:
#             month = month + 1
#
#         today = datetime.now()
#         months_paid = month_diff(today, loan.apply_date)
#         month -= months_paid
#         data['month'] = month
#         data['installment'] = monthly_installment
#         data['last_month'] = last_month
#         data['amount'] = loan.amount.__str__()
#         data['start_date'] = loan.apply_date
#
# # installment_info()
