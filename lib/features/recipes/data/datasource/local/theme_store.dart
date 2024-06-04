import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/features/recipes/data/managers/local/local_storage.dart';

class ThemeStore {
  final LocalStorageManager _manager;
  const ThemeStore(this._manager);

  String getTheme() {
    return _manager.getString(key: AppConstants.theme) ?? AppConstants.light;
  }

  Future<void> setTheme({required String theme}) async {
    await _manager.setString(key: AppConstants.theme, value: theme);
  }
}
