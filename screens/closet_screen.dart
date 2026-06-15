import 'package:flutter/material.dart';
import '../models/wardrobe_item.dart';
import 'add_item_screen.dart';

class ClosetScreen extends StatefulWidget {
  final List<WardrobeItem> items;
  final VoidCallback onUpdate;

  const ClosetScreen({
    super.key,
    required this.items,
    required this.onUpdate,
  });

  @override
  State<ClosetScreen> createState() => _ClosetScreenState();
}

class _ClosetScreenState extends State<ClosetScreen> {
  String _selectedCategory = '전체';

  final List<String> _categories = [
    '전체',
    '상의',
    '하의',
    '아우터',
    '신발',
    '잡화'
  ];

  List<WardrobeItem> get _filtered {
    if (_selectedCategory == '전체') return widget.items;
    return widget.items
        .where((e) => e.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        title: const Text(
          '옷장',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // 🧠 카테고리 필터
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final cat = _categories[index];
                  final selected = _selectedCategory == cat;

                  return GestureDetector(
                    onTap: () {
                      setState(() => _selectedCategory = cat);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFFF4A261)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected
                              ? const Color(0xFFF4A261)
                              : Colors.grey.shade200,
                        ),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          color:
                          selected ? Colors.white : Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // 📦 그리드
            Expanded(
              child: GridView.builder(
                itemCount: _filtered.length + 1,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  // ➕ 추가 카드
                  if (index == _filtered.length) {
                    return GestureDetector(
                      onTap: () async {
                        final newItem = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AddItemScreen(),
                          ),
                        );

                        if (newItem is WardrobeItem) {
                          setState(() {
                            widget.items.add(newItem);
                          });

                          widget.onUpdate();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 34,
                            color: Color(0xFFF4A261),
                          ),
                        ),
                      ),
                    );
                  }

                  final item = _filtered[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.checkroom,
                          size: 48,
                          color: Colors.black26,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          item.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          item.category,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}