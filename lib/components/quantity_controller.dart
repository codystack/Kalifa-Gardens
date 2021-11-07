import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalifa_gardens/controller/state_controller.dart';

class QuantityController extends StatefulWidget {
  QuantityController(
      {Key? key,
      required this.unitPrice,
      required this.size,
      required this.quantity,
      required this.totalPrice,
      required this.updateQuantity,
      required this.computeTotal})
      : super(key: key);
  final double unitPrice;
  int size;
  var quantity;
  double totalPrice;
  var computeTotal;
  var updateQuantity;

  @override
  State<QuantityController> createState() => _QuantityControllerState();
}

class _QuantityControllerState extends State<QuantityController> {
  _QuantityControllerState();

  final _controller = Get.find<StateController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.8, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              '${_controller.quantityCounter}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 21.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => widget.updateQuantity(widget.quantity++),
                child: Icon(
                  Icons.arrow_drop_up,
                  size: 15.0,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              GestureDetector(
                onTap: () {
                  if (widget.quantity >= 1) {
                    widget.updateQuantity(widget.quantity--);
                  }
                  // else  {
                  //   quantity = 1;
                  // }
                  // _controller.setTotalPrice(widget.unitPrice, widget.size,
                  //     _controller.quantityCounter);
                },
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 15.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
