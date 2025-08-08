import 'package:flutter/material.dart';

class ShoppingHomeScreen extends StatelessWidget {
  const ShoppingHomeScreen({super.key});

  final List<String> featuredImages = const [
    'https://via.placeholder.com/300x150',
    'https://via.placeholder.com/300x150/FF5733',
    'https://via.placeholder.com/300x150/33B5FF',
  ];

  final List<Map<String, String>> products = const [
    {
      'title': 'Shoes',
      'image': 'https://via.placeholder.com/100x100/009688',
    },
    {
      'title': 'Watch',
      'image': 'https://via.placeholder.com/100x100/3F51B5',
    },
    {
      'title': 'T-Shirt',
      'image': 'https://via.placeholder.com/100x100/FFC107',
    },
    {
      'title': 'Bag',
      'image': 'https://via.placeholder.com/100x100/795548',
    },
  ];

  final List<Map<String, String>> hotOffers = const [
    {
      'image': 'https://via.placeholder.com/80x80/4CAF50',
      'desc': '50% off on all shoes',
    },
    {
      'image': 'https://via.placeholder.com/80x80/FF9800',
      'desc': 'Buy 1 Get 1 Free - T-Shirts',
    },
    {
      'image': 'https://via.placeholder.com/80x80/9C27B0',
      'desc': '30% discount on bags',
    },
    {
      'image': 'https://via.placeholder.com/80x80/2196F3',
      'desc': 'Watches on sale now',
    },
    {
      'image': 'https://via.placeholder.com/80x80/607D8B',
      'desc': 'Free shipping on orders over \$100',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Products'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// PageView - Featured
          SizedBox(
            height: 150,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: featuredImages.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.network(
                    featuredImages[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          /// GridView - Products
          GridView.builder(
            itemCount: products.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                elevation: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      product['image']!,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product['title']} added to the cart'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                    )
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          /// Hot Offers Title
          const Text(
            'Hot Offers',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          /// ListView - Hot Offers
          ListView.builder(
            itemCount: hotOffers.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final offer = hotOffers[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.network(
                        offer['image']!,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          offer['desc']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
