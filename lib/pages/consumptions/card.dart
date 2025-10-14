import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:statisfuel/collections/collections.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/pages/consumptions/consumption_form/consumption_form.dart';

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
    final NumberFormat decimalFormat = NumberFormat('#,##0.00', 'fr_FR');
    final NumberFormat decimal3Format = NumberFormat('#,##0.000', 'fr_FR');

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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!consumption.isComplete())
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.warning, color: Colors.orange),
                        const SizedBox(width: 8),
                        Text(
                          t.consumption.incomplete,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              // Entête avec date et lieu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 16, color: primaryColor),
                      const SizedBox(width: 8),
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
                    children: [
                      Icon(Icons.location_on, size: 16, color: primaryColor),
                      const SizedBox(width: 4),
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

              const Divider(height: 24),

              // Informations principales
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildInfoColumn(
                      context,
                      Icons.euro,
                      "${consumption.totalPrice != null ? decimalFormat.format(consumption.totalPrice) : '-'} ${t.unit.price}",
                      t.consumption.totalPrice,
                      primaryColor,
                    ),
                  ),
                  Expanded(
                    child: _buildInfoColumn(
                      context,
                      Icons.local_gas_station,
                      "${consumption.liters != null ? decimalFormat.format(consumption.liters) : '-'} ${t.unit.volume}",
                      t.consumption.volume,
                      primaryColor,
                    ),
                  ),
                  Expanded(
                    child: _buildInfoColumn(
                      context,
                      Symbols.distance_rounded,
                      "${consumption.distance != null ? decimalFormat.format(consumption.distance) : '-'} ${t.unit.distance}",
                      t.consumption.distance,
                      primaryColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Flex(
                direction: Axis.horizontal,
                children: [
                  _buildCalculatedItem(
                    Icons.speed,
                    "${consumption.litersPer100km != null ? decimalFormat.format(consumption.litersPer100km) : '-'} ${t.unit.litersPer100km}",
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Informations détaillées
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDetailItem(
                    Symbols.price_change_rounded,
                    '${t.consumption.pricePerLiter}:',
                    "${consumption.pricePerLiter != null ? decimal3Format.format(consumption.pricePerLiter!) : '-'} ${t.unit.pricePerLiter}",
                  ),
                  _buildDetailItem(
                    Icons.directions_car,
                    '${t.consumption.mileage}:',
                    '${consumption.mileage ?? "-"} ${t.unit.distance}',
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
        children: [
          Icon(icon, color: color, size: 28, weight: 700),
          const SizedBox(height: 8),
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
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 4),
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
      children: [
        Icon(icon, size: 16, color: Colors.grey[700], weight: 700),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(width: 4),
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
              padding: const EdgeInsets.all(24.0),
              child: Dialog(
                insetPadding: EdgeInsets.zero,
                surfaceTintColor: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
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
