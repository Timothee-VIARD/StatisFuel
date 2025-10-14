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
  indexes: {},
  links: {},
  embeddedSchemas: {r'Location': LocationSchema},
  getId: _consumptionGetId,
  getLinks: _consumptionGetLinks,
  attach: _consumptionAttach,
  version: '3.1.8',
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
