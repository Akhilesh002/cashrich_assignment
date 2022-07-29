import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/strings.dart';
import '../controllers/home_controller.dart';
import '../model/data_array_item_model.dart';
import '../model/response_model.dart';
import '../shimmer_widget/card_shimmer.dart';
import '../widget/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController thisController = HomeController();

  @override
  void initState() {
    super.initState();
    thisController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            Strings.coinRich,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            children: [
              getHeadingContent(),
              Flexible(child: getBody()),
            ],
          ),
        ),
      ),
    );
  }

  Widget getHeadingContent() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(
                Icons.pie_chart_outline_outlined,
                size: 20,
                color: Colors.yellow,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                Strings.showChart,
                style: TextStyle(fontSize: 16, color: Colors.yellow),
              )
            ],
          ),
          Row(
            children: [
              const Text(
                Strings.count,
                style: TextStyle(fontSize: 16, color: Colors.white60),
              ),
              const SizedBox(
                width: 10,
              ),
              Obx(() {
                final totalCount =
                    thisController.responseModel.value.data?.toJson().length ??
                        0;
                return Text(
                  totalCount.toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.white60),
                );
              })
            ],
          ),
        ],
      ).paddingSymmetric(vertical: 16);

  Widget getBody() {
    return Obx(() {
      final isShimmer = thisController.apiCallStatus.value;
      if (isShimmer) {
        return getShimmer();
      } else {
        return getData();
      }
    });
  }

  Widget getData() {
    return Obx(() {
      final data = thisController.responseModel.value.data?.toJson();

      if (data == null || data.isEmpty) return const SizedBox();

      List<DataArrayItem> list = [];

      data.forEach((key, value) {
        final DataArrayItem model = DataArrayItem.fromJson(value);
        list.add(model);
      });

      return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) => CardWidget(item: list[index]),
      );
    });
  }

  Widget getShimmer() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (context, index) => const CardShimmer(),
    );
  }
}
