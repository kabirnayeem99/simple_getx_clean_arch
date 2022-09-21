import 'package:simple_getx_clean_arch/domain/entity/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
