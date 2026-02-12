import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        // استخدام SingleChildScrollView ليسمح لك بالتمرير (التحريك) للأعلى والأسفل
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(image: 'images/lake.jpg'), // قسم الصورة
              TitleSection(name: 'عبدالإله', location: 'الرقم الأكاديمي: 443229442'), // قسم العنوان
              ButtonSection(), // قسم الأزرار
              TextSection(description: 'هذا التطبيق تم بناؤه بناءً على تعليمات Flutter Layout Tutorial.'), // قسم النص
            ],
          ),
        ),
      ),
    );
  }
}

// 1. قسم الصورة
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network( // استخدمنا Network لكي تظهر الصورة فوراً بدون إعدادات إضافية
      'https://raw.githubusercontent.com/flutter/website/main/examples/layout/lakes/step5/images/lake.jpg',
      width: 600, height: 240, fit: BoxFit.cover,
    );
  }
}

// 2. قسم العنوان (اسمك ورقمك)
class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});
  final String name; final String location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500], fontSize: 16)),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
    );
  }
}

// 3. قسم الأزرار
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color)),
        ),
      ],
    );
  }
}

// 4. قسم النص الوصفي
class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(32), child: Text(description, softWrap: true));
  }
}
