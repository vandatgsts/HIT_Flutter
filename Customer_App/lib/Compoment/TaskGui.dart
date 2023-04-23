import 'package:flutter/material.dart';

class TaskGui extends StatelessWidget {
  String name;
  String? phoneNumber;
  String city;
  String? district, address;
  String? email;
  String taxCode;
  String idNumber;
  String? description;

  TaskGui(
      {super.key,
      required this.name,
      required this.phoneNumber,
      required this.city,
      required this.district,
      required this.address,
      required this.email,
      required this.taxCode,
      required this.idNumber,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          phoneNumberGui(),
          taxCodeGui(),
          emailGui(),
          addressGui(),
          desscriptionGui()
        ],
      ),
    );
  }

  phoneNumberGui() {
    return (phoneNumber!.isEmpty
        ? const SizedBox(
            height: 0,
          )
        : Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [const Icon(Icons.call), Text(' $phoneNumber')],
              ),
            ],
          ));
  }

  taxCodeGui() {
    return (Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text('MST: $taxCode'),
      ],
    ));
  }

  emailGui() {
    return (email!.isEmpty
        ? const SizedBox(
            height: 0,
          )
        : Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [const Icon(Icons.mail_rounded), Text(' $email')],
              ),
            ],
          ));
  }

  idNumberGui() {
    Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text('CCCD/CMND: $idNumber'),
      ],
    );
  }

  addressGui() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Icon(Icons.location_on),
            Text(' $address/$district/$city')
          ],
        ),
      ],
    );
  }

  desscriptionGui() {
    return (description!.isEmpty
        ? const SizedBox(
            height: 0,
          )
        : Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text('Mo ta: $description'),
            ],
          ));
  }
}
