import '../../../domain/entity/user.dart';

class UsersUiState {
  bool isLoading;
  List<User> users;

  UsersUiState({
    required this.isLoading,
    required this.users,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersUiState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          users == other.users);

  @override
  int get hashCode => isLoading.hashCode ^ users.hashCode;

  @override
  String toString() {
    return 'UsersUiState{ isLoading: $isLoading, users: $users,}';
  }

  UsersUiState copyWith({
    bool? isLoading,
    List<User>? users,
  }) {
    return UsersUiState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
    );
  }

  factory UsersUiState.init() {
    return UsersUiState(
      isLoading: true,
      users: List.empty(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'users': users,
    };
  }

  factory UsersUiState.fromMap(Map<String, dynamic> map) {
    return UsersUiState(
      isLoading: map['isLoading'] as bool,
      users: map['users'] as List<User>,
    );
  }
}
