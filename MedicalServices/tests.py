from datetime import datetime

def month_diff(date1, date2):
    if date2 < date1:  # Ensure date2 is later than date1
        date1, date2 = date2, date1
    return (date2.year - date1.year) * 12 + date2.month - date1.month

# Example usage
today = datetime.now()
loan_apply_date = datetime(2023, 1, 27)
# Assuming the loan was applied for on December 1, 2023
months_paid = month_diff(loan_apply_date, today)
print(months_paid)
