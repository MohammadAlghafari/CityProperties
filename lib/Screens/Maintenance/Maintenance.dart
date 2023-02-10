import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomWidgets/ErrorWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/Maintenance/Widgets/MaintenanceHistory/MaintHistoryPage.dart';
import 'package:cityproperties/Screens/MyRentals/Bloc/myrentals_bloc.dart';
import 'package:cityproperties/Screens/MyRentals/Bloc/myrentals_state.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../CustomLists/ListRealEstate.dart';


class MaintenancePage extends StatefulWidget {
  final MyRentalsBloc myRentalsBloc;

  const MaintenancePage({Key? key, required this.myRentalsBloc}) : super(key: key);

  @override
  _MaintenancePageState createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage>
    with BaseMixin, AutomaticKeepAliveClientMixin {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<MyRentalsBloc, MyRentalsState>(
      bloc: widget.myRentalsBloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.liteWhite,
          appBar: AppBar(
            title: Text(
              LocaleKeys.ttl_maint.tr(),
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          body: state.isLoading!
              ? SizedBox(
                  height: 0.9.sh,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ) ,
                )
              : state.myRentalsModel!.listMyRentals != null &&
                      state.myRentalsModel!.listMyRentals!.isNotEmpty
                  ? SafeArea(
                      child:

                      Container(
                          color: MyColors.liteWhite,
                          child: RawScrollbar(
                            thickness: 5.w,
                            controller: controller,
                            thumbColor: Colors.grey.shade500,
                            radius: Radius.circular(20.sp),
                            crossAxisMargin: 2.w,
                            child: RefreshIndicator(
                              onRefresh: ()async{
                                widget.myRentalsBloc.add(GetMyRentalsEvent());
                              },
                              child: ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics()
                                ),
                                controller: controller,
                                itemCount:
                                state.myRentalsModel!.listMyRentals!.length,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 8.w),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                               MaintenanceHistoryPage(
                                                shortCode: state.myRentalsModel!.listMyRentals![index].sHORTCODE??"",
                                                 propertyCode: state.myRentalsModel!.listMyRentals![index].pROPERTYCODE??"",
                                                 devCode: state.myRentalsModel!.listMyRentals![index].dEVCODE??"",
                                                 propertyName: state.myRentalsModel!.listMyRentals![index].pROPERTYNAME??"",
                                              )));
                                    },
                                    child: ListRealEstate(
                                      name: isArabic(context)
                                          ? state.myRentalsModel!.listMyRentals![index].dEVNAMEAR??""
                                          : state.myRentalsModel!.listMyRentals![index].dEVNAME??"",
                                      city: state.myRentalsModel!.listMyRentals![index].pROPERTYNAME??"",
                                      shortCode: state.myRentalsModel!.listMyRentals![index].sHORTCODE??"",
                                      realEstate: false,
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                    SizedBox(height: 12.h),
                              ),
                            ),
                          )),
                    )
                  : SizedBox(
                      height: 0.9.sh,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          widget.myRentalsBloc.add(GetMyRentalsEvent());
                        },
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 0.45.sh,
                            ),
                            ErrorTextWidget(
                              error: state.error!.isNotEmpty
                                  ? state.error!
                                  : LocaleKeys.ttl_No_Record_Available.tr(),
                            ),
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
