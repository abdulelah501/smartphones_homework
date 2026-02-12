import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'قائمة المنتجات',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: const ProductList(),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات المنتجات مع روابط صور جديدة وشغالة
    final List<Map<String, String>> products = [
      {
        'name': 'iPhone',
        'desc': 'iPhone is the stylist phone ever',
        'price': '1000',
        'image': 'https://picsum.photos/id/160/200/200'
      },
      {
        'name': 'Pixel',
        'desc': 'Pixel is the most featureful phone ever',
        'price': '800',
        'image': 'https://picsum.photos/id/0/200/200'
      },
      {
        'name': 'Laptop',
        'desc': 'Laptop is most productive development tool',
        'price': '2000',
        'image': 'https://picsum.photos/id/1/200/200'
      },
      {
        'name': 'Tablet',
        'desc': 'Tablet is the most useful device ever for meeting',
        'price': '1500',
        'image': 'https://picsum.photos/id/10/200/200'
      },
      {
        'name': 'Pendrive',
        'desc': 'Pendrive is useful storage medium',
        'price': '100',
        'image': 'https://picsum.photos/id/48/200/200'
      },
      {
        'name': 'Floppy Drive',
        'desc': 'Floppy drive is useful rescue storage medium',
        'price': '20',
        'image': 'https://picsum.photos/id/60/200/200'
      },
    ];

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // الصورة - تم إزالة const من أمام BoxFit لتصحيح الخطأ
                Image.network(
                  products[index]['image']!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 100),
                ),
                const SizedBox(width: 20),
                // نصوص المنتج (اسم، وصف، سعر)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        products[index]['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        products[index]['desc']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Price: ${products[index]['price']}',
                        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
