import 'package:flutter/widgets.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/ui/screens/countries/widgets/countries_body_widget.dart';
import 'package:task/ui/screens/countries/widgets/paginator_widget.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CountriesBodyWidget(),
        24.vSpace,
        const PaginatorWidget(),
      ],
    );
  }
}
