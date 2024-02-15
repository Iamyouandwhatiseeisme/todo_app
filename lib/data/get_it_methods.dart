import 'package:todo_app/main.dart';
import 'package:todo_app/presentation/widgets/custom_bottom_navigatio_bar_widget.dart';

import '../presentation/presentation_widgets.dart';

void setUp() {
  sl.registerSingleton<NavigatorClient>(NavigatorClient());
  sl.registerSingleton<TasksDataSource>(TasksDataSource());
  sl.registerSingleton<CustomBottomNavigationBar>(
      const CustomBottomNavigationBar());
}
