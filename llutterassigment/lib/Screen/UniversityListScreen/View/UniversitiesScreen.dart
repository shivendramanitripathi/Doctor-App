import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Utils/app_colors.dart';
import '../Controller/CountryItemController.dart';

class UniversitiesListScreen extends StatefulWidget {
  const UniversitiesListScreen({super.key});

  @override
  State<UniversitiesListScreen> createState() => _UniversitiesListScreenState();
}

class _UniversitiesListScreenState extends State<UniversitiesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Universities',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<UniversityScreenController>(
        builder: (context, model, child) {
          if (model.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: model.countryStatusList.length,
            itemBuilder: (context, index) {
              final countryStatus = model.countryStatusList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.whiteColor,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0.7,
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        _buildRow("Domain", countryStatus.domains.join(', ')),
                        _buildRow("Alpha code",
                            countryStatus.alphaTwoCode.toString()),
                        _buildRow("State Province",
                            countryStatus.stateProvince ?? "Texas"),
                        _buildRow("Name", countryStatus.name, fontSize: 13),
                        _buildRow("Web", countryStatus.country.toString(),
                            fontSize: 13),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildRow(String label, String value, {double fontSize = 13}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colors.blackTextColor,
                  fontSize: fontSize),
            ),
          ),
          const Text(
            ':',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colors.blackTextColor,
                  fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
