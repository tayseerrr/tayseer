from datetime import datetime


def month_diff(date1, date2):
    """Calculate the difference in months between two dates."""
    # Convert datetime.datetime to datetime.date if necessary
    if isinstance(date1, datetime):
        date1 = date1.date()
    if isinstance(date2, datetime):
        date2 = date2.date()

    if date2 < date1:  # Ensure date2 is later than date1
        date1, date2 = date2, date1
    return (date2.year - date1.year) * 12 + date2.month - date1.month


# Example usage
