import 'package:hive/hive.dart';

const _boxKey = 'token_store';
const _currentTokenKey = 'current_token';

class TokenStore {
  Future<String?> getCurrent() async {
    final box = await Hive.openBox<String>(_boxKey);
    return box.get(_currentTokenKey);
  }

  Future<void> setCurrent(String token) async {
    final box = await Hive.openBox<String>(_boxKey);
    await box.put(_currentTokenKey, token);
  }

  Future<void> clearCurrent() async {
    final box = await Hive.openBox<String>(_boxKey);
    await box.delete(_currentTokenKey);
  }
}
