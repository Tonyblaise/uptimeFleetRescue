import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/chat/empty_image/empty_image_widget.dart';
import 'vehicle_confirmation3_widget.dart' show VehicleConfirmation3Widget;
import 'package:flutter/material.dart';

class VehicleConfirmation3Model
    extends FlutterFlowModel<VehicleConfirmation3Widget> {
  ///  Local state fields for this page.

  bool apiCallMade = false;

  String? details;

  List<String> image = [];
  void addToImage(String item) => image.add(item);
  void removeFromImage(String item) => image.remove(item);
  void removeAtIndexFromImage(int index) => image.removeAt(index);
  void insertAtIndexInImage(int index, String item) =>
      image.insert(index, item);
  void updateImageAtIndex(int index, Function(String) updateFn) =>
      image[index] = updateFn(image[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldLicense2 widget.
  FocusNode? textFieldLicense2FocusNode;
  TextEditingController? textFieldLicense2TextController;
  String? Function(BuildContext, String?)?
      textFieldLicense2TextControllerValidator;
  // State field(s) for DropDownState2 widget.
  String? dropDownState2Value;
  FormFieldController<String>? dropDownState2ValueController;
  // State field(s) for TextFieldNotes widget.
  FocusNode? textFieldNotesFocusNode;
  TextEditingController? textFieldNotesTextController;
  String? Function(BuildContext, String?)?
      textFieldNotesTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for empty_image component.
  late EmptyImageModel emptyImageModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? chatId;
  // Stores action output result for [Backend Call - API (Get vehicles)] action in Button widget.
  ApiCallResponse? vehicle;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RequestRecord? request;
  // Stores action output result for [Backend Call - API (Create a request)] action in Button widget.
  ApiCallResponse? apiResulty8vCopy;

  @override
  void initState(BuildContext context) {
    emptyImageModel = createModel(context, () => EmptyImageModel());
  }

  @override
  void dispose() {
    textFieldLicense2FocusNode?.dispose();
    textFieldLicense2TextController?.dispose();

    textFieldNotesFocusNode?.dispose();
    textFieldNotesTextController?.dispose();

    emptyImageModel.dispose();
  }
}
