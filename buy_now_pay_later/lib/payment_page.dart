import 'package:flutter/material.dart';
import 'payment_summary.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for a clean look
      appBar: AppBar(
        title: Text('Payment', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Payment Information Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 15,
              shadowColor: Colors.grey.withOpacity(0.3),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Details",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 15),
                    _buildInfoRow("Item", "Premium Subscription"),
                    _buildInfoRow("Validity", "1 Year"),
                    _buildInfoRow("Price", "\$7.61"),
                    SizedBox(height: 20),
                    Divider(color: Colors.grey[300]),
                    Text(
                      "Enter Payment Details",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    _buildTextField("Merchant Account", Icons.account_balance),
                    _buildTextField("Amount", Icons.attach_money),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Save this card?", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                        Switch(value: true, onChanged: (bool value) {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            // Confirm Payment Button
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentSummaryPage()));
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFE67026), Color(0xFFE87026)], // Your platform's color (secondary)
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 2, blurRadius: 8, offset: Offset(0, 4)),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Confirm Payment",
                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  // Helper method for building text field with icons
  Widget _buildTextField(String labelText, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color(0xFFE67026)), // Use platform color for the icon
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xFFE67026)), // Highlight with platform color
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      ),
      style: TextStyle(color: Colors.black),
    );
  }

  // Helper method for creating rows for Order Details
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFE67026)), // Platform color
          ),
        ],
      ),
    );
  }
}
