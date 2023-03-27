import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  IconTextButton(
      {Key? key,
      required this.enable,
      required this.text,
      required this.onTap,
      this.iconData})
      : super(key: key);

  bool enable;
  String text;
  IconData? iconData;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color:
            enable ? Utils.buttonDisableBG : Utils.mainColor.withOpacity(0.2),
        child: InkWell(
          splashColor: Utils.mainDark.withOpacity(0.2),
          highlightColor: Utils.mainDark.withOpacity(0.5),
          onTap: enable
              ? null
              : () {
                  onTap();
                },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                iconData == null
                    ? SizedBox()
                    : Icon(
                        iconData,
                        color: enable ? Utils.buttonDisableT : Utils.mainDark,
                      ),
                Text(
                  'Clear Cart',
                  style: TextStyle(
                      color: enable ? Utils.buttonDisableT : Utils.mainDark),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
