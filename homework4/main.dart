
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, 
    home: ProductPage(),
  ));
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("متجر الإلكتروني"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [

          ProductBox(
            name: "لابتوب برو",
            description: "معالج حديث، رامات 16 جيجا، شاشة عالية الدقة",
            price: 7500,
            imagePath: "assets/images/laptop.png",
          ),

          ProductBox(
            name: "شاشة OLED",
            description: "حجم 65 بوصة، تقنية 4K، ألوان واقعية",
            price: 4500,
            imagePath: "assets/images/screen.png",
          ),

          ProductBox(
            name: "ساعة ذكية",
            description: "مقاومة للماء، تتبع الصحة والرياضة، تدعم GPS",
            price: 1200,
            imagePath: "assets/images/watch.png",
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatefulWidget {
  final String name, description, imagePath;
  final int price;

  const ProductBox({
    super.key, 
    required this.name, 
    required this.description, 
    required this.price, 
    required this.imagePath,
  });

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  // القائمة المنسدلة (الطلب الأساسي للدكتور)
  String? selectedBrand = 'أبل';
  final List<String> brands = ['أبل', 'سامسونج', 'سوني', 'إل جي', 'هواوي'];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          // عرض الصورة من مجلد assets
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              widget.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              // في حال لم يجد الصورة يظهر أيقونة بديلة
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported, size: 100, color: Colors.grey);
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name, 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                  ),
                  
                  // تصميم القائمة المنسدلة للماركة
                  Row(
                    children: [
                      const Text("الماركة: ", style: TextStyle(fontSize: 13)),
                      DropdownButton<String>(
                        value: selectedBrand,
                        items: brands.map((String b) {
                          return DropdownMenuItem(value: b, child: Text(b, style: const TextStyle(fontSize: 13)));
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedBrand = val;
                          });
                        },
                      ),
                    ],
                  ),
                  
                  Text(
                    widget.description, 
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "السعر: ${widget.price} ريال", 
                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
