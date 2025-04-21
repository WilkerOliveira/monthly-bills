import 'package:flutter_test/flutter_test.dart';
import 'package:monthly_login/modules/login/domain/entities/user_entity.dart';

void main() {
  group('UserEntity', () {
    test('should correctly initialize properties', () {
      const user = UserEntity(
        id: '123',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'http://example.com/photo.jpg',
      );

      expect(user.id, '123');
      expect(user.email, 'test@example.com');
      expect(user.name, 'Test User');
      expect(user.photoUrl, 'http://example.com/photo.jpg');
    });

    test('should support equality comparison', () {
      const user1 = UserEntity(
        id: '123',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'http://example.com/photo.jpg',
      );

      const user2 = UserEntity(
        id: '123',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'http://example.com/photo.jpg',
      );

      expect(user1, equals(user2));
    });

    test('should correctly handle null values', () {
      const user = UserEntity(id: '123', email: 'test@example.com');

      expect(user.id, '123');
      expect(user.email, 'test@example.com');
      expect(user.name, isNull);
      expect(user.photoUrl, isNull);
    });

    test('props should include all fields', () {
      const user = UserEntity(
        id: '123',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'http://example.com/photo.jpg',
      );

      expect(user.props, [
        '123',
        'test@example.com',
        'Test User',
        'http://example.com/photo.jpg',
      ]);
    });
  });
}
