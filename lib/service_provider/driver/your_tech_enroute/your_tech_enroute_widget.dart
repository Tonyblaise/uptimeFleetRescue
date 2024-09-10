import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'your_tech_enroute_model.dart';
export 'your_tech_enroute_model.dart';

class YourTechEnrouteWidget extends StatefulWidget {
  const YourTechEnrouteWidget({
    super.key,
    required this.request,
    required this.chat,
  });

  final RequestRecord? request;
  final ChatsRecord? chat;

  @override
  State<YourTechEnrouteWidget> createState() => _YourTechEnrouteWidgetState();
}

class _YourTechEnrouteWidgetState extends State<YourTechEnrouteWidget> {
  late YourTechEnrouteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YourTechEnrouteModel());

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
