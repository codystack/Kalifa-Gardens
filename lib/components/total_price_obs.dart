import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalifa_gardens/controller/state_controller.dart';

class TotalPriceObs extends StatefulWidget {
  const TotalPriceObs(
      {Key? key, required this.selectedPlotSize, this.formatMoney})
      : super(key: key);
  final int? selectedPlotSize;
  final String? formatMoney;

  @override
  _TotalPriceObsState createState() => _TotalPriceObsState();
}

class _TotalPriceObsState extends State<TotalPriceObs> {
  final _controller = Get.find<StateController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _controller.totalPrice >= 0.0
              ? RichText(
                  text: TextSpan(
                      text: 'Purchase ${widget.selectedPlotSize}SQM for ',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      children: [
                        TextSpan(
                          text: '${_controller.totalPrice}',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: 'NGN',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      ]),
                  textAlign: TextAlign.center,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
