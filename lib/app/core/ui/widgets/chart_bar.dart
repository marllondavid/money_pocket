import 'package:flutter/material.dart';
import 'package:money_pocket/app/core/ui/constants.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.label,
    required this.value,
    required this.percentage,
  });

  final String label;
  final double value;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      builder: (ctx, Constraints) {
        return Column(children: <Widget>[
          // ignore: sized_box_for_whitespace
          Container(
            height: Constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('${value.toStringAsFixed(2)},'),
            ),
          ),
          SizedBox(height: Constraints.maxHeight * 0.05),
          // ignore: sized_box_for_whitespace
          Container(
            height: Constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(5)),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsConstants.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: Constraints.maxHeight * 0.05),
          // ignore: sized_box_for_whitespace
          Container(
            height: Constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text(label),
            ),
          )
        ]);
      },
    );
  }
}
