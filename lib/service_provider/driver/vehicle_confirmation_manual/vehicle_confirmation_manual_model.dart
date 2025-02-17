import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/chat/empty_image/empty_image_widget.dart';
import 'vehicle_confirmation_manual_widget.dart'
    show VehicleConfirmationManualWidget;
import 'package:flutter/material.dart';

class VehicleConfirmationManualModel
    extends FlutterFlowModel<VehicleConfirmationManualWidget> {
  ///  Local state fields for this page.

  String? vehicleId;

  String? color;

  String? state;

  String? image = '';

  String? details;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldColor widget.
  FocusNode? textFieldColorFocusNode1;
  TextEditingController? textFieldColorTextController1;
  String? Function(BuildContext, String?)?
      textFieldColorTextController1Validator;
  // State field(s) for TextFieldColor widget.
  FocusNode? textFieldColorFocusNode2;
  TextEditingController? textFieldColorTextController2;
  String? Function(BuildContext, String?)?
      textFieldColorTextController2Validator;
  // State field(s) for TextFieldColor widget.
  FocusNode? textFieldColorFocusNode3;
  TextEditingController? textFieldColorTextController3;
  String? Function(BuildContext, String?)?
      textFieldColorTextController3Validator;
  // State field(s) for TextFieldColor widget.
  FocusNode? textFieldColorFocusNode4;
  TextEditingController? textFieldColorTextController4;
  String? Function(BuildContext, String?)?
      textFieldColorTextController4Validator;
  String? _textFieldColorTextController4Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldNotes widget.
  FocusNode? textFieldNotesFocusNode;
  TextEditingController? textFieldNotesTextController;
  String? Function(BuildContext, String?)?
      textFieldNotesTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Model for empty_image component.
  late EmptyImageModel emptyImageModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? chatId;
  // Stores action output result for [Backend Call - API (Update vehicle)] action in Button widget.
  ApiCallResponse? apiResult1adCopy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RequestRecord? request;
  // Stores action output result for [Backend Call - API (Create a request)] action in Button widget.
  ApiCallResponse? apiResulty8vCopy;

  @override
  void initState(BuildContext context) {
    textFieldColorTextController4Validator =
        _textFieldColorTextController4Validator;
    emptyImageModel = createModel(context, () => EmptyImageModel());
  }

  @override
  void dispose() {
    textFieldColorFocusNode1?.dispose();
    textFieldColorTextController1?.dispose();

    textFieldColorFocusNode2?.dispose();
    textFieldColorTextController2?.dispose();

    textFieldColorFocusNode3?.dispose();
    textFieldColorTextController3?.dispose();

    textFieldColorFocusNode4?.dispose();
    textFieldColorTextController4?.dispose();

    textFieldNotesFocusNode?.dispose();
    textFieldNotesTextController?.dispose();

    emptyImageModel.dispose();
  }
}
