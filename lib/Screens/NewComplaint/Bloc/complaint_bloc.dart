import 'dart:io';

import 'package:cityproperties/Screens/MyRentals/Api/MyRentalsDetailsRemote.dart';
import 'package:cityproperties/Screens/MyRentals/Api/MyRentalsRemote.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsModel.dart';
import 'package:cityproperties/Screens/NewComplaint/Api/ComplainDataRemote.dart';
import 'package:cityproperties/Screens/NewComplaint/Api/NewComplainDataRemote.dart';
import 'package:cityproperties/Screens/NewComplaint/Api/ServiceTypeRemote.dart';
import 'package:cityproperties/Screens/NewComplaint/Api/SpotUnitRemote.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ComplaintData.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/LocationData.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ResultModel.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ServiceTypeModel.dart';
import 'package:cityproperties/Screens/Vacant/Api/VacantUnitRemote.dart';
import 'package:cityproperties/Screens/Vacant/Model/VacantUnitModel.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'complaint_state.dart';

part 'complaint_event.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  MyRentalsDataSource myRentalsDataSource;
  ServiceTypeDataSource serviceTypeDataSource;
  SpotUnitDataSource spotUnitDataSource;
  ComplainDataSource complainDataSource;
  NewComplainDataSource newComplainDataSource;
  ComplaintBloc({required this.myRentalsDataSource,
    required this.serviceTypeDataSource,
    required this.spotUnitDataSource,
    required this.complainDataSource,
    required this.newComplainDataSource
  })
      : super(ComplaintState.initial()) {
    on<GetServiceTypeEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''
        ..serviceTypeModel = ServiceTypeModel(listServiceType: [])));
      final result = await serviceTypeDataSource.getServiceType(
          propertyCode: event.propertyCode);
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) =>
        b
          ..isSuccess = false
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) =>
        b
          ..isSuccess = true
          ..isLoading = false
          ..serviceTypeModel = r));
        emit(state.rebuild((b) => b..isSuccess = false));
      });
    });



    on<GetSpotUnitEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccessSpotUnit = false
        ..isLoading = true
        ..error = ''
        ..locationData = LocationData(listLocation: [])));
      final result = await spotUnitDataSource.getSpotUnit(
          serviceTypeId: event.serviceType, propertyCode: event.propertyCode);
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) =>
        b
          ..isSuccessSpotUnit = false
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) =>
        b
          ..isSuccessSpotUnit = true
          ..isLoading = false
          ..locationData = r));
        emit(state.rebuild((b) => b..isSuccessSpotUnit = false));
      });
    });



    on<GetComplaintDataEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccessComplaint = false
        ..isLoading = true
        ..error = ''
        ..complaintData = ComplaintData(listComplaint: [])));
      final result = await complainDataSource.getComplainData(
          propertyCode: event.propertyCode,
          spotId: event.spotId,
          serviceTypeId: event.serviceType);
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) =>
        b
          ..isSuccessComplaint = false
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) =>
        b
          ..isSuccessComplaint = true
          ..isLoading = false
          ..complaintData = r));
        emit(state.rebuild((b) => b..isSuccessComplaint = false));
      });
    });

    on<TakeImageEvent>((event, emit) async {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.accessMediaLocation,
        Permission.photos
      ].request();
      bool permissions = false;
      if (Platform.isIOS) {
        permissions = await Permission.camera.isGranted
            && await Permission.photos.isGranted;
        print(Permission.photos.isGranted);
      } else if (Platform.isAndroid) {
        permissions = await Permission.camera.isGranted
            && await Permission.accessMediaLocation.isGranted;
      }


      if (permissions) {
        XFile? image;
        if (event.isCamera == false) {
          image = await getImage(ImageSource.gallery);
        } else {
          image = await getImage(ImageSource.camera);
        }
        print(image?.name);
        final Directory imagePath = await getApplicationDocumentsDirectory();
        String path = imagePath.path;
        String imageName = "${DateTime
            .now()
            .millisecondsSinceEpoch}.jpg";

        File file = File(image!.path);


        final File newImage = await file.copy('$path/$imageName');
        emit(state.rebuild((b) =>
        b
          ..imagePath='$path/$imageName' ));
       // emit(TakeImageState(image: newImage, permission: true));


        // }else{
        //   emit(TakeImageState(permission: false));
        // }

      }

      else{
        emit(state.rebuild((b) => b..error = "No Permission,enable permission from settings"));
      }


    });


    on<NewComplainEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isLoading = true
        ..error = ''
        ..resultData = ResultData(contact_no: '',
           status: ''
        )));
      final result = await newComplainDataSource.newComplain(
          complaintData: event.complaintData
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) =>
        b
          ..isLoading = false
          ..resultData = r
        ));
        emit(state.rebuild((b) =>
        b
          ..resultData = ResultData(contact_no: '',
              status: ''
          )));



      });
    });



    on<ResetEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..resultData=ResultData(
          contact_no: '',
          status: ''
        )
        ..error = ''
          ..imagePath=''
       ));

    });



        }
  Future<XFile?> getImage(ImageSource source)
  async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    return pickedFile;
  }


  }
