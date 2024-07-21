import 'package:MyApp/repositories/cloud_repository.dart';
import 'package:bloc/bloc.dart';
import '../../models/application_user.dart';
import '../../repositories/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final CloudRepository _cloudRepository;
  String? _email;

  AuthBloc({required AuthRepository authRepository, required CloudRepository cloudRepository})
      : _authRepository = authRepository,
        _cloudRepository = cloudRepository,
        super(AuthInitial()) {
    on<AuthSignUpRequested>(_onSignUpRequested);
    on<AuthSignInRequested>(_onSignInRequested);
    on<AuthGoogleSignInRequested>(_onGoogleSignInRequested);
    on<AuthSignOutRequested>(_onSignOutRequested);
    on<AuthResetPasswordRequested>(_onResetPasswordRequested);
    on<AuthCheckStatusRequested>(_onCheckStatusRequested);
    on<AuthSetEmailRequested>(_onSetEmailRequested);
  }

  void _onSignUpRequested(AuthSignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.signUpWithEmailAndPassword(event.email, event.password);
      if (user != null) {
        await _cloudRepository.saveProfileData(user.uid, event.firstname, event.secondname, event.email, '');
        emit(AuthAuthenticated(user: ApplicationUser(user: user)));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onSignInRequested(AuthSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.signInWithEmailAndPassword(event.email, event.password);
      if (user != null) {
        emit(AuthAuthenticated(user: ApplicationUser(user: user)));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onGoogleSignInRequested(AuthGoogleSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.signInWithGoogle();
      if (user != null) {
        emit(AuthAuthenticated(user: ApplicationUser(user: user)));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onSignOutRequested(AuthSignOutRequested event, Emitter<AuthState> emit) async {
    await _authRepository.signOut();
    emit(AuthUnauthenticated());
  }

  void _onResetPasswordRequested(AuthResetPasswordRequested event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.resetPassword(event.email);
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onCheckStatusRequested(AuthCheckStatusRequested event, Emitter<AuthState> emit) {
    final user = _authRepository.getCurrentUser();
    if (user != null) {
      emit(AuthAuthenticated(user: ApplicationUser(user: user)));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void _onSetEmailRequested(AuthSetEmailRequested event, Emitter<AuthState> emit) {
    _email = event.email;
    emit(AuthEmailUpdated(email: event.email));
  }

  String? get email => _email;
}
