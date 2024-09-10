import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/chat/empty_image/empty_image_widget.dart';
import '/service_provider/confirm_request/confirm_request_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'vehicle_confirmation2_widget.dart' show VehicleConfirmation2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VehicleConfirmation2Model
    extends FlutterFlowModel<VehicleConfirmation2Widget> {
  ///  Local state fields for this page.

  String? vehicleId;

  String? color;

  String? state;

  String? image =
      'https://dd8c54a01d09ed2b89dfbd9e5dfe0b12.cdn.bubble.io/f1707747018407x476662704940518100/photo.png';

  String? details;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldColor widget.
  FocusNode? textFieldColorFocusNode;
  TextEditingController? textFieldColorTextController;
  String? Function(BuildContext, String?)?
      textFieldColorTextControllerValidator;
  String? _textFieldColorTextControllerValidator(
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
    textFieldColorTextControllerValidator =
        _textFieldColorTextControllerValidator;
    emptyImageModel = createModel(context, () => EmptyImageModel());
  }

  @override
  void dispose() {
    textFieldColorFocusNode?.dispose();
    textFieldColorTextController?.dispose();

    textFieldNotesFocusNode?.dispose();
    textFieldNotesTextController?.dispose();

    emptyImageModel.dispose();
  }
}
