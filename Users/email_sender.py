import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


# Create a MIME multipart message object
def send_email(

        code: str,
        email: str,
):
    msg = MIMEMultipart('alternative')
    msg['Subject'] = "تأكيد البريد الإلكتروني"
    msg['From'] = 'tayseer.20240@gmail.com'
    msg['To'] = email

    # Email body with placeholders for the code and the link
    html_content = """<!DOCTYPE html>
    <html lang="ar" dir="rtl">
    <head>
    <meta charset="UTF-8">
    <title>تأكيد البريد الإلكتروني</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Tajawal:wght@200;300;400;500;700;800;900&display=swap');
    *{
    font-family: 'Tajawal', sans-serif !important
    }

        body {
            font-family: 'Tajawal', sans-serif;
            background-color: #006972;
            margin: 0;
            padding: 0;
            color: black;
        }
        .email-container {
            max-width: 600px;
            margin: auto;
            background: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .header {
            background-color: #006972;
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 24px;
        }
        .content {
            padding: 20px;
            text-align: center;
            line-height: 1.6;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background-color: #006972;
            color: white !important;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
        }

        a.button:hover {
            background-color: #45a049;
            color: white;
            }
            a.button:active {
            background-color: #45a049;}
            a.button:visited {
            background-color: #45a049;}
        .footer {
            text-align: center;
            padding: 10px;
            font-size: 12px;
            color: #777777;
        }
    </style>
    </head>
    <body>
    <div class="email-container">
        <div class="header">
            منصة تيسير
        </div>
        <div class="content">
            <h1>مرحبًا بك في منصة تيسير!</h1>
            <h2>
            كود التحقق الخاص بك هو: <span style="color: #4CAF50; font-weight: bold;font-size:24px">#CODE</span>
            </h2>

            <p>إذا واجهت أي مشاكل، يرجى التواصل مع دعم العملاء.</p>
        </div>
        <div class="footer">
            © 2024 منصة تيسير. جميع الحقوق محفوظة.
        </div>
    </div>
    </body>
    </html>
    """

    # <p>شكرًا لتسجيلك. يرجى تأكيد عنوان بريدك الإلكتروني بالنقر على الرابط أدناه لتفعيل حسابك.</p>
    #             <a href="#LINK" class="button">تأكيد البريد الإلكتروني</a>
    # Replace placeholders in the HTML content
    html_content = html_content.replace("#CODE", code).replace("#LINK", "http://localhost:8000/verify-email/123456")

    # Attach the HTML part
    part = MIMEText(html_content, 'html', 'utf-8')
    msg.attach(part)

    # Send the email
    server = smtplib.SMTP('smtp.gmail.com', 587)
    try:
        server.starttls()
        server.login('tayseer.20240@gmail.com', 'fiwd acbd xgum acll')
        server.sendmail(msg['From'], msg['To'], msg.as_string())
        print("Email sent successfully!")
    except Exception as e:
        print("SMTP error:", e)
    finally:
        server.quit()
# send_email(subject="Test Email", code="123456", email='salahaldinalhajsoft@gmail.com')