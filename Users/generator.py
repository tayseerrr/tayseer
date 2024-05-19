from django.test import TestCase

import os
from datetime import datetime

from django.utils import timezone

from utilities import month_diff

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Root.settings')

import django

django.setup()
# Add this import statement at the top of your file
from faker import Faker
from Users.models import User, StudentProfile

# Inside your Django management command or any other function where you want to generate fake users
def generate_fake_users(number_users=0):
    fake = Faker()

    # Your existing code for the model and manager goes here

    # Now, you can create fake users using Faker
    first_names = ['ali', 'abdullah', 'turki', 'mohammed', 'khalid', 'fahad', 'bandar', 'saud', 'sara', 'noura', 'reem',
                   'nawal', 'nora', 'maha', 'lina', 'lolo', 'lulu', 'lala', 'nada', 'nadia', 'najla', 'najwa', 'najat', ]
    last_names = ['ali', 'abdullah', 'turki', 'mohammed', 'khalid', 'fahad', 'bandar', 'saud', 'nadir', 'nasser', 'nawaf',
                  'nizar', 'mushtaq', 'musa', 'musharraf', 'mushir', 'mushin']
    domains = ['gmail.com', 'yahoo.com', 'hotmail.com', 'outlook.com', 'example.com',
               'test.com', 'mail.com', 'live.com', 'aol.com', 'icloud.com', 'protonmail.com', 'zoho.com', 'yandex.com',
               ]
    collages = [
        "Institute of Technology",
        "Engineering College",
        "Polytechnic Institute",
        "School of Engineering",
        "Technical University",
        "College of Engineering and Technology",
        "Engineering Institute",
        "Technology College",
        "Polytechnic College",
        "School of Applied Sciences",
        "College of Fine Arts",
        "School of Arts and Humanities",
        "Institute of Arts",
        "Art Academy",
        "Creative Arts College",
        "Fine Arts Institute",
        "School of Performing Arts",
        "Humanities College",
        "Visual Arts Institute",
        "Drama School",
        "Business School",
        "College of Business Administration",
        "School of Management",
        "Institute of Business Studies",
        "Business Academy",
        "Management Institute",
        "School of Economics",
        "Finance College",
        "Entrepreneurship Center",
        "Marketing Institute",
        "Medical College",
        "School of Medicine",
        "Health Sciences Institute",
        "Medical University",
        "College of Physicians and Surgeons",
        "Healthcare Academy",
        "Medical Institute",
        "School of Nursing",
        "Pharmacy College",
        "Dental School",
        "Law School",
        "College of Law",
        "Legal Studies Institute",
        "Law and Justice Academy",
        "Judicial College",
        "Legal Affairs Institute",
        "School of Criminal Justice",
        "Jurisprudence Center",
        "Human Rights Institute",
        "International Law College",
        "Science College",
        "School of Sciences",
        "Science Institute",
        "Research Center for Science",
        "Mathematics Academy",
        "Physics College",
        "Chemistry Institute",
        "Biology School",
        "Earth Sciences College",
        "Environmental Studies Center",
        "Education College",
        "School of Education",
        "Teacher Training Institute",
        "Pedagogy College",
        "Educational Psychology Center",
        "Institute for Teacher Development",
        "Education Leadership Academy",
        "Special Education School",
        "Early Childhood Education Center",
        "Curriculum Development Institute",
        "Social Sciences College",
        "School of Social Work",
        "Sociology Institute",
        "Anthropology College",
        "Political Science School",
        "Psychology Institute",
        "Cultural Studies Center",
        "Public Policy School",
        "Gender Studies Institute",
        "Development Studies College",
        "Information Technology College",
        "School of Information Sciences",
        "Computer Science Institute",
        "Software Engineering College",
        "Cybersecurity Academy",
        "Data Science Institute",
        "Information Systems School",
        "Network Engineering College",
        "IT Management Institute",
        "Digital Innovation Center"
    ]

    # Now, you can create fake users using Faker
    for i in range(number_users):
        # Generate 10 fake users, you can adjust the number as needed
        print(i)
        first_name = fake.random_element(elements=first_names)
        last_name = fake.random_element(elements=last_names)
        email = first_name + "." + last_name + "@" + fake.random_element(elements=domains)
        password = 'test1234'

        try:
            user = User.objects.create_user(email=email, first_name=first_name, last_name=last_name)
            user.set_password(password)
            user.is_active = True
            user.account_type = 'student'
            user.address = fake.address()
            user.date_of_birth = fake.date_of_birth()
            #  user, roll_no, specialization, collage, enrollment_year, level, average, study_type,loan
            enrollment_year = [2019, 2020, 2021, 2022, 2023, 2024, ]
            level = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
            average = [1.0, 1.1, 1.5, 1.8,
                       2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
            study_type = [1, 2, 3]
            specializations = specializations = [
                "Mechanical",
                "Electrical",
                "Civil",
                "Computer",
                "Chemical",
                "Aerospace",
                "Biomedical",
                "Environmental",
                "Industrial",
                "Petroleum",
                "Fine Arts",
                "Performing Arts",
                "Visual Arts",
                "Music",
                "Dance",
                "Theater",
                "Sculpture",
                "Photography",
                "Film Studies",
                "Graphic Design",
                "Finance",
                "Marketing",
                "Management",
                "Entrepreneurship",
                "Accounting",
                "International Business",
                "Human Resources",
                "Supply Chain Management",
                "Economics",
                "Business Analytics",
                "General Medicine",
                "Surgery",
                "Pediatrics",
                "Internal Medicine",
                "Obstetrics and Gynecology",
                "Orthopedics",
                "Neurology",
                "Psychiatry",
                "Dermatology",
                "Radiology",
                "Corporate Law",
                "Criminal Law",
                "International Law",
                "Constitutional Law",
                "Environmental Law",
                "Intellectual Property Law",
                "Human Rights Law",
                "Family Law",
                "Tax Law",
                "Labor Law",
                "Physics",
                "Chemistry",
                "Biology",
                "Mathematics",
                "Geology",
                "Astronomy",
                "Biochemistry",
                "Genetics",
                "Ecology",
                "Microbiology",
                "Elementary Education",
                "Secondary Education",
                "Special Education",
                "Educational Leadership",
                "Curriculum and Instruction",
                "Early Childhood Education",
                "Educational Psychology",
                "Adult Education",
                "TESOL",
                "Educational Technology",
                "Sociology",
                "Psychology",
                "Anthropology",
                "Political Science",
                "Economics",
                "Geography",
                "History",
                "Criminology",
                "Social Work",
                "Development Studies",
                "Software Development",
                "Computer Science",
                "Information Systems",
                "Cybersecurity",
                "Data Science",
                "Network Engineering",
                "Web Development",
                "Database Management",
                "Artificial Intelligence",
                "Mobile App Development"
            ]

            collages = [
                "Engineering", "Computer Science", "Information Technology", "Software Engineering", "Information Systems",
                "Data Science", "Artificial Intelligence", "Machine Learning", "Deep Learning",
                "Natural Language Processing",
                "Computer Vision", "Human Computer Interaction", "User Experience", "User Interface", "Database",
                "Data Science",
                "Design and Analysis of Algorithms", "Computer Networks", "Operating Systems", "Security and Privacy",
                "Cloud Computing",
            ]
            collage = fake.random_element(elements=collages)
            specialization = fake.random_element(elements=specializations)
            enrollment_year = fake.random_element(elements=enrollment_year)
            level = fake.random_element(elements=level)
            average = fake.random_element(elements=average)
            study_type = fake.random_element(elements=study_type)
            profile = StudentProfile.objects.create(user=user, roll_no=fake.random_int(min=100000, max=999999),
                                                    specialization=specialization, collage=collage,
                                                    enrollment_year=enrollment_year, level=level, average=average,
                                                    study_type=study_type)

            user.save()
        except Exception as e:
            print(e)
            continue
# users = User.objects.all()
# users.update(is_active=True)
