import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/driver/cancel_request/cancel_request_widget.dart';
import '/driver/complete_request/complete_request_widget.dart';
import '/driver/your_tech_enroute/your_tech_enroute_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'service_updates_component_model.dart';
export 'service_updates_component_model.dart';

class ServiceUpdatesComponentWidget extends StatefulWidget {
  const ServiceUpdatesComponentWidget({
    super.key,
    required this.request,
    required this.chat,
  });

  final RequestRecord? request;
  final DocumentReference? chat;

  @override
  State<ServiceUpdatesComponentWidget> createState() =>
      _ServiceUpdatesComponentWidgetState();
}

class _ServiceUpdatesComponentWidgetState
    extends State<ServiceUpdatesComponentWidget> {
  late ServiceUpdatesComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiceUpdatesComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder<ChatsRecord>(
              stream: ChatsRecord.getDocument(widget.chat!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                final containerChatsRecord = snapshot.data!;
                return Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Booking status:',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Yantramanav',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 35.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 64.0,
                                      height: 64.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          widget.request?.status == 'newCase'
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : Colors.white,
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        border: Border.all(
                                          color: valueOrDefault<Color>(
                                            widget.request?.status == 'newCase'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : const Color(0xFFE5E7EE),
                                            const Color(0xFFE5E7EE),
                                          ),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.36,
                                            height: 36.0,
                                            constraints: const BoxConstraints(
                                              maxWidth: 36.0,
                                              maxHeight: 36.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              border: Border.all(
                                                color: valueOrDefault<Color>(
                                                  widget.request?.status ==
                                                          'newCase'
                                                      ? Colors.transparent
                                                      : const Color(0xFFE5E7EE),
                                                  const Color(0xFFE5E7EE),
                                                ),
                                              ),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '1',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Yantramanav',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      widget.request?.status ==
                                                              'inProgress'
                                                          ? Colors.black
                                                          : const Color(0xFFE5E7EE),
                                                      const Color(0xFFE5E7EE),
                                                    ),
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 64.0,
                                        height: 64.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              widget.request?.status ==
                                                      'newCase'
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : const Color(0xFFE5E7EE),
                                              const Color(0xFFE5E7EE),
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 20.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Request In Process',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Yantramanav',
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                widget.request?.status ==
                                                                        'newCase'
                                                                    ? Colors
                                                                        .black
                                                                    : const Color(
                                                                        0xFFE5E7EE),
                                                                const Color(
                                                                    0xFFE5E7EE),
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                      Text(
                                                        'Standby For ETA',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Yantramanav',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    widget.request?.status ==
                                                                            'newCase'
                                                                        ? const Color(
                                                                            0xFF64748B)
                                                                        : const Color(
                                                                            0xFFE5E7EE),
                                                                    const Color(
                                                                        0xFFE5E7EE),
                                                                  ),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 5.0)),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (widget.request?.status == 'inProgress') {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: YourTechEnrouteWidget(
                                            request: widget.request!,
                                            chat: containerChatsRecord,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                },
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 64.0,
                                        height: 64.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            widget.request?.status ==
                                                    'inProgress'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : Colors.white,
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              widget.request?.status ==
                                                      'inProgress'
                                                  ? Colors.transparent
                                                  : const Color(0xFFE5E7EE),
                                              const Color(0xFFE5E7EE),
                                            ),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.36,
                                              height: 36.0,
                                              constraints: const BoxConstraints(
                                                maxWidth: 36.0,
                                                maxHeight: 36.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    widget.request?.status ==
                                                            'inProgress'
                                                        ? Colors.transparent
                                                        : const Color(0xFFE5E7EE),
                                                    const Color(0xFFE5E7EE),
                                                  ),
                                                ),
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  '2',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Yantramanav',
                                                        color: valueOrDefault<
                                                            Color>(
                                                          widget.request
                                                                      ?.status ==
                                                                  'inProgress'
                                                              ? Colors.black
                                                              : const Color(
                                                                  0xFFE5E7EE),
                                                          const Color(0xFFE5E7EE),
                                                        ),
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 64.0,
                                          height: 64.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            border: Border.all(
                                              color: valueOrDefault<Color>(
                                                widget.request?.status ==
                                                        'inProgress'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary
                                                    : const Color(0xFFE5E7EE),
                                                const Color(0xFFE5E7EE),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 20.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'En Route',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Yantramanav',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  widget.request
                                                                              ?.status ==
                                                                          'inProgress'
                                                                      ? Colors
                                                                          .black
                                                                      : const Color(
                                                                          0xFFE5E7EE),
                                                                  const Color(
                                                                      0xFFE5E7EE),
                                                                ),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Text(
                                                          'Check your tech location',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Yantramanav',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  widget.request
                                                                              ?.status ==
                                                                          'inProgress'
                                                                      ? const Color(
                                                                          0xFF64748B)
                                                                      : const Color(
                                                                          0xFFE5E7EE),
                                                                  const Color(
                                                                      0xFFE5E7EE),
                                                                ),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                if (widget.request?.status ==
                                                    'inProgress')
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/group_locationicon_(1).svg',
                                                      width: 18.0,
                                                      height: 31.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 5.0)),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 64.0,
                                      height: 64.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          widget.request?.status ==
                                                  'arrivedAtLocation'
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : Colors.white,
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        border: Border.all(
                                          color: valueOrDefault<Color>(
                                            widget.request?.status ==
                                                    'arrivedAtLocation'
                                                ? Colors.transparent
                                                : const Color(0xFFE5E7EE),
                                            const Color(0xFFE5E7EE),
                                          ),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.36,
                                            height: 36.0,
                                            constraints: const BoxConstraints(
                                              maxWidth: 36.0,
                                              maxHeight: 36.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              border: Border.all(
                                                color: valueOrDefault<Color>(
                                                  widget.request?.status ==
                                                          'arrivedAtLocation'
                                                      ? Colors.transparent
                                                      : const Color(0xFFE5E7EE),
                                                  const Color(0xFFE5E7EE),
                                                ),
                                              ),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '3',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Yantramanav',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      widget.request?.status ==
                                                              'arrivedAtLocation'
                                                          ? Colors.black
                                                          : const Color(0xFFE5E7EE),
                                                      const Color(0xFFE5E7EE),
                                                    ),
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 64.0,
                                        height: 64.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              widget.request?.status ==
                                                      'arrivedAtLocation'
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : const Color(0xFFE5E7EE),
                                              const Color(0xFFE5E7EE),
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 20.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Technician has arrived',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Yantramanav',
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                widget.request?.status ==
                                                                        'arrivedAtLocation'
                                                                    ? Colors
                                                                        .black
                                                                    : const Color(
                                                                        0xFFE5E7EE),
                                                                const Color(
                                                                    0xFFE5E7EE),
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                      Text(
                                                        'Job is in service',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Yantramanav',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    widget.request?.status ==
                                                                            'arrivedAtLocation'
                                                                        ? const Color(
                                                                            0xFF64748B)
                                                                        : const Color(
                                                                            0xFFE5E7EE),
                                                                    const Color(
                                                                        0xFFE5E7EE),
                                                                  ),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 5.0)),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: const CompleteRequestWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 64.0,
                                        height: 64.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            widget.request?.status ==
                                                    'completed'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : Colors.white,
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              widget.request?.status ==
                                                      'completed'
                                                  ? Colors.transparent
                                                  : const Color(0xFFE5E7EE),
                                              const Color(0xFFE5E7EE),
                                            ),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.36,
                                              height: 36.0,
                                              constraints: const BoxConstraints(
                                                maxWidth: 36.0,
                                                maxHeight: 36.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    widget.request?.status ==
                                                            'completed'
                                                        ? Colors.transparent
                                                        : const Color(0xFFE5E7EE),
                                                    const Color(0xFFE5E7EE),
                                                  ),
                                                ),
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                '4',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Yantramanav',
                                                      color:
                                                          valueOrDefault<Color>(
                                                        widget.request
                                                                    ?.status ==
                                                                'completed'
                                                            ? Colors.black
                                                            : const Color(0xFFE5E7EE),
                                                        const Color(0xFFE5E7EE),
                                                      ),
                                                      fontSize: 24.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 64.0,
                                          height: 64.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            border: Border.all(
                                              color: valueOrDefault<Color>(
                                                widget.request?.status ==
                                                        'completed'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary
                                                    : const Color(0xFFE5E7EE),
                                                const Color(0xFFE5E7EE),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 20.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Completed',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Yantramanav',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  widget.request
                                                                              ?.status ==
                                                                          'completed'
                                                                      ? Colors
                                                                          .black
                                                                      : const Color(
                                                                          0xFFE5E7EE),
                                                                  const Color(
                                                                      0xFFE5E7EE),
                                                                ),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Text(
                                                          'Click here to mark  it as complete',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Yantramanav',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  widget.request
                                                                              ?.status ==
                                                                          'completed'
                                                                      ? const Color(
                                                                          0xFF64748B)
                                                                      : const Color(
                                                                          0xFFE5E7EE),
                                                                  const Color(
                                                                      0xFFE5E7EE),
                                                                ),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 5.0)),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CancelRequestWidget(
                                                  id: widget.request!.bubbleId,
                                                  driver: true,
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: 160.0,
                                          height: 56.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            border: Border.all(
                                              color: const Color(0xFFF50833),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Cancel',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Yantramanav',
                                                    color: const Color(0xFFF50833),
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      StreamBuilder<List<ChatMessagesRecord>>(
                                        stream: queryChatMessagesRecord(
                                          queryBuilder: (chatMessagesRecord) =>
                                              chatMessagesRecord
                                                  .where(Filter.or(
                                            Filter(
                                              'chat',
                                              isEqualTo: containerChatsRecord
                                                  .reference,
                                            ),
                                            Filter(
                                              'read',
                                              isEqualTo: false,
                                            ),
                                            Filter(
                                              'user',
                                              isNotEqualTo:
                                                  currentUserReference,
                                            ),
                                          )),
                                        ),
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
                                          List<ChatMessagesRecord>
                                              containerChatMessagesRecordList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: Stack(
                                              alignment: const AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                if (widget.request?.status !=
                                                    'newCase')
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      if (containerChatsRecord
                                                              .lastMessageUser ==
                                                          currentUserReference) {
                                                        await containerChatsRecord
                                                            .reference
                                                            .update(
                                                                createChatsRecordData(
                                                          lastMessageRead: true,
                                                        ));
                                                      }

                                                      context.pushNamed(
                                                        'chat_2_Details_1',
                                                        queryParameters: {
                                                          'chatRef':
                                                              serializeParam(
                                                            containerChatsRecord,
                                                            ParamType.Document,
                                                          ),
                                                          'driver':
                                                              serializeParam(
                                                            true,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'chatRef':
                                                              containerChatsRecord,
                                                        },
                                                      );
                                                    },
                                                    text: 'Chat Technician',
                                                    options: FFButtonOptions(
                                                      width: 160.0,
                                                      height: 56.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
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
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                  ),
                                                Builder(
                                                  builder: (context) {
                                                    if ((containerChatsRecord
                                                                .lastMessageUser !=
                                                            currentUserReference) &&
                                                        (containerChatsRecord
                                                                .lastMessageUser !=
                                                            null) &&
                                                        (containerChatsRecord
                                                                .lastMessageRead ==
                                                            false)) {
                                                      return Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      20.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 18.0,
                                                            height: 18.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100.0),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              '1',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Yantramanav',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return Container(
                                                        width: 1.0,
                                                        height: 1.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ].divide(const SizedBox(width: 15.0)),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 40.0)),
                          ),
                        ),
                      ].divide(const SizedBox(height: 5.0)),
                    ),
                  ),
                );
              },
            ),
          ].divide(const SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
