
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<ChangeColorThemeEvent>(_changeColorTheme);
    on<SwitchThemeEvent>(_changeTheme);
    on<InitThemeEvent>(_initTheme);
  }

  void _initTheme(InitThemeEvent event, Emitter<ThemeState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int color = prefs.getInt('color') ?? 0xFF4CAF50;
    final bool isDark = prefs.getBool('isDark') ?? false;
    emit(ThemeState(isDark: isDark, color: color));
  }

  void _changeColorTheme(ChangeColorThemeEvent event, Emitter<ThemeState> emit) async {
    var color = event.mainColor;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('color', color);
    final bool isDark = prefs.getBool('isDark') ?? false;
    emit(ThemeState(color: color, isDark: isDark));
  }

  void _changeTheme(SwitchThemeEvent event, Emitter<ThemeState> emit) async {
    var isDark = event.turnOnDarkTheme;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
    final int color = prefs.getInt('color') ?? 0xFF4CAF50;
    emit(ThemeState(isDark: isDark, color: color));
  }

}
