import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(RainyPay());

class RainyPay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rainy Pay',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WalletHome(),
    );
  }
}

class WalletHome extends StatefulWidget {
  @override
  State<WalletHome> createState() => _WalletHomeState();
}

class _WalletHomeState extends State<WalletHome> {
  String address = '0x...'; // placeholder
  bool isUSD = false;
  String amount = '';

  void copyAddress() {
    Clipboard.setData(ClipboardData(text: address));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Address copied')),
    );
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(title: Text('Rainy Pay')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          SelectableText(address),
          ElevatedButton.icon(
            icon: Icon(Icons.copy),
            label: Text('Copy Address'),
            onPressed: copyAddress,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: isUSD ? 'Amount in USD' : 'Amount in Token',
            ),
            onChanged: (v) => setState(() => amount = v),
          ),
          Row(
            children: [
              Text('USD'),
              Switch(value: isUSD, onChanged: (v) => setState(() => isUSD = v)),
              Text('Token'),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: Text('Send'))
        ]),
      ),
    );
  }
}
