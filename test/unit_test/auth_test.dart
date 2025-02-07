import 'package:fitflex/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthEntity', () {
    test('should support value equality', () {
      const auth1 = AuthEntity(
        userId: '123',
        name: 'Aashrit Shrestha',
        email: 'aashrit@example.com',
        phone: '1234567890',
        password: 'securePassword',
        image: 'profile.jpg',
      );

      const auth2 = AuthEntity(
        userId: '123',
        name: 'Aashrit Shrestha',
        email: 'aashrit@example.com',
        phone: '1234567890',
        password: 'securePassword',
        image: 'profile.jpg',
      );

      expect(auth1, equals(auth2));
    });

    test('should have correct props for equality', () {
      const auth = AuthEntity(
        userId: '123',
        name: 'Aashrit Shrestha',
        email: 'aashrit@example.com',
        phone: '1234567890',
        password: 'securePassword',
        image: 'profile.jpg',
      );

      expect(
          auth.props,
          containsAll([
            '123',
            'Aashrit Shrestha',
            'aashrit@example.com',
            '1234567890',
            'securePassword'
          ]));
    });

    test('should differentiate objects with different properties', () {
      const auth1 = AuthEntity(
        userId: '123',
        name: 'Aashrit Shrestha',
        email: 'aashrit@example.com',
        phone: '1234567890',
        password: 'securePassword',
      );

      const auth2 = AuthEntity(
        userId: '456',
        name: 'Jane Doe',
        email: 'jane.doe@example.com',
        phone: '0987654321',
        password: 'anotherPassword',
      );

      expect(auth1, isNot(equals(auth2)));
    });

    test('should allow nullable userId and image', () {
      const auth = AuthEntity(
        name: 'Aashrit Shrestha',
        email: 'aashrit@example.com',
        phone: '1234567890',
        password: 'securePassword',
      );

      expect(auth.userId, isNull);
      expect(auth.image, isNull);
    });

    test('should create instance with all fields', () {
      const auth = AuthEntity(
        userId: '789',
        name: 'Alice Smith',
        email: 'alice.smith@example.com',
        phone: '9876543210',
        password: 'mypassword',
        image: 'avatar.png',
      );

      expect(auth.userId, '789');
      expect(auth.name, 'Alice Smith');
      expect(auth.email, 'alice.smith@example.com');
      expect(auth.phone, '9876543210');
      expect(auth.password, 'mypassword');
      expect(auth.image, 'avatar.png');
    });

    test('should handle empty strings correctly', () {
      const auth = AuthEntity(
        userId: '',
        name: '',
        email: '',
        phone: '',
        password: '',
        image: '',
      );

      expect(auth.userId, '');
      expect(auth.name, '');
      expect(auth.email, '');
      expect(auth.phone, '');
      expect(auth.password, '');
      expect(auth.image, '');
    });

    test('should ignore image in equality comparison', () {
      const auth1 = AuthEntity(
        userId: '001',
        name: 'Aashrit Shrestha',
        email: 'aashrit@example.com',
        phone: '1234567890',
        password: 'securePass',
        image: 'img1.jpg',
      );

      const auth2 = AuthEntity(
        userId: '001',
        name: 'Aashrit Shrestha',
        email: 'aashrit@example.com',
        phone: '1234567890',
        password: 'securePass',
        image: 'img2.jpg',
      );

      expect(auth1, equals(auth2));
    });

    test('should compare only relevant fields in props', () {
      const auth = AuthEntity(
        userId: '101',
        name: 'Aashrit Shrestha',
        email: 'aashrit@example.com',
        phone: '123456789',
        password: 'pass123',
        image: 'test.jpg',
      );

      expect(
          auth.props,
          containsAll([
            '101',
            'Aashrit Shrestha',
            'aashrit@example.com',
            '123456789',
            'pass123'
          ]));
    });

    test('should differentiate instances with different passwords', () {
      const auth1 = AuthEntity(
        userId: '102',
        name: 'Aashrit Shrestha',
        email: 'aashrit@example.com',
        phone: '987654321',
        password: 'passOne',
      );

      const auth2 = AuthEntity(
        userId: '102',
        name: 'Aashrit Shrestha',
        email: 'aashrit@example.com',
        phone: '987654321',
        password: 'passTwo',
      );

      expect(auth1, isNot(equals(auth2)));
    });

    test('should ensure email is properly stored', () {
      const auth = AuthEntity(
        name: 'Aashrit Shrestha',
        email: 'aashrit@example.com',
        phone: '111222333',
        password: 'emailPass',
      );

      expect(auth.email, 'aashrit@example.com');
    });
  });
}
