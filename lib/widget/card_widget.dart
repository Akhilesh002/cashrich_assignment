import 'package:flutter/material.dart';

import '../base/strings.dart';
import '../model/data_array_item_model.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({@required this.item, Key? key}) : super(key: key);

  final DataArrayItem? item;

  @override
  Widget build(BuildContext context) {
    if (item == null) return const SizedBox();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 7,
                      child: getName(),
                    ),
                    Flexible(
                      flex: 5,
                      child: getPercentChange(),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: getSymbol(),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getPrice(),
                    getRank(),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: getIcon(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getPrice() => Row(
        children: [
          const Text(
            Strings.price,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white60,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "\$${item?.quote?.uSD?.price?.toStringAsFixed(2) ?? 0}",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white60,
            ),
          ),
        ],
      );

  Widget getRank() => Row(
        children: [
          const Text(
            Strings.rank,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white60,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "${item?.cmcRank ?? ""}",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white60,
            ),
          ),
        ],
      );

  Widget getIcon() => Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.yellow,
        ),
        child: Image.asset(
          "assets/images/right_arrow.png",
          height: 24,
          width: 24,
          fit: BoxFit.cover,
        ),
      );

  Widget getName() => Text(
        item?.name ?? "",
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.yellow,
        ),
      );

  Widget getPercentChange() => Row(
        children: [
          getPercentageIcon(),
          const SizedBox(
            width: 4,
          ),
          Text(
            "${item?.quote?.uSD?.percentChange24h?.toStringAsFixed(2) ?? 0}%",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      );

  getPercentageIcon() {
    if ((item?.quote?.uSD?.percentChange24h ?? 0) > 0) {
      return const Icon(
        Icons.arrow_upward_rounded,
        size: 20,
        color: Colors.grey,
      );
    } else if ((item?.quote?.uSD?.percentChange24h ?? 0) < 0) {
      return const Icon(
        Icons.arrow_downward_rounded,
        size: 20,
        color: Colors.grey,
      );
    } else {
      return const SizedBox();
    }
  }

  Widget getSymbol() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          item?.symbol ?? "",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      );
}
