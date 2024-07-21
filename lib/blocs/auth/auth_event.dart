part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String firstname;
  final String secondname;

  AuthSignUpRequested({
    required this.email, 
    required this.password,
    required this.firstname,
    required this.secondname
    });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthSignUpRequested &&
        other.email == email &&
        other.password == password &&
        other.firstname == firstname &&
        other.secondname == secondname;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode ^ firstname.hashCode ^ secondname.hashCode;
}

class AuthSignInRequested extends AuthEvent {
  final String email;
  final String password;

  AuthSignInRequested({required this.email, required this.password});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthSignInRequested &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}

class AuthGoogleSignInRequested extends AuthEvent {}

class AuthSignOutRequested extends AuthEvent {}

class AuthResetPasswordRequested extends AuthEvent {
  final String email;

  AuthResetPasswordRequested({required this.email});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthResetPasswordRequested && other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}

class AuthCheckStatusRequested extends AuthEvent {}

class AuthSetEmailRequested extends AuthEvent {
  final String email;

  AuthSetEmailRequested({required this.email});
}