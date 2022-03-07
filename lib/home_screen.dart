
import 'package:flutter/material.dart';
import 'package:untitled/zip_code.dart';

import 'find_zip_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _zoneCodeTextEditingController = TextEditingController();
  final _addressTextEditingController = TextEditingController();
  final _address2TextEditingController = TextEditingController();
  final _dongTextEditingController = TextEditingController();

  @override
  void dispose() {
    _zoneCodeTextEditingController.dispose();
    _addressTextEditingController.dispose();
    _address2TextEditingController.dispose();
    _dongTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('우편번호 검색'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _zoneCodeTextEditingController,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  ZipCode zipCode = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FindZipScreen()),
                  );

                  _zoneCodeTextEditingController.text = zipCode.zonecode;
                  _addressTextEditingController.text = zipCode.roadAddress;
                  _dongTextEditingController.text = zipCode.bname;

                  print(zipCode.roadAddress);
                },
                child: const Text('우편번호 찾기'),
              ),
            ],
          ),
          TextField(
            controller: _addressTextEditingController,
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                    controller: _address2TextEditingController,
                  )),
              const SizedBox(width: 30),
              Expanded(
                  child: TextField(
                    controller: _dongTextEditingController,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}