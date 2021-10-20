import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/screens/logged/order/map_app.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailOngoing extends StatelessWidget {
  const DetailOngoing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Berlangsung"),
      ),
      body: SlidingUpPanel(
        color: Colors.white.withOpacity(0.75),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        backdropEnabled: true,
        maxHeight: layoutHeight(context) * 0.8,
        minHeight: 120,
        panel: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 5,
                width: 40,
                decoration: const BoxDecoration(color: Colors.blueGrey),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 75,
                      child:
                          Image(image: AssetImage("assets/images/truck.png")),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Driver sedang menuju ke depo",
                            style: kHeadlineSmall,
                            overflow: TextOverflow.visible,
                          ),
                          const Text("Achmad Subandy"),
                          const Text("B 5146 IAN"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("GK-Order", style: kHeadlineSmall),
                      Text("No. Container", style: kHeadlineSmall),
                      Text("Jenis", style: kHeadlineSmall),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text("GK-T-2021082135"),
                      Text("RFKU 2806216"),
                      Text("Inbound"),
                    ],
                  ),
                ],
              ),
              const Divider(thickness: 2),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Asiatex Cileungsi",
                            style: kHeadlineSmall,
                            overflow: TextOverflow.visible,
                          ),
                          const Text(
                            "JL Raya Mayor Oking, No. 35, Citeureup, Citeureup, Bogor, Jawa Barat 16810",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.double_arrow),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Asiatex Cileungsi",
                            style: kHeadlineSmall,
                            overflow: TextOverflow.visible,
                          ),
                          const Text(
                            "JL Raya Mayor Oking, No. 35, Citeureup, Citeureup, Bogor, Jawa Barat 16810",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 2),
              Expanded(
                child: ListView(
                  children: [
                    // statusOrder(),
                    // statusOrder(),
                    // statusOrder(),
                    // statusOrder(),
                    // statusOrder(),
                    // statusOrder(),
                    // statusOrder(),
                    // statusOrder(),
                  ],
                ),
              )
            ],
          ),
        ),
        body: const MapSample(),
      ),
    );
  }
}
