import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DealsScreen(),
    );
  }
}

class DealsScreen extends StatefulWidget {
  @override
  _DealsScreenState createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> products = [
    {
      'category': 'Clothings',
      'price': '\$560',
      'name': 'Smart T-Shirt Causal For Men Available Now',
      'rating': '5.00 (1)',
      'image': 'images/OIF.jpeg',
      'liked': true,
    },
    {
      'category': 'Clothings',
      'price': '\$560',
      'name': 'Casual Full Sleeve Black Shirt For Man',
      'rating': '5.00 (1)',
      'image': 'images/th.jpeg',
      'liked': false,
    },
    {
      'category': 'Food',
      'price': '\$800',
      'name': 'Mozzarella Pesan Mixed Healthy Delight Ready...',
      'rating': '5.00 (1)',
      'image': 'images/OIP (1).jpeg',
      'liked': false,
    },
    {
      'category': 'Mobiles',
      'price': '\$800',
      'name': 'Latest iPhone 16 Pro Brand New',
      'rating': '5.00 (1)',
      'image': 'images/OIF (1).jpeg',
      'liked': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.blue,
        title: Text('Deals & Offers'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Featured'),
            Tab(text: 'On Sale'),
            Tab(text: 'Top Rated'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildProductGrid(),
          
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.65,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      products[index]['image'],
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Icon(
                        products[index]['liked'] ? Icons.favorite : Icons.favorite_border,
                        color: products[index]['liked'] ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[index]['category'],
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        products[index]['price'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        products[index]['name'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                          SizedBox(width: 4),
                          Text(products[index]['rating'], style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}