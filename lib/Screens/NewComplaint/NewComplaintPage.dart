import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomLists/ListComplaint.dart';
import 'package:cityproperties/CustomWidgets/ElevatedButtonWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/NewComplaint/Bloc/complaint_bloc.dart';
import 'package:cityproperties/Screens/NewComplaint/Bloc/complaint_state.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ComplaintData.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/LocationData.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ServiceTypeModel.dart';
import 'package:cityproperties/injection.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'Widgets/BottomSheetAddComment.dart';
import 'Widgets/BottomSheetWidget.dart';

class NewComplaintPage extends StatefulWidget {
  final String shortCode;
  final String propertyCode;
  final String propertyName;
  final String devCode;

  const NewComplaintPage(
      {Key? key,
      required this.shortCode,
      required this.propertyCode,
      required this.propertyName,
      required this.devCode})
      : super(key: key);

  @override
  State<NewComplaintPage> createState() => _NewComplaintPageState();
}

class _NewComplaintPageState extends State<NewComplaintPage> with BaseMixin {
  //late ComplaintBloc _bloc;

  ComplaintBloc complaintBloc = sl<ComplaintBloc>();

  String serviceName = "";
  String serviceTypeId = "";
  String spotDesc = "";
  String spotId = "";
  String complainDesc = "";
  String complainId = "";
  String comment = "";
  File? image;
  String imageName = '';
  String date = "";
  String time = "";
  String mobile = "";

