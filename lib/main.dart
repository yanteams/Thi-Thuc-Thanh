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
        primarySwatch: Colors.cyan,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodyText2: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
          button: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> cardScaleAnimation;
  late Animation<double> cardOpacityAnimation;
  late Animation<Offset> cardSlideAnimation;
  late Animation<Color?> selectedColorTween;

  Map<String, dynamic> selectedItem = {};
  List<Map<String, dynamic>> menu = [
    {
      'id': 1,
      'title': 'Beer',
      'description':
      'Bia là một loại đồ uống có chứa cồn được sản xuất từ sự lên men của ngũ cốc như lúa mạch hoặc khoai tây. Nước bia có màu đậm và có vị đắng do có chứa hoa bia và hương thảo. Bia có nhiều hương vị khác nhau, từ nhẹ nhàng cho đến đậm đà, và được uống phổ biến trên toàn thế giới.',
      'image': 'beer.png',
      'quantity': 0,
    },
    {
      'id': 2,
      'title': 'Coconut Cocktail',
      'description':
      'Coconut Cocktail là một loại cocktail có thành phần chính là dừa tươi và rượu, thường được phục vụ trong những ly thủy tinh đồ uống. Coconut Cocktail có hương vị thơm ngon của dừa và rượu hòa quyện với nhau, tạo nên một hương vị rất hấp dẫn và thích thú.',
      'image': 'coconutcocktail.png',
      'quantity': 0,
    },
    {
      'id': 3,
      'title': 'Lemonade',
      'description':
      'Nước chanh là một loại thức uống được làm từ nước, đường, chanh hoặc chanh tươi cùng các thành phần khác như bạc hà, sả... Nước chanh thường được uống trong thời tiết nóng để giải khát và mang lại cảm giác sảng khoái cho người uống. Nước chanh cũng được biết đến với các tác dụng tốt cho sức khỏe như làm giảm cảm giác mệt mỏi, giảm stress, tăng cường hệ miễn dịch và hỗ trợ chức năng tiêu hóa.',
      'image': 'lemonade.png',
      'quantity': 0,
    },
    {
      'id': 4,
      'title': 'Milkshake',
      'description':
      'Sữa lắc là một loại thức uống được làm từ sữa, kem và hương vị. Thức uống này có thể được pha chế với các loại hương vị như chocolate, vani, dâu tây, mặt nạ Oreo và nhiều loại trái cây khác. Đôi khi, rượu cũng được thêm vào để tạo ra phiên bản sô cô la hoặc rượu. Milkshake thường được phục vụ trong các quán cà phê, trung tâm thể thao và nhà hàng. Nó là một loại thức uống giải nhiệt tuyệt vời trong những ngày nóng và cũng thường được sử dụng như một món tráng miệng sau bữa ăn của bạn.',
      'image': 'milkshake.png',
      'quantity': 0,
    },
    {
      'id': 5,
      'title': 'Orange Juice',
      'description':
      'Nước ép cam là loại nước uống được làm từ trái cam tươi đươc ép lấy nước. Cam là một nguồn cung cấp vitamin C và các chất chống oxy hóa có tác dụng tốt đối với sức khỏe. Nước ép cam thường uống mát lạnh hoặc pha đường tùy theo khẩu vị của người dùng. Vì tính tiện dụng và tác dụng tốt đối với sức khỏe, nước ép cam được yêu thích và sử dụng rộng rãi trên toàn thế giới.',
      'image': 'orangejuice.png',
      'quantity': 0,
    },
    {
      'id': 6,
      'title': 'Celery Juice',
      'description':
      'Nước ép cần tây là một loại đồ uống được chiết xuất từ củ cần tây tươi, có vị thanh mát và thơm ngon. Nước ép cần tây giàu chất xơ và vitamin K, giúp tăng cường hệ tiêu hóa, hỗ trợ giảm cân và cải thiện sức khỏe tim mạch. Ngoài ra, nước ép cần tây còn có tác dụng giảm căng thẳng và tăng cường sức đề kháng cho cơ thể.',
      'image': 'celeryjuice.jpg',
      'quantity': 0,
    },
    {
      'id': 7,
      'title': 'Pineapple Juice',
      'description':
      'Nước ép dứa là thức uống được sản xuất bằng cách ép hoặc xay trái dứa tươi lấy nước. Nó có vị ngọt, thơm và giàu dinh dưỡng. Nước ép dứa chứa nhiều vitamin C và chất xơ, giúp tăng cường hệ miễn dịch và hỗ trợ tiêu hóa. Nó thường được pha loãng hoặc trộn với đá để tạo nên một thức uống mát lạnh và phong phú.',
      'image': 'pineapplejuice.jpg',
      'quantity': 0,
    },
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    cardScaleAnimation =
        Tween<double>(begin: 1.0, end: 0.9).animate(controller);
    cardOpacityAnimation =
        Tween<double>(begin: 1.0, end: 0.7).animate(controller);
    cardSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.0, -0.02),
    ).animate(controller);
    selectedColorTween = ColorTween(
      begin: Colors.white,
      end: Colors.green[700],
    ).animate(controller);
  }

  void handleSelected(Map<String, dynamic> item) {
    setState(() {
      selectedItem = item;
      controller.forward();
    });
  }

  void handleDelete() {
    setState(() {
      selectedItem['quantity'] = 0;
      selectedItem = {};
      controller.reverse();
    });
  }

  void handleAdd() {
    setState(() {
      if (selectedItem['quantity'] >= 0) {
        selectedItem['quantity']++;
      }
    });
  }

  void handleRemove() {
    setState(() {
      if (selectedItem['quantity'] > 0) {
        selectedItem['quantity']--;
        if (selectedItem['quantity'] == 0) {
          selectedItem = {};
          controller.reverse();
        }
      }
    });
  }

  void handleDeleteAll() {
    setState(() {
      selectedItem = {};
      controller.reverse();
      for (var item in menu) {
        item['quantity'] = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Thực đơn 7 món nước',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontFamily: 'Pacifico',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => handleSelected(menu[index]),
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: index == menu.indexOf(selectedItem)
                            ? cardScaleAnimation.value
                            : 1.0,
                        child: Opacity(
                          opacity: index == menu.indexOf(selectedItem)
                              ? cardOpacityAnimation.value
                              : 1.0,
                          child: child,
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: menu.indexOf(selectedItem) == index
                            ? BorderSide(color: Colors.green[700]!, width: 3)
                            : BorderSide.none,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                'images/${menu[index]['image']}',
                                width: double.infinity,
                                fit: BoxFit.cover,
                                height: 250,
                              ),
                              Positioned(
                                right: 16,
                                top: 16,
                                child: menu[index]['id'] == 6 || menu[index]['id'] == 7
                                    ? Text(
                                  '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black54,
                                        offset: Offset(0.5, 0.5),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                )
                                    : Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 32,
                                ),
                              ),
                              Positioned(
                                bottom: 16,
                                left: 16,
                                child: Text(
                                  menu[index]['title'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black54,
                                        offset: Offset(0.5, 0.5),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              menu[index]['description'].substring(0, 100) + '...',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Số lượng đặt mua: ${menu[index]['quantity']}',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                      elevation:
                      index == menu.indexOf(selectedItem) ? 8.0 : 2.0,
                      margin: const EdgeInsets.all(16.0),
                    ),
                  ),
                );
              },
            ),
          ),
          if (selectedItem.isNotEmpty)
            SlideTransition(
              position: cardSlideAnimation,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: selectedColorTween.value,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                    ),
                    child: child,
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Món đã chọn:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        TextButton(
                          onPressed: handleDeleteAll,
                          child: Text(
                            'Xóa tất cả',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      selectedItem['title'],
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Số lượng đặt mua: ${selectedItem['quantity']}',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: handleRemove,
                              icon: Icon(Icons.remove),
                              color: Colors.white,
                              iconSize: 24,
                            ),
                            IconButton(
                              onPressed: handleAdd,
                              icon: Icon(Icons.add),
                              color: Colors.white,
                              iconSize: 24,
                            ),
                            IconButton(
                              onPressed: handleDelete,
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              iconSize: 24,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Đặt hàng',
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(
                            fontFamily: 'Pacifico',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding:
                          const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          primary: Colors.green[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}