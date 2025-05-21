import 'package:flutter_test/flutter_test.dart';
import 'package:monthly_domain/entities/user.dart';

void main() {
  group('User', () {
    test('should create a User with all fields', () {
      final user = User(
        uid: '123',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'http://example.com/photo.jpg',
      );

      expect(user.uid, '123');
      expect(user.email, 'test@example.com');
      expect(user.name, 'Test User');
      expect(user.photoUrl, 'http://example.com/photo.jpg');
    });

    test('should create a User with null name and photoUrl', () {
      final user = User(
        uid: '456',
        email: 'another@example.com',
        name: null,
        photoUrl: null,
      );

      expect(user.uid, '456');
      expect(user.email, 'another@example.com');
      expect(user.name, isNull);
      expect(user.photoUrl, isNull);
    });
  });
}
