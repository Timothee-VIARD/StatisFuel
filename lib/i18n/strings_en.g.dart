///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
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
	late final TranslationsDashboardEn dashboard = TranslationsDashboardEn._(_root);
	late final TranslationsHistoryEn history = TranslationsHistoryEn._(_root);
	late final TranslationsStatisticsEn statistics = TranslationsStatisticsEn._(_root);
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

// Path: dashboard
class TranslationsDashboardEn {
	TranslationsDashboardEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dashboard'
	String get title => 'Dashboard';
}

// Path: history
class TranslationsHistoryEn {
	TranslationsHistoryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Historique'
	String get title => 'Historique';
}

// Path: statistics
class TranslationsStatisticsEn {
	TranslationsStatisticsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Statistiques'
	String get title => 'Statistiques';
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

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app_title' => 'StatisFuel',
			'global.loading' => 'Chargement...',
			'global.forms.required' => 'Ce champ est obligatoire',
			'global.forms.invalid' => 'Ce champ est invalide',
			'global.forms.save' => 'Sauvegarder',
			'global.forms.cancel' => 'Annuler',
			'global.forms.success' => 'Enregistrement réussi',
			'global.forms.error' => 'Une erreur est survenue',
			'global.forms.notSpecified' => 'Non spécifié',
			'global.date.noDate' => 'Date inconnue',
			'global.date.format' => 'dd/MM/yyyy',
			'global.confirm' => 'Confirmer',
			'global.delete' => 'Supprimer',
			'global.deleteAll' => 'Tout supprimer',
			'global.yes' => 'Oui',
			'global.no' => 'Non',
			'global.exportToCSV' => 'Exporter en CSV',
			'global.importFromCSV' => 'Importer depuis CSV',
			'unit.distance' => 'km',
			'unit.volume' => 'L',
			'unit.price' => '€',
			'unit.pricePerLiter' => '€/L',
			'unit.litersPer100km' => 'L/100km',
			'consumption.warningDeleteAll' => 'Êtes-vous sûr de vouloir supprimer toutes les consommations ?',
			'consumption.noData' => 'Aucune consommation trouvée',
			'consumption.totalPrice' => 'Prix total',
			'consumption.volume' => 'Volume',
			'consumption.liters' => 'Litres',
			'consumption.distance' => 'Distance',
			'consumption.mileage' => 'Kilométrage',
			'consumption.pricePerLiter' => 'Prix/Litre',
			'consumption.modify' => 'Modifier',
			'consumption.place.label' => 'Lieu',
			'consumption.place.utiliserMaPositionActuelle' => 'Utiliser ma position actuelle',
			'consumption.date' => 'Date',
			'consumption.newConsumption' => 'Nouvelle consommation',
			'consumption.incomplete' => 'Consommation incomplète',
			'dashboard.title' => 'Dashboard',
			'history.title' => 'Historique',
			'statistics.title' => 'Statistiques',
			_ => null,
		};
	}
}
