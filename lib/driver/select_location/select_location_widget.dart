import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'select_location_model.dart';
export 'select_location_model.dart';

class SelectLocationWidget extends StatefulWidget {
  const SelectLocationWidget({
    super.key,
    required this.service,
    this.additionalInfo,
    required this.address,
  });

  final String? service;
  final String? additionalInfo;
  final String? address;

  @override
  State<SelectLocationWidget> createState() => _SelectLocationWidgetState();
}

class _SelectLocationWidgetState extends State<SelectLocationWidget> {
  late SelectLocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectLocationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      setState(() {
        _model.latLng = currentUserLocationValue;
      });
    });

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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Text(
                'Confirm Location',
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Builder(builder: (context) {
                                final googleMapMarker = _model.latLng;
                                return FlutterFlowGoogleMap(
                                  controller: _model.googleMapsController,
                                  onCameraIdle: (latLng) => setState(
                                      () => _model.googleMapsCenter = latLng),
                                  initialLocation: _model.googleMapsCenter ??=
                                      _model.latLng!,
                                  markers: [
                                    if (googleMapMarker != null)
                                      FlutterFlowMarker(
                                        googleMapMarker.serialize(),
                                        googleMapMarker,
                                      ),
                                  ],
                                  markerColor: GoogleMarkerColor.red,
                                  mapType: MapType.normal,
                                  style: GoogleMapStyle.standard,
                                  initialZoom: 14.0,
                                  allowInteraction: true,
                                  allowZoom: true,
                                  showZoomControls: true,
                                  showLocation: true,
                                  showCompass: true,
                                  showMapToolbar: true,
                                  showTraffic: true,
                                  centerMapOnMarkerTap: true,
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      decoration: const BoxDecoration(),
                      child: FutureBuilder<ApiCallResponse>(
                        future: GetAddressFromLatLngCall.call(
                          lat: functions.getLat(_model.latLng!),
                          lng: functions.getLng(_model.latLng!),
                        ),
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
                          final columnGetAddressFromLatLngResponse =
                              snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Visibility(
                                  visible: _model.addressView,
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'We see your location as: ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Yantramanav',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        const TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            GetAddressFromLatLngCall.placename(
                                              columnGetAddressFromLatLngResponse
                                                  .jsonBody,
                                            )?.first,
                                            '.',
                                          ),
                                          style: const TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              if (!_model.addressView)
                                FlutterFlowPlacePicker(
                                  iOSGoogleMapsApiKey:
                                      'AIzaSyCQCtKBOInrdAHzTTfpXIeTqKe4-9Q1iB8',
                                  androidGoogleMapsApiKey:
                                      'AIzaSyCQCtKBOInrdAHzTTfpXIeTqKe4-9Q1iB8',
                                  webGoogleMapsApiKey:
                                      'AIzaSyCQCtKBOInrdAHzTTfpXIeTqKe4-9Q1iB8',
                                  onSelect: (place) async {
                                    setState(
                                        () => _model.placePickerValue = place);
                                  },
                                  defaultText: 'Type in your location',
                                  icon: const Icon(
                                    Icons.place,
                                    color: Color(0xFF0F172A),
                                    size: 16.0,
                                  ),
                                  buttonOptions: FFButtonOptions(
                                    width: double.infinity,
                                    height: 50.0,
                                    color: const Color(0xFFF1F5F9),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Yantramanav',
                                          color: const Color(0xFF0F172A),
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 2.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.addressView = !_model.addressView;
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    _model.addressView
                                        ? 'Change location'
                                        : 'Back',
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Yantramanav',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.addressView == true) {
                                    context.pushNamed(
                                      'vehicle_confirmation',
                                      queryParameters: {
                                        'service': serializeParam(
                                          widget.service,
                                          ParamType.String,
                                        ),
                                        'latLng': serializeParam(
                                          _model.latLng,
                                          ParamType.LatLng,
                                        ),
                                        'additionalInfo': serializeParam(
                                          widget.additionalInfo,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    await _model.googleMapsController.future
                                        .then(
                                      (c) => c.animateCamera(
                                        CameraUpdate.newLatLng(_model
                                            .placePickerValue.latLng
                                            .toGoogleMaps()),
                                      ),
                                    );
                                    setState(() {
                                      _model.addressView = true;
                                      _model.latLng =
                                          _model.placePickerValue.latLng;
                                    });
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: 56.0,
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).secondary,
                                        FlutterFlowTheme.of(context).tertiary
                                      ],
                                      stops: const [0.0, 1.0],
                                      begin: const AlignmentDirectional(0.0, -1.0),
                                      end: const AlignmentDirectional(0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      _model.addressView
                                          ? 'Confirm Location'
                                          : 'Confirm Address',
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
                            ].divide(const SizedBox(height: 10.0)),
                          );
                        },
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 5.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
