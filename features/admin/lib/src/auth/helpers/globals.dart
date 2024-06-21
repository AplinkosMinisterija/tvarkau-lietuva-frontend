class Globals {
  String azureAccessToken = "";

  Globals._privateConstructor();

  static final Globals _instance = Globals._privateConstructor();

  static Globals get instance => _instance;

  static const String aadTenantId = '74edcdf9-ca2e-4601-9982-4e2df1ba3a54';
  static const String aadClientId = '0408503a-ada6-4a72-8823-c52ca0fe5b43';
  static const String aadScope = 'openid profile offline_access user.read';

  static const String amvmtTenantId = '921d51c1-8cd9-4bbe-858e-0202aa639ec9';
  static const String amvmtClientId = 'df0f4f9c-75f3-4287-9331-f2e5a3edf76c';
  static const String amvmtScope = 'openid profile offline_access user.read';

}
