import 'package:flutter/material.dart';

class OrdersListScreen extends StatefulWidget {
  final List<Map<String, String>> orders;
  final String employeeName;

  const OrdersListScreen({
    Key? key,
    required this.orders,
    required this.employeeName,
  }) : super(key: key);

  @override
  _OrdersListScreenState createState() => _OrdersListScreenState();
}

class _OrdersListScreenState extends State<OrdersListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طلبات ${widget.employeeName}'),
      ),
      body: widget.orders.isEmpty
          ? const Center(child: Text('لا توجد طلبات بعد'))
          : ListView.builder(
        itemCount: widget.orders.length,
        itemBuilder: (context, index) {
          final order = widget.orders[index];
          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: ListTile(
              title: Text('الاسم: ${order['name']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('رقم التواصل: ${order['contact']}'),
                  Text('نوع الخدمة: ${order['serviceType']}'),
                  const SizedBox(height: 5),
                  Text('نص الطلب: ${order['order']}'),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('تأكيد الحذف'),
                        content: const Text('هل أنت متأكد من حذف هذا الطلب؟'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('إلغاء'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('حذف'),
                            onPressed: () {
                              setState(() {
                                widget.orders.removeAt(index);
                              });
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('تم حذف الطلب')),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
