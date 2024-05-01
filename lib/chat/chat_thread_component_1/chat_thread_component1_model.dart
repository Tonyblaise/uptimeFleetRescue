import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/chat/chat_thread_update_1/chat_thread_update1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_thread_component1_widget.dart' show ChatThreadComponent1Widget;
import 'package:flutter/material.dart';

class ChatThreadComponent1Model
    extends FlutterFlowModel<ChatThreadComponent1Widget> {
  ///  Local state fields for this component.

  List<DocumentReference> lastSeenBy = [];
  void addToLastSeenBy(DocumentReference item) => lastSeenBy.add(item);
  void removeFromLastSeenBy(DocumentReference item) => lastSeenBy.remove(item);
  void removeAtIndexFromLastSeenBy(int index) => lastSeenBy.removeAt(index);
  void insertAtIndexInLastSeenBy(int index, DocumentReference item) =>
      lastSeenBy.insert(index, item);
  void updateLastSeenByAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      lastSeenBy[index] = updateFn(lastSeenBy[index]);

  List<String> imagesUploaded = [];
  void addToImagesUploaded(String item) => imagesUploaded.add(item);
  void removeFromImagesUploaded(String item) => imagesUploaded.remove(item);
  void removeAtIndexFromImagesUploaded(int index) =>
      imagesUploaded.removeAt(index);
  void insertAtIndexInImagesUploaded(int index, String item) =>
      imagesUploaded.insert(index, item);
  void updateImagesUploadedAtIndex(int index, Function(String) updateFn) =>
      imagesUploaded[index] = updateFn(imagesUploaded[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  List<ChatMessagesRecord>? listViewPreviousSnapshot;
  // Models for chat_threadUpdate_1 dynamic component.
  late FlutterFlowDynamicModels<ChatThreadUpdate1Model> chatThreadUpdate1Models;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  ChatMessagesRecord? newChatMessage;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? newChat;
  // Stores action output result for [Backend Call - API (Create message)] action in IconButton widget.
  ApiCallResponse? apiResult116;
  // Stores action output result for [Backend Call - API (Create message)] action in IconButton widget.
  ApiCallResponse? apiResult117;

  @override
  void initState(BuildContext context) {
    chatThreadUpdate1Models =
        FlutterFlowDynamicModels(() => ChatThreadUpdate1Model());
  }

  @override
  void dispose() {
    chatThreadUpdate1Models.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
