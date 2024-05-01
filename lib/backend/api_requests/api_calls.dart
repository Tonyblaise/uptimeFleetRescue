import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start UptimeFleet App Group Code

class UptimeFleetAppGroup {
  static String baseUrl = 'https://uptimefleetapp.bubbleapps.io/api/1.1/wf';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [accessToken]',
  };
  static LogUserInCall logUserInCall = LogUserInCall();
  static LogOutCall logOutCall = LogOutCall();
  static ResetUserPasswordCall resetUserPasswordCall = ResetUserPasswordCall();
  static ChangePasswordCall changePasswordCall = ChangePasswordCall();
  static CreateARequestCall createARequestCall = CreateARequestCall();
  static RejectRequestCall rejectRequestCall = RejectRequestCall();
  static UpdateRequestPositionCall updateRequestPositionCall =
      UpdateRequestPositionCall();
  static FetchTechnicianRequestsCall fetchTechnicianRequestsCall =
      FetchTechnicianRequestsCall();
  static CompleteRequestsCall completeRequestsCall = CompleteRequestsCall();
  static CancelRequestDriverCall cancelRequestDriverCall =
      CancelRequestDriverCall();
  static AcceptRequestCall acceptRequestCall = AcceptRequestCall();
  static UpdateRequestCall updateRequestCall = UpdateRequestCall();
  static GetThreadMessagesCall getThreadMessagesCall = GetThreadMessagesCall();
  static CreateMessageCall createMessageCall = CreateMessageCall();
  static UpdateProfileCall updateProfileCall = UpdateProfileCall();
  static CompanyInfoCall companyInfoCall = CompanyInfoCall();
  static UpdateTechStatusCall updateTechStatusCall = UpdateTechStatusCall();
  static GetTechnicianVehiclesCall getTechnicianVehiclesCall =
      GetTechnicianVehiclesCall();
  static GetVehiclesCall getVehiclesCall = GetVehiclesCall();
  static UpdateVehicleCall updateVehicleCall = UpdateVehicleCall();
  static ApproveRequestCall approveRequestCall = ApproveRequestCall();
  static GetRequestCall getRequestCall = GetRequestCall();
  static CreateDriverCall createDriverCall = CreateDriverCall();
  static CreateTechnicianCall createTechnicianCall = CreateTechnicianCall();
  static CheckUserCall checkUserCall = CheckUserCall();
  static UpdateDriverTokenCall updateDriverTokenCall = UpdateDriverTokenCall();
  static DeleteAccountCall deleteAccountCall = DeleteAccountCall();
  static UpdateTechnicianCall updateTechnicianCall = UpdateTechnicianCall();
  static UpdateTechnicianPositionCall updateTechnicianPositionCall =
      UpdateTechnicianPositionCall();
  static UpdateTechnicianPositionUsingCurrentPostionCall
      updateTechnicianPositionUsingCurrentPostionCall =
      UpdateTechnicianPositionUsingCurrentPostionCall();
  static GetRequestStatusCall getRequestStatusCall = GetRequestStatusCall();
  static GetPreviousJobsCall getPreviousJobsCall = GetPreviousJobsCall();
}

class LogUserInCall {
  Future<ApiCallResponse> call({
    String? email = 'bubbablaise3+driver@gmail.com',
    String? password = 'kkkkk',
    String? deviceId = 'Quixotic_y0LO',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password",
  "device_id": "$deviceId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Log user in',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? failureReason(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.reason''',
      ));
  String? failureMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user._id''',
      ));
  String? userType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.user_type''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.authentication.email.email''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.first_name''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.last_name''',
      ));
  String? profilePicture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.profile_picture''',
      ));
  String? companyId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.company_id''',
      ));
  String? fleetaManagerId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.fleet_manager_id''',
      ));
  String? driverId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.user_driver_id''',
      ));
  String? contact(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.contact''',
      ));
  String? techStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.tech_status''',
      ));
  String? driverSupportMessageThread(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.user.driver_support_message_thread_id''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.token''',
      ));
  String? deviceId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.device_id''',
      ));
}

class LogOutCall {
  Future<ApiCallResponse> call({
    String? email = 'bubbablaise3+driver@gmail.com',
    String? password = 'kkkkk',
    String? deviceId = 'Quixotic_y0LO',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    const ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Log out',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/logout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? failureReason(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.reason''',
      ));
  String? failureMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user._id''',
      ));
  String? userType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.user_type''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.authentication.email.email''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.first_name''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.last_name''',
      ));
  String? profilePicture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.profile_picture''',
      ));
  String? companyId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.company_id''',
      ));
  String? fleetaManagerId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.fleet_manager_id''',
      ));
  String? driverId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.user_driver_id''',
      ));
  String? contact(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.contact''',
      ));
  String? techStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.tech_status''',
      ));
  String? driverSupportMessageThread(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.user.driver_support_message_thread_id''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.token''',
      ));
  String? deviceId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.device_id''',
      ));
}

