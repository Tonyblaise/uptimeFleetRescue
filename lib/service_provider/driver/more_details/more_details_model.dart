import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'more_details_widget.dart' show MoreDetailsWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoreDetailsModel extends FlutterFlowModel<MoreDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for Wherewouldyoulikethevehicletowedto widget.
  FFPlace wherewouldyoulikethevehicletowedtoValue = FFPlace();
  // State field(s) for dropOffInstructions widget.
  FocusNode? dropOffInstructionsFocusNode;
  TextEditingController? dropOffInstructionsTextController;
  String? Function(BuildContext, String?)?
      dropOffInstructionsTextControllerValidator;
  String? _dropOffInstructionsTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for willyoubewaitingwiththevehicle widget.
  FormFieldController<String>? willyoubewaitingwiththevehicleValueController;
  // State field(s) for ifnowherewillyouleavethekeys widget.
  FocusNode? ifnowherewillyouleavethekeysFocusNode;
  TextEditingController? ifnowherewillyouleavethekeysTextController;
  String? Function(BuildContext, String?)?
      ifnowherewillyouleavethekeysTextControllerValidator;
  // State field(s) for Areyourkeys widget.
  FormFieldController<String>? areyourkeysValueController;
  // State field(s) for DoesYourVehicleHaveaSpareTire widget.
  FormFieldController<String>? doesYourVehicleHaveaSpareTireValueController;

  @override
  void initState(BuildContext context) {
    dropOffInstructionsTextControllerValidator =
        _dropOffInstructionsTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    dropOffInstructionsFocusNode?.dispose();
    dropOffInstructionsTextController?.dispose();

    ifnowherewillyouleavethekeysFocusNode?.dispose();
    ifnowherewillyouleavethekeysTextController?.dispose();
  }

  /// Additional helper methods.
  String? get willyoubewaitingwiththevehicleValue =>
      willyoubewaitingwiththevehicleValueController?.value;
  String? get areyourkeysValue => areyourkeysValueController?.value;
  String? get doesYourVehicleHaveaSpareTireValue =>
      doesYourVehicleHaveaSpareTireValueController?.value;
}
