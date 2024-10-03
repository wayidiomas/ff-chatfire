// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatWebhookStruct extends BaseStruct {
  ChatWebhookStruct({
    bool? fromMe,
    bool? chatfire,
    DateTime? createdAt,
    String? imagePath,
    bool? deletada,
  })  : _fromMe = fromMe,
        _chatfire = chatfire,
        _createdAt = createdAt,
        _imagePath = imagePath,
        _deletada = deletada;

  // "fromMe" field.
  bool? _fromMe;
  bool get fromMe => _fromMe ?? false;
  set fromMe(bool? val) => _fromMe = val;

  bool hasFromMe() => _fromMe != null;

  // "chatfire" field.
  bool? _chatfire;
  bool get chatfire => _chatfire ?? false;
  set chatfire(bool? val) => _chatfire = val;

  bool hasChatfire() => _chatfire != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  set imagePath(String? val) => _imagePath = val;

  bool hasImagePath() => _imagePath != null;

  // "deletada" field.
  bool? _deletada;
  bool get deletada => _deletada ?? false;
  set deletada(bool? val) => _deletada = val;

  bool hasDeletada() => _deletada != null;

  static ChatWebhookStruct fromMap(Map<String, dynamic> data) =>
      ChatWebhookStruct(
        fromMe: data['fromMe'] as bool?,
        chatfire: data['chatfire'] as bool?,
        createdAt: data['created_at'] as DateTime?,
        imagePath: data['imagePath'] as String?,
        deletada: data['deletada'] as bool?,
      );

  static ChatWebhookStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatWebhookStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fromMe': _fromMe,
        'chatfire': _chatfire,
        'created_at': _createdAt,
        'imagePath': _imagePath,
        'deletada': _deletada,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fromMe': serializeParam(
          _fromMe,
          ParamType.bool,
        ),
        'chatfire': serializeParam(
          _chatfire,
          ParamType.bool,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'imagePath': serializeParam(
          _imagePath,
          ParamType.String,
        ),
        'deletada': serializeParam(
          _deletada,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ChatWebhookStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatWebhookStruct(
        fromMe: deserializeParam(
          data['fromMe'],
          ParamType.bool,
          false,
        ),
        chatfire: deserializeParam(
          data['chatfire'],
          ParamType.bool,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        imagePath: deserializeParam(
          data['imagePath'],
          ParamType.String,
          false,
        ),
        deletada: deserializeParam(
          data['deletada'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ChatWebhookStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatWebhookStruct &&
        fromMe == other.fromMe &&
        chatfire == other.chatfire &&
        createdAt == other.createdAt &&
        imagePath == other.imagePath &&
        deletada == other.deletada;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([fromMe, chatfire, createdAt, imagePath, deletada]);
}

ChatWebhookStruct createChatWebhookStruct({
  bool? fromMe,
  bool? chatfire,
  DateTime? createdAt,
  String? imagePath,
  bool? deletada,
}) =>
    ChatWebhookStruct(
      fromMe: fromMe,
      chatfire: chatfire,
      createdAt: createdAt,
      imagePath: imagePath,
      deletada: deletada,
    );
