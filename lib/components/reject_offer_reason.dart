import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalifa_gardens/controller/state_controller.dart';
import 'package:kalifa_gardens/util/preference_manager.dart';
import 'package:kalifa_gardens/util/service.dart';

// ignore: must_be_immutable
class RejectOfferReason extends StatefulWidget {
  final PreferenceManager manager;
  RejectOfferReason({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  _RejectOfferReasonState createState() => _RejectOfferReasonState();
}

class _RejectOfferReasonState extends State<RejectOfferReason> {
  final _controller = Get.find<StateController>();

  bool _isErrorPurchase = true,
      _isReapplyLater = false,
      _isChangedMind = false,
      _isOther = false;
  String? _otherReason;

  String _rejectionReason = '';
  TextEditingController _otherController = TextEditingController();

  void setRejectReason(String reason) {
    if (mounted) {
      setState(() {
        _rejectionReason = reason;
      });
    }
  }

  Future<void> _rejectOffer() async {
    if (_isOther) {
      setRejectReason('${_otherController.text}');
    }
    print('REAS => $_rejectionReason');
    try {
      final response = await APIService().rejectOffer(
        reason: _rejectionReason,
        token: widget.manager.getAccessToken(),
        applicationID: _controller.currApplicationID,
      );
      print('REJECT => ${response.body}');

      if (response.statusCode == 200) {
        _controller.triggerPurchase(false);
      } else {
        _controller.triggerPurchase(false);
      }
    } catch (e) {
      _controller.triggerPurchase(false);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 16.0,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x296C9496),
            border: Border.all(
                color: _isErrorPurchase ? Color(0xFF0A4D50) : Color(0x296C9496),
                width: _isErrorPurchase ? 2.0 : 0.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: _isErrorPurchase,
                onChanged: (val) {
                  if (val == true) {
                    setRejectReason('Error in my purchase information');
                    setState(() {
                      _isChangedMind = false;
                      _isReapplyLater = false;
                      _isOther = false;
                    });
                  }
                  setState(() {
                    _isErrorPurchase = val as bool;
                  });
                },
                // activeColor: Color(0xFF0A4D50),
                activeColor: Color(0xFF0A4D50),
              ),
              Expanded(
                child: Text(
                  'Error in my purchase information',
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x296C9496),
            border: Border.all(
                color: _isReapplyLater ? Color(0xFF0A4D50) : Color(0x296C9496),
                width: _isReapplyLater ? 2.0 : 0.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: _isReapplyLater,
                onChanged: (val) {
                  if (val == true) {
                    setRejectReason('I will re-apply on a later date');
                    setState(() {
                      _isChangedMind = false;
                      _isErrorPurchase = false;
                      _isOther = false;
                    });
                  }
                  setState(() {
                    _isReapplyLater = val as bool;
                  });
                },
                // activeColor: Color(0xFF0A4D50),
                activeColor: Color(0xFF0A4D50),
              ),
              Expanded(
                child: Text(
                  'I will re-apply on a later date',
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x296C9496),
            border: Border.all(
                color: _isChangedMind ? Color(0xFF0A4D50) : Color(0x296C9496),
                width: _isChangedMind ? 2.0 : 0.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: _isChangedMind,
                onChanged: (val) {
                  if (val == true) {
                    setRejectReason('I changed my mind about purchase');
                    setState(() {
                      _isReapplyLater = false;
                      _isErrorPurchase = false;
                      _isOther = false;
                    });
                  }
                  setState(() {
                    _isChangedMind = val as bool;
                  });
                },
                // activeColor: Color(0xFF0A4D50),
                activeColor: Color(0xFF0A4D50),
              ),
              Expanded(
                child: Text(
                  'I changed my mind about purchase',
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x296C9496),
            border: Border.all(
                color: _isOther ? Color(0xFF0A4D50) : Color(0x296C9496),
                width: _isOther ? 2.0 : 0.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                  value: _isOther,
                  onChanged: (val) {
                    if (val == true) {
                      setState(() {
                        _isReapplyLater = false;
                        _isErrorPurchase = false;
                        _isChangedMind = false;
                      });
                    }
                    setState(() {
                      _isOther = val as bool;
                    });
                  },
                  activeColor: Color(0xFF0A4D50)),
              Text(
                'Other',
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: _isOther ? Color(0x296C9496) : Colors.transparent,
            border: _isOther
                ? Border.all(
                    color:
                        _isChangedMind ? Color(0xFF0A4D50) : Color(0x296C9496),
                    width: _isChangedMind ? 2.0 : 0.0)
                : Border(),
          ),
          child: _isOther
              ? TextFormField(
                  minLines: 3,
                  maxLines: 5,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Type response here',
                    hintText: 'Type response here',
//              prefixIcon: Icon(Icons.message),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your reason';
                    }
                    return null;
                  },
                  onSaved: (resp) {
                    _otherReason = resp;
                  },
                  controller: _otherController,
                  keyboardType: TextInputType.text,
                )
              : SizedBox(
                  height: 1.0,
                ),
        ),
        ElevatedButton(
          onPressed: () {
            _rejectOffer();
          },
          child: Text(
            'Submit',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            padding: const EdgeInsets.all(16.0),
          ),
        ),
      ],
    );
  }
}
