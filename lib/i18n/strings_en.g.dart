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
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
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

	// Translations
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
	String get loading => 'Chargement...';
	late final TranslationsGlobalFormsEn forms = TranslationsGlobalFormsEn._(_root);
	late final TranslationsGlobalDateEn date = TranslationsGlobalDateEn._(_root);
	String get confirm => 'Confirmer';
	String get delete => 'Supprimer';
	String get deleteAll => 'Tout supprimer';
	String get yes => 'Oui';
	String get no => 'Non';
	String get exportToCSV => 'Exporter en CSV';
	String get importFromCSV => 'Importer depuis CSV';
}

// Path: unit
class TranslationsUnitEn {
	TranslationsUnitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get distance => 'km';
	String get volume => 'L';
	String get price => '€';
	String get pricePerLiter => '€/L';
	String get litersPer100km => 'L/100km';
}

// Path: consumption
class TranslationsConsumptionEn {
	TranslationsConsumptionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get warningDeleteAll => 'Êtes-vous sûr de vouloir supprimer toutes les consommations ?';
	String get noData => 'Aucune consommation trouvée';
	String get totalPrice => 'Prix total';
	String get volume => 'Volume';
	String get liters => 'Litres';
	String get distance => 'Distance';
	String get mileage => 'Kilométrage';
	String get pricePerLiter => 'Prix/Litre';
	String get modify => 'Modifier';
	String get place => 'Lieu';
	String get date => 'Date';
	String get newConsumption => 'Nouvelle consommation';
}

// Path: global.forms
class TranslationsGlobalFormsEn {
	TranslationsGlobalFormsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get required => 'Ce champ est obligatoire';
	String get invalid => 'Ce champ est invalide';
	String get save => 'Sauvegarder';
	String get cancel => 'Annuler';
	String get success => 'Enregistrement réussi';
	String get error => 'Une erreur est survenue';
	String get notSpecified => 'Non spécifié';
}

// Path: global.date
class TranslationsGlobalDateEn {
	TranslationsGlobalDateEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get noDate => 'Date inconnue';
	String get format => 'dd/MM/yyyy';
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
			case 'consumption.place': return 'Lieu';
			case 'consumption.date': return 'Date';
			case 'consumption.newConsumption': return 'Nouvelle consommation';
			default: return null;
		}
	}
}

