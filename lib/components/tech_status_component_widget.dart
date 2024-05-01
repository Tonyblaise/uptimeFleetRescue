import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'tech_status_component_model.dart';
export 'tech_status_component_model.dart';

class TechStatusComponentWidget extends StatefulWidget {
  const TechStatusComponentWidget({super.key});

  @override
  State<TechStatusComponentWidget> createState() =>
      _TechStatusComponentWidgetState();
}

class _TechStatusComponentWidgetState extends State<TechStatusComponentWidget> {
  late TechStatusComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TechStatusComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        height: 300.0,
        constraints: const BoxConstraints(
          maxHeight: 300.0,
        ),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: MediaQuery.sizeOf(context).height * 0.95,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 80.0,
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
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Please set your status',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Yantramanav',
                              color: Colors.black,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.9,
                  ),
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select your status',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Yantramanav',
                                      color: const Color(0xFF64748B),
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 56.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(60.0),
                                  border: Border.all(
                                    color: const Color(0xFFE5E7EE),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault<bool>(
                                                  currentUserDocument?.onDuty,
                                                  false)
                                              ? 'On Duty'
                                              : 'Off Duty',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Yantramanav',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      AuthUserStreamWidget(
                                        builder: (context) => Switch.adaptive(
                                          value: _model.switchValue ??=
                                              valueOrDefault<bool>(
                                                  currentUserDocument?.onDuty,
                                                  false),
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.switchValue = newValue);
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 8.0)),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 56.0,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width * 0.9,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.0),
                                      border: Border.all(
                                        color: const Color(0xFF0CCA4A),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Cancel',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Yantramanav',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.apiResult5nw =
                                        await UptimeFleetAppGroup
                                            .updateTechStatusCall
                                            .call(
                                      onDuty: _model.switchValue,
                                      technicianId: valueOrDefault(
                                          currentUserDocument?.technicianId,
                                          ''),
                                    );
                                    if ((_model.apiResult5nw?.succeeded ??
                                        true)) {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        onDuty: _model.switchValue,
                                      ));
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Changes made succesfully!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      if (_model.switchValue != null) {
                                        await actions.mainAction(
                                          (lat, lng) async {
                                            _model.apiResultksz =
                                                await UptimeFleetAppGroup
                                                    .updateTechnicianPositionCall
                                                    .call(
                                              lat: lat,
                                              lng: lng,
                                              technicianId: valueOrDefault(
                                                  currentUserDocument
                                                      ?.technicianId,
                                                  ''),
                                            );
                                          },
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Something went wrong. Please try again later.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor: const Color(0xFFF50833),
                                        ),
                                      );
                                    }

                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF7DEFA2),
                                          Color(0xFF0CCA4A)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(18.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Confirm',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Yantramanav',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 15.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
