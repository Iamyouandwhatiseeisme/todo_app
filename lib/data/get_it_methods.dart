import 'package:todo_app/main.dart';

import '../presentation/presentation_widgets.dart';

void setUp() {
  sl.registerSingleton<NavigatorClient>(NavigatorClient());
  sl.registerSingleton<TasksDataSource>(TasksDataSource());
}
