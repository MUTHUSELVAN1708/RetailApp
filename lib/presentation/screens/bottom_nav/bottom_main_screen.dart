import 'package:flutter/material.dart';
import 'package:retail_mobile/presentation/screens/dashboard/sidebar_navigation.dart';
import 'package:retail_mobile/presentation/widgets/custom_svg.dart';

class BottomMainScreen extends StatefulWidget {
  const BottomMainScreen({super.key});

  @override
  State<BottomMainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BottomMainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ProductsPage(),
    const CartPage(),
    const BillingPage(),
    const OrdersPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarNavigation(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Billing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/images/elude_logo.png',
          height: 30,
        ),
        leading: Row(
          children: [],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              children: [
                _buildCategoryItem('star', 'Fav'),
                _buildCategoryItem('all_cart', 'All'),
                _buildCategoryItem('chocolate', 'Chocolate'),
                _buildCategoryItem('fruits', 'Fruits'),
                _buildCategoryItem('veg', 'Vegetables'),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Product / Item No.',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Scan Code',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // Products List
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'assets/product.png',
                      width: 60,
                    ),
                    title: const Text(
                      'DAIRY MILK',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Chocolate'),
                    trailing: SizedBox(
                      width: 120,
                      child: Row(
                        children: [
                          const Text(
                            '\$100/pcs',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {},
                          ),
                          const Text('0'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String icon, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[200],
            child: CustomSvg(name: icon),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Cart Page'));
  }
}

class BillingPage extends StatelessWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Billing Page'));
  }
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Orders Page'));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Page'));
  }
}
