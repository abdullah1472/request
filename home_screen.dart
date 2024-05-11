import 'package:flutter/material.dart';
import 'order_screen.dart';
import 'orders_list_screen.dart';

class HomeScreen extends StatefulWidget {
  final String employeeName;

  const HomeScreen({super.key, required this.employeeName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> orders = [];

  void _navigateToOrderScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OrderScreen()),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        orders.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('نظام إدارة الطلبات')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'مرحباً، ${widget.employeeName}!',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _navigateToOrderScreen,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                fixedSize: const Size(200, 60),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              icon: const Icon(Icons.add, size: 24),
              label: const Text('طلب'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersListScreen(
                    orders: orders,
                    employeeName: widget.employeeName,
                  )),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                fixedSize: const Size(200, 60),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              icon: const Icon(Icons.list, size: 24),
              label: const Text('عرض الطلبات'),
            ),
          ],
        ),
      ),
    );
  }
}
