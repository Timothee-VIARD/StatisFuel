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
	late final TranslationsNewEntryPageEn newEntryPage = TranslationsNewEntryPageEn._(_root);
}

// Path: global
class TranslationsGlobalEn {
	TranslationsGlobalEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get loading => 'Chargement...';
	late final TranslationsGlobalFormsEn forms = TranslationsGlobalFormsEn._(_root);
}

// Path: newEntryPage
class TranslationsNewEntryPageEn {
	TranslationsNewEntryPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Nouvelle consommation';
	String get date => 'Date';
	String get totalPrice => 'Prix total';
	String get pricePerLiter => 'Prix par litre';
	String get liters => 'Litres';
	String get distance => 'Distance';
	String get mileage => 'Kilométrage';
	String get place => 'Lieu';
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
			case 'newEntryPage.title': return 'Nouvelle consommation';
			case 'newEntryPage.date': return 'Date';
			case 'newEntryPage.totalPrice': return 'Prix total';
			case 'newEntryPage.pricePerLiter': return 'Prix par litre';
			case 'newEntryPage.liters': return 'Litres';
			case 'newEntryPage.distance': return 'Distance';
			case 'newEntryPage.mileage': return 'Kilométrage';
			case 'newEntryPage.place': return 'Lieu';
			default: return null;
		}
	}
}

