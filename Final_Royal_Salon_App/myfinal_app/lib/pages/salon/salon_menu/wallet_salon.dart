import 'package:flutter/material.dart';

class WalletSalon extends StatefulWidget {
  const WalletSalon({Key? key}) : super(key: key);

  @override
  _WalletSalonState createState() => _WalletSalonState();
}

class _WalletSalonState extends State<WalletSalon> {
  final TextEditingController _accHolderController = TextEditingController();
  final TextEditingController _accNumberController = TextEditingController();
  final TextEditingController _expMonthController = TextEditingController();
  final TextEditingController _expYearController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/logo.jpg'),
                    title: const Text('Mastercard'),
                    onTap: () {},
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/logo.jpg'),
                    title: const Text('Cash'),
                    onTap: () {},
                  ),
                ),
                Column(
                  children: [
                    const Text('Name on Card:'),
                    TextFormField(
                      controller: _accHolderController,
                      textCapitalization: TextCapitalization.words,
                      decoration:
                          const InputDecoration(hintText: 'Account holder'),
                      onChanged: (value) {
                        debugPrint(value);
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Account Number:',
                    ),
                    TextFormField(
                      controller: _accNumberController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: 'Account Number'),
                      onChanged: (value) {
                        debugPrint(value);
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Expiry Date: ',
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            controller: _expMonthController,
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(hintText: 'Month'),
                            onChanged: (value) {
                              debugPrint(value);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            controller: _expYearController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(hintText: 'Year'),
                            onChanged: (value) {
                              debugPrint(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'CVC:',
                    ),
                    TextFormField(
                      controller: _cvcController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: '999'),
                      onChanged: (value) {
                        debugPrint(value);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
