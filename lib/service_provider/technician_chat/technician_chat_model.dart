import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/driver/chat/chat_thread_component_1/chat_thread_component1_widget.dart';
import 'technician_chat_widget.dart' show TechnicianChatWidget;
import 'package:flutter/material.dart';

class TechnicianChatModel extends FlutterFlowModel<TechnicianChatWidget> {
  ///  Local state fields for this page.

  int? pageState = 2;

  ///  State fields for stateful widgets in this page.

  // Model for chat_ThreadComponent_1 component.
  late ChatThreadComponent1Model chatThreadComponent1Model;

  @override
  void initState(BuildContext context) {
    chatThreadComponent1Model =
        createModel(context, () => ChatThreadComponent1Model());
  }

  @override
  void dispose() {
    chatThreadComponent1Model.dispose();
  }
}
