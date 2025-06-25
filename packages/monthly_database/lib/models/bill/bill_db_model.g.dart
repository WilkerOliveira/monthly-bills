// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_db_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBillDbModelCollection on Isar {
  IsarCollection<BillDbModel> get billDbModels => this.collection();
}

const BillDbModelSchema = CollectionSchema(
  name: r'BillDbModel',
  id: -8376999482463709633,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.string,
    ),
    r'dueDate': PropertySchema(
      id: 2,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'extraInfo': PropertySchema(
      id: 3,
      name: r'extraInfo',
      type: IsarType.string,
    ),
    r'monthYear': PropertySchema(
      id: 4,
      name: r'monthYear',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'paid': PropertySchema(
      id: 6,
      name: r'paid',
      type: IsarType.bool,
    ),
    r'paymentDate': PropertySchema(
      id: 7,
      name: r'paymentDate',
      type: IsarType.dateTime,
    ),
    r'recurrenceId': PropertySchema(
      id: 8,
      name: r'recurrenceId',
      type: IsarType.long,
    ),
    r'recurrences': PropertySchema(
      id: 9,
      name: r'recurrences',
      type: IsarType.long,
    )
  },
  estimateSize: _billDbModelEstimateSize,
  serialize: _billDbModelSerialize,
  deserialize: _billDbModelDeserialize,
  deserializeProp: _billDbModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'dueDate': IndexSchema(
      id: -7871003637559820552,
      name: r'dueDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dueDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'monthYear_dueDate': IndexSchema(
      id: 1472720138862365877,
      name: r'monthYear_dueDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'monthYear',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'dueDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _billDbModelGetId,
  getLinks: _billDbModelGetLinks,
  attach: _billDbModelAttach,
  version: '3.1.0+1',
);

int _billDbModelEstimateSize(
  BillDbModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  {
    final value = object.extraInfo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _billDbModelSerialize(
  BillDbModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.category);
  writer.writeDateTime(offsets[2], object.dueDate);
  writer.writeString(offsets[3], object.extraInfo);
  writer.writeLong(offsets[4], object.monthYear);
  writer.writeString(offsets[5], object.name);
  writer.writeBool(offsets[6], object.paid);
  writer.writeDateTime(offsets[7], object.paymentDate);
  writer.writeLong(offsets[8], object.recurrenceId);
  writer.writeLong(offsets[9], object.recurrences);
}

BillDbModel _billDbModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BillDbModel(
    amount: reader.readDouble(offsets[0]),
    category: reader.readString(offsets[1]),
    dueDate: reader.readDateTime(offsets[2]),
    extraInfo: reader.readStringOrNull(offsets[3]),
    id: id,
    name: reader.readString(offsets[5]),
    paid: reader.readBool(offsets[6]),
    paymentDate: reader.readDateTimeOrNull(offsets[7]),
    recurrenceId: reader.readLongOrNull(offsets[8]),
    recurrences: reader.readLongOrNull(offsets[9]),
  );
  return object;
}

P _billDbModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _billDbModelGetId(BillDbModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _billDbModelGetLinks(BillDbModel object) {
  return [];
}

void _billDbModelAttach(
    IsarCollection<dynamic> col, Id id, BillDbModel object) {}

extension BillDbModelQueryWhereSort
    on QueryBuilder<BillDbModel, BillDbModel, QWhere> {
  QueryBuilder<BillDbModel, BillDbModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhere> anyDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dueDate'),
      );
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhere> anyMonthYearDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'monthYear_dueDate'),
      );
    });
  }
}

