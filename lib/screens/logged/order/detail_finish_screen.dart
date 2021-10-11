import 'package:bokshaul_haulier/helpers/card.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:flutter/material.dart';

class DetailFinish extends StatelessWidget {
  const DetailFinish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Selesai"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            Container(
              color: Colors.white,
              width: layoutWidth(context),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("GK-Order", style: kHeadlineSmall),
                        Text("No. Container", style: kHeadlineSmall),
                        Text("Shipping Line", style: kHeadlineSmall),
                        Text("Jenis", style: kHeadlineSmall),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text("GK-Order"),
                        Text("No. Container"),
                        Text("Shipping Line"),
                        Text("Jenis"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Container(
              color: Colors.white,
              width: layoutWidth(context),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama Supir", style: kHeadlineSmall),
                        Text("No. Polisi", style: kHeadlineSmall),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text("GK-Order"),
                        Text("No. Container"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Container(
              color: Colors.white,
              width: layoutWidth(context),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Dari:"),
                    Text("Tanjung Priok", style: kHeadlineSmall),
                    const Text(
                      "Jalan Sunter Garden Blok B9 no 12 rt 005 / rw 018 kelurahan, RT.5/RW.18, Sunter Agung, Tanjung Priok, North Jakarta City, Jakarta 14350",
                    ),
                    const SizedBox(height: 10),
                    const Text("Ke:"),
                    Text("Tanjung Priok", style: kHeadlineSmall),
                    const Text(
                      "Jalan Sunter Garden Blok B9 no 12 rt 005 / rw 018 kelurahan, RT.5/RW.18, Sunter Agung, Tanjung Priok, North Jakarta City, Jakarta 14350",
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
            const Divider(),
            Container(
              color: Colors.white,
              width: layoutWidth(context),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text("Milestone", style: kHeadlineSmall),
                    Divider(),
                    statusOrder(),
                    statusOrder(),
                    statusOrder(),
                    statusOrder(),
                    statusOrder(),
                    statusOrder(),
                    statusOrder(),
                    statusOrder(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
