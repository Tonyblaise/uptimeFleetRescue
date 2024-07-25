import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_details_model.dart';
export 'user_details_model.dart';

class UserDetailsWidget extends StatefulWidget {
  const UserDetailsWidget({super.key});

  @override
  State<UserDetailsWidget> createState() => _UserDetailsWidgetState();
}

class _UserDetailsWidgetState extends State<UserDetailsWidget> {
  late UserDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDetailsModel());

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
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AuthUserStreamWidget(
              builder: (context) => Container(
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      currentUserPhoto != ''
                          ? currentUserPhoto
                          : 'https://s3.amazonaws.com/appforest_uf/f1633437780404x920214512569844000/account.png',
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    constraints: const BoxConstraints(
                      minWidth: 9.0,
                      minHeight: 9.0,
                      maxWidth: 10.0,
                      maxHeight: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0CCA4A),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 100.0,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthUserStreamWidget(
                      builder: (context) => Text(
                        valueOrDefault(currentUserDocument?.fullName, ''),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Yantramanav',
                              color: const Color(0xFF0F172A),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => Text(
                        valueOrDefault(currentUserDocument?.companyName, ''),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Yantramanav',
                              color: const Color(0xFF0F172A),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 6.0)),
                ),
              ),
            ),
          ].divide(const SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
