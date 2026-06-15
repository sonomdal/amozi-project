import 'package:flutter/material.dart';
import '../models/wardrobe_item.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key}); // onAdd 파라미터 삭제

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _nameController = TextEditingController();
  String _selectedCategory = '상의';
  String _selectedSeason = '봄';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("옷 추가하기")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: "옷 이름")),
            DropdownButtonFormField(
              value: _selectedCategory,
              items: ['상의', '하의', '아우터', '신발', '잡화'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => _selectedCategory = val!),
            ),
            DropdownButtonFormField(
              value: _selectedSeason,
              items: ['봄', '여름', '가을', '겨울'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => _selectedSeason = val!),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 입력된 정보로 새 아이템 생성
                final newItem = WardrobeItem(
                    id: DateTime.now().toString(),
                    name: _nameController.text,
                    category: _selectedCategory,
                    imageUrl: 'assets/clothes/default.png'
                );

                // 생성된 데이터를 가지고 이전 화면으로 돌아감
                Navigator.pop(context, newItem);
              },
              child: const Text("등록하기"),
            )
          ],
        ),
      ),
    );
  }
}