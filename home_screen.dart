import 'package:flutter/material.dart';
import 'order_screen.dart';
import 'orders_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('الرئيسية')), // وضع العنوان في المنتصف
      ),
      body: Center(
        child: Row( // تغيير التخطيط إلى Row لوضع الأزرار أفقيًا
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 60), // تكبير الأزرار قليلاً
              ),
              child: const Text('طلب'),
            ),
            const SizedBox(width: 20), // مسافة بين الأزرار
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersListScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 60), // تكبير الأزرار قليلاً
              ),
              child: const Text('عرض الطلبات'),
            ),
          ],
        ),
      ),
    );
  }
}
