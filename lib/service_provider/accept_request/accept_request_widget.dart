import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'accept_request_model.dart';
export 'accept_request_model.dart';

class AcceptRequestWidget extends StatefulWidget {
  const AcceptRequestWidget({super.key});

  @override
  State<AcceptRequestWidget> createState() => _AcceptRequestWidgetState();
}

class _AcceptRequestWidgetState extends State<AcceptRequestWidget> {
  late AcceptRequestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcceptRequestModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
