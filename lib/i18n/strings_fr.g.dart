///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsFr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	// Translations
	@override String get app_title => 'StatisFuel';
	@override late final _TranslationsGlobalFr global = _TranslationsGlobalFr._(_root);
	@override late final _TranslationsNewEntryPageFr newEntryPage = _TranslationsNewEntryPageFr._(_root);
}

// Path: global
class _TranslationsGlobalFr implements TranslationsGlobalEn {
	_TranslationsGlobalFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get loading => 'Chargement...';
	@override late final _TranslationsGlobalFormsFr forms = _TranslationsGlobalFormsFr._(_root);
}

// Path: newEntryPage
class _TranslationsNewEntryPageFr implements TranslationsNewEntryPageEn {
	_TranslationsNewEntryPageFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nouvelle consommation';
	@override String get date => 'Date';
	@override String get totalPrice => 'Prix total';
	@override String get pricePerLiter => 'Prix par litre';
	@override String get liters => 'Litres';
	@override String get distance => 'Distance';
	@override String get mileage => 'Kilométrage';
	@override String get place => 'Lieu';
}

// Path: global.forms
class _TranslationsGlobalFormsFr implements TranslationsGlobalFormsEn {
	_TranslationsGlobalFormsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get required => 'Ce champ est obligatoire';
	@override String get invalid => 'Ce champ est invalide';
	@override String get save => 'Sauvegarder';
	@override String get cancel => 'Annuler';
	@override String get success => 'Enregistrement réussi';
	@override String get error => 'Une erreur est survenue';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
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

