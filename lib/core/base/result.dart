/// A functional wrapper for operation results.
///
/// Used by repositories and data sources to return either a successful result
/// or a failure, without throwing exceptions across layer boundaries.
///
/// This follows the Dependency Inversion Principle — domain layer defines
/// this contract, and data layer uses it to wrap responses.
sealed class Result<T> {
  const Result();
}

/// Represents a successful operation with [data].
class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

/// Represents a failed operation with an error [message].
class ServerFailure<T> extends Result<T> {
  final String message;
  const ServerFailure(this.message);
}
