// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetConsumptionCollection on Isar {
  IsarCollection<Consumption> get consumptions => this.collection();
}

const ConsumptionSchema = CollectionSchema(
  name: r'Consumption',
  id: -1960512473907227800,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'distance': PropertySchema(
      id: 1,
      name: r'distance',
      type: IsarType.double,
    ),
    r'liters': PropertySchema(
      id: 2,
      name: r'liters',
      type: IsarType.double,
    ),
    r'litersPer100km': PropertySchema(
      id: 3,
      name: r'litersPer100km',
      type: IsarType.double,
    ),
    r'location': PropertySchema(
      id: 4,
      name: r'location',
      type: IsarType.object,
      target: r'Location',
    ),
    r'mileage': PropertySchema(
      id: 5,
      name: r'mileage',
      type: IsarType.double,
    ),
    r'pricePerLiter': PropertySchema(
      id: 6,
      name: r'pricePerLiter',
      type: IsarType.double,
    ),
    r'totalPrice': PropertySchema(
      id: 7,
      name: r'totalPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _consumptionEstimateSize,
  serialize: _consumptionSerialize,
  deserialize: _consumptionDeserialize,
  deserializeProp: _consumptionDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'totalPrice': IndexSchema(
      id: 889174485785105731,
      name: r'totalPrice',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'totalPrice',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'pricePerLiter': IndexSchema(
      id: 8937923363033208399,
      name: r'pricePerLiter',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'pricePerLiter',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'liters': IndexSchema(
      id: -4826211576000169681,
      name: r'liters',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'liters',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'distance': IndexSchema(
      id: -830811181569289072,
      name: r'distance',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'distance',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'mileage': IndexSchema(
      id: 6196993076918590094,
      name: r'mileage',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'mileage',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'litersPer100km': IndexSchema(
      id: -4360252151548193466,
      name: r'litersPer100km',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'litersPer100km',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'Location': LocationSchema},
  getId: _consumptionGetId,
  getLinks: _consumptionGetLinks,
  attach: _consumptionAttach,
  version: '3.3.0',
);

int _consumptionEstimateSize(
  Consumption object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 +
          LocationSchema.estimateSize(value, allOffsets[Location]!, allOffsets);
    }
  }
  return bytesCount;
}

void _consumptionSerialize(
  Consumption object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeDouble(offsets[1], object.distance);
  writer.writeDouble(offsets[2], object.liters);
  writer.writeDouble(offsets[3], object.litersPer100km);
  writer.writeObject<Location>(
    offsets[4],
    allOffsets,
    LocationSchema.serialize,
    object.location,
  );
  writer.writeDouble(offsets[5], object.mileage);
  writer.writeDouble(offsets[6], object.pricePerLiter);
  writer.writeDouble(offsets[7], object.totalPrice);
}

Consumption _consumptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Consumption(
    date: reader.readDateTime(offsets[0]),
    distance: reader.readDoubleOrNull(offsets[1]),
    id: id,
    liters: reader.readDoubleOrNull(offsets[2]),
    location: reader.readObjectOrNull<Location>(
      offsets[4],
      LocationSchema.deserialize,
      allOffsets,
    ),
    mileage: reader.readDoubleOrNull(offsets[5]),
    pricePerLiter: reader.readDoubleOrNull(offsets[6]),
    totalPrice: reader.readDoubleOrNull(offsets[7]),
  );
  object.litersPer100km = reader.readDoubleOrNull(offsets[3]);
  return object;
}

P _consumptionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<Location>(
        offset,
        LocationSchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _consumptionGetId(Consumption object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _consumptionGetLinks(Consumption object) {
  return [];
}

void _consumptionAttach(
    IsarCollection<dynamic> col, Id id, Consumption object) {
  object.id = id;
}

extension ConsumptionQueryWhereSort
    on QueryBuilder<Consumption, Consumption, QWhere> {
  QueryBuilder<Consumption, Consumption, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhere> anyTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'totalPrice'),
      );
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhere> anyPricePerLiter() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pricePerLiter'),
      );
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhere> anyLiters() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'liters'),
      );
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhere> anyDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'distance'),
      );
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhere> anyMileage() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'mileage'),
      );
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhere> anyLitersPer100km() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'litersPer100km'),
      );
    });
  }
}

