import '/flutter_flow/flutter_flow_util.dart';
import 'edit_your_information_widget.dart' show EditYourInformationWidget;
import 'package:flutter/material.dart';

class EditYourInformationModel
    extends FlutterFlowModel<EditYourInformationWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
