import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:social_app/core/viewmodels/base_model.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<BaseModel>(create: (_) => BaseModel()),
  ];
}