class ResetUserPasswordCall {
  Future<ApiCallResponse> call({
    String? email = 'bubbablaise3+driver@gmail.com',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reset user password',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/reset_password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangePasswordCall {
  Future<ApiCallResponse> call({
    String? currentPassword = 'kkkkk',
    String? newPassword = 'kkkkk',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "current_password": "$currentPassword",
  "new_password": "$newPassword"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change password',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/change_password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class CreateARequestCall {
  Future<ApiCallResponse> call({
    int? date = 1707140367,
    String? driverId = '1697477794424x323144111658893300',
    String? fault = 'Vehicle Stuck',
    String? status = 'New Case',
    String? vehicleId = '1707832058693x519949178268781060',
    String? additionalInfo = 'My tire also has a puncture',
    bool? supportReview = false,
    String? position = 'LatLng(lat: -1.1570327, lng: 36.8879157)',
    String? chatId = '',
    String? firebaseId = '',
    String? driverImage = '',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "date": $date,
  "driverId": "$driverId",
  "position": "$position",
  "fault": "$fault",
  "status": "New Case",
  "vehicleId": "$vehicleId",
  "additionalInfo": "$additionalInfo",
  "support_review": $supportReview,
  "chatId": "$chatId",
  "firebaseId": "$firebaseId",
  "driverImage": "$driverImage"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create a request',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/create_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? uniqueId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request._id''',
      ));
  int? date(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.response.request.date''',
      ));
  String? fault(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.fault''',
      ));
  String? requestStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.status''',
      ));
  String? vehicleId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.vehicleId''',
      ));
  String? driverId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.driverId''',
      ));
  String? fleerManagerid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.fleetManagerId''',
      ));
  String? additionalInfo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.additionalInfo''',
      ));
  String? position(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.driverPosition''',
      ));
  String? lat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.lat''',
      ));
  String? lng(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.lng''',
      ));
  String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.location.address''',
      ));
  dynamic driverTechnicianMessageThreadId(dynamic response) => getJsonField(
        response,
        r'''$.response.request.driverTechnicianMessageThreadId''',
      );
}

class RejectRequestCall {
  Future<ApiCallResponse> call({
    String? requestId = '1647908011754x563072280262082560',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "$requestId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reject request',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/reject_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class UpdateRequestPositionCall {
  Future<ApiCallResponse> call({
    String? lat = '-1.3266',
    String? lng = '36.8420',
    String? technician = '1647908011754x563072280262082560',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "lat":"$lat",
  "lng": "$lng",
  "request_id": "<request_id>"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update request position',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/update_position',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class FetchTechnicianRequestsCall {
  Future<ApiCallResponse> call({
    String? userId = '1641908376814x128323440588060450',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "$userId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch technician requests',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/fetch_requests',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CompleteRequestsCall {
  Future<ApiCallResponse> call({
    String? id = '1647908011754x563072280262082560',
    String? notes = 'This is awesome',
    String? image = '',
    String? odometer = '',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "$id",
  "notes": "$notes",
  "image": "$image",
  "odometer": "$odometer"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Complete requests',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/complete_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class CancelRequestDriverCall {
  Future<ApiCallResponse> call({
    String? id = '1647908011754x563072280262082560',
    bool? driver = true,
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "$id",
  "driver": $driver
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cancel request driver',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/cancel_request_driver',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class AcceptRequestCall {
  Future<ApiCallResponse> call({
    String? id = '1647908011754x563072280262082560',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "$id"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Accept request',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/accept_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class UpdateRequestCall {
  Future<ApiCallResponse> call({
    String? id = '1647908011754x563072280262082560',
    String? status = 'in_progress',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "$id",
  "status": "$status"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update request',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/update_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GetThreadMessagesCall {
  Future<ApiCallResponse> call({
    String? messageThreadId = '1711233569788x399682376000069400',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get thread messages',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/messages',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'message_thread_id': messageThreadId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  List<String>? userId(dynamic response) => (getJsonField(
        response,
        r'''$.response.messages[:].user_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? requestId(dynamic response) => (getJsonField(
        response,
        r'''$.response.messages[:].request_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? messageThreadId(dynamic response) => (getJsonField(
        response,
        r'''$.response.messages[:].message_thread_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.response.messages[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? messages(dynamic response) => getJsonField(
        response,
        r'''$.response.messages''',
        true,
      ) as List?;
}

class CreateMessageCall {
  Future<ApiCallResponse> call({
    String? messageThreadId = '1713534065721x415685239338135600',
    String? message = 'This is really awesome stuff',
    String? messageImage =
        'https://firebasestorage.googleapis.com/v0/b/uptimefleet-383db.appspot.com/o/photos%2Fjump%20start%201.png?alt=media&token=95661959-6f57-4637-a7c1-0e7df5cca14e',
    String? creator = '1713562471172x740552289509116800',
    String? driver = '1713562471172x740552289509116800',
    String? technician = '',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "messageThreadId": "$messageThreadId",
  "message": "$message",
  "messageImage": "$messageImage",
  "driverId": "$driver",
  "technicianId": "$technician"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create message',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/create-message',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  dynamic messages(dynamic response) => getJsonField(
        response,
        r'''$.response.messages''',
      );
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.messages._id''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.messages.message''',
      ));
  String? messageThreadId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.messages.messageThreadId''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.messages.user_id''',
      ));
  String? messageImage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.messages.messageImage''',
      ));
  String? creatorId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.messages.creator''',
      ));
}

