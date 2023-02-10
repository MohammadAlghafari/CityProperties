import 'dart:io';

import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomWidgets/ElevatedButtonWidget.dart';
import 'package:cityproperties/CustomWidgets/TextFormFieldWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/DashBoardPage/Bloc/dashboard_bloc.dart';
import 'package:cityproperties/Screens/DashBoardPage/DashBoardPage.dart';
import 'package:cityproperties/Screens/HomePage/Bloc/home_state.dart';
import 'package:cityproperties/Screens/Maintenance/Maintenance.dart';
import 'package:cityproperties/Screens/MyRentals/Bloc/myrentals_bloc.dart';
import 'package:cityproperties/Screens/MyRentals/MyRentals.dart';
import 'package:cityproperties/Screens/Setting/Bloc/setting_bloc.dart';
import 'package:cityproperties/Screens/Setting/SettingPage.dart';
import 'package:cityproperties/Screens/Vacant/Vacant.dart';
import 'package:cityproperties/injection.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cityproperties/Screens/HomePage/Bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BaseMixin {


  PageController pageController = PageController(
    initialPage: 0,
  );


  late DashboardBloc dashboardBloc;
  late HomeBloc homeBloc;
  late MyRentalsBloc myRentalsBloc;
  late SettingBloc settingBloc;
  @override
  void initState() {
    setUpNotification(context);

    homeBloc = sl<HomeBloc>();
    homeBloc.add(ChangePageEvent(page: 0));
    dashboardBloc = sl<DashboardBloc>();
    myRentalsBloc=sl<MyRentalsBloc>();
    settingBloc=sl<SettingBloc>();
    myRentalsBloc.add(GetMyRentalsEvent());
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
      builder: (context, state) {

        return
          WillPopScope(
            onWillPop: ()async{
              if(state.page!=0){
                homeBloc.add(ChangePageEvent(page: 0));
                pageController.jumpToPage(0);
              }
              else{
                showAlertDialog(context: context,
                  title:LocaleKeys.ttl_exit.tr(),
                  msg:LocaleKeys.ttl_are_you_sure.tr(),
                  positivePressed: (){
                    exit(0);
                  },
                  negativePressed: (){
                    Navigator.pop(context);
                  },
                  cancelable: true,
                  negativeBtn: LocaleKeys.ttl_no.tr(),
                  positiveBtn: LocaleKeys.ttl_yes.tr(),
                );
              }


              return false;
            },
            child: Scaffold(

              body: PageView(
                onPageChanged: (value) {
                  homeBloc.add(ChangePageEvent(page: value));
                },
                controller: pageController,
                children: [
                  DashBoardPage(dashboardBloc:
                  dashboardBloc,),
                  MaintenancePage(
                    myRentalsBloc: myRentalsBloc,
                  ),
                  MyRentalsPage(
                    myRentalsBloc: myRentalsBloc,
                  ),
                  VacantPage(
                    myRentalsBloc: myRentalsBloc,
                  ),
                  SettingPage(
                      settingBloc:settingBloc
                  ),


                ],
              ),
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  // sets the background color of the `BottomNavigationBar`
                  canvasColor: MyColors.colorBlack,
                ),
                child: BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: const ImageIcon(
                          AssetImage("assets/tab_dashboard_icon.png",
                          ),
                          // color: Colors.black,
                        ),
                        label: LocaleKeys.tab_dashboard.tr(),
                      ),
                      BottomNavigationBarItem(
                        icon: const ImageIcon(
                          AssetImage("assets/tab_maintenance.png"),
                          // color: Colors.black,
                        ),
                        label: LocaleKeys.ttl_maint.tr(),
                      ),
                      BottomNavigationBarItem(
                        icon: const ImageIcon(
                          AssetImage("assets/tab_realestate_icon.png"),
                          // color: Colors.black,
                        ),
                        label: LocaleKeys.tab_min_my_rentals.tr(),
                      ),
                      BottomNavigationBarItem(
                        icon: const ImageIcon(
                          AssetImage("assets/tab_vacants.png"),
                          // color: Colors.black,
                        ),
                        label: LocaleKeys.tab_min_vacant_units.tr(),
                      ),
                      BottomNavigationBarItem(
                        icon: const ImageIcon(
                          AssetImage("assets/tab_settings.png"),
                          // color: Colors.black,
                        ),
                        label: LocaleKeys.tab_settings.tr(),
                      ),
                    ],
                    iconSize: 20.w,
                    selectedLabelStyle: TextStyle(
                      fontSize: 12.sp,
                    ),
                    unselectedFontSize: 11.sp,

                    currentIndex: state.page,
                    unselectedItemColor: MyColors.unselectedIcon,
                    selectedItemColor: MyColors.white,
                    showUnselectedLabels: true,
                    backgroundColor: MyColors.colorPrimary,
                    onTap: _onItemTapped),
              ),
            ),
          ) ;
      },
    );
  }

  void _onItemTapped(int index) {


      homeBloc.add(ChangePageEvent(page: index));
      pageController.jumpToPage(index);
      // print(index.toString());

  }

}