import 'package:flutter_test/flutter_test.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/modules/login/data/models/user_model.dart';

import '../../../../mocks/firebase/mocks_firebase.dart';

void main() {
  final mockUser = MockUser();

  setUp(() {
    when(() => mockUser.uid).thenReturn('123');
    when(() => mockUser.email).thenReturn('johndoe@example.com');
    when(() => mockUser.displayName).thenReturn('John Doe');
    when(() => mockUser.photoURL).thenReturn('http://example.com/photo.jpg');
  });

  group('UserModel', () {
    test('should create a valid UserModel from Firebase User', () {
      final userModel = UserModel.fromFirebase(mockUser);

      expect(userModel.uid, '123');
      expect(userModel.displayName, 'John Doe');
      expect(userModel.email, 'johndoe@example.com');
      expect(userModel.photoURL, 'http://example.com/photo.jpg');
    });

    test('should handle null values in Firebase User', () {
      when(() => mockUser.uid).thenReturn('123');
      when(() => mockUser.email).thenReturn(null);
      when(() => mockUser.displayName).thenReturn(null);
      when(() => mockUser.photoURL).thenReturn(null);

      final userModel = UserModel.fromFirebase(mockUser);

      expect(userModel.uid, '123');
      expect(userModel.displayName, '');
      expect(userModel.email, '');
      expect(userModel.photoURL, '');
    });

    test('should convert UserModel to UserEntity correctly', () {
      final userModel = UserModel(
        uid: '123',
        displayName: 'John Doe',
        email: 'johndoe@example.com',
        photoURL: 'http://example.com/photo.jpg',
      );

      final userEntity = userModel.toEntity();

      expect(userEntity.id, '123');
      expect(userEntity.name, 'John Doe');
      expect(userEntity.email, 'johndoe@example.com');
      expect(userEntity.photoUrl, 'http://example.com/photo.jpg');
    });
  });
}
