import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/chat/empty_image/empty_image_widget.dart';
import 'vehicle_confirmation_widget.dart' show VehicleConfirmationWidget;
import 'package:flutter/material.dart';

class VehicleConfirmationModel
    extends FlutterFlowModel<VehicleConfirmationWidget> {
  ///  Local state fields for this page.

  String? vehicleId;

  String? color;

  String? state;

  String? image =
      'https://dd8c54a01d09ed2b89dfbd9e5dfe0b12.cdn.bubble.io/f1707747018407x476662704940518100/photo.png';

  bool apiCallMade = false;

  String? details;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'At least 2 characters required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Get vehicles)] action in Button widget.
  ApiCallResponse? vehicle;
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

  // State field(s) for TextFieldDetails widget.
  FocusNode? textFieldDetailsFocusNode;
  TextEditingController? textFieldDetailsTextController;
  String? Function(BuildContext, String?)?
      textFieldDetailsTextControllerValidator;
  // State field(s) for DropDownState widget.
  String? dropDownStateValue;
  FormFieldController<String>? dropDownStateValueController;
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
    textController1Validator = _textController1Validator;
    textFieldColorTextControllerValidator =
        _textFieldColorTextControllerValidator;
    emptyImageModel = createModel(context, () => EmptyImageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    textFieldColorFocusNode?.dispose();
    textFieldColorTextController?.dispose();

    textFieldDetailsFocusNode?.dispose();
    textFieldDetailsTextController?.dispose();

    emptyImageModel.dispose();
  }
}
