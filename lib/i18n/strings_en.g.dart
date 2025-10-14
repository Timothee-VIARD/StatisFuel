///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'StatisFuel'
	String get app_title => 'StatisFuel';

	late final TranslationsGlobalEn global = TranslationsGlobalEn._(_root);
	late final TranslationsUnitEn unit = TranslationsUnitEn._(_root);
	late final TranslationsConsumptionEn consumption = TranslationsConsumptionEn._(_root);
}

// Path: global
class TranslationsGlobalEn {
	TranslationsGlobalEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Chargement...'
	String get loading => 'Chargement...';

	late final TranslationsGlobalFormsEn forms = TranslationsGlobalFormsEn._(_root);
	late final TranslationsGlobalDateEn date = TranslationsGlobalDateEn._(_root);

	/// en: 'Confirmer'
	String get confirm => 'Confirmer';

	/// en: 'Supprimer'
	String get delete => 'Supprimer';

	/// en: 'Tout supprimer'
	String get deleteAll => 'Tout supprimer';

	/// en: 'Oui'
	String get yes => 'Oui';

	/// en: 'Non'
	String get no => 'Non';

	/// en: 'Exporter en CSV'
	String get exportToCSV => 'Exporter en CSV';

	/// en: 'Importer depuis CSV'
	String get importFromCSV => 'Importer depuis CSV';
}

// Path: unit
class TranslationsUnitEn {
	TranslationsUnitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'km'
	String get distance => 'km';

	/// en: 'L'
	String get volume => 'L';

	/// en: '€'
	String get price => '€';

	/// en: '€/L'
	String get pricePerLiter => '€/L';

	/// en: 'L/100km'
	String get litersPer100km => 'L/100km';
}

// Path: consumption
class TranslationsConsumptionEn {
	TranslationsConsumptionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Êtes-vous sûr de vouloir supprimer toutes les consommations ?'
	String get warningDeleteAll => 'Êtes-vous sûr de vouloir supprimer toutes les consommations ?';

	/// en: 'Aucune consommation trouvée'
	String get noData => 'Aucune consommation trouvée';

	/// en: 'Prix total'
	String get totalPrice => 'Prix total';

	/// en: 'Volume'
	String get volume => 'Volume';

	/// en: 'Litres'
	String get liters => 'Litres';

	/// en: 'Distance'
	String get distance => 'Distance';

	/// en: 'Kilométrage'
	String get mileage => 'Kilométrage';

	/// en: 'Prix/Litre'
	String get pricePerLiter => 'Prix/Litre';

	/// en: 'Modifier'
	String get modify => 'Modifier';

	late final TranslationsConsumptionPlaceEn place = TranslationsConsumptionPlaceEn._(_root);

	/// en: 'Date'
	String get date => 'Date';

	/// en: 'Nouvelle consommation'
	String get newConsumption => 'Nouvelle consommation';

	/// en: 'Consommation incomplète'
	String get incomplete => 'Consommation incomplète';
}

// Path: global.forms
class TranslationsGlobalFormsEn {
	TranslationsGlobalFormsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Ce champ est obligatoire'
	String get required => 'Ce champ est obligatoire';

	/// en: 'Ce champ est invalide'
	String get invalid => 'Ce champ est invalide';

	/// en: 'Sauvegarder'
	String get save => 'Sauvegarder';

	/// en: 'Annuler'
	String get cancel => 'Annuler';

	/// en: 'Enregistrement réussi'
	String get success => 'Enregistrement réussi';

	/// en: 'Une erreur est survenue'
	String get error => 'Une erreur est survenue';

	/// en: 'Non spécifié'
	String get notSpecified => 'Non spécifié';
}

// Path: global.date
class TranslationsGlobalDateEn {
	TranslationsGlobalDateEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Date inconnue'
	String get noDate => 'Date inconnue';

	/// en: 'dd/MM/yyyy'
	String get format => 'dd/MM/yyyy';
}

// Path: consumption.place
class TranslationsConsumptionPlaceEn {
	TranslationsConsumptionPlaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Lieu'
	String get label => 'Lieu';

	/// en: 'Utiliser ma position actuelle'
	String get utiliserMaPositionActuelle => 'Utiliser ma position actuelle';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_title': return 'StatisFuel';
			case 'global.loading': return 'Chargement...';
			case 'global.forms.required': return 'Ce champ est obligatoire';
			case 'global.forms.invalid': return 'Ce champ est invalide';
			case 'global.forms.save': return 'Sauvegarder';
			case 'global.forms.cancel': return 'Annuler';
			case 'global.forms.success': return 'Enregistrement réussi';
			case 'global.forms.error': return 'Une erreur est survenue';
			case 'global.forms.notSpecified': return 'Non spécifié';
			case 'global.date.noDate': return 'Date inconnue';
			case 'global.date.format': return 'dd/MM/yyyy';
			case 'global.confirm': return 'Confirmer';
			case 'global.delete': return 'Supprimer';
			case 'global.deleteAll': return 'Tout supprimer';
			case 'global.yes': return 'Oui';
			case 'global.no': return 'Non';
			case 'global.exportToCSV': return 'Exporter en CSV';
			case 'global.importFromCSV': return 'Importer depuis CSV';
			case 'unit.distance': return 'km';
			case 'unit.volume': return 'L';
			case 'unit.price': return '€';
			case 'unit.pricePerLiter': return '€/L';
			case 'unit.litersPer100km': return 'L/100km';
			case 'consumption.warningDeleteAll': return 'Êtes-vous sûr de vouloir supprimer toutes les consommations ?';
			case 'consumption.noData': return 'Aucune consommation trouvée';
			case 'consumption.totalPrice': return 'Prix total';
			case 'consumption.volume': return 'Volume';
			case 'consumption.liters': return 'Litres';
			case 'consumption.distance': return 'Distance';
			case 'consumption.mileage': return 'Kilométrage';
			case 'consumption.pricePerLiter': return 'Prix/Litre';
			case 'consumption.modify': return 'Modifier';
			case 'consumption.place.label': return 'Lieu';
			case 'consumption.place.utiliserMaPositionActuelle': return 'Utiliser ma position actuelle';
			case 'consumption.date': return 'Date';
			case 'consumption.newConsumption': return 'Nouvelle consommation';
			case 'consumption.incomplete': return 'Consommation incomplète';
			default: return null;
		}
	}
}

