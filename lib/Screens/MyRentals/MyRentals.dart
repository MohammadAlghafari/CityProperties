import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomWidgets/ErrorWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/MyRentals/Bloc/myrentals_bloc.dart';
import 'package:cityproperties/Screens/MyRentals/Bloc/myrentals_state.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../CustomLists/ListRealEstate.dart';
import 'RentalDetail/RentalDetail.dart';

class MyRentalsPage extends StatefulWidget {
  final MyRentalsBloc myRentalsBloc;

  const MyRentalsPage({Key? key, required this.myRentalsBloc})
      : super(key: key);

  @override
  _MyRentalsPageState createState() => _MyRentalsPageState();
}

class _MyRentalsPageState extends State<MyRentalsPage>
    with BaseMixin, AutomaticKeepAliveClientMixin {
  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<MyRentalsBloc, MyRentalsState>(
      bloc: widget.myRentalsBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.liteWhite,
          appBar: AppBar(
            title: Text(
              LocaleKeys.tab_min_my_rentals.tr(),
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          body: state.isLoading!
              ? SizedBox(
                  height: 0.9.sh,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : state.myRentalsModel!.listMyRentals != null &&
                      state.myRentalsModel!.listMyRentals!.isNotEmpty
                  ? SafeArea(
                      child: Container(
                          color: MyColors.liteWhite,
                          child: RawScrollbar(
                            thickness: 5.w,
                            thumbColor: Colors.grey.shade700,
                            radius: Radius.circular(20.sp),
                            crossAxisMargin: 2.w,
                            child: RefreshIndicator(
                              onRefresh: ()async{
                                widget.myRentalsBloc.add(GetMyRentalsEvent());
                              },
                              child: ListView.separated(
                                itemCount: state.myRentalsModel!.listMyRentals!.length,
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
                                                  RentalDetailPage(
                                                    myRentalsBloc: widget.myRentalsBloc,
                                                    propCode: state.myRentalsModel!.listMyRentals!
                                                    [index].pROPERTYCODE!,
                                                  )));
                                    },
                                    child: ListRealEstate(
                                      name: !isArabic(context)
                                          ? state.myRentalsModel!.listMyRentals![index].dEVNAME
                                          : state.myRentalsModel!.listMyRentals![index].dEVNAMEAR,
                                      city: state.myRentalsModel!.listMyRentals![index].pROPERTYNAME,
                                      shortCode: state.myRentalsModel!.listMyRentals![index].sHORTCODE,
                                      realEstate: true,
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
                      child:
                          RefreshIndicator(
                            onRefresh: ()async{
                              widget.myRentalsBloc.add(GetMyRentalsEvent());
                            },
                            child: ListView(
                              children: [
                                SizedBox(height: 0.45.sh,),
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
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