extension BillDbModelQueryWhere
    on QueryBuilder<BillDbModel, BillDbModel, QWhereClause> {
  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause> dueDateEqualTo(
      DateTime dueDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dueDate',
        value: [dueDate],
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause> dueDateNotEqualTo(
      DateTime dueDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dueDate',
              lower: [],
              upper: [dueDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dueDate',
              lower: [dueDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dueDate',
              lower: [dueDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dueDate',
              lower: [],
              upper: [dueDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause> dueDateGreaterThan(
    DateTime dueDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dueDate',
        lower: [dueDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause> dueDateLessThan(
    DateTime dueDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dueDate',
        lower: [],
        upper: [dueDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause> dueDateBetween(
    DateTime lowerDueDate,
    DateTime upperDueDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dueDate',
        lower: [lowerDueDate],
        includeLower: includeLower,
        upper: [upperDueDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause>
      monthYearEqualToAnyDueDate(int monthYear) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'monthYear_dueDate',
        value: [monthYear],
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause>
      monthYearNotEqualToAnyDueDate(int monthYear) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'monthYear_dueDate',
              lower: [],
              upper: [monthYear],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'monthYear_dueDate',
              lower: [monthYear],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'monthYear_dueDate',
              lower: [monthYear],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'monthYear_dueDate',
              lower: [],
              upper: [monthYear],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause>
      monthYearGreaterThanAnyDueDate(
    int monthYear, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'monthYear_dueDate',
        lower: [monthYear],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause>
      monthYearLessThanAnyDueDate(
    int monthYear, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'monthYear_dueDate',
        lower: [],
        upper: [monthYear],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause>
      monthYearBetweenAnyDueDate(
    int lowerMonthYear,
    int upperMonthYear, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'monthYear_dueDate',
        lower: [lowerMonthYear],
        includeLower: includeLower,
        upper: [upperMonthYear],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause>
      monthYearDueDateEqualTo(int monthYear, DateTime dueDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'monthYear_dueDate',
        value: [monthYear, dueDate],
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause>
      monthYearEqualToDueDateNotEqualTo(int monthYear, DateTime dueDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'monthYear_dueDate',
              lower: [monthYear],
              upper: [monthYear, dueDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'monthYear_dueDate',
              lower: [monthYear, dueDate],
              includeLower: false,
              upper: [monthYear],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'monthYear_dueDate',
              lower: [monthYear, dueDate],
              includeLower: false,
              upper: [monthYear],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'monthYear_dueDate',
              lower: [monthYear],
              upper: [monthYear, dueDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause>
      monthYearEqualToDueDateGreaterThan(
    int monthYear,
    DateTime dueDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'monthYear_dueDate',
        lower: [monthYear, dueDate],
        includeLower: include,
        upper: [monthYear],
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause>
      monthYearEqualToDueDateLessThan(
    int monthYear,
    DateTime dueDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'monthYear_dueDate',
        lower: [monthYear],
        upper: [monthYear, dueDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterWhereClause>
      monthYearEqualToDueDateBetween(
    int monthYear,
    DateTime lowerDueDate,
    DateTime upperDueDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'monthYear_dueDate',
        lower: [monthYear, lowerDueDate],
        includeLower: includeLower,
        upper: [monthYear, upperDueDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BillDbModelQueryFilter
    on QueryBuilder<BillDbModel, BillDbModel, QFilterCondition> {
  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> dueDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      dueDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> dueDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> dueDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      extraInfoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'extraInfo',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      extraInfoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'extraInfo',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      extraInfoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extraInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      extraInfoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extraInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      extraInfoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extraInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      extraInfoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extraInfo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      extraInfoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'extraInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      extraInfoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'extraInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      extraInfoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'extraInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      extraInfoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'extraInfo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      extraInfoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extraInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      extraInfoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'extraInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      monthYearEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthYear',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      monthYearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthYear',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      monthYearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthYear',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      monthYearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition> paidEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paid',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      paymentDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paymentDate',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      paymentDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paymentDate',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      paymentDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      paymentDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      paymentDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      paymentDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      recurrenceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recurrenceId',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      recurrenceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recurrenceId',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      recurrenceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrenceId',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      recurrenceIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrenceId',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      recurrenceIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrenceId',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      recurrenceIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrenceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      recurrencesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recurrences',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      recurrencesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recurrences',
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      recurrencesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrences',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      recurrencesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrences',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      recurrencesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrences',
        value: value,
      ));
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterFilterCondition>
      recurrencesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrences',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BillDbModelQueryObject
    on QueryBuilder<BillDbModel, BillDbModel, QFilterCondition> {}

extension BillDbModelQueryLinks
    on QueryBuilder<BillDbModel, BillDbModel, QFilterCondition> {}

extension BillDbModelQuerySortBy
    on QueryBuilder<BillDbModel, BillDbModel, QSortBy> {
  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByExtraInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extraInfo', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByExtraInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extraInfo', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByMonthYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthYear', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByMonthYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthYear', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paid', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paid', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByPaymentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentDate', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByPaymentDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentDate', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByRecurrenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceId', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy>
      sortByRecurrenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceId', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByRecurrences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrences', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> sortByRecurrencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrences', Sort.desc);
    });
  }
}

extension BillDbModelQuerySortThenBy
    on QueryBuilder<BillDbModel, BillDbModel, QSortThenBy> {
  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByExtraInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extraInfo', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByExtraInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extraInfo', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByMonthYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthYear', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByMonthYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthYear', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paid', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paid', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByPaymentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentDate', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByPaymentDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentDate', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByRecurrenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceId', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy>
      thenByRecurrenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceId', Sort.desc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByRecurrences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrences', Sort.asc);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QAfterSortBy> thenByRecurrencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrences', Sort.desc);
    });
  }
}

extension BillDbModelQueryWhereDistinct
    on QueryBuilder<BillDbModel, BillDbModel, QDistinct> {
  QueryBuilder<BillDbModel, BillDbModel, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QDistinct> distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QDistinct> distinctByExtraInfo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'extraInfo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QDistinct> distinctByMonthYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthYear');
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QDistinct> distinctByPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paid');
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QDistinct> distinctByPaymentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentDate');
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QDistinct> distinctByRecurrenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrenceId');
    });
  }

  QueryBuilder<BillDbModel, BillDbModel, QDistinct> distinctByRecurrences() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrences');
    });
  }
}

extension BillDbModelQueryProperty
    on QueryBuilder<BillDbModel, BillDbModel, QQueryProperty> {
  QueryBuilder<BillDbModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BillDbModel, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<BillDbModel, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<BillDbModel, DateTime, QQueryOperations> dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<BillDbModel, String?, QQueryOperations> extraInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'extraInfo');
    });
  }

  QueryBuilder<BillDbModel, int, QQueryOperations> monthYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthYear');
    });
  }

  QueryBuilder<BillDbModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<BillDbModel, bool, QQueryOperations> paidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paid');
    });
  }

  QueryBuilder<BillDbModel, DateTime?, QQueryOperations> paymentDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentDate');
    });
  }

  QueryBuilder<BillDbModel, int?, QQueryOperations> recurrenceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrenceId');
    });
  }

  QueryBuilder<BillDbModel, int?, QQueryOperations> recurrencesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrences');
    });
  }
}
