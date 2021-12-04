import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabittracker/theme/app_theme.dart';
import 'package:myhabittracker/theme/colors.dart';
import 'package:myhabittracker/widgets/app_bar.dart';
import 'package:myhabittracker/widgets/bottom_nav_bar.dart';
import 'package:myhabittracker/widgets/timeline_date.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: MyAppBar(),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: MyBodyInicio(),
    );
  }
}

class MyBodyInicio extends StatefulWidget {
  const MyBodyInicio({Key? key}) : super(key: key);

  @override
  State<MyBodyInicio> createState() => _MyBodyInicioState();
}

class _MyBodyInicioState extends State<MyBodyInicio>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // @override
  // void initState() {
  //   _tabController = new TabController(length: 2, vsync: this);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    DateTime _selectedValue = DateTime.now();

    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TimeLineDate(DateTime.now()),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    constraints:
                        const BoxConstraints.expand(height: 24, width: 320),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: AppColors.grayWhite,
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(50), // Creates border
                        color: AppColors.cyan,
                      ), //Change background color from here
                      labelColor: AppColors.white,
                      unselectedLabelColor: AppColors.grayDark,
                      unselectedLabelStyle: GoogleFonts.montserrat(
                        fontSize: 11,
                        color: AppColors.grayDark,
                        fontWeight: FontWeight.w300,
                      ),
                      labelStyle: GoogleFonts.montserrat(
                        fontSize: 11,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      tabs: const [
                        Tab(text: "hoje"),
                        Tab(text: "esta semana"),
                        Tab(text: "este mês"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Container(
                          child: Text("hoje"),
                        ),
                        Container(
                          child: Text("esta semana"),
                        ),
                        Container(
                          child: Text("este mês"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
