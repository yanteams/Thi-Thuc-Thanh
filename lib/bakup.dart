import 'package:flutter/material.dart';

void main() {
  runApp(MenuApp());
}

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thực đơn 7 món nước',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String selectedItem = '';

  List<Map<String, dynamic>> menu = [
    {
      'title': 'Beer',
      'description':
      'Nước ép cà rốt là một trong những đồ uống bổ dưỡng, giàu vitamin A, beta-carotene, khoáng chất và chất xơ. Đồng thời, nước ép này còn giúp thanh lọc cơ thể, giảm đờm và đào thải các chất độc hại.',
      'image': 'beer.png',
    },
    {
      'title': 'Coconut Cocktail',
      'description':
      'Sữa chua dâu là một món ăn vặt ngon miệng, vừa giúp bổ sung canxi cần thiết cho cơ thể vừa tốt cho sức khỏe. Sữa chua dâu rất dễ làm, chỉ cần những nguyên liệu đơn giản như sữa, đường, dâu tây và sữa chua.',
      'image': 'coconutcocktail.png',
    },
    {
      'title': 'Lemonade',
      'description':
      'Nước chanh muối vô cùng bổ dưỡng và tốt cho sức khỏe. Nó giúp bảo vệ sức khỏe đường tiêu hóa, giảm cân nhanh chóng, giảm mệt mỏi và tăng cường hệ miễn dịch.',
      'image': 'lemonade.png',
    },
    {
      'title': 'Milkshake',
      'description':
      'Nước mía là một loại đồ uống tự nhiên rất phổ biến và được yêu thích ở nhiều nơi trên thế giới. Nó chứa nhiều chất dinh dưỡng, vitamin, khoáng chất và chất xơ, giúp cơ thể khỏe mạnh và bảo vệ khỏi nhiều bệnh tật.',
      'image': 'milkshake.png',
    },
    {
      'title': 'Orange Juice',
      'description':
      'Nước dừa là một loại thức uống tự nhiên, giúp giảm đau đầu, giảm áp lực máu và bảo vệ sức khỏe tim mạch. Nó cũng rất giàu chất dinh dưỡng, vitamin và khoáng chất, giúp cơ thể khỏe mạnh và tràn đầy năng lượng.',
      'image': 'orangejuice.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thực đơn 7 món nước'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedItem = menu[index]['title'];
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/${menu[index]['image']}',
                            height: 100,
                          ),
                          SizedBox(height: 8),
                          Text(
                            menu[index]['title'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(menu[index]['description']),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          selectedItem.isNotEmpty
              ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Món đã chọn: $selectedItem',
              style: TextStyle(fontSize: 16),
            ),
          )
              : Container(),
        ],
      ),
    );
  }
}