// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mpresa_bank/components/colors.dart';
import 'package:mpresa_bank/widgets/buttons.dart';
import 'package:mpresa_bank/widgets/large_buttons.dart';

class paymentPage extends StatelessWidget {
  const paymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        height: h,
        width: w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage("images/paymentbackground.png"))),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: h * 0.14,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("images/logo9.jpg"))),
            ),
            const Text(
              "Success !!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Text(
              "Payment Completed for 2 bills !!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey),
            ),
            SizedBox(
              height: h * 0.045,
            ),
            Container(
                height: 160,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2, color: Colors.grey.withOpacity(0.5))),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        return Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 15, left: 20, bottom: 10),
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.green),
                                    child: const Icon(
                                      Icons.done,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "KenGen Power",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "ID: 4759379",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "R1248.00",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                  thickness: 2,
                                  color: Colors.grey.withOpacity(0.5))
                            ],
                          ),
                        );
                      }),
                )),
            SizedBox(
              height: h * 0.05,
            ),
            Column(
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(fontSize: 20, color: AppColor.idColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "R2840.00",
                  style: TextStyle(
                      fontSize: 30,
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: h * 0.10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButtons(
                  icon: Icons.share_sharp,
                  onTap: () {},
                  text: "Share",
                ),
                const SizedBox(
                  width: 80,
                ),
                AppButtons(
                  icon: Icons.print_outlined,
                  onTap: () {},
                  text: "print",
                )
              ],
            ),
            SizedBox(
              height: h * 0.01,
            ),
            AppLargeButton(
              text: "Done",
              backgroundColor: AppColor.backgroundColor,
              textColor: AppColor.selectColor,
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
