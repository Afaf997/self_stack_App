import 'package:flutter/material.dart';
import 'package:self_stack/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/pie.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget buildChartSection(double screenWidth, DashBoardState state) {
    late TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
    if (state is InitaialState) {
      List<GDPData> chatData = state.chatdata;
      return SfCircularChart(
        palette: [kselfstackGreen, kredtheme, kyellow, kblueTheme, Colors.orange],
        title: ChartTitle(
          text: "Status Of Review",
          textStyle: TextStyle(
            color: kwhiteModel,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.04,
          ),
        ),
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.scroll,
          textStyle: TextStyle(color: kwhiteModel),
        ),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          DoughnutSeries<GDPData, String>(
            dataSource: chatData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.taskValue,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
          ),
        ],
      );
    } else {
      return CircularProgressIndicator();
    }
  }

