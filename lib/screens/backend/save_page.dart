import 'package:shared_preferences/shared_preferences.dart';

class NavigationState {
	static const String _currentRouteKey = 'currentRoute';

	Future<void> saveCurrentRoute(String routeName) async {
		final prefs = await SharedPreferences.getInstance();
		await prefs.setString(_currentRouteKey, routeName);
	}

	Future<String?> getCurrentRoute() async {
		final prefs = await SharedPreferences.getInstance();
		return prefs.getString(_currentRouteKey);
	}

	Future<void> clearCurrentRoute() async {
    	final prefs = await SharedPreferences.getInstance();
    	await prefs.remove(_currentRouteKey);
  	}
}