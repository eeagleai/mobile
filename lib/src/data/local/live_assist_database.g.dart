// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_assist_database.dart';

// ignore_for_file: type=lint
class $ConversationsTable extends Conversations
    with TableInfo<$ConversationsTable, Conversation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConversationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _conversationIdMeta = const VerificationMeta(
    'conversationId',
  );
  @override
  late final GeneratedColumn<String> conversationId = GeneratedColumn<String>(
    'conversation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _siteApiKeyMeta = const VerificationMeta(
    'siteApiKey',
  );
  @override
  late final GeneratedColumn<String> siteApiKey = GeneratedColumn<String>(
    'site_api_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _visitorLabelMeta = const VerificationMeta(
    'visitorLabel',
  );
  @override
  late final GeneratedColumn<String> visitorLabel = GeneratedColumn<String>(
    'visitor_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageUrlMeta = const VerificationMeta(
    'pageUrl',
  );
  @override
  late final GeneratedColumn<String> pageUrl = GeneratedColumn<String>(
    'page_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _visitIdMeta = const VerificationMeta(
    'visitId',
  );
  @override
  late final GeneratedColumn<String> visitId = GeneratedColumn<String>(
    'visit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _firstSeenAtMeta = const VerificationMeta(
    'firstSeenAt',
  );
  @override
  late final GeneratedColumn<DateTime> firstSeenAt = GeneratedColumn<DateTime>(
    'first_seen_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastActivityAtMeta = const VerificationMeta(
    'lastActivityAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastActivityAt =
      GeneratedColumn<DateTime>(
        'last_activity_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _unreadCountMeta = const VerificationMeta(
    'unreadCount',
  );
  @override
  late final GeneratedColumn<int> unreadCount = GeneratedColumn<int>(
    'unread_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _latestPreviewMeta = const VerificationMeta(
    'latestPreview',
  );
  @override
  late final GeneratedColumn<String> latestPreview = GeneratedColumn<String>(
    'latest_preview',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latestEventTypeMeta = const VerificationMeta(
    'latestEventType',
  );
  @override
  late final GeneratedColumn<String> latestEventType = GeneratedColumn<String>(
    'latest_event_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    conversationId,
    siteApiKey,
    visitorLabel,
    pageUrl,
    city,
    country,
    visitId,
    status,
    firstSeenAt,
    lastActivityAt,
    unreadCount,
    latestPreview,
    latestEventType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conversations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Conversation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('conversation_id')) {
      context.handle(
        _conversationIdMeta,
        conversationId.isAcceptableOrUnknown(
          data['conversation_id']!,
          _conversationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conversationIdMeta);
    }
    if (data.containsKey('site_api_key')) {
      context.handle(
        _siteApiKeyMeta,
        siteApiKey.isAcceptableOrUnknown(
          data['site_api_key']!,
          _siteApiKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_siteApiKeyMeta);
    }
    if (data.containsKey('visitor_label')) {
      context.handle(
        _visitorLabelMeta,
        visitorLabel.isAcceptableOrUnknown(
          data['visitor_label']!,
          _visitorLabelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_visitorLabelMeta);
    }
    if (data.containsKey('page_url')) {
      context.handle(
        _pageUrlMeta,
        pageUrl.isAcceptableOrUnknown(data['page_url']!, _pageUrlMeta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('visit_id')) {
      context.handle(
        _visitIdMeta,
        visitId.isAcceptableOrUnknown(data['visit_id']!, _visitIdMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('first_seen_at')) {
      context.handle(
        _firstSeenAtMeta,
        firstSeenAt.isAcceptableOrUnknown(
          data['first_seen_at']!,
          _firstSeenAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_firstSeenAtMeta);
    }
    if (data.containsKey('last_activity_at')) {
      context.handle(
        _lastActivityAtMeta,
        lastActivityAt.isAcceptableOrUnknown(
          data['last_activity_at']!,
          _lastActivityAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastActivityAtMeta);
    }
    if (data.containsKey('unread_count')) {
      context.handle(
        _unreadCountMeta,
        unreadCount.isAcceptableOrUnknown(
          data['unread_count']!,
          _unreadCountMeta,
        ),
      );
    }
    if (data.containsKey('latest_preview')) {
      context.handle(
        _latestPreviewMeta,
        latestPreview.isAcceptableOrUnknown(
          data['latest_preview']!,
          _latestPreviewMeta,
        ),
      );
    }
    if (data.containsKey('latest_event_type')) {
      context.handle(
        _latestEventTypeMeta,
        latestEventType.isAcceptableOrUnknown(
          data['latest_event_type']!,
          _latestEventTypeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {conversationId, siteApiKey};
  @override
  Conversation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Conversation(
      conversationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conversation_id'],
      )!,
      siteApiKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}site_api_key'],
      )!,
      visitorLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}visitor_label'],
      )!,
      pageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}page_url'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      visitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}visit_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      firstSeenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}first_seen_at'],
      )!,
      lastActivityAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_activity_at'],
      )!,
      unreadCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unread_count'],
      )!,
      latestPreview: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}latest_preview'],
      ),
      latestEventType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}latest_event_type'],
      ),
    );
  }

  @override
  $ConversationsTable createAlias(String alias) {
    return $ConversationsTable(attachedDatabase, alias);
  }
}

