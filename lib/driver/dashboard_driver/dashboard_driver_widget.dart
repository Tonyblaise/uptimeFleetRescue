import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/page_title_widget.dart';
import '/components/user_details_widget.dart';
import '/driver/allow_location/allow_location_widget.dart';
import '/driver/service_updates_component/service_updates_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dashboard_driver_model.dart';
export 'dashboard_driver_model.dart';

class DashboardDriverWidget extends StatefulWidget {
  const DashboardDriverWidget({super.key});

  @override
  State<DashboardDriverWidget> createState() => _DashboardDriverWidgetState();
}

class _DashboardDriverWidgetState extends State<DashboardDriverWidget> {
  late DashboardDriverModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardDriverModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.technicianId, '') != '') {
        context.pushNamed('dashboardTechnician');
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Text(
                'Dashboard',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Yantramanav',
                      color: const Color(0xFF1E293B),
                      fontSize: 30.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                decoration: const BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.userDetailsModel,
                                  updateCallback: () => setState(() {}),
                                  child: const UserDetailsWidget(),
                                ),
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.pageTitleModel,
                            updateCallback: () => setState(() {}),
                            child: const PageTitleWidget(),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (valueOrDefault(
                                    currentUserDocument?.activeRequestBubble,
                                    '') ==
                                '') {
                          return Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Select a service',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Yantramanav',
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      StreamBuilder<List<ServicesRecord>>(
                                        stream: queryServicesRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ServicesRecord>
                                              containerServicesRecordList =
                                              snapshot.data!;
                                          return Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(),
                                            child: Builder(
                                              builder: (context) {
                                                final services =
                                                    containerServicesRecordList
                                                        .toList();
                                                return GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 10.0,
                                                    mainAxisSpacing: 10.0,
                                                    childAspectRatio: 1.0,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: services.length,
                                                  itemBuilder:
                                                      (context, servicesIndex) {
                                                    final servicesItem =
                                                        services[servicesIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.service =
                                                              servicesItem.name;
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 99.0,
                                                        height: 99.0,
                                                        constraints:
                                                            const BoxConstraints(
                                                          minWidth: 99.0,
                                                          minHeight: 99.0,
                                                          maxWidth: 99.0,
                                                          maxHeight: 100.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: servicesItem
                                                                      .name !=
                                                                  _model.service
                                                              ? const Color(
                                                                  0xFFE5E7EE)
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        child: SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            52.0,
                                                                        height:
                                                                            52.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          border:
                                                                              Border.all(
                                                                            color: servicesItem.name != _model.service
                                                                                ? FlutterFlowTheme.of(context).tertiary
                                                                                : const Color(0xFF64748B),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              12.0,
                                                                              10.0,
                                                                              12.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                31.0,
                                                                            height:
                                                                                23.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: CachedNetworkImage(
                                                                                fadeInDuration: const Duration(milliseconds: 500),
                                                                                fadeOutDuration: const Duration(milliseconds: 500),
                                                                                imageUrl: servicesItem.name == _model.service ? servicesItem.selectedImage : servicesItem.defaultImage,
                                                                                width: 300.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.fitWidth,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        servicesItem
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Yantramanav',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.8,
                                                                        -0.74),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    width: 16.0,
                                                                    height:
                                                                        16.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100.0),
                                                                    ),
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Visibility(
                                                                      visible: servicesItem
                                                                              .name ==
                                                                          _model
                                                                              .service,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            8.0,
                                                                        height:
                                                                            100.0,
                                                                        constraints:
                                                                            const BoxConstraints(
                                                                          maxWidth:
                                                                              8.0,
                                                                          maxHeight:
                                                                              8.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ].divide(const SizedBox(height: 5.0)),
                                  ),
                                ),
                                if (_model.service == 'Other')
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Details',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Yantramanav',
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          decoration: const BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 4.0),
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Please describe your technical problem',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFCBD5E1),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 20.0,
                                                            20.0, 20.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Yantramanav',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              maxLines: 5,
                                              minLines: 5,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 5.0)),
                                    ),
                                  ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (await getPermissionStatus(
                                          locationPermission)) {
                                        context.pushNamed(
                                          'selectLocation',
                                          queryParameters: {
                                            'service': serializeParam(
                                              _model.service,
                                              ParamType.String,
                                            ),
                                            'additionalInfo': serializeParam(
                                              _model.textController.text,
                                              ParamType.String,
                                            ),
                                            'address': serializeParam(
                                              '',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          isDismissible: false,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.6,
                                                  child: const AllowLocationWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 56.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                            FlutterFlowTheme.of(context)
                                                .tertiary
                                          ],
                                          stops: const [0.0, 1.0],
                                          begin:
                                              const AlignmentDirectional(0.0, -1.0),
                                          end: const AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Submit',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Yantramanav',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 16.0)),
                            ),
                          );
                        } else {
                          return Container(
                            width: double.infinity,
                            height: 450.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: AuthUserStreamWidget(
                              builder: (context) =>
                                  StreamBuilder<RequestRecord>(
                                stream: RequestRecord.getDocument(
                                    currentUserDocument!.activeRequest!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final containerRequestRecord = snapshot.data!;
                                  return Container(
                                    decoration: const BoxDecoration(),
                                    child: wrapWithModel(
                                      model:
                                          _model.serviceUpdatesComponentModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: ServiceUpdatesComponentWidget(
                                        request: containerRequestRecord,
                                        chat: containerRequestRecord
                                            .firebaseMessageThread!,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
