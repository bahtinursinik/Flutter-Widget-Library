import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Card Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BankCardWidget(
              cardNumber: cardNumber,
              cardHolderName: cardHolderName,
              expiryDate: expiryDate,
              cvv: cvv,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Bank Card Information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Card Number'),
                    onChanged: (value) {
                      setState(() {
                        cardNumber = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Name Surname'),
                    onChanged: (value) {
                      setState(() {
                        cardHolderName = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Expiration Date'),
                    onChanged: (value) {
                      setState(() {
                        expiryDate = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'CVV'),
                    onChanged: (value) {
                      setState(() {
                        cvv = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // process
                    },
                    child: const Text('Approve'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BankCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cvv;

  const BankCardWidget({
    super.key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvv,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.deepPurple,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Card Number:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              _formatCardNumber(cardNumber),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Name Surname:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              cardHolderName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Expiration Date:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              expiryDate,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'CVV:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              cvv,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatCardNumber(String input) {
    if (input.length < 4) return input;
    final formatted = input.replaceAllMapped(
        RegExp(r".{4}"), (match) => "${match.group(0)} ");
    return formatted.trim();
  }
}
