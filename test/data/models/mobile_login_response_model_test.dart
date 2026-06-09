import 'package:eeagle_ai/src/data/models/json_readers.dart';
import 'package:eeagle_ai/src/data/models/mobile_login_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses successful mobile login response', () {
    final model = MobileLoginResponseModel.fromJson({
      'status': 'ok',
      'message': 'Signed in successfully.',
      'access_token': 'jwt-token',
      'token_type': 'Bearer',
      'expires_in': 2592000,
      'access_token_expires_at': '2026-07-07T10:15:00+00:00',
      'user': {
        'id': 'user-1',
        'email': 'owner@example.com',
        'email_verified': true,
        'admin': false,
      },
    });

    expect(model.accessToken, 'jwt-token');
    expect(model.toEntity().accessToken, 'jwt-token');
  });

  test('parses nested login payload', () {
    final model = MobileLoginResponseModel.fromJson({
      'data': {
        'status': 'ok',
        'access_token': 'jwt-token',
      },
    });

    expect(model.accessToken, 'jwt-token');
  });

  test('handles null access token without throwing during fromJson', () {
    final model = MobileLoginResponseModel.fromJson({
      'status': 'ok',
      'message': 'Email verification required.',
      'access_token': null,
    });

    expect(model.accessToken, isNull);
    expect(
      () => model.toEntity(),
      throwsA(isA<FormatException>()),
    );
  });

  test('readNullableString ignores empty strings', () {
    expect(readNullableString(''), isNull);
    expect(readNullableString('token'), 'token');
  });
}
