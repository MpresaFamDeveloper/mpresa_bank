import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpresa_bank/components/colors.dart';
import 'package:mpresa_bank/controllers/data_controllers.dart';
import 'package:mpresa_bank/pages/paymentPage.dart';
import 'package:mpresa_bank/widgets/buttons.dart';
import 'package:mpresa_bank/widgets/large_buttons.dart';
import 'package:mpresa_bank/widgets/text_size.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataController _controller =
      Get.put(DataController()); //Calling the controller using a special way

  @override
  Widget build(BuildContext context) {
    print(_controller.list);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SizedBox(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            Obx(() {
              if (_controller.loading == false) {
                return const Center(
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        backgroundColor: Colors.blueAccent,
                      )),
                );
              } else {
                return _listBills();
              }
            }),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return SizedBox(
      height:
          210, //defining the height for the stack to have better control in future
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
        bottom: 4,
        right: 41,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent.withOpacity(0.0),
                context: context,
                builder: (BuildContext bc) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height - 150,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: -1,
                            child: Container(
                              color: Colors.transparent.withOpacity(0),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 145,
                            )),
                        Positioned(
                            top: -6,
                            right: 43,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              width: 58,
                              height: 250,
                              decoration: BoxDecoration(
                                  color: AppColor.mainColor,
                                  borderRadius: BorderRadius.circular(29)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppButtons(
                                    icon: Icons.cancel,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  AppButtons(
                                    icon: Icons.add,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {},
                                    text: "Add Bills",
                                  ),
                                  AppButtons(
                                    icon: Icons.history,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {},
                                    text: "History",
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("images/lines.png")),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 30,
                      offset: Offset(0, 1),
                      color: Color(0xFF11324d))
                ]),
          ),
        ));
  }

  _mainBackground() {
    return Positioned(
        bottom: 15,
        left: 0,
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "images/money_burn.jpg") //assetsImage means the image from our local file we have to put the path
                  )),
        ));
  }

  _curveImageContainer() {
    return Positioned(
        left: 0,
        right: -18,
        bottom: 15,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "images/curve.png") //assetsImage means the image from our local file we have to put the path
                  )),
        ));
  }

  _listBills() {
    return Positioned(
        top: 200,
        left: 0,
        right: 0,
        bottom: 0,
        child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              itemCount: _controller.list.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 10, left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 3, color: Colors.grey),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(_controller.list[index][
                                          "img"]) //assetsImage means the image from our local file we have to put the path
                                      ),
                                ),
                              ), //Container for the left brand label on the first item on the list

                              const SizedBox(
                                width: 10,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _controller.list[index]["brand"],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ID:846594",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.idColor,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedText(
                              text: _controller.list[index]["more"],
                              color: AppColor.green),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _controller.list[index]
                                      ["status"] = !_controller
                                          .list[index][
                                      "status"]; //whatever is in the status variable we are doing it

                                  print(_controller.list[index]["status"]);
                                  _controller.list.refresh();

                                  print(_controller.newList.length);
                                },
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: _controller.list[index]
                                                  ["status"] ==
                                              false
                                          ? AppColor.selectBackground
                                          : AppColor.green),
                                  child: Center(
                                    child: Text(
                                      "Select",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: _controller.list[index]
                                                      ["status"] ==
                                                  false
                                              ? AppColor.black
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 45,
                              ),
                              Text(
                                "R" + _controller.list[index]["due"],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: AppColor.mainColor),
                              ),
                              Text(
                                "Due in 3 days",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    color: AppColor.idColor),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 5,
                            height: 35,
                            decoration: BoxDecoration(
                                color: AppColor.halfOval,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            )));
  }

  _payButton() {
    return Positioned(
        bottom: 20,
        child: AppLargeButton(
          text: "Pay All Bills",
          textColor: Colors.white,
          onTap: () {
            Get.to(() => const paymentPage());
          },
        ));
  }

  _textContainer() {
    return Stack(
      children: const [
        Positioned(
            left: 0,
            top: 50,
            child: Text(
              "Mpresa Bank",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )),
        Positioned(
            left: 40,
            top: 40,
            child: Text(
              "Mpresa Bank",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ))
      ],
    );
  }
}
