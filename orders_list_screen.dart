import 'package:flutter/material.dart';

final List<Map<String, String>> orders = [];

class OrdersListScreen extends StatelessWidget {
  const OrdersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عرض الطلبات'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Card( // وضع كل طلب داخل Card
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), // إضافة هامش حول البطاقة
            child: ListTile(
              title: Text(orders[index]['name']!),
              subtitle: Text('رقم: ${orders[index]['contact']}\nطلب: ${orders[index]['order']}'),
              trailing: IconButton( // زر الحذف لكل طلب
                icon: const Icon(Icons.delete),
                onPressed: () {
                  orders.removeAt(index); // حذف الطلب من القائمة
                  (context as Element).markNeedsBuild(); // تحديث واجهة المستخدم
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // العودة إلى الصفحة الرئيسية
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