extension ConsumptionQueryWhere
    on QueryBuilder<Consumption, Consumption, QWhereClause> {
  QueryBuilder<Consumption, Consumption, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> idBetween(
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

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> dateNotEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> totalPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'totalPrice',
        value: [null],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      totalPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalPrice',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> totalPriceEqualTo(
      double? totalPrice) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'totalPrice',
        value: [totalPrice],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      totalPriceNotEqualTo(double? totalPrice) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalPrice',
              lower: [],
              upper: [totalPrice],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalPrice',
              lower: [totalPrice],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalPrice',
              lower: [totalPrice],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalPrice',
              lower: [],
              upper: [totalPrice],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      totalPriceGreaterThan(
    double? totalPrice, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalPrice',
        lower: [totalPrice],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> totalPriceLessThan(
    double? totalPrice, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalPrice',
        lower: [],
        upper: [totalPrice],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> totalPriceBetween(
    double? lowerTotalPrice,
    double? upperTotalPrice, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalPrice',
        lower: [lowerTotalPrice],
        includeLower: includeLower,
        upper: [upperTotalPrice],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      pricePerLiterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pricePerLiter',
        value: [null],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      pricePerLiterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pricePerLiter',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      pricePerLiterEqualTo(double? pricePerLiter) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pricePerLiter',
        value: [pricePerLiter],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      pricePerLiterNotEqualTo(double? pricePerLiter) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pricePerLiter',
              lower: [],
              upper: [pricePerLiter],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pricePerLiter',
              lower: [pricePerLiter],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pricePerLiter',
              lower: [pricePerLiter],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pricePerLiter',
              lower: [],
              upper: [pricePerLiter],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      pricePerLiterGreaterThan(
    double? pricePerLiter, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pricePerLiter',
        lower: [pricePerLiter],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      pricePerLiterLessThan(
    double? pricePerLiter, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pricePerLiter',
        lower: [],
        upper: [pricePerLiter],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      pricePerLiterBetween(
    double? lowerPricePerLiter,
    double? upperPricePerLiter, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pricePerLiter',
        lower: [lowerPricePerLiter],
        includeLower: includeLower,
        upper: [upperPricePerLiter],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> litersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'liters',
        value: [null],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> litersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'liters',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> litersEqualTo(
      double? liters) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'liters',
        value: [liters],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> litersNotEqualTo(
      double? liters) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'liters',
              lower: [],
              upper: [liters],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'liters',
              lower: [liters],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'liters',
              lower: [liters],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'liters',
              lower: [],
              upper: [liters],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> litersGreaterThan(
    double? liters, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'liters',
        lower: [liters],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> litersLessThan(
    double? liters, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'liters',
        lower: [],
        upper: [liters],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> litersBetween(
    double? lowerLiters,
    double? upperLiters, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'liters',
        lower: [lowerLiters],
        includeLower: includeLower,
        upper: [upperLiters],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> distanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'distance',
        value: [null],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      distanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'distance',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> distanceEqualTo(
      double? distance) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'distance',
        value: [distance],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> distanceNotEqualTo(
      double? distance) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'distance',
              lower: [],
              upper: [distance],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'distance',
              lower: [distance],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'distance',
              lower: [distance],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'distance',
              lower: [],
              upper: [distance],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> distanceGreaterThan(
    double? distance, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'distance',
        lower: [distance],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> distanceLessThan(
    double? distance, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'distance',
        lower: [],
        upper: [distance],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> distanceBetween(
    double? lowerDistance,
    double? upperDistance, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'distance',
        lower: [lowerDistance],
        includeLower: includeLower,
        upper: [upperDistance],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> mileageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'mileage',
        value: [null],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> mileageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'mileage',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> mileageEqualTo(
      double? mileage) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'mileage',
        value: [mileage],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> mileageNotEqualTo(
      double? mileage) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mileage',
              lower: [],
              upper: [mileage],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mileage',
              lower: [mileage],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mileage',
              lower: [mileage],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mileage',
              lower: [],
              upper: [mileage],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> mileageGreaterThan(
    double? mileage, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'mileage',
        lower: [mileage],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> mileageLessThan(
    double? mileage, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'mileage',
        lower: [],
        upper: [mileage],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause> mileageBetween(
    double? lowerMileage,
    double? upperMileage, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'mileage',
        lower: [lowerMileage],
        includeLower: includeLower,
        upper: [upperMileage],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      litersPer100kmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'litersPer100km',
        value: [null],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      litersPer100kmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'litersPer100km',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      litersPer100kmEqualTo(double? litersPer100km) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'litersPer100km',
        value: [litersPer100km],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      litersPer100kmNotEqualTo(double? litersPer100km) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'litersPer100km',
              lower: [],
              upper: [litersPer100km],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'litersPer100km',
              lower: [litersPer100km],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'litersPer100km',
              lower: [litersPer100km],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'litersPer100km',
              lower: [],
              upper: [litersPer100km],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      litersPer100kmGreaterThan(
    double? litersPer100km, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'litersPer100km',
        lower: [litersPer100km],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      litersPer100kmLessThan(
    double? litersPer100km, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'litersPer100km',
        lower: [],
        upper: [litersPer100km],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterWhereClause>
      litersPer100kmBetween(
    double? lowerLitersPer100km,
    double? upperLitersPer100km, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'litersPer100km',
        lower: [lowerLitersPer100km],
        includeLower: includeLower,
        upper: [upperLitersPer100km],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ConsumptionQueryFilter
    on QueryBuilder<Consumption, Consumption, QFilterCondition> {
  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      distanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'distance',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      distanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'distance',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> distanceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      distanceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'distance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      distanceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'distance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> distanceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'distance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> litersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'liters',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      litersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'liters',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> litersEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'liters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      litersGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'liters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> litersLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'liters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> litersBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'liters',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      litersPer100kmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'litersPer100km',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      litersPer100kmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'litersPer100km',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      litersPer100kmEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'litersPer100km',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      litersPer100kmGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'litersPer100km',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      litersPer100kmLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'litersPer100km',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      litersPer100kmBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'litersPer100km',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      mileageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mileage',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      mileageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mileage',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> mileageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mileage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      mileageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mileage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> mileageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mileage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> mileageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mileage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      pricePerLiterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pricePerLiter',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      pricePerLiterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pricePerLiter',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      pricePerLiterEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pricePerLiter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      pricePerLiterGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pricePerLiter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      pricePerLiterLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pricePerLiter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      pricePerLiterBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pricePerLiter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      totalPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPrice',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      totalPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPrice',
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      totalPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      totalPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      totalPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterFilterCondition>
      totalPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ConsumptionQueryObject
    on QueryBuilder<Consumption, Consumption, QFilterCondition> {
  QueryBuilder<Consumption, Consumption, QAfterFilterCondition> location(
      FilterQuery<Location> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'location');
    });
  }
}

extension ConsumptionQueryLinks
    on QueryBuilder<Consumption, Consumption, QFilterCondition> {}

extension ConsumptionQuerySortBy
    on QueryBuilder<Consumption, Consumption, QSortBy> {
  QueryBuilder<Consumption, Consumption, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> sortByDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distance', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> sortByDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distance', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> sortByLiters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liters', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> sortByLitersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liters', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> sortByLitersPer100km() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litersPer100km', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy>
      sortByLitersPer100kmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litersPer100km', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> sortByMileage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mileage', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> sortByMileageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mileage', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> sortByPricePerLiter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerLiter', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy>
      sortByPricePerLiterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerLiter', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> sortByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> sortByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }
}

extension ConsumptionQuerySortThenBy
    on QueryBuilder<Consumption, Consumption, QSortThenBy> {
  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distance', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distance', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByLiters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liters', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByLitersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liters', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByLitersPer100km() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litersPer100km', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy>
      thenByLitersPer100kmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litersPer100km', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByMileage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mileage', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByMileageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mileage', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByPricePerLiter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerLiter', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy>
      thenByPricePerLiterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerLiter', Sort.desc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<Consumption, Consumption, QAfterSortBy> thenByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }
}

extension ConsumptionQueryWhereDistinct
    on QueryBuilder<Consumption, Consumption, QDistinct> {
  QueryBuilder<Consumption, Consumption, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Consumption, Consumption, QDistinct> distinctByDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distance');
    });
  }

  QueryBuilder<Consumption, Consumption, QDistinct> distinctByLiters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'liters');
    });
  }

  QueryBuilder<Consumption, Consumption, QDistinct> distinctByLitersPer100km() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'litersPer100km');
    });
  }

  QueryBuilder<Consumption, Consumption, QDistinct> distinctByMileage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mileage');
    });
  }

  QueryBuilder<Consumption, Consumption, QDistinct> distinctByPricePerLiter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pricePerLiter');
    });
  }

  QueryBuilder<Consumption, Consumption, QDistinct> distinctByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPrice');
    });
  }
}

extension ConsumptionQueryProperty
    on QueryBuilder<Consumption, Consumption, QQueryProperty> {
  QueryBuilder<Consumption, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Consumption, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Consumption, double?, QQueryOperations> distanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distance');
    });
  }

  QueryBuilder<Consumption, double?, QQueryOperations> litersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'liters');
    });
  }

  QueryBuilder<Consumption, double?, QQueryOperations>
      litersPer100kmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'litersPer100km');
    });
  }

  QueryBuilder<Consumption, Location?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<Consumption, double?, QQueryOperations> mileageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mileage');
    });
  }

  QueryBuilder<Consumption, double?, QQueryOperations> pricePerLiterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pricePerLiter');
    });
  }

  QueryBuilder<Consumption, double?, QQueryOperations> totalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPrice');
    });
  }
}
