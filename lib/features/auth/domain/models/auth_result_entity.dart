/// Clean domain entity representing the result of an authentication operation.
///
/// This is decoupled from the API response DTO — the data layer maps
/// DTOs into this entity via `toDomain()`, ensuring the domain layer
/// has zero knowledge of the API contract.
class AuthResultEntity {
  final String token;
  final String message;

  const AuthResultEntity({
    required this.token,
    required this.message,
  });
}