class UpdateProfileCall {
  Future<ApiCallResponse> call({
    String? phone = '12345678',
    String? email = 'bubbablaise3+driver@gmail.com',
    String? encodedPhoto =
        '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',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "phone": "$phone",
  "email": "$email",
  "encoded_photo": "$encodedPhoto"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update profile',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/update_profile',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.last_name''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.first_name''',
      ));
  String? profilePicture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.profile_picture''',
      ));
  String? contact(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.contact''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.user.authentication.email.email''',
      ));
}

class CompanyInfoCall {
  Future<ApiCallResponse> call({
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Company Info',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/company_info',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.company.name''',
      ));
  String? logo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.company.logo''',
      ));
}

class UpdateTechStatusCall {
  Future<ApiCallResponse> call({
    bool? onDuty,
    String? technicianId = '1708270804093x206021699018692930',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "onDuty": $onDuty,
  "technicianId": "$technicianId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update tech status',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/update_tech_status',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GetTechnicianVehiclesCall {
  Future<ApiCallResponse> call({
    String? technicianId = '1711561297242x959590260378098100',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get technician vehicles',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/technician-vehicles',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'technicianId': technicianId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? licensePlate(dynamic response) => (getJsonField(
        response,
        r'''$.response.vehicle[:].licensePlate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? serviceProvider(dynamic response) => (getJsonField(
        response,
        r'''$.response.vehicle[:].serviceProvider''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fleetManager(dynamic response) => (getJsonField(
        response,
        r'''$.response.vehicle[:].fleetManager''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? state(dynamic response) => (getJsonField(
        response,
        r'''$.response.vehicle[:].state''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? color(dynamic response) => (getJsonField(
        response,
        r'''$.response.vehicle[:].color''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companyId(dynamic response) => (getJsonField(
        response,
        r'''$.response.vehicle[:].companyId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.response.vehicle[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? vehicles(dynamic response) => getJsonField(
        response,
        r'''$.response.vehicle''',
        true,
      ) as List?;
}

class GetVehiclesCall {
  Future<ApiCallResponse> call({
    String? vehicleRegNo = 'Kdj991c',
    String? driverId = '1708270748717x347590476241924860',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get vehicles',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/vehicles',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'licensePlate': vehicleRegNo,
        'driverId': driverId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? licensePlate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.vehicle.licensePlate''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.vehicle._id''',
      ));
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.vehicle.state''',
      ));
  String? color(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.vehicle.color''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.vehicle.image''',
      ));
  dynamic details(dynamic response) => getJsonField(
        response,
        r'''$.response.vehicle.details''',
      );
}

class UpdateVehicleCall {
  Future<ApiCallResponse> call({
    String? id = '1709221980915x854794289578496500',
    String? licensePlate = 'FP109109',
    String? state = 'texas',
    String? color = 'Blue',
    String? image =
        'https://s3.amazonaws.com/appforest_uf/f1633437780404x920214512569844000/account.png',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "$id",
  "licensePlate": "$licensePlate",
  "state": "$state",
  "color": "$color",
  "image": "$image"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update vehicle',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/update_vehicle',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApproveRequestCall {
  Future<ApiCallResponse> call({
    String? id = '1647908011754x563072280262082560',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "$id"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Approve request',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/approve_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GetRequestCall {
  Future<ApiCallResponse> call({
    String? request = '1713906123433x954724735348511400',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get request',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/request',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'request': request,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? timestamp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.response.request.date''',
      ));
  String? fault(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.fault''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.status''',
      ));
  String? vehicleDetails(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.vehicle.details''',
      ));
  String? driverPosition(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.driverPosition''',
      ));
  bool? closed(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.response.request.closed''',
      ));
  String? driverTechnicianMessageThreadId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.request.driverTechnicianMessageThreadId''',
      ));
  bool? driverApproved(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.response.request.driverApproved''',
      ));
  String? uniqueId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request._id''',
      ));
  bool? supportReview(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.response.request.supportReview''',
      ));
  String? vehicleState(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.vehicle.state''',
      ));
  String? vehicleColor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.vehicle.color''',
      ));
  String? vehicleRegNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.vehicle.licensePlate''',
      ));
  String? driverFullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.driver.fullName''',
      ));
  String? driverPhoneNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.driver.phoneNumber''',
      ));
  String? driverCompanyName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.driver.companyName''',
      ));
  String? lng(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.lng''',
      ));
  String? lat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.lat''',
      ));
  String? additionalInfo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.additionalInfo''',
      ));
  String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.location.address''',
      ));
  dynamic vehicleVinNumber(dynamic response) => getJsonField(
        response,
        r'''$.response.vehicle.vinNumber''',
      );
  dynamic dropOffLocation(dynamic response) => getJsonField(
        response,
        r'''$.response.request.dropOffLocation''',
      );
  String? serviceId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.id''',
      ));
  String? firebaseId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request.firebaseId''',
      ));
  String? uniqueBubbleId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.request._id''',
      ));
  dynamic driverImage(dynamic response) => getJsonField(
        response,
        r'''$.response.request.driverImage''',
      );
}

class CreateDriverCall {
  Future<ApiCallResponse> call({
    String? fleetManagerId = '1683637059489x656388733636706300',
    String? fullName = 'Tony Bubba',
    String? phoneNumber = '+254712403786',
    String? token = 'abc place',
    String? driverTechnicianMessageThreadIdFirebase = '',
    String? driverSupportMessageThreadIdFirebase = '',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "fleetManagerId": "$fleetManagerId",
  "fullName": "$fullName",
  "phoneNumber": "$phoneNumber",
  "token": "$token",
  "driverTechnicianMessageThreadIdFirebase": "$driverTechnicianMessageThreadIdFirebase",
  "driverSupportMessageThreadIdFirebase": "$driverSupportMessageThreadIdFirebase"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create driver',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/create-driver',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.driver._id''',
      ));
  String? fullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.driver.fullName''',
      ));
  String? phoneNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.driver.phoneNumber''',
      ));
  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.response.driver.token''',
      );
  String? companyName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.driver.companyName''',
      ));
  String? companyId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.driver.companyId''',
      ));
  String? fleetManagerId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.driver.fleetManagerId''',
      ));
  String? driverFleetManagerMessageThreadId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.driver.driverFleetManagerMessageThreadId''',
      ));
  String? driverSupportMessageThreadId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.driver.driverSupportMessageThreadId''',
      ));
}

class CreateTechnicianCall {
  Future<ApiCallResponse> call({
    String? serviceProviderId = '1666282691966x966109451452153900',
    String? fullName = 'Tony Bubba',
    String? phoneNumber = '+2547115403786',
    String? token = 'kk',
    String? driverTechnicianMessageThreadIdFirebase = '',
    String? driverSupportMessageThreadIdFirebase = '',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "serviceProviderId": "$serviceProviderId",
  "fullName": "$fullName",
  "phoneNumber": "$phoneNumber",
  "token": "$token",
  "driverTechnicianMessageThreadIdFirebase": "$driverTechnicianMessageThreadIdFirebase",
  "driverSupportMessageThreadIdFirebase": "$driverSupportMessageThreadIdFirebase"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create technician',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/create-technician',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? companyName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.technician.companyName''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.technician.firebaseToken''',
      ));
  String? fullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.technician.fullName''',
      ));
  String? phoneNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.technician.phoneNumber''',
      ));
  String? serviceProviderId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.technician.serviceProviderId''',
      ));
  String? technicianId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.technician._id''',
      ));
  String? companyId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.technician.companyId''',
      ));
  String? technicianServiceProviderMessageThreadId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.technician.technicianServiceProviderMessageThreadId''',
      ));
  String? technicianSupportMessageThreadId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.technician.technicianSupportMessageThreadId''',
      ));
}

class CheckUserCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '+254(793) 289-839',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "phoneNumber": "$phoneNumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Check user',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/check-driver-technician',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? driverId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.driver._id''',
      ));
  String? signUpType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.signUpType''',
      ));
  dynamic technicianId(dynamic response) => getJsonField(
        response,
        r'''$.response.technician._id''',
      );
}

class UpdateDriverTokenCall {
  Future<ApiCallResponse> call({
    String? driverId = '1708270748717x347590476241924860',
    String? token = 'driverToken',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "driverId": "$driverId",
  "token": "$token"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update driver token',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/update-driver-token',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAccountCall {
  Future<ApiCallResponse> call({
    String? driverId = '1708270748717x347590476241924860',
    String? technicianId = 'driverToken',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "driver": "$driverId",
  "technician": "$technicianId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Delete account',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/delete_account',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateTechnicianCall {
  Future<ApiCallResponse> call({
    String? technicianId = '1708270804093x206021699018692930',
    String? token = 'technicianToken',
    String? activeVehiceId = '1709221980915x854794289578496500',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "technicianId": "$technicianId",
  "token": "$token",
  "activeVehiceId": "$activeVehiceId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update technician',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/update-technician',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateTechnicianPositionCall {
  Future<ApiCallResponse> call({
    String? technicianId = '1708270804093x206021699018692930',
    String? lat = '-1.22225343',
    String? lng = '322.65785',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "$technicianId",
  "lat": "$lat",
  "lng": "$lng"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update technician position',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/update_position',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateTechnicianPositionUsingCurrentPostionCall {
  Future<ApiCallResponse> call({
    String? technicianId = '1711634888940x294197895639990000',
    String? position = 'LatLng(lat: -1.1570327, lng: 36.8879157)',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "$technicianId",
  "position": "$position"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update technician position  using current postion',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/update_position_current_position',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRequestStatusCall {
  Future<ApiCallResponse> call({
    String? request = '1712607845146x953960202003370100',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get request status',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/request_status',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'request': request,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.status''',
      ));
}

class GetPreviousJobsCall {
  Future<ApiCallResponse> call({
    String? driverId = '1713534791114x400825862056229250',
    String? technicianId = '',
    String? accessToken = '1707139937267x678517623997244500',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get previous jobs',
      apiUrl: '${UptimeFleetAppGroup.baseUrl}/completed_jobs',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'driverId': driverId,
        'technicianId': technicianId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? requests(dynamic response) => getJsonField(
        response,
        r'''$.response.requests''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.response.requests[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.response.requests[:].location.address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? date(dynamic response) => (getJsonField(
        response,
        r'''$.response.requests[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

/// End UptimeFleet App Group Code

class GetUsdCodeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUsdCode',
      apiUrl: 'http://country.io/phone.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPlaceInfoCall {
  static Future<ApiCallResponse> call({
    String? latitude = '37.42159',
    String? longitude = '-122.0837',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get place info',
      apiUrl: 'https://api.bigdatacloud.net/data/reverse-geocode-client',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latitude': latitude,
        'longitude': longitude,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? locality(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.locality''',
      ));
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.city''',
      ));
  static String? pricipalSubdivision(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.principalSubdivision''',
      ));
  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.countryName''',
      ));
  static String? postCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.postcode''',
      ));
}

class GetAddressFromLatLngCall {
  static Future<ApiCallResponse> call({
    double? lat = 30.434199840736387,
    double? lng = -97.66495548376372,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get address from latLng',
      apiUrl:
          'https://api.openrouteservice.org/geocode/reverse?api_key=5b3ce3597851110001cf624881bae077dd5340f885fedf25ef381c10&point.lon=$lng&point.lat=$lat',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? placename(dynamic response) => (getJsonField(
        response,
        r'''$.features[:].properties.label''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class MapboxCall {
  static Future<ApiCallResponse> call({
    String? from = '-97.6260415209838,30.311352158549063',
    String? to = '-74.157502,40.785593',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Mapbox',
      apiUrl:
          'https://api.mapbox.com/directions/v5/mapbox/driving/$from%3B$to?access_token=pk.eyJ1IjoiYnViYnMiLCJhIjoiY2tuajZnM2RrM3Z5bTJwcDl5dnUyMGIweSJ9.ptrzHux-aOqLLq88xesllg',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static double? durationSeconds(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.routes[:].duration''',
      ));
  static double? distanceMetres(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.routes[:].distance''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
