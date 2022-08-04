import 'package:f_web_service_random_user_template/data/models/random_user_json_response_model.dart';
import 'package:loggy/loggy.dart';

import '../../data/datasources/local/user_local_datasource.dart';
import '../../data/datasources/remote/user_remote_datasource.dart';
import '../../data/models/random_user_model.dart';
import '../entities/random_user.dart';

class UserRepository {
  late UserRemoteDatatasource userRemote;
  late UserLocalDataSource userLocal;

  UserRepository() {
    userRemote = UserRemoteDatatasource();
    userLocal = UserLocalDataSource();
    logInfo("Starting UserRepository");
  }

  Future<bool> getUser() async {
    RandomUser usuario = await userRemote.getUser();
    userLocal.addUser(usuario);
    return Future.value(true);
  }

  Future<List<RandomUser>> getAllUsers() async => await userLocal.getAllUsers();

  Future<void> deleteUser(id) async => await userLocal.deleteUser(id);

  Future<void> deleteAll() async => await userLocal.deleteAll();

  Future<void> updateUser(user) async => await userLocal.updateUser(user);
}
