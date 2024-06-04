abstract class ThemeRepo {
  String getTheme();
  Future<void> setTheme({required String theme});
}