  @override
  void initState() {
    print(widget.propertyCode);

    complaintBloc.add(ResetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComplaintBloc, ComplaintState>(
      bloc: complaintBloc,
      listener: (context, state) {
        if (state.isSuccess!
            ) {
          if(state.serviceTypeModel!.listServiceType!.isNotEmpty) {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.sp),
                topRight: Radius.circular(22.sp),
              )),
              context: context,
              builder: (builder) {
                return BottomSheetWidget(
                  services: state.serviceTypeModel!.listServiceType!,
                );
              }).then((value) {
            if (value is ListServiceType) {
              serviceName = value.sERVICETYPENAME ?? "";
              serviceTypeId = value.sERVICETYPEID ?? "";
              spotDesc = "";
              complainDesc = "";
              setState(() {});
            }
          });
          }

        }
        if (state.isSuccessSpotUnit!
            ) {
          if(state.locationData!.listLocation!.isNotEmpty) {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.sp),
                topRight: Radius.circular(22.sp),
              )),
              context: context,
              builder: (builder) {
                return BottomSheetWidget(
                  locations: state.locationData!.listLocation!,
                );
              }).then((value) {
            if (value is ListLocation) {
              spotDesc = value.sPOTDESC ?? "";
              spotId = value.sPOTID ?? "";
              complainDesc = "";
              setState(() {});
            }
          });
          }
          else{
            showInSnackBar(context,
                LocaleKeys.ttl_No_Record_Available.tr());
          }
        }

        if (state.isSuccessComplaint!
            ) {
          if(state.complaintData.listComplaint!.isNotEmpty) {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.sp),
                topRight: Radius.circular(22.sp),
              )),
              builder: (builder) {
                return BottomSheetWidget(
                  complaints: state.complaintData.listComplaint,
                );
              }).then((value) {
            if (value is ListComplaint) {
              complainDesc = value.cOMPLAINTDESC ?? "";
              complainId = value.cOMPLAINTID ?? "";
              setState(() {});
            }
          });
          }
          else{
            showInSnackBar(context,
                LocaleKeys.ttl_No_Record_Available.tr());
          }
        }

        if (state.resultData != null && state.resultData!.status!.isNotEmpty) {
          onNewComplainRespose(
              state.resultData!.status!, state.resultData!.contact_no ?? '');
        }
        if (state.error!.isNotEmpty) {
          showInSnackBar(context, state.error!);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state.isLoading!,
            child: Scaffold(
              backgroundColor: MyColors.liteWhite,
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 22.sp,
                  ),
                ),
                title: Text(
                  LocaleKeys.lbl_req_new_complaint.tr(),
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            _bottomSheetWidget(context, complaintBloc);
                          },
                          child: SizedBox(
                            height: 180.h,
                            child:
                                Stack(alignment: Alignment.center, children: [
                              state.imagePath != null &&
                                      state.imagePath!.isNotEmpty
                                  ? Image.file(File(state.imagePath!))
                                  : Center(
                                      child: Icon(
                                        Icons.add_a_photo_outlined,
                                        size: 140.w,
                                        color: MyColors.unselectedIcon
                                            .withOpacity(0.4),
                                      ),
                                    ),
                              Center(
                                  child: RichText(
                                      text: TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.green,
                                    size: 20.w,
                                  )),
                                  TextSpan(
                                    text: "Upload image",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp),
                                  )
                                ],
                              ))),
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ListComplaintWidget(
                          onPressed: () {
                            //    _bloc.add(GetPropertiesEvent(devCode: devCode!));
                          },
                          type: LocaleKeys.lbl_comp_property.tr(),
                          value: widget.propertyName,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ListComplaintWidget(
                          type: LocaleKeys.lbl_comp_requesttype.tr(),
                          value: serviceName.isNotEmpty
                              ? serviceName
                              : LocaleKeys.dtl_comp_requesttype.tr(),
                          onPressed: () {
                            complaintBloc.add(GetServiceTypeEvent(
                                propertyCode: widget.propertyCode));

                            //  _bloc.add(GetServicesEvent(propertyCode: propertyCode));
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ListComplaintWidget(
                          type: LocaleKeys.lbl_comp_location.tr(),
                          value: spotDesc.isNotEmpty
                              ? spotDesc
                              : LocaleKeys.dtl_comp_location.tr(),
                          onPressed: () {
                            if (serviceName.isNotEmpty) {
                              complaintBloc.add(GetSpotUnitEvent(
                                  propertyCode: widget.propertyCode,
                                  serviceType: serviceTypeId));
                            } else {
                              showInSnackBar(context, "Please select service");
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ListComplaintWidget(
                          type: LocaleKeys.lbl_comp_complaint.tr(),
                          value: complainDesc.isNotEmpty
                              ? complainDesc
                              : LocaleKeys.dtl_comp_complaint.tr(),
                          onPressed: () {
                            if (spotDesc.isNotEmpty) {
                              complaintBloc.add(GetComplaintDataEvent(
                                propertyCode: widget.propertyCode,
                                spotId: spotId,
                                serviceType: serviceTypeId,
                              ));
                            } else {
                              showInSnackBar(context, "Please select location");
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ListComplaintWidget(
                          type: LocaleKeys.lbl_comp_availability.tr(),
                          value: date.isNotEmpty
                              ? "$date  $time"
                              : LocaleKeys.dtl_comp_availability.tr(),
                          onPressed: () async {
                            DateTime now = DateTime.now();
                            DateTime min = DateTime(now.year, now.month,
                                now.day, now.hour + 1, now.minute, now.second);
                            // DateTime max =DateTime(now.year+1,now.month,now.day,
                            //     now.hour,now.minute,now.second
                            // );
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                minTime: min, onChanged: (date) {
                              print('change $date');
                            }, onConfirm: (dateConfirm) {
                              date = getFormattedDate(dateConfirm.toString(),
                                  outputFormat: "dd/MMM/yyyy");
                              time = getFormattedDate(dateConfirm.toString(),
                                  outputFormat: DateFormat.HOUR_MINUTE);
                              print('confirm $date');
                              setState(() {});
                            }, currentTime: min, locale: LocaleType.en);
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ListComplaintWidget(
                          type: LocaleKeys.lbl_comp_more_info.tr(),
                          value: comment.isNotEmpty
                              ? comment
                              : LocaleKeys.dtl_comp_more_info.tr(),
                          onPressed: () async {
                            await showModalBottomSheet(
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(22.w),
                                  topRight: Radius.circular(22.w),
                                )),
                                context: context,
                                builder: (builder) {
                                  return BottomSheetAddComment(
                                    comment: comment,
                                    mobileNumber: mobile,
                                  );
                                }).then((value) {
                              if (value is List) {
                                comment = value[0];
                                mobile = value[1];
                                setState(() {});
                                //   _bloc.add(UpdateEvent());
                              }
                            });
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButtonWidget(
                            text: LocaleKeys.lbl_req_new_complaint.tr(),
                            bgColor: MyColors.colorBGBrown,
                            textColor: MyColors.white,
                            onPressed: () async {
                              if ((state.imagePath != null &&
                                      state.imagePath!.isNotEmpty) &&
                                  complainDesc.isNotEmpty &&
                                  date.isNotEmpty) {
                                image = File(state.imagePath!);
                                Map<String, Object> obj = getComplaintObj();
                                complaintBloc
                                    .add(NewComplainEvent(complaintData: obj));
                              } else if (serviceName.isEmpty) {
                                showInSnackBar(
                                    context, "Please select Service");
                              } else if (spotDesc.isEmpty) {
                                showInSnackBar(
                                    context, "Please select Location");
                              } else if (complainDesc.isEmpty) {
                                showInSnackBar(
                                    context, "Please select Service In");
                              } else if (date.isEmpty) {
                                showInSnackBar(context, "Please Select Date");
                              } else if (state.imagePath == null ||
                                  state.imagePath!.isEmpty) {
                                showInSnackBar(context, "Please select image");
                              }

                              // _bottomSheetWidget(context, _bloc);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }

  Map<String, Object> getComplaintObj() {
    String base64Image = '';

    if (image != null) {
      final bytes = File(image!.path).readAsBytesSync();
      base64Image = base64Encode(bytes);
    }

    String? pidNo = Preferences.preferences!.getString(KeyConstants.keyPidNo);
    String? tenantCode =
        Preferences.preferences!.getString(KeyConstants.keyUserId);
    Map<String, Object> obj = HashMap();

    obj['cmremarks'] = comment;
    obj['cmmobile'] = mobile;
    obj['image_data'] = base64Image;
    obj['image_name'] = imageName;
    obj['PROPERTYCODE'] = widget.propertyCode;
    obj['CMTENANT'] = pidNo!;
    obj['CMTENANTCODE'] = tenantCode!;
    obj['CMTENANTAVAIALABLE'] = date;
    obj['CMTENANTAVAIALABLETIME'] = time;
    obj['complaintid'] = complainId;
    obj['Devcode'] = widget.devCode;
    obj['servicetype'] = serviceTypeId;
    obj['complaintservicetypem'] = '';
    obj['requestinvaluenumber'] = '';
    obj['cmdspotvalue'] = spotId;

    return obj;
  }

  void onNewComplainRespose(String result, String data) {
    switch (result) {
      case "200":
        showAlertDialog(
            title: LocaleKeys.ttl_success.tr(),
            context: context,
            msg: LocaleKeys.request_registered_success.tr(),
            positivePressed: () {
              Navigator.pop(context);
              Navigator.pop(context, true);
            });
        break;
      case "300":
        showAlertDialog(
            title: LocaleKeys.ttl_failed.tr(),
            context: context,
            msg: "${LocaleKeys.expired_tenancy_contract.tr()} $date",
            positivePressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            });
        //  showAlertDialog(getString(R.string.ttl_failed),String.format(getString(R.string.expired_tenancy_contract),data.contactNo),false);

        break;
      case "400":
        showAlertDialog(
            title: LocaleKeys.ttl_failed.tr(),
            context: context,
            msg: "${LocaleKeys.rent_outstanding_amount.tr()} $date",
            positivePressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            });
        // showAlertDialog(getString(R.string.ttl_failed),String.format(getString(R.string.rent_outstanding_amount),data.contactNo),false);
        break;

      case "500":
        showAlertDialog(
            title: LocaleKeys.ttl_failed.tr(),
            context: context,
            msg: "${LocaleKeys.maintenance_outstanding_amount.tr()} $date",
            positivePressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            });
        //   showAlertDialog(getString(R.string.ttl_failed),String.format(getString(R.string.maintenance_outstanding_amount),data.contactNo),false);
        break;

      case "600":
        showAlertDialog(
            title: LocaleKeys.ttl_failed.tr(),
            context: context,
            msg: LocaleKeys.request_already_exists.tr(),
            positivePressed: () {
              // Navigator.pop(context);
              Navigator.pop(context);
            });
        //  showAlertDialog(getString(R.string.ttl_failed),getString(R.string.request_already_exists),false);
        break;

      case "100":
        showAlertDialog(
            title: LocaleKeys.ttl_failed.tr(),
            context: context,
            msg: LocaleKeys.lbl_some_thing_wrong.tr(),
            positivePressed: () {
              // Navigator.pop(context);
              Navigator.pop(context);
            });
        // showAlertDialogWeb(getString(R.string.lbl_sorry),"Image not Uploaded");
        break;

      case "101":
        showAlertDialog(
            title: LocaleKeys.ttl_failed.tr(),
            context: context,
            msg: LocaleKeys.ttl_image_uploading_failed.tr(),
            positivePressed: () {
              // Navigator.pop(context);
              Navigator.pop(context);
            });
        // Toast.makeText(this,"Image uploading failed",Toast.LENGTH_SHORT).show();
        break;

      default:
        showAlertDialog(
            title: LocaleKeys.ttl_failed.tr(),
            context: context,
            msg: LocaleKeys.lbl_some_thing_wrong.tr(),
            positivePressed: () {
              // Navigator.pop(context);
              Navigator.pop(context);
            });
      //  showAlertDialog(getString(R.string.ttl_failed),getString(R.string.lbl_some_thing_wrong),false);
    }
  }
}

_bottomSheetWidget(BuildContext context, ComplaintBloc _bloc) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return SafeArea(
          child: Container(
            height: 250.0.h,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.w),
                        topRight: Radius.circular(25.w))),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text(
                          LocaleKeys.ttl_action.tr(),
                          style: TextStyle(
                            color: MyColors.colorBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      IconButtonWidget(
                        onPressed: () {
                          _bloc.add(TakeImageEvent(isCamera: true));
                          Navigator.pop(context);
                        },
                        text: LocaleKeys.ttl_camera.tr(),
                        icon: Icons.add_a_photo_outlined,
                        bgColor: MyColors.colorPrimary,
                      ),
                      IconButtonWidget(
                        onPressed: () {
                          _bloc.add(const TakeImageEvent(isCamera: false));
                          Navigator.pop(context);
                        },
                        text: LocaleKeys.ttl_gallery.tr(),
                        icon: Icons.add_photo_alternate_outlined,
                        bgColor: MyColors.colorBGBrown,
                      ),
                    ],
                  ),
                )),
          ),
        );
      });
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    Key? key,
    this.text = '',
    this.icon,
    this.bgColor = MyColors.colorPrimary,
    this.textColor = MyColors.white,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final Color bgColor, textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        size: 22.w,
      ),
      onPressed: onPressed,
      label: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 14.sp),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
          padding: MaterialStateProperty.all(EdgeInsets.all(15.w)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.w),
          ))),
    );
  }
}
