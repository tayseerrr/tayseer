String checkPasswordRequirements(String password) {
  List<String> missingComponents = [];

  // Regular expressions for different types of characters
  bool hasLowercase = RegExp(r'[a-z]').hasMatch(password);
  bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
  bool hasDigits = RegExp(r'\d').hasMatch(password);
  bool hasSymbols = RegExp(r'[!@#\$&*~]').hasMatch(password); // Add more symbols if needed

  // Check for missing components
  if (!hasLowercase) missingComponents.add('حروف صغيرة');
  if (!hasUppercase) missingComponents.add('حروف كبيرة');
  if (!hasDigits) missingComponents.add('أرقام');
  if (!hasSymbols) missingComponents.add('رموز');
  if (password.length < 12) missingComponents.add('12 حرفًا على الأقل');

  // Return message based on missing components
  if (missingComponents.isEmpty) {
    return '';
  //   checkPasswordRequirements
  } else {
    return 'كلمة المرور تفتقر إلى: ${missingComponents.join(' و ')}';
  }
}

