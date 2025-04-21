import 'package:flutter_test/flutter_test.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/modules/login/data/datasources/firebase_datasource.dart';
import 'package:monthly_login/modules/login/data/models/user_model.dart';

import '../../../../mocks/firebase/mocks_firebase.dart';

void main() {
  final dummyAuthCredential = GoogleAuthProvider.credential(
    idToken: 'idToken',
    accessToken: 'accessToken',
  );

  late FirebaseDatasourceImpl datasource;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockGoogleSignIn mockGoogleSignIn;

  setUpAll(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockGoogleSignIn = MockGoogleSignIn();
    datasource = FirebaseDatasourceImpl(
      firebaseAuth: mockFirebaseAuth,
      googleSignIn: mockGoogleSignIn,
    );

    registerFallbackValue(dummyAuthCredential);
  });

  group('signInWithGoogle', () {
    test('should return a UserModel when sign-in is successful', () async {
      final mockGoogleSignInAccount = MockGoogleSignInAccount();
      final mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();
      final mockUserCredential = MockUserCredential();
      final mockUser = MockUser();

      when(
        () => mockGoogleSignIn.signIn(),
      ).thenAnswer((_) async => mockGoogleSignInAccount);
      when(
        () => mockGoogleSignInAccount.authentication,
      ).thenAnswer((_) async => mockGoogleSignInAuthentication);
      when(
        () => mockGoogleSignInAuthentication.accessToken,
      ).thenReturn('accessToken');
      when(() => mockGoogleSignInAuthentication.idToken).thenReturn('idToken');
      when(
        () => mockFirebaseAuth.signInWithCredential(any()),
      ).thenAnswer((_) async => mockUserCredential);
      when(() => mockUserCredential.user).thenReturn(mockUser);
      when(() => mockUser.uid).thenReturn('123');
      when(() => mockUser.email).thenReturn('test@example.com');
      when(() => mockUser.displayName).thenReturn('Test User');

      final result = await datasource.signInWithGoogle();

      expect(result, isA<UserModel>());
      expect(result.uid, '123');
      expect(result.email, 'test@example.com');
      expect(result.displayName, 'Test User');
    });

    test('should throw an exception when sign-in fails', () async {
      when(() => mockGoogleSignIn.signIn()).thenThrow(Exception());
      when(
        () => mockFirebaseAuth.signInWithCredential(any()),
      ).thenThrow((_) async => Exception());
      expect(() => datasource.signInWithGoogle(), throwsException);
    });
  });

  group('signOut', () {
    test('should call signOut on both FirebaseAuth and GoogleSignIn', () async {
      when(() => mockGoogleSignIn.signOut()).thenAnswer((_) async {
        return null;
      });
      when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async {});

      await datasource.signOut();

      verify(() => mockGoogleSignIn.signOut()).called(1);
      verify(() => mockFirebaseAuth.signOut()).called(1);
    });
  });

  group('getCurrentUser', () {
    test('should return a UserModel when a user is signed in', () {
      final mockUser = MockUser();

      when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
      when(() => mockUser.uid).thenReturn('123');
      when(() => mockUser.email).thenReturn('test@example.com');
      when(() => mockUser.displayName).thenReturn('Test User');

      final result = datasource.getCurrentUser();

      expect(result, isA<UserModel>());
      expect(result?.uid, '123');
      expect(result?.email, 'test@example.com');
      expect(result?.displayName, 'Test User');
    });

    test('should return null when no user is signed in', () {
      when(() => mockFirebaseAuth.currentUser).thenReturn(null);

      final result = datasource.getCurrentUser();

      expect(result, isNull);
    });
  });
}
