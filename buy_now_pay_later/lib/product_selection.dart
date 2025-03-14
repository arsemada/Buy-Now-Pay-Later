import 'package:flutter/material.dart';
import 'payment_page.dart';

class ProductSelectionPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Household', 'image': 'assets/household.jpg'},
    {'name': 'Groceries', 'image': 'assets/groceries.jpg'},
    {'name': 'Electronics', 'image': 'assets/electronics.jpg'},
    {'name': 'Machinery', 'image': 'assets/machinery.jpg'},
    {'name': 'Agro Products', 'image': 'assets/agro_products.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E0), // Light background color
      appBar: AppBar(
        title: Text('Select Product'),
        backgroundColor: Color(0xFFE67026),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        products[index]['image']!,
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      products[index]['name']!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentPage()),
                      );
                    },
                    child: Text("Buy"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE67026),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
