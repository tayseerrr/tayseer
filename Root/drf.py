from datetime import timedelta

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_simplejwt.authentication.JWTAuthentication',
    #     default permissions

    ),
    # 'DEFAULT_PERMISSION_CLASSES': (
    #     'rest_framework.permissions.AllowAny',
    # ),
}


SIMPLE_JWT = {
    'ACCESS_TOKEN_LIFETIME': timedelta(days=365),  # Short lifetime for the access token
    'REFRESH_TOKEN_LIFETIME': timedelta(days=365),  # Longer lifetime for the refresh token
    'ROTATE_REFRESH_TOKENS': True,  # Issue a new refresh token with each refresh request
    'BLACKLIST_AFTER_ROTATION': True,  # Blacklist old tokens after rotation
    "TOKEN_REFRESH_SERIALIZER": "Users.serializer.AppTokenRefreshSerializer",
    "TOKEN_OBTAIN_SERIALIZER": "Users.serializer.AppTokenObtainPairSerializer",
    # 'ACCESS_TOKEN_CLASS': 'Users.tokens.CustomAccessToken',
    # 'REFRESH_TOKEN_CLASS': 'Users.tokens.CustomRefreshToken',
}