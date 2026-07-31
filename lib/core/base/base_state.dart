/// Base state classes for the MVI (Model-View-Intent) pattern.
///
/// All Cubits in the app emit states that extend [BaseState<T>].
/// This provides a consistent pattern for handling loading, success, and error
/// states across the entire application.
sealed class BaseState<T> {
  const BaseState();
}

/// The initial idle state before any action has been taken.
class InitialState<T> extends BaseState<T> {
  const InitialState();
}

/// Indicates that an async operation is in progress.
class LoadingState<T> extends BaseState<T> {
  const LoadingState();
}

/// The operation completed successfully with [data].
class SuccessState<T> extends BaseState<T> {
  final T data;
  const SuccessState(this.data);
}

/// The operation failed with an error [message].
class ErrorState<T> extends BaseState<T> {
  final String message;
  const ErrorState(this.message);
}