class Conversation extends DataClass implements Insertable<Conversation> {
  final String conversationId;
  final String siteApiKey;
  final String visitorLabel;
  final String? pageUrl;
  final String? city;
  final String? country;
  final String? visitId;
  final String status;
  final DateTime firstSeenAt;
  final DateTime lastActivityAt;
  final int unreadCount;
  final String? latestPreview;
  final String? latestEventType;
  const Conversation({
    required this.conversationId,
    required this.siteApiKey,
    required this.visitorLabel,
    this.pageUrl,
    this.city,
    this.country,
    this.visitId,
    required this.status,
    required this.firstSeenAt,
    required this.lastActivityAt,
    required this.unreadCount,
    this.latestPreview,
    this.latestEventType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['conversation_id'] = Variable<String>(conversationId);
    map['site_api_key'] = Variable<String>(siteApiKey);
    map['visitor_label'] = Variable<String>(visitorLabel);
    if (!nullToAbsent || pageUrl != null) {
      map['page_url'] = Variable<String>(pageUrl);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || visitId != null) {
      map['visit_id'] = Variable<String>(visitId);
    }
    map['status'] = Variable<String>(status);
    map['first_seen_at'] = Variable<DateTime>(firstSeenAt);
    map['last_activity_at'] = Variable<DateTime>(lastActivityAt);
    map['unread_count'] = Variable<int>(unreadCount);
    if (!nullToAbsent || latestPreview != null) {
      map['latest_preview'] = Variable<String>(latestPreview);
    }
    if (!nullToAbsent || latestEventType != null) {
      map['latest_event_type'] = Variable<String>(latestEventType);
    }
    return map;
  }

  ConversationsCompanion toCompanion(bool nullToAbsent) {
    return ConversationsCompanion(
      conversationId: Value(conversationId),
      siteApiKey: Value(siteApiKey),
      visitorLabel: Value(visitorLabel),
      pageUrl: pageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(pageUrl),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      visitId: visitId == null && nullToAbsent
          ? const Value.absent()
          : Value(visitId),
      status: Value(status),
      firstSeenAt: Value(firstSeenAt),
      lastActivityAt: Value(lastActivityAt),
      unreadCount: Value(unreadCount),
      latestPreview: latestPreview == null && nullToAbsent
          ? const Value.absent()
          : Value(latestPreview),
      latestEventType: latestEventType == null && nullToAbsent
          ? const Value.absent()
          : Value(latestEventType),
    );
  }

  factory Conversation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Conversation(
      conversationId: serializer.fromJson<String>(json['conversationId']),
      siteApiKey: serializer.fromJson<String>(json['siteApiKey']),
      visitorLabel: serializer.fromJson<String>(json['visitorLabel']),
      pageUrl: serializer.fromJson<String?>(json['pageUrl']),
      city: serializer.fromJson<String?>(json['city']),
      country: serializer.fromJson<String?>(json['country']),
      visitId: serializer.fromJson<String?>(json['visitId']),
      status: serializer.fromJson<String>(json['status']),
      firstSeenAt: serializer.fromJson<DateTime>(json['firstSeenAt']),
      lastActivityAt: serializer.fromJson<DateTime>(json['lastActivityAt']),
      unreadCount: serializer.fromJson<int>(json['unreadCount']),
      latestPreview: serializer.fromJson<String?>(json['latestPreview']),
      latestEventType: serializer.fromJson<String?>(json['latestEventType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'conversationId': serializer.toJson<String>(conversationId),
      'siteApiKey': serializer.toJson<String>(siteApiKey),
      'visitorLabel': serializer.toJson<String>(visitorLabel),
      'pageUrl': serializer.toJson<String?>(pageUrl),
      'city': serializer.toJson<String?>(city),
      'country': serializer.toJson<String?>(country),
      'visitId': serializer.toJson<String?>(visitId),
      'status': serializer.toJson<String>(status),
      'firstSeenAt': serializer.toJson<DateTime>(firstSeenAt),
      'lastActivityAt': serializer.toJson<DateTime>(lastActivityAt),
      'unreadCount': serializer.toJson<int>(unreadCount),
      'latestPreview': serializer.toJson<String?>(latestPreview),
      'latestEventType': serializer.toJson<String?>(latestEventType),
    };
  }

  Conversation copyWith({
    String? conversationId,
    String? siteApiKey,
    String? visitorLabel,
    Value<String?> pageUrl = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<String?> country = const Value.absent(),
    Value<String?> visitId = const Value.absent(),
    String? status,
    DateTime? firstSeenAt,
    DateTime? lastActivityAt,
    int? unreadCount,
    Value<String?> latestPreview = const Value.absent(),
    Value<String?> latestEventType = const Value.absent(),
  }) => Conversation(
    conversationId: conversationId ?? this.conversationId,
    siteApiKey: siteApiKey ?? this.siteApiKey,
    visitorLabel: visitorLabel ?? this.visitorLabel,
    pageUrl: pageUrl.present ? pageUrl.value : this.pageUrl,
    city: city.present ? city.value : this.city,
    country: country.present ? country.value : this.country,
    visitId: visitId.present ? visitId.value : this.visitId,
    status: status ?? this.status,
    firstSeenAt: firstSeenAt ?? this.firstSeenAt,
    lastActivityAt: lastActivityAt ?? this.lastActivityAt,
    unreadCount: unreadCount ?? this.unreadCount,
    latestPreview: latestPreview.present
        ? latestPreview.value
        : this.latestPreview,
    latestEventType: latestEventType.present
        ? latestEventType.value
        : this.latestEventType,
  );
  Conversation copyWithCompanion(ConversationsCompanion data) {
    return Conversation(
      conversationId: data.conversationId.present
          ? data.conversationId.value
          : this.conversationId,
      siteApiKey: data.siteApiKey.present
          ? data.siteApiKey.value
          : this.siteApiKey,
      visitorLabel: data.visitorLabel.present
          ? data.visitorLabel.value
          : this.visitorLabel,
      pageUrl: data.pageUrl.present ? data.pageUrl.value : this.pageUrl,
      city: data.city.present ? data.city.value : this.city,
      country: data.country.present ? data.country.value : this.country,
      visitId: data.visitId.present ? data.visitId.value : this.visitId,
      status: data.status.present ? data.status.value : this.status,
      firstSeenAt: data.firstSeenAt.present
          ? data.firstSeenAt.value
          : this.firstSeenAt,
      lastActivityAt: data.lastActivityAt.present
          ? data.lastActivityAt.value
          : this.lastActivityAt,
      unreadCount: data.unreadCount.present
          ? data.unreadCount.value
          : this.unreadCount,
      latestPreview: data.latestPreview.present
          ? data.latestPreview.value
          : this.latestPreview,
      latestEventType: data.latestEventType.present
          ? data.latestEventType.value
          : this.latestEventType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Conversation(')
          ..write('conversationId: $conversationId, ')
          ..write('siteApiKey: $siteApiKey, ')
          ..write('visitorLabel: $visitorLabel, ')
          ..write('pageUrl: $pageUrl, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('visitId: $visitId, ')
          ..write('status: $status, ')
          ..write('firstSeenAt: $firstSeenAt, ')
          ..write('lastActivityAt: $lastActivityAt, ')
          ..write('unreadCount: $unreadCount, ')
          ..write('latestPreview: $latestPreview, ')
          ..write('latestEventType: $latestEventType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    conversationId,
    siteApiKey,
    visitorLabel,
    pageUrl,
    city,
    country,
    visitId,
    status,
    firstSeenAt,
    lastActivityAt,
    unreadCount,
    latestPreview,
    latestEventType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Conversation &&
          other.conversationId == this.conversationId &&
          other.siteApiKey == this.siteApiKey &&
          other.visitorLabel == this.visitorLabel &&
          other.pageUrl == this.pageUrl &&
          other.city == this.city &&
          other.country == this.country &&
          other.visitId == this.visitId &&
          other.status == this.status &&
          other.firstSeenAt == this.firstSeenAt &&
          other.lastActivityAt == this.lastActivityAt &&
          other.unreadCount == this.unreadCount &&
          other.latestPreview == this.latestPreview &&
          other.latestEventType == this.latestEventType);
}

class ConversationsCompanion extends UpdateCompanion<Conversation> {
  final Value<String> conversationId;
  final Value<String> siteApiKey;
  final Value<String> visitorLabel;
  final Value<String?> pageUrl;
  final Value<String?> city;
  final Value<String?> country;
  final Value<String?> visitId;
  final Value<String> status;
  final Value<DateTime> firstSeenAt;
  final Value<DateTime> lastActivityAt;
  final Value<int> unreadCount;
  final Value<String?> latestPreview;
  final Value<String?> latestEventType;
  final Value<int> rowid;
  const ConversationsCompanion({
    this.conversationId = const Value.absent(),
    this.siteApiKey = const Value.absent(),
    this.visitorLabel = const Value.absent(),
    this.pageUrl = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.visitId = const Value.absent(),
    this.status = const Value.absent(),
    this.firstSeenAt = const Value.absent(),
    this.lastActivityAt = const Value.absent(),
    this.unreadCount = const Value.absent(),
    this.latestPreview = const Value.absent(),
    this.latestEventType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConversationsCompanion.insert({
    required String conversationId,
    required String siteApiKey,
    required String visitorLabel,
    this.pageUrl = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.visitId = const Value.absent(),
    required String status,
    required DateTime firstSeenAt,
    required DateTime lastActivityAt,
    this.unreadCount = const Value.absent(),
    this.latestPreview = const Value.absent(),
    this.latestEventType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : conversationId = Value(conversationId),
       siteApiKey = Value(siteApiKey),
       visitorLabel = Value(visitorLabel),
       status = Value(status),
       firstSeenAt = Value(firstSeenAt),
       lastActivityAt = Value(lastActivityAt);
  static Insertable<Conversation> custom({
    Expression<String>? conversationId,
    Expression<String>? siteApiKey,
    Expression<String>? visitorLabel,
    Expression<String>? pageUrl,
    Expression<String>? city,
    Expression<String>? country,
    Expression<String>? visitId,
    Expression<String>? status,
    Expression<DateTime>? firstSeenAt,
    Expression<DateTime>? lastActivityAt,
    Expression<int>? unreadCount,
    Expression<String>? latestPreview,
    Expression<String>? latestEventType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (conversationId != null) 'conversation_id': conversationId,
      if (siteApiKey != null) 'site_api_key': siteApiKey,
      if (visitorLabel != null) 'visitor_label': visitorLabel,
      if (pageUrl != null) 'page_url': pageUrl,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (visitId != null) 'visit_id': visitId,
      if (status != null) 'status': status,
      if (firstSeenAt != null) 'first_seen_at': firstSeenAt,
      if (lastActivityAt != null) 'last_activity_at': lastActivityAt,
      if (unreadCount != null) 'unread_count': unreadCount,
      if (latestPreview != null) 'latest_preview': latestPreview,
      if (latestEventType != null) 'latest_event_type': latestEventType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConversationsCompanion copyWith({
    Value<String>? conversationId,
    Value<String>? siteApiKey,
    Value<String>? visitorLabel,
    Value<String?>? pageUrl,
    Value<String?>? city,
    Value<String?>? country,
    Value<String?>? visitId,
    Value<String>? status,
    Value<DateTime>? firstSeenAt,
    Value<DateTime>? lastActivityAt,
    Value<int>? unreadCount,
    Value<String?>? latestPreview,
    Value<String?>? latestEventType,
    Value<int>? rowid,
  }) {
    return ConversationsCompanion(
      conversationId: conversationId ?? this.conversationId,
      siteApiKey: siteApiKey ?? this.siteApiKey,
      visitorLabel: visitorLabel ?? this.visitorLabel,
      pageUrl: pageUrl ?? this.pageUrl,
      city: city ?? this.city,
      country: country ?? this.country,
      visitId: visitId ?? this.visitId,
      status: status ?? this.status,
      firstSeenAt: firstSeenAt ?? this.firstSeenAt,
      lastActivityAt: lastActivityAt ?? this.lastActivityAt,
      unreadCount: unreadCount ?? this.unreadCount,
      latestPreview: latestPreview ?? this.latestPreview,
      latestEventType: latestEventType ?? this.latestEventType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (conversationId.present) {
      map['conversation_id'] = Variable<String>(conversationId.value);
    }
    if (siteApiKey.present) {
      map['site_api_key'] = Variable<String>(siteApiKey.value);
    }
    if (visitorLabel.present) {
      map['visitor_label'] = Variable<String>(visitorLabel.value);
    }
    if (pageUrl.present) {
      map['page_url'] = Variable<String>(pageUrl.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (visitId.present) {
      map['visit_id'] = Variable<String>(visitId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (firstSeenAt.present) {
      map['first_seen_at'] = Variable<DateTime>(firstSeenAt.value);
    }
    if (lastActivityAt.present) {
      map['last_activity_at'] = Variable<DateTime>(lastActivityAt.value);
    }
    if (unreadCount.present) {
      map['unread_count'] = Variable<int>(unreadCount.value);
    }
    if (latestPreview.present) {
      map['latest_preview'] = Variable<String>(latestPreview.value);
    }
    if (latestEventType.present) {
      map['latest_event_type'] = Variable<String>(latestEventType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConversationsCompanion(')
          ..write('conversationId: $conversationId, ')
          ..write('siteApiKey: $siteApiKey, ')
          ..write('visitorLabel: $visitorLabel, ')
          ..write('pageUrl: $pageUrl, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('visitId: $visitId, ')
          ..write('status: $status, ')
          ..write('firstSeenAt: $firstSeenAt, ')
          ..write('lastActivityAt: $lastActivityAt, ')
          ..write('unreadCount: $unreadCount, ')
          ..write('latestPreview: $latestPreview, ')
          ..write('latestEventType: $latestEventType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChatMessagesTable extends ChatMessages
    with TableInfo<$ChatMessagesTable, ChatMessage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatMessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conversationIdMeta = const VerificationMeta(
    'conversationId',
  );
  @override
  late final GeneratedColumn<String> conversationId = GeneratedColumn<String>(
    'conversation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _siteApiKeyMeta = const VerificationMeta(
    'siteApiKey',
  );
  @override
  late final GeneratedColumn<String> siteApiKey = GeneratedColumn<String>(
    'site_api_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _senderMeta = const VerificationMeta('sender');
  @override
  late final GeneratedColumn<String> sender = GeneratedColumn<String>(
    'sender',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageTextMeta = const VerificationMeta(
    'messageText',
  );
  @override
  late final GeneratedColumn<String> messageText = GeneratedColumn<String>(
    'message_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    conversationId,
    siteApiKey,
    sender,
    messageText,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChatMessage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('conversation_id')) {
      context.handle(
        _conversationIdMeta,
        conversationId.isAcceptableOrUnknown(
          data['conversation_id']!,
          _conversationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conversationIdMeta);
    }
    if (data.containsKey('site_api_key')) {
      context.handle(
        _siteApiKeyMeta,
        siteApiKey.isAcceptableOrUnknown(
          data['site_api_key']!,
          _siteApiKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_siteApiKeyMeta);
    }
    if (data.containsKey('sender')) {
      context.handle(
        _senderMeta,
        sender.isAcceptableOrUnknown(data['sender']!, _senderMeta),
      );
    } else if (isInserting) {
      context.missing(_senderMeta);
    }
    if (data.containsKey('message_text')) {
      context.handle(
        _messageTextMeta,
        messageText.isAcceptableOrUnknown(
          data['message_text']!,
          _messageTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_messageTextMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatMessage(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      conversationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conversation_id'],
      )!,
      siteApiKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}site_api_key'],
      )!,
      sender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sender'],
      )!,
      messageText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message_text'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $ChatMessagesTable createAlias(String alias) {
    return $ChatMessagesTable(attachedDatabase, alias);
  }
}

class ChatMessage extends DataClass implements Insertable<ChatMessage> {
  final String id;
  final String conversationId;
  final String siteApiKey;
  final String sender;
  final String messageText;
  final String status;
  final DateTime? createdAt;
  const ChatMessage({
    required this.id,
    required this.conversationId,
    required this.siteApiKey,
    required this.sender,
    required this.messageText,
    required this.status,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['conversation_id'] = Variable<String>(conversationId);
    map['site_api_key'] = Variable<String>(siteApiKey);
    map['sender'] = Variable<String>(sender);
    map['message_text'] = Variable<String>(messageText);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  ChatMessagesCompanion toCompanion(bool nullToAbsent) {
    return ChatMessagesCompanion(
      id: Value(id),
      conversationId: Value(conversationId),
      siteApiKey: Value(siteApiKey),
      sender: Value(sender),
      messageText: Value(messageText),
      status: Value(status),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory ChatMessage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatMessage(
      id: serializer.fromJson<String>(json['id']),
      conversationId: serializer.fromJson<String>(json['conversationId']),
      siteApiKey: serializer.fromJson<String>(json['siteApiKey']),
      sender: serializer.fromJson<String>(json['sender']),
      messageText: serializer.fromJson<String>(json['messageText']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'conversationId': serializer.toJson<String>(conversationId),
      'siteApiKey': serializer.toJson<String>(siteApiKey),
      'sender': serializer.toJson<String>(sender),
      'messageText': serializer.toJson<String>(messageText),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  ChatMessage copyWith({
    String? id,
    String? conversationId,
    String? siteApiKey,
    String? sender,
    String? messageText,
    String? status,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => ChatMessage(
    id: id ?? this.id,
    conversationId: conversationId ?? this.conversationId,
    siteApiKey: siteApiKey ?? this.siteApiKey,
    sender: sender ?? this.sender,
    messageText: messageText ?? this.messageText,
    status: status ?? this.status,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  ChatMessage copyWithCompanion(ChatMessagesCompanion data) {
    return ChatMessage(
      id: data.id.present ? data.id.value : this.id,
      conversationId: data.conversationId.present
          ? data.conversationId.value
          : this.conversationId,
      siteApiKey: data.siteApiKey.present
          ? data.siteApiKey.value
          : this.siteApiKey,
      sender: data.sender.present ? data.sender.value : this.sender,
      messageText: data.messageText.present
          ? data.messageText.value
          : this.messageText,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatMessage(')
          ..write('id: $id, ')
          ..write('conversationId: $conversationId, ')
          ..write('siteApiKey: $siteApiKey, ')
          ..write('sender: $sender, ')
          ..write('messageText: $messageText, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    conversationId,
    siteApiKey,
    sender,
    messageText,
    status,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatMessage &&
          other.id == this.id &&
          other.conversationId == this.conversationId &&
          other.siteApiKey == this.siteApiKey &&
          other.sender == this.sender &&
          other.messageText == this.messageText &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class ChatMessagesCompanion extends UpdateCompanion<ChatMessage> {
  final Value<String> id;
  final Value<String> conversationId;
  final Value<String> siteApiKey;
  final Value<String> sender;
  final Value<String> messageText;
  final Value<String> status;
  final Value<DateTime?> createdAt;
  final Value<int> rowid;
  const ChatMessagesCompanion({
    this.id = const Value.absent(),
    this.conversationId = const Value.absent(),
    this.siteApiKey = const Value.absent(),
    this.sender = const Value.absent(),
    this.messageText = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChatMessagesCompanion.insert({
    required String id,
    required String conversationId,
    required String siteApiKey,
    required String sender,
    required String messageText,
    required String status,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       conversationId = Value(conversationId),
       siteApiKey = Value(siteApiKey),
       sender = Value(sender),
       messageText = Value(messageText),
       status = Value(status);
  static Insertable<ChatMessage> custom({
    Expression<String>? id,
    Expression<String>? conversationId,
    Expression<String>? siteApiKey,
    Expression<String>? sender,
    Expression<String>? messageText,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (conversationId != null) 'conversation_id': conversationId,
      if (siteApiKey != null) 'site_api_key': siteApiKey,
      if (sender != null) 'sender': sender,
      if (messageText != null) 'message_text': messageText,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChatMessagesCompanion copyWith({
    Value<String>? id,
    Value<String>? conversationId,
    Value<String>? siteApiKey,
    Value<String>? sender,
    Value<String>? messageText,
    Value<String>? status,
    Value<DateTime?>? createdAt,
    Value<int>? rowid,
  }) {
    return ChatMessagesCompanion(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      siteApiKey: siteApiKey ?? this.siteApiKey,
      sender: sender ?? this.sender,
      messageText: messageText ?? this.messageText,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (conversationId.present) {
      map['conversation_id'] = Variable<String>(conversationId.value);
    }
    if (siteApiKey.present) {
      map['site_api_key'] = Variable<String>(siteApiKey.value);
    }
    if (sender.present) {
      map['sender'] = Variable<String>(sender.value);
    }
    if (messageText.present) {
      map['message_text'] = Variable<String>(messageText.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatMessagesCompanion(')
          ..write('id: $id, ')
          ..write('conversationId: $conversationId, ')
          ..write('siteApiKey: $siteApiKey, ')
          ..write('sender: $sender, ')
          ..write('messageText: $messageText, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LiveAssistDatabase extends GeneratedDatabase {
  _$LiveAssistDatabase(QueryExecutor e) : super(e);
  $LiveAssistDatabaseManager get managers => $LiveAssistDatabaseManager(this);
  late final $ConversationsTable conversations = $ConversationsTable(this);
  late final $ChatMessagesTable chatMessages = $ChatMessagesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    conversations,
    chatMessages,
  ];
}

typedef $$ConversationsTableCreateCompanionBuilder =
    ConversationsCompanion Function({
      required String conversationId,
      required String siteApiKey,
      required String visitorLabel,
      Value<String?> pageUrl,
      Value<String?> city,
      Value<String?> country,
      Value<String?> visitId,
      required String status,
      required DateTime firstSeenAt,
      required DateTime lastActivityAt,
      Value<int> unreadCount,
      Value<String?> latestPreview,
      Value<String?> latestEventType,
      Value<int> rowid,
    });
typedef $$ConversationsTableUpdateCompanionBuilder =
    ConversationsCompanion Function({
      Value<String> conversationId,
      Value<String> siteApiKey,
      Value<String> visitorLabel,
      Value<String?> pageUrl,
      Value<String?> city,
      Value<String?> country,
      Value<String?> visitId,
      Value<String> status,
      Value<DateTime> firstSeenAt,
      Value<DateTime> lastActivityAt,
      Value<int> unreadCount,
      Value<String?> latestPreview,
      Value<String?> latestEventType,
      Value<int> rowid,
    });

class $$ConversationsTableFilterComposer
    extends Composer<_$LiveAssistDatabase, $ConversationsTable> {
  $$ConversationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get conversationId => $composableBuilder(
    column: $table.conversationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get siteApiKey => $composableBuilder(
    column: $table.siteApiKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get visitorLabel => $composableBuilder(
    column: $table.visitorLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pageUrl => $composableBuilder(
    column: $table.pageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get visitId => $composableBuilder(
    column: $table.visitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get firstSeenAt => $composableBuilder(
    column: $table.firstSeenAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastActivityAt => $composableBuilder(
    column: $table.lastActivityAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unreadCount => $composableBuilder(
    column: $table.unreadCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get latestPreview => $composableBuilder(
    column: $table.latestPreview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get latestEventType => $composableBuilder(
    column: $table.latestEventType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ConversationsTableOrderingComposer
    extends Composer<_$LiveAssistDatabase, $ConversationsTable> {
  $$ConversationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get conversationId => $composableBuilder(
    column: $table.conversationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get siteApiKey => $composableBuilder(
    column: $table.siteApiKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get visitorLabel => $composableBuilder(
    column: $table.visitorLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pageUrl => $composableBuilder(
    column: $table.pageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get visitId => $composableBuilder(
    column: $table.visitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get firstSeenAt => $composableBuilder(
    column: $table.firstSeenAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastActivityAt => $composableBuilder(
    column: $table.lastActivityAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unreadCount => $composableBuilder(
    column: $table.unreadCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get latestPreview => $composableBuilder(
    column: $table.latestPreview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get latestEventType => $composableBuilder(
    column: $table.latestEventType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConversationsTableAnnotationComposer
    extends Composer<_$LiveAssistDatabase, $ConversationsTable> {
  $$ConversationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get conversationId => $composableBuilder(
    column: $table.conversationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get siteApiKey => $composableBuilder(
    column: $table.siteApiKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get visitorLabel => $composableBuilder(
    column: $table.visitorLabel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pageUrl =>
      $composableBuilder(column: $table.pageUrl, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get visitId =>
      $composableBuilder(column: $table.visitId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get firstSeenAt => $composableBuilder(
    column: $table.firstSeenAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastActivityAt => $composableBuilder(
    column: $table.lastActivityAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unreadCount => $composableBuilder(
    column: $table.unreadCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get latestPreview => $composableBuilder(
    column: $table.latestPreview,
    builder: (column) => column,
  );

  GeneratedColumn<String> get latestEventType => $composableBuilder(
    column: $table.latestEventType,
    builder: (column) => column,
  );
}

class $$ConversationsTableTableManager
    extends
        RootTableManager<
          _$LiveAssistDatabase,
          $ConversationsTable,
          Conversation,
          $$ConversationsTableFilterComposer,
          $$ConversationsTableOrderingComposer,
          $$ConversationsTableAnnotationComposer,
          $$ConversationsTableCreateCompanionBuilder,
          $$ConversationsTableUpdateCompanionBuilder,
          (
            Conversation,
            BaseReferences<
              _$LiveAssistDatabase,
              $ConversationsTable,
              Conversation
            >,
          ),
          Conversation,
          PrefetchHooks Function()
        > {
  $$ConversationsTableTableManager(
    _$LiveAssistDatabase db,
    $ConversationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConversationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConversationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConversationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> conversationId = const Value.absent(),
                Value<String> siteApiKey = const Value.absent(),
                Value<String> visitorLabel = const Value.absent(),
                Value<String?> pageUrl = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> visitId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> firstSeenAt = const Value.absent(),
                Value<DateTime> lastActivityAt = const Value.absent(),
                Value<int> unreadCount = const Value.absent(),
                Value<String?> latestPreview = const Value.absent(),
                Value<String?> latestEventType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConversationsCompanion(
                conversationId: conversationId,
                siteApiKey: siteApiKey,
                visitorLabel: visitorLabel,
                pageUrl: pageUrl,
                city: city,
                country: country,
                visitId: visitId,
                status: status,
                firstSeenAt: firstSeenAt,
                lastActivityAt: lastActivityAt,
                unreadCount: unreadCount,
                latestPreview: latestPreview,
                latestEventType: latestEventType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String conversationId,
                required String siteApiKey,
                required String visitorLabel,
                Value<String?> pageUrl = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> visitId = const Value.absent(),
                required String status,
                required DateTime firstSeenAt,
                required DateTime lastActivityAt,
                Value<int> unreadCount = const Value.absent(),
                Value<String?> latestPreview = const Value.absent(),
                Value<String?> latestEventType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConversationsCompanion.insert(
                conversationId: conversationId,
                siteApiKey: siteApiKey,
                visitorLabel: visitorLabel,
                pageUrl: pageUrl,
                city: city,
                country: country,
                visitId: visitId,
                status: status,
                firstSeenAt: firstSeenAt,
                lastActivityAt: lastActivityAt,
                unreadCount: unreadCount,
                latestPreview: latestPreview,
                latestEventType: latestEventType,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ConversationsTableProcessedTableManager =
    ProcessedTableManager<
      _$LiveAssistDatabase,
      $ConversationsTable,
      Conversation,
      $$ConversationsTableFilterComposer,
      $$ConversationsTableOrderingComposer,
      $$ConversationsTableAnnotationComposer,
      $$ConversationsTableCreateCompanionBuilder,
      $$ConversationsTableUpdateCompanionBuilder,
      (
        Conversation,
        BaseReferences<_$LiveAssistDatabase, $ConversationsTable, Conversation>,
      ),
      Conversation,
      PrefetchHooks Function()
    >;
typedef $$ChatMessagesTableCreateCompanionBuilder =
    ChatMessagesCompanion Function({
      required String id,
      required String conversationId,
      required String siteApiKey,
      required String sender,
      required String messageText,
      required String status,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });
typedef $$ChatMessagesTableUpdateCompanionBuilder =
    ChatMessagesCompanion Function({
      Value<String> id,
      Value<String> conversationId,
      Value<String> siteApiKey,
      Value<String> sender,
      Value<String> messageText,
      Value<String> status,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });

class $$ChatMessagesTableFilterComposer
    extends Composer<_$LiveAssistDatabase, $ChatMessagesTable> {
  $$ChatMessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conversationId => $composableBuilder(
    column: $table.conversationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get siteApiKey => $composableBuilder(
    column: $table.siteApiKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sender => $composableBuilder(
    column: $table.sender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get messageText => $composableBuilder(
    column: $table.messageText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChatMessagesTableOrderingComposer
    extends Composer<_$LiveAssistDatabase, $ChatMessagesTable> {
  $$ChatMessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conversationId => $composableBuilder(
    column: $table.conversationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get siteApiKey => $composableBuilder(
    column: $table.siteApiKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sender => $composableBuilder(
    column: $table.sender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get messageText => $composableBuilder(
    column: $table.messageText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChatMessagesTableAnnotationComposer
    extends Composer<_$LiveAssistDatabase, $ChatMessagesTable> {
  $$ChatMessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get conversationId => $composableBuilder(
    column: $table.conversationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get siteApiKey => $composableBuilder(
    column: $table.siteApiKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sender =>
      $composableBuilder(column: $table.sender, builder: (column) => column);

  GeneratedColumn<String> get messageText => $composableBuilder(
    column: $table.messageText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ChatMessagesTableTableManager
    extends
        RootTableManager<
          _$LiveAssistDatabase,
          $ChatMessagesTable,
          ChatMessage,
          $$ChatMessagesTableFilterComposer,
          $$ChatMessagesTableOrderingComposer,
          $$ChatMessagesTableAnnotationComposer,
          $$ChatMessagesTableCreateCompanionBuilder,
          $$ChatMessagesTableUpdateCompanionBuilder,
          (
            ChatMessage,
            BaseReferences<
              _$LiveAssistDatabase,
              $ChatMessagesTable,
              ChatMessage
            >,
          ),
          ChatMessage,
          PrefetchHooks Function()
        > {
  $$ChatMessagesTableTableManager(
    _$LiveAssistDatabase db,
    $ChatMessagesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatMessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatMessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatMessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> conversationId = const Value.absent(),
                Value<String> siteApiKey = const Value.absent(),
                Value<String> sender = const Value.absent(),
                Value<String> messageText = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChatMessagesCompanion(
                id: id,
                conversationId: conversationId,
                siteApiKey: siteApiKey,
                sender: sender,
                messageText: messageText,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String conversationId,
                required String siteApiKey,
                required String sender,
                required String messageText,
                required String status,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChatMessagesCompanion.insert(
                id: id,
                conversationId: conversationId,
                siteApiKey: siteApiKey,
                sender: sender,
                messageText: messageText,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChatMessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$LiveAssistDatabase,
      $ChatMessagesTable,
      ChatMessage,
      $$ChatMessagesTableFilterComposer,
      $$ChatMessagesTableOrderingComposer,
      $$ChatMessagesTableAnnotationComposer,
      $$ChatMessagesTableCreateCompanionBuilder,
      $$ChatMessagesTableUpdateCompanionBuilder,
      (
        ChatMessage,
        BaseReferences<_$LiveAssistDatabase, $ChatMessagesTable, ChatMessage>,
      ),
      ChatMessage,
      PrefetchHooks Function()
    >;

class $LiveAssistDatabaseManager {
  final _$LiveAssistDatabase _db;
  $LiveAssistDatabaseManager(this._db);
  $$ConversationsTableTableManager get conversations =>
      $$ConversationsTableTableManager(_db, _db.conversations);
  $$ChatMessagesTableTableManager get chatMessages =>
      $$ChatMessagesTableTableManager(_db, _db.chatMessages);
}
