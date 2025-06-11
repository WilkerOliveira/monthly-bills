// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_db_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppConfigDbModelCollection on Isar {
  IsarCollection<AppConfigDbModel> get appConfigDbModels => this.collection();
}

const AppConfigDbModelSchema = CollectionSchema(
  name: r'AppConfigDbModel',
  id: -6793816941854687362,
  properties: {
    r'endDay': PropertySchema(
      id: 0,
      name: r'endDay',
      type: IsarType.long,
    ),
    r'startDay': PropertySchema(
      id: 1,
      name: r'startDay',
      type: IsarType.long,
    )
  },
  estimateSize: _appConfigDbModelEstimateSize,
  serialize: _appConfigDbModelSerialize,
  deserialize: _appConfigDbModelDeserialize,
  deserializeProp: _appConfigDbModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _appConfigDbModelGetId,
  getLinks: _appConfigDbModelGetLinks,
  attach: _appConfigDbModelAttach,
  version: '3.1.0+1',
);

int _appConfigDbModelEstimateSize(
  AppConfigDbModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _appConfigDbModelSerialize(
  AppConfigDbModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.endDay);
  writer.writeLong(offsets[1], object.startDay);
}

AppConfigDbModel _appConfigDbModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppConfigDbModel(
    endDay: reader.readLong(offsets[0]),
    startDay: reader.readLong(offsets[1]),
  );
  return object;
}

P _appConfigDbModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appConfigDbModelGetId(AppConfigDbModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appConfigDbModelGetLinks(AppConfigDbModel object) {
  return [];
}

void _appConfigDbModelAttach(
    IsarCollection<dynamic> col, Id id, AppConfigDbModel object) {}

extension AppConfigDbModelQueryWhereSort
    on QueryBuilder<AppConfigDbModel, AppConfigDbModel, QWhere> {
  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppConfigDbModelQueryWhere
    on QueryBuilder<AppConfigDbModel, AppConfigDbModel, QWhereClause> {
  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppConfigDbModelQueryFilter
    on QueryBuilder<AppConfigDbModel, AppConfigDbModel, QFilterCondition> {
  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterFilterCondition>
      endDayEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDay',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterFilterCondition>
      endDayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDay',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterFilterCondition>
      endDayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDay',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterFilterCondition>
      endDayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterFilterCondition>
      startDayEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDay',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterFilterCondition>
      startDayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDay',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterFilterCondition>
      startDayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDay',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterFilterCondition>
      startDayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppConfigDbModelQueryObject
    on QueryBuilder<AppConfigDbModel, AppConfigDbModel, QFilterCondition> {}

extension AppConfigDbModelQueryLinks
    on QueryBuilder<AppConfigDbModel, AppConfigDbModel, QFilterCondition> {}

extension AppConfigDbModelQuerySortBy
    on QueryBuilder<AppConfigDbModel, AppConfigDbModel, QSortBy> {
  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterSortBy>
      sortByEndDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDay', Sort.asc);
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterSortBy>
      sortByEndDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDay', Sort.desc);
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterSortBy>
      sortByStartDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDay', Sort.asc);
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterSortBy>
      sortByStartDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDay', Sort.desc);
    });
  }
}

extension AppConfigDbModelQuerySortThenBy
    on QueryBuilder<AppConfigDbModel, AppConfigDbModel, QSortThenBy> {
  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterSortBy>
      thenByEndDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDay', Sort.asc);
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterSortBy>
      thenByEndDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDay', Sort.desc);
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterSortBy>
      thenByStartDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDay', Sort.asc);
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QAfterSortBy>
      thenByStartDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDay', Sort.desc);
    });
  }
}

extension AppConfigDbModelQueryWhereDistinct
    on QueryBuilder<AppConfigDbModel, AppConfigDbModel, QDistinct> {
  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QDistinct>
      distinctByEndDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDay');
    });
  }

  QueryBuilder<AppConfigDbModel, AppConfigDbModel, QDistinct>
      distinctByStartDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDay');
    });
  }
}

extension AppConfigDbModelQueryProperty
    on QueryBuilder<AppConfigDbModel, AppConfigDbModel, QQueryProperty> {
  QueryBuilder<AppConfigDbModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppConfigDbModel, int, QQueryOperations> endDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDay');
    });
  }

  QueryBuilder<AppConfigDbModel, int, QQueryOperations> startDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDay');
    });
  }
}
