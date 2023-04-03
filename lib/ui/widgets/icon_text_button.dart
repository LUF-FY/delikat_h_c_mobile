import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  IconTextButton(
      {Key? key,
      required this.disable,
      required this.text,
      required this.onTap,
      this.iconData})
      : super(key: key);

  bool disable;
  String text;
  IconData? iconData;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color:
            disable ? Utils.buttonDisableBG : Utils.mainColor.withOpacity(0.2),
        child: InkWell(
          splashColor: Utils.mainDark.withOpacity(0.2),
          highlightColor: Utils.mainDark.withOpacity(0.5),
          onTap: disable
              ? null
              : () {
                  onTap();
                },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                iconData == null
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Icon(
                          iconData,
                          color:
                              disable ? Utils.buttonDisableT : Utils.mainDark,
                        ),
                      ),
                Text(
                  text,
                  style: TextStyle(
                      color: disable ? Utils.buttonDisableT : Utils.mainDark),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
