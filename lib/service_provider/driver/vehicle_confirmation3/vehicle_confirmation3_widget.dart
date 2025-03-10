import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/chat/empty_image/empty_image_widget.dart';
import '/service_provider/confirm_request/confirm_request_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'vehicle_confirmation3_model.dart';
export 'vehicle_confirmation3_model.dart';

class VehicleConfirmation3Widget extends StatefulWidget {
  const VehicleConfirmation3Widget({
    super.key,
    required this.service,
    this.additionalInfo,
  });

  final String? service;
  final String? additionalInfo;

  static String routeName = 'vehicle_confirmation3';
  static String routePath = 'vehicle_confirmation3';

  @override
  State<VehicleConfirmation3Widget> createState() =>
      _VehicleConfirmation3WidgetState();
}

class _VehicleConfirmation3WidgetState
    extends State<VehicleConfirmation3Widget> {
  late VehicleConfirmation3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VehicleConfirmation3Model());

    _model.textFieldLicense2TextController ??= TextEditingController();
    _model.textFieldLicense2FocusNode ??= FocusNode();

    _model.textFieldNotesTextController ??= TextEditingController();
    _model.textFieldNotesFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'vehicle_confirmation3',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Color(0xFF1E293B)),
              automaticallyImplyLeading: true,
              title: Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Vehicle Confirmation',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Yantramanav',
                            color: Color(0xFF1E293B),
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 500.0,
                  ),
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xF304B53E),
                                      FlutterFlowTheme.of(context).tertiary
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(36.0),
                                    bottomRight: Radius.circular(36.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Enter',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Yantramanav',
                                                color: Colors.black,
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                        TextSpan(
                                          text: '\nvehicle details',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 36.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'License Plate',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Yantramanav',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        4.0),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textFieldLicense2TextController,
                                                              focusNode: _model
                                                                  .textFieldLicense2FocusNode,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Enter vehicle license plate',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Yantramanav',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFCBD5E1),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                filled: true,
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Yantramanav',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                              validator: _model
                                                                  .textFieldLicense2TextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'State',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Yantramanav',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            controller: _model
                                                                    .dropDownState2ValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    null),
                                                            options: [
                                                              'Alabama',
                                                              'Alaska',
                                                              'American Samoa',
                                                              'Arizona',
                                                              'Arkansas',
                                                              'California',
                                                              'Colorado',
                                                              'Connecticut',
                                                              'Delaware',
                                                              'District Of Columbia',
                                                              'Federated States Of Micronesia',
                                                              'Florida',
                                                              'Georgia',
                                                              'Guam',
                                                              'Hawaii',
                                                              'Idaho',
                                                              'Illinois',
                                                              'Indiana',
                                                              'Iowa',
                                                              'Kansas',
                                                              'Kentucky',
                                                              'Louisiana',
                                                              'Maine',
                                                              'Marshall Islands',
                                                              'Maryland',
                                                              'Massachusetts',
                                                              'Michigan',
                                                              'Minnesota',
                                                              'Mississippi',
                                                              'Missouri',
                                                              'Montana',
                                                              'Nebraska',
                                                              'Nevada',
                                                              'New Hampshire',
                                                              'New Jersey',
                                                              'New Mexico',
                                                              'New York',
                                                              'North Carolina',
                                                              'North Dakota',
                                                              'Northern Mariana Islands',
                                                              'Ohio',
                                                              'Oklahoma',
                                                              'Oregon',
                                                              'Palau',
                                                              'Pennsylvania',
                                                              'Puerto Rico',
                                                              'Rhode Island',
                                                              'South Carolina',
                                                              'South Dakota',
                                                              'Tennessee',
                                                              'Texas',
                                                              'Utah',
                                                              'Vermont',
                                                              'Virgin Islands',
                                                              'Virginia',
                                                              'Washington',
                                                              'West Virginia',
                                                              'Wisconsin',
                                                              'Wyoming'
                                                            ],
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.dropDownState2Value =
                                                                        val),
                                                            width: 300.0,
                                                            height: 52.0,
                                                            searchHintTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Yantramanav',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            searchTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Yantramanav',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Yantramanav',
                                                                      color: Color(
                                                                          0xFF64748B),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'Enter state of registration',
                                                            searchHintText:
                                                                'Search for a state',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 2.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            borderWidth: 2.0,
                                                            borderRadius: 18.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: true,
                                                            isSearchable: true,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Notes',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Yantramanav',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        4.0),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textFieldNotesTextController,
                                                              focusNode: _model
                                                                  .textFieldNotesFocusNode,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Enter vehicle’s notes',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Yantramanav',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFCBD5E1),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                filled: true,
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Yantramanav',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                              maxLines: null,
                                                              minLines: 5,
                                                              validator: _model
                                                                  .textFieldNotesTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      final selectedMedia =
                                                          await selectMediaWithSourceBottomSheet(
                                                        context: context,
                                                        maxWidth: 400.00,
                                                        maxHeight: 400.00,
                                                        imageQuality: 42,
                                                        allowPhoto: true,
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        safeSetState(() => _model
                                                                .isDataUploading =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        var downloadUrls =
                                                            <String>[];
                                                        try {
                                                          showUploadMessage(
                                                            context,
                                                            'Uploading file...',
                                                            showLoading: true,
                                                          );
                                                          selectedUploadedFiles =
                                                              selectedMedia
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                      ))
                                                                  .toList();

                                                          downloadUrls =
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .hideCurrentSnackBar();
                                                          _model.isDataUploading =
                                                              false;
                                                        }
                                                        if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedMedia
                                                                    .length &&
                                                            downloadUrls
                                                                    .length ==
                                                                selectedMedia
                                                                    .length) {
                                                          safeSetState(() {
                                                            _model.uploadedLocalFile =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                          showUploadMessage(
                                                              context,
                                                              'Success!');
                                                        } else {
                                                          safeSetState(() {});
                                                          showUploadMessage(
                                                              context,
                                                              'Failed to upload data');
                                                          return;
                                                        }
                                                      }

                                                      _model.addToImage(_model
                                                          .uploadedFileUrl);
                                                      safeSetState(() {});
                                                      safeSetState(() {
                                                        _model.isDataUploading =
                                                            false;
                                                        _model.uploadedLocalFile =
                                                            FFUploadedFile(
                                                                bytes: Uint8List
                                                                    .fromList(
                                                                        []));
                                                        _model.uploadedFileUrl =
                                                            '';
                                                      });
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.9,
                                                      height: 179.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .emptyImageModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: EmptyImageWidget(
                                                          icon: Icon(
                                                            Icons
                                                                .file_upload_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 40.0,
                                                          ),
                                                          title:
                                                              'Upload vehicle images',
                                                          body:
                                                              'Click here to upload vehicle image',
                                                          action: () async {},
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (_model.image
                                                              .firstOrNull !=
                                                          null &&
                                                      _model.image
                                                              .firstOrNull !=
                                                          '')
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.9,
                                                      height: 237.3,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final images = _model
                                                              .image
                                                              .toList();

                                                          return GridView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            gridDelegate:
                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 3,
                                                              crossAxisSpacing:
                                                                  10.0,
                                                              mainAxisSpacing:
                                                                  10.0,
                                                              childAspectRatio:
                                                                  1.0,
                                                            ),
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                images.length,
                                                            itemBuilder: (context,
                                                                imagesIndex) {
                                                              final imagesItem =
                                                                  images[
                                                                      imagesIndex];
                                                              return Container(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  child: Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          imagesItem,
                                                                          width:
                                                                              200.0,
                                                                          height:
                                                                              200.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              _model.removeFromImage(imagesItem);
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.close_sharp,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 20.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        var chatsRecordReference =
                                                            ChatsRecord
                                                                .collection
                                                                .doc();
                                                        await chatsRecordReference
                                                            .set({
                                                          ...createChatsRecordData(
                                                            userA:
                                                                currentUserReference,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'users': [
                                                                currentUserReference
                                                              ],
                                                            },
                                                          ),
                                                        });
                                                        _model.chatId = ChatsRecord
                                                            .getDocumentFromData({
                                                          ...createChatsRecordData(
                                                            userA:
                                                                currentUserReference,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'users': [
                                                                currentUserReference
                                                              ],
                                                            },
                                                          ),
                                                        }, chatsRecordReference);
                                                        _model.vehicle =
                                                            await UptimeFleetAppGroup
                                                                .getVehiclesCall
                                                                .call(
                                                          vehicleRegNo: _model
                                                              .textFieldLicense2TextController
                                                              .text,
                                                          driverId: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.driverId,
                                                              ''),
                                                          state: _model
                                                              .dropDownState2Value,
                                                        );

                                                        var requestRecordReference =
                                                            RequestRecord
                                                                .collection
                                                                .doc();
                                                        await requestRecordReference
                                                            .set(
                                                                createRequestRecordData(
                                                          status: 'newCase',
                                                          firebaseMessageThread:
                                                              _model.chatId
                                                                  ?.reference,
                                                          driver:
                                                              currentUserReference,
                                                          location: FFAppState()
                                                              .location,
                                                          driverName: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.fullName,
                                                              ''),
                                                          dropOffLocationLatLng:
                                                              FFAppState()
                                                                  .dropOffLocation,
                                                        ));
                                                        _model.request = RequestRecord
                                                            .getDocumentFromData(
                                                                createRequestRecordData(
                                                                  status:
                                                                      'newCase',
                                                                  firebaseMessageThread:
                                                                      _model
                                                                          .chatId
                                                                          ?.reference,
                                                                  driver:
                                                                      currentUserReference,
                                                                  location:
                                                                      FFAppState()
                                                                          .location,
                                                                  driverName: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.fullName,
                                                                      ''),
                                                                  dropOffLocationLatLng:
                                                                      FFAppState()
                                                                          .dropOffLocation,
                                                                ),
                                                                requestRecordReference);
                                                        _model.apiResulty8vCopy =
                                                            await UptimeFleetAppGroup
                                                                .createARequestCall
                                                                .call(
                                                          date: getCurrentTimestamp
                                                              .millisecondsSinceEpoch,
                                                          driverId: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.driverId,
                                                              ''),
                                                          fault:
                                                              widget.service,
                                                          vehicleId:
                                                              UptimeFleetAppGroup
                                                                  .getVehiclesCall
                                                                  .id(
                                                            (_model.vehicle
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          additionalInfo: widget
                                                                          .additionalInfo !=
                                                                      null &&
                                                                  widget.additionalInfo !=
                                                                      ''
                                                              ? widget
                                                                  .additionalInfo
                                                              : FFAppState()
                                                                  .requestAdditionalInfo,
                                                          supportReview: false,
                                                          position: FFAppState()
                                                              .location
                                                              ?.toString(),
                                                          chatId: _model.chatId
                                                              ?.reference.id,
                                                          firebaseId: _model
                                                              .request
                                                              ?.reference
                                                              .id,
                                                          driverImage: functions
                                                              .joinListofImagURLs(
                                                                  _model.image
                                                                      .toList()),
                                                          driverTechnician:
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.technicianId,
                                                                  ''),
                                                          dropOffLocationLatLng:
                                                              FFAppState()
                                                                  .dropOffLocation
                                                                  ?.toString(),
                                                          address: FFAppState()
                                                              .address,
                                                          dropOffAddress:
                                                              FFAppState()
                                                                  .dropOffLocationAddress,
                                                          vehicleAdditionalNotes:
                                                              _model
                                                                  .textFieldNotesTextController
                                                                  .text,
                                                        );

                                                        await _model
                                                            .request!.reference
                                                            .update(
                                                                createRequestRecordData(
                                                          bubbleId:
                                                              UptimeFleetAppGroup
                                                                  .createARequestCall
                                                                  .uniqueId(
                                                            (_model.apiResulty8vCopy
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                        ));

                                                        await currentUserReference!
                                                            .update(
                                                                createUsersRecordData(
                                                          activeRequest: _model
                                                              .request
                                                              ?.reference,
                                                          activeRequestBubble:
                                                              UptimeFleetAppGroup
                                                                  .createARequestCall
                                                                  .uniqueId(
                                                            (_model.apiResulty8vCopy
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                        ));
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          isDismissible: false,
                                                          enableDrag: false,
                                                          useSafeArea: true,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.6,
                                                                  child:
                                                                      ConfirmRequestWidget(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));

                                                        safeSetState(() {});
                                                      },
                                                      text: 'Next',
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        height: 50.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Yantramanav',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 20.0)),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 20.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
