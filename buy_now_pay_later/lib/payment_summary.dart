import 'package:flutter/material.dart';

class PaymentSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Summary', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFF2F2F2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 20),

            // Summary Rows
            _buildSummaryCard('Due Date:', '2024-04-30'),
            _buildSummaryCard('Interest Amount:', '500 ETB'),
            _buildSummaryCard('Remaining Final Fee:', '5,500 ETB'),
            _buildSummaryCard('Delay Fee:', '100 ETB (if late)'),

            SizedBox(height: 30),
            
            // Pay Now Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle final payment logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Payment Successful!'))
                  );
                },
                child: Text('Pay Now', style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Color(0xFFE67026), // Corrected line
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom widget to build summary row inside a card with shadow effect
  Widget _buildSummaryCard(String title, String value) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
            Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF00C2FF)),
            ),
          ],
        ),
      ),
    );
  }
}
