import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/chat/empty_image/empty_image_widget.dart';
import 'vehicle_confirmation2_widget.dart' show VehicleConfirmation2Widget;
import 'package:flutter/material.dart';

class VehicleConfirmation2Model
    extends FlutterFlowModel<VehicleConfirmation2Widget> {
  ///  Local state fields for this page.

  String? vehicleId;

  String? color;

  String? state;

  String? image = '';

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
