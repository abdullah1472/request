import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _contact, _order, _serviceType;
  final List<String> _serviceTypes = ['استفسار', 'طلب دعم', 'شكاوى'];

  void _confirmOrder() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تأكيد الطلب'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('الاسم: $_name'),
              Text('رقم التواصل: $_contact'),
              Text('نوع الخدمة: $_serviceType'),
              Text('نص الطلب: $_order'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('إلغاء'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('تأكيد'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context, {
                  'name': _name ?? '',
                  'contact': _contact ?? '',
                  'serviceType': _serviceType ?? '',
                  'order': _order ?? '',
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم إرسال الطلب بنجاح')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طلب خدمة'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'الاسم',
                  icon: Icon(Icons.person),
                ),
                onSaved: (value) => _name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال الاسم';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'رقم التواصل',
                  icon: Icon(Icons.phone),
                ),
                onSaved: (value) => _contact = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال رقم التواصل';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'نوع الخدمة',
                  icon: Icon(Icons.support),
                ),
                items: _serviceTypes
                    .map((type) => DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                ))
                    .toList(),
                onChanged: (value) => setState(() {
                  _serviceType = value;
                }),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى اختيار نوع الخدمة';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'نص الطلب',
                  icon: Icon(Icons.note),
                ),
                maxLines: 3,
                onSaved: (value) => _order = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال نص الطلب';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    _confirmOrder();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('إرسال الطلب'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
