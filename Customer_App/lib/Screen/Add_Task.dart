import 'dart:html';

import 'package:customerapp/data/ClientInf.dart';
import 'package:customerapp/data/data.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  static String id = 'Add_Task';

  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? typeClient = 1;
    String chooseCity = 'Vo gia cu';
    final keyForm = GlobalKey<FormState>();
    TextEditingController controllerInputEmail = TextEditingController();
    TextEditingController controllerInputName = TextEditingController();
    TextEditingController controllerInputPhone = TextEditingController();
    TextEditingController controllerInputIdNumber = TextEditingController();
    TextEditingController controllerInputDistric = TextEditingController();
    TextEditingController controllerInputAddress = TextEditingController();
    TextEditingController controllerInputTaxCode = TextEditingController();
    TextEditingController controllerInputDesscription = TextEditingController();
    return Form(
        key: keyForm,
        child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            title: const Text('Them danh sach'),
          ),
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('Ten khach hang '),
                      Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  TextFormField(
                    controller: controllerInputName,
                    decoration:
                        const InputDecoration(hintText: 'Vi du: Nguyen Van A'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ten khach hang khong duoc de trong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text('Loai khach hang '),
                      Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  DropdownButtonFormField<int>(
                      value: typeClient,
                      items: const [
                        DropdownMenuItem(value: 1, child: Text('Khach hang')),
                        DropdownMenuItem(
                            value: 2,
                            child: Text('Khach hang va nha cung cap')),
                        DropdownMenuItem(value: 3, child: Text('nha cung cap')),
                      ],
                      onChanged: (value) {
                        typeClient = value;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('So dien thoai '),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controllerInputPhone,
                    decoration:
                        const InputDecoration(hintText: 'Vi du: 0123456789'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
                      }
                      if (value.length < 10 || value.length > 14) {
                        return 'So dien thoai la so co tu 10-14 ky tu';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text('Tinh/thanh pho '),
                      Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  DropdownButtonFormField<String>(
                    items: provinces.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      chooseCity = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tỉnh/Thành phố không được trống';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Quan/Huyen'),
                  TextFormField(
                    controller: controllerInputDistric,
                    decoration:
                        const InputDecoration(hintText: 'Vi du: Me tri'),
                    validator: (value) {
                      return null;
                    },
                  ),
                  const Text('Dia chi'),
                  TextFormField(
                    controller: controllerInputAddress,
                    decoration: const InputDecoration(
                        hintText: 'Vi du: 73/25 Phu Minh'),
                    validator: (value) {
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text('Ma so thue '),
                      Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      maxLength: 14,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controllerInputTaxCode,
                      decoration:
                          const InputDecoration(hintText: 'Vi du: 0105123456'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ma so thue khong duoc de trong';
                        }
                        if (value.length != 10 && value.length != 13) {
                          return 'ma so thue bao gom 10 hoac 13 chu so';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text('Can cuoc cong dan '),
                      Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controllerInputIdNumber,
                    decoration:
                        const InputDecoration(hintText: 'Vi du: 188008441'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ma so thue khong duoc de trong';
                      }
                      if (value.length != 10 && value.length != 12) {
                        return 'ma so thue bao gom 9 hoac 12 chu so';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Email'),
                  TextFormField(
                    controller: controllerInputEmail,
                    decoration: const InputDecoration(
                        hintText: 'Vi du: ndatgs@gmail.com'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
                      }
                      if (!isValidEmail(value)) {
                        return 'hay nhap dung dinh dang email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Mo ta'),
                  TextFormField(
                    controller: controllerInputDesscription,
                    decoration: const InputDecoration(
                        hintText: 'Vi du: Nguyen Van Dat dep trai'),
                    validator: (value) {
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff122db4)),
                    child: TextButton(
                      child: const Text(
                        'Them',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (!keyForm.currentState!.validate()) {
                          return;
                        }
                        ClientInf newClient = ClientInf(
                            controllerInputName.text,
                            typeClient!,
                            controllerInputPhone.text,
                            chooseCity,
                            controllerInputDistric.text,
                            controllerInputAddress.text,
                            controllerInputEmail.text,
                            controllerInputTaxCode.text,
                            controllerInputIdNumber.text,
                            controllerInputDesscription.text);
                        listAll.add(newClient);
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  bool isValidEmail(String value) {
    // Sử dụng regular expression để kiểm tra xem giá trị nhập vào có phải là địa chỉ email hợp lệ hay không
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }
}
