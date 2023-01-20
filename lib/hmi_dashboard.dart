import 'package:dashboard_car_youtube/components/car_indicators.dart';
import 'package:dashboard_car_youtube/components/current_speed.dart';
import 'package:dashboard_car_youtube/components/gear_and_battery.dart';
import 'package:dashboard_car_youtube/components/speed_limit.dart';
import 'package:dashboard_car_youtube/components/time_and_temperature.dart';
import 'package:dashboard_car_youtube/printers/hmi_shape_printer.dart';
import 'package:dashboard_car_youtube/printers/speed_linear_printer.dart';
import 'package:flutter/material.dart';

import 'package:dashboard_car_youtube/constants.dart';
   
class HmiDashboard extends StatefulWidget {

  const HmiDashboard({ Key? key }) : super(key: key);

  @override
  State<HmiDashboard> createState() => _HmiDashboardState();
}

class _HmiDashboardState extends State<HmiDashboard> {

  final List<double> speedLinesOpacities = [1,0.8,0.6,0.4,0.3,0.2,0.15,0.1];

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    final bool hasEnoughSize = size.width > 1184 && size.height > 604;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        child: hasEnoughSize
          ? Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(
              maxWidth: 1480,
              minWidth: 1184,
              maxHeight: 604,
              minHeight: 456,
            ),
            child: AspectRatio(
              aspectRatio: 2.59,
              child: LayoutBuilder(
                builder: (context,constraints) {
                  return CustomPaint(
                    painter: HmiShapePrinter(),
                    child: Column(
                      children: [
                        TimeAndTemperature(
                          constraints: constraints,
                        ),

                        Expanded(
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: defaultPadding * 1.25,
                                  ),
                                  
                                  const CarIndicators(),

                                  const Spacer(),

                                  const CurrentSpeed(
                                    speed: 50,
                                  ),

                                  const Spacer(),

                                  const SpeedLimit(),

                                  const SizedBox(
                                    height: defaultPadding * 0.75,
                                  ),

                                  GearAndBattery(
                                    constraints: constraints,
                                  ),
                                ],
                              ),
                            
                              ...List.generate(
                                speedLinesOpacities.length, 
                                (index) {
                                  return Positioned(
                                    bottom: 20 + (2.0 * index),
                                    left: constraints.maxWidth * 0.13 - (30 * index),
                                    height: constraints.maxHeight * 0.8,
                                    width: constraints.maxWidth * 0.31,
                                    child: Opacity(
                                      opacity: speedLinesOpacities[index],
                                      child: CustomPaint(
                                        painter: SpeedLinePrinter(),
                                      ),
                                    ),
                                  );
                                },
                              ),

                              ...List.generate(
                                speedLinesOpacities.length, 
                                (index) {
                                  return Positioned(
                                    bottom: 20 + (2.0 * index),
                                    right: constraints.maxWidth * 0.13 - (30 * index),
                                    height: constraints.maxHeight * 0.8,
                                    width: constraints.maxWidth * 0.31,
                                    child: Transform.scale(
                                      scaleX: -1,
                                      child: Opacity(
                                        opacity: speedLinesOpacities[index],
                                        child: CustomPaint(
                                          painter: SpeedLinePrinter(),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ),
            ),
          )
          : const Center(
            child: Text(
              "Screen is too small to show the UI",
            ),
          ),
      ),
    );
  }
}



