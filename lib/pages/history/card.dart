import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:statisfuel/collections/collections.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/pages/dashboard/dialogs/consumption_form/consumption_form.dart';
import 'package:statisfuel/theme/app_config.dart';
import 'package:statisfuel/utils/num.dart';

class ConsumptionCard extends StatelessWidget {
  final Consumption consumption;
  final void Function(Consumption consumtpion, int? id) onSave;
  final void Function(int id) onDelete;

  const ConsumptionCard({
    super.key,
    required this.consumption,
    required this.onSave,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: () => _buildItemEdit(context),
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 2,
        color: consumption.isComplete() ? null : Colors.orange[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppConfig.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppConfig.spacing * 2,
            children: [
              if (!consumption.isComplete())
                Padding(
                  padding: const EdgeInsets.only(bottom: AppConfig.spacing),
                  child: Row(
                    spacing: AppConfig.spacing,
                    children: [
                      const Icon(Icons.warning, color: Colors.orange),
                      Text(
                        t.consumption.incomplete,
                        style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              // Entête avec date et lieu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: AppConfig.spacing,
                    children: [
                      Icon(Icons.calendar_today, size: 16, color: primaryColor),
                      Text(
                        DateFormat(t.global.date.format)
                            .format(consumption.date),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: AppConfig.spacing / 2,
                    children: [
                      Icon(Icons.location_on, size: 16, color: primaryColor),
                      Text(
                        consumption.location != null
                            ? consumption.location!.shortTitle
                            : t.global.forms.notSpecified,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Divider(),

              // Informations principales
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildInfoColumn(
                      context,
                      Icons.euro,
                      consumption.totalPrice.toFormattedString(unit: t.unit.price),
                      t.consumption.totalPrice,
                      primaryColor,
                    ),
                  ),
                  Expanded(
                    child: _buildInfoColumn(
                      context,
                      Icons.local_gas_station,
                      consumption.liters.toFormattedString(unit: t.unit.volume),
                      t.consumption.volume,
                      primaryColor,
                    ),
                  ),
                  Expanded(
                    child: _buildInfoColumn(
                      context,
                      Symbols.distance_rounded,
                      consumption.distance.toFormattedString(unit: t.unit.distance),
                      t.consumption.distance,
                      primaryColor,
                    ),
                  ),
                ],
              ),

              Flex(
                direction: Axis.horizontal,
                children: [
                  _buildCalculatedItem(
                    Icons.speed,
                    consumption.litersPer100km.toFormattedString(unit: t.unit.litersPer100km),
                  ),
                ],
              ),

              // Informations détaillées
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDetailItem(
                    Symbols.price_change_rounded,
                    '${t.consumption.pricePerLiter}:',
                    consumption.pricePerLiter.toFormattedString(unit: t.unit.pricePerLiter),
                  ),
                  _buildDetailItem(
                    Icons.directions_car,
                    '${t.consumption.mileage}:',
                    consumption.mileage.toFormattedString(unit: t.unit.distance),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(
    BuildContext context,
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Tooltip(
      message: label,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppConfig.spacing / 2,
        children: [
          Icon(icon, color: color, size: 28, weight: 700),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalculatedItem(IconData icon, String value) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppConfig.spacing / 2,
        children: [
          Icon(icon, size: 24),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: AppConfig.spacing / 2,
      children: [
        Icon(icon, size: 16, color: Colors.grey[700], weight: 700),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  void _buildItemEdit(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext contextDialog) {
        return Center(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(AppConfig.padding * 2),
              child: Dialog(
                insetPadding: EdgeInsets.zero,
                surfaceTintColor: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppConfig.padding * 3),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              t.consumption.modify,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => {
                                Navigator.of(contextDialog).pop(),
                              },
                            ),
                          ],
                        ),
                        ConsumptionForm(
                          consumption: consumption,
                          (consumption, id) {
                            if (id != null) {
                              consumption.id = id;
                            }
                            onSave(consumption, id);
                            Navigator.of(contextDialog).pop();
                          },
                          onDelete: () {
                            onDelete.call(consumption.id);
                            Navigator.of(contextDialog).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
