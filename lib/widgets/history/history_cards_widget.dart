import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:intl/intl.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/helpers/variables/sizes.dart";

class HistoryCardsWidget extends StatelessWidget {
  const HistoryCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Observer(
        builder: (_) => ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SizedBox(
                width: 200,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: PrimaryColors.primary99,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                NumberFormat.simpleCurrency(
                                        name: "RUB", locale: "Ru-ru")
                                    .format(1000.0),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: IconButton(
                                onPressed: () => {},
                                style: IconButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  iconSize: IconSizes.small,
                                  backgroundColor: PrimaryColors.primary90,
                                ),
                                icon: Icon(Icons.edit_outlined),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "Потрачено сегодня",
                          style: TextStyle(
                            color: SecondaryColors.secondary40,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
