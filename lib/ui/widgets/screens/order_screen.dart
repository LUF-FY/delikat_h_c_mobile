import 'package:delikat_h_c_mobile/domain/services/order_page_selection_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/oreder_pages/order_address_info_page.dart';
import 'package:delikat_h_c_mobile/ui/widgets/oreder_pages/order_complete_page.dart';
import 'package:delikat_h_c_mobile/ui/widgets/oreder_pages/order_personal_info_page.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Utils.mainColor,
        centerTitle: true,
        title: const Text(
          'Оформление заказа',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Consumer<OrderPageSelectionService>(
              builder: (context, pss, child) {
                return PageView(
                  onPageChanged: (index) => pss.setPageIndex(index),
                  controller: pss.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    PersonalInfoPage(),
                    AddressInfoPage(),
                    CompletePage(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
