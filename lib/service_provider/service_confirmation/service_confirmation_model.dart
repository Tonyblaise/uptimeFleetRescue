import '/backend/api_requests/api_calls.dart';
import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/chat/empty_image/empty_image_widget.dart';
import 'service_confirmation_widget.dart' show ServiceConfirmationWidget;
import 'package:flutter/material.dart';

class ServiceConfirmationModel
    extends FlutterFlowModel<ServiceConfirmationWidget> {
  ///  Local state fields for this page.

  String? image;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for userDetails component.
  late UserDetailsModel userDetailsModel;
  // State field(s) for TextFiel_odometer widget.
  FocusNode? textFielOdometerFocusNode;
  TextEditingController? textFielOdometerTextController;
  String? Function(BuildContext, String?)?
      textFielOdometerTextControllerValidator;
  String? _textFielOdometerTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Complete requests)] action in Button widget.
  ApiCallResponse? apiResultd4y;

  @override
  void initState(BuildContext context) {
    userDetailsModel = createModel(context, () => UserDetailsModel());
    textFielOdometerTextControllerValidator =
        _textFielOdometerTextControllerValidator;
    emptyImageModel = createModel(context, () => EmptyImageModel());
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userDetailsModel.dispose();
    textFielOdometerFocusNode?.dispose();
    textFielOdometerTextController?.dispose();

    emptyImageModel.dispose();
    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
