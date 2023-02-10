
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterPage extends StatefulWidget {
 final String statusValue ;
 final String categoryValue ;
   FilterPage({Key? key,
     required this.statusValue,
    required this.categoryValue
  }) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  late String statusValue ;
  late String categoryValue ;

  List<String> statusList = [
    "All",
    "Completed",
    "Received",
    "Assigned",
    "WIP",
    "Cancelled"
  ];

  List<String> categoryList = [
    "All","Air Conditioning","Plumbing","Carpentry",
    "Electricity","Bathtub","Ceramic","Painting","Pest Control"];



  @override
  void initState() {
    statusValue=widget.statusValue;
    categoryValue=widget.categoryValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.liteWhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 22.sp,
          ),
        ),

        title: Text(LocaleKeys.ttl_filter.tr(),style: TextStyle(
          fontSize: 16.sp
        )),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.ttl_by_status.tr(),
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.w)),

                child: DropdownButton<String>(
                  isExpanded: true,
                  value: statusValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(color: MyColors.colorBlack),
                  onChanged: (String? newValue) {
                    setState(() {
                      statusValue = newValue!;
                    });
                  },
                  items:
                      statusList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(child: Text(value,
                      style: TextStyle(
                        fontSize: 14.sp
                      ),
                      )),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 45.h,),
              Text(
                LocaleKeys.ttl_by_category.tr(),
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 17.h,
              ),
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.w)),

                child: DropdownButton<String>(

                  isExpanded: true,
                  value: categoryValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style:  TextStyle(color: MyColors.colorBlack,
                  fontSize: 14.sp
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      categoryValue = newValue!;
                    });
                  },
                  items:
                   categoryList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(child: Text(value)),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 45.h,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                       statusValue ='All';
                       categoryValue ='All';
                       Navigator.pop(context,[statusValue,categoryValue]);
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(11.w)),
                          backgroundColor: MaterialStateProperty.all(MyColors.colorBGBrown)
                      ),
                      child: Text(
                        LocaleKeys.lbl_reset.tr(),
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context,[statusValue,categoryValue]);
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(11.w)),
                          backgroundColor: MaterialStateProperty.all(MyColors.colorBGBrown)
                      ),
                      child: Text(
                        LocaleKeys.ttl_apply.tr(),
                        style: TextStyle(
                          fontSize: 13.sp
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
