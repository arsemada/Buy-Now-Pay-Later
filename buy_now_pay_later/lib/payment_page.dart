import 'package:flutter/material.dart';
import 'payment_summary.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
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
            // Payment Information
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              shadowColor: Colors.grey.withOpacity(0.3), // Subtle shadow effect
              color: Colors.white, // White background for the card
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Details",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text("Item: Premium Subscription", style: TextStyle(color: Colors.grey[700])),
                    Text("Validity: 1 Year", style: TextStyle(color: Colors.grey[700])),
                    Text("Price: \$7.61", style: TextStyle(color: Colors.grey[700])),
                    SizedBox(height: 10),
                    Divider(color: Colors.grey[300]),
                    Text(
                      "Enter Payment Details",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    _buildTextField("Merchant Account"),
                    _buildTextField("Amount"),
                    SizedBox(height: 10),
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
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentSummaryPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF9800), // Orange button
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.grey.withOpacity(0.3),
                  elevation: 5,
                ),
                child: Text("Confirm Payment", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for building a custom text field
  Widget _buildTextField(String labelText) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
        filled: true,
        fillColor: Colors.grey[100], // Light gray background for text fields
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
    );
  }
}
