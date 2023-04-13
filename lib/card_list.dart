import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  const CardList({super.key, this.args});

  final ScreenArgument? args;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  TextEditingController cardNo = TextEditingController();
  TextEditingController fullName = TextEditingController();
  String? cardnoValue;
  String? fullnameValue;

  final List<BankCard> cardHorizontal = [
    BankCard(card: "assets/images/card.png"),
    BankCard(card: "assets/images/card.png"),
    BankCard(card: "assets/images/card.png"),
    BankCard(card: "assets/images/card.png"),
    BankCard(card: "assets/images/card.png"),
    BankCard(card: "assets/images/card.png"),
    BankCard(card: "assets/images/card.png"),
    BankCard(card: "assets/images/card.png"),
    BankCard(card: "assets/images/card.png"),
    BankCard(card: "assets/images/card.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text(
              "Danh sách thẻ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/images/card.png',
                          width: double.infinity,
                        ),
                        Positioned(
                          bottom: 10,
                          left: 12,
                          child: Column(
                            children: [
                              Text(
                                cardnoValue ?? "",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(fullnameValue ?? "",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      onChanged: (String value) {
                        setState(() {
                          cardnoValue = value;
                        });
                      },
                      controller: cardNo,
                      decoration: const InputDecoration(labelText: 'Card No'),
                    ),
                    TextField(
                      onChanged: (String value) {
                        setState(() {
                          fullnameValue = value;
                        });
                      },
                      controller: fullName,
                      decoration: const InputDecoration(labelText: 'Fullname'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Thêm",
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Danh sách thẻ của\n Techmaster",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 130,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: cardHorizontal.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: Image.asset(
                          "assets/images/card.png",
                          height: double.infinity,
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}

class ScreenArgument {
  final String userName;
  final String passWord;

  ScreenArgument({required this.userName, required this.passWord});
}

class BankCard {
  final String card;
  // final String cardholder;

  BankCard({required this.card});
}
