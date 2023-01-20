import 'package:dashboard_car_youtube/clippers/battery_clipper.dart';
import 'package:dashboard_car_youtube/components/gears.dart';
import 'package:dashboard_car_youtube/printers/avg_watt_per_km_printer.dart';
import 'package:dashboard_car_youtube/printers/dash_line_printer.dart';
import 'package:dashboard_car_youtube/printers/odo_printer.dart';
import 'package:flutter/material.dart';

import 'package:dashboard_car_youtube/constants.dart';
import 'package:dashboard_car_youtube/printers/gear_printer.dart';

class GearAndBattery extends StatelessWidget {

  final BoxConstraints constraints;

  const GearAndBattery({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.22,
      width: constraints.maxWidth * 0.74,
      child: CustomPaint(
        painter: GearPrinter(),
        child: LayoutBuilder(
          builder: (context,constraints) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: defaultPadding / 2,
                        bottom: defaultPadding / 4,
                      ),
                      child: Gears(
                        constraints: constraints,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Rest. ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.16),
                        ),
                        children: const [
                          TextSpan(
                            text: "465km",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF77C000),
                            ),
                          ),
                        ]
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: constraints.maxWidth * 0.74,
                      child: Row(
                        children: [
                          Text(
                            "E",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.16),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: defaultPadding / 2,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 6,
                              child: ClipPath(
                                clipper: BatteryClipper(),
                                child: CustomPaint(
                                  painter: DashLinePrinter(
                                    progress: 0.9,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: defaultPadding / 2,
                          ),
                          const Text(
                            "100%",
                            style: TextStyle(
                              color: Color(0xFF77C000),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                  ],
                ),
                Positioned(
                  top: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.16,
                  width: constraints.maxWidth * 0.17,
                  height: constraints.maxHeight * 0.38,
                  child: CustomPaint(
                    painter: AvgWattPerKmPrinter(),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 16,
                      ), 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.025,
                          ),
                          Text(
                            "Avg. ",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.16),
                            ),
                          ),
                          Text(
                            "11.3 w/km",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.32),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.1,
                  right: constraints.maxWidth * 0.16,
                  width: constraints.maxWidth * 0.17,
                  height: constraints.maxHeight * 0.38,
                  child: CustomPaint(
                    painter: OdoPrinter(),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 16,
                      ), 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            "ODO ",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.16),
                            ),
                          ),
                          Text(
                            "6666.6km",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.32),
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.025,
                          ),
                        ],
                      ),
                    ),
                  )
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}