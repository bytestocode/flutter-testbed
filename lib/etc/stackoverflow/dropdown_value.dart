import 'package:flutter/material.dart';

class DropdownValue extends StatefulWidget {
  const DropdownValue({super.key});

  @override
  State<DropdownValue> createState() => _DropdownValueState();
}

class _DropdownValueState extends State<DropdownValue> {
  var selectedCity = "Kahramanmaraş";
  var selectedDistrict = "";
  List<DropdownMenuItem<String>> kahramanmarasDistricts = [
    // const DropdownMenuItem(
    //   value: "",
    //   child: Text(""),
    // ),
    const DropdownMenuItem(
      value: "Onikişubat",
      child: Text("Onikişubat"),
    ),
    const DropdownMenuItem(
      value: "Dulkadiroğlu",
      child: Text("Dulkadiroğlu"),
    ),
  ];

  List<DropdownMenuItem<String>> diyarbakirDistricts = [
    // const DropdownMenuItem(
    //   value: "",
    //   child: Text(""),
    // ),
    const DropdownMenuItem(
      value: "Bağlar",
      child: Text("Bağlar"),
    ),
    const DropdownMenuItem(
      value: "Bismil",
      child: Text("Bismil"),
    ),
    const DropdownMenuItem(
      value: "Bismil2",
      child: Text("Bismil2"),
    ),
  ];
  List<DropdownMenuItem<String>> citys = [
    const DropdownMenuItem(
      value: "Kahramanmaraş",
      child: Text("Kahramanmaraş"),
    ),
    const DropdownMenuItem(
      value: "Diyarbakır",
      child: Text("Diyarbakır"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SelectCityDropDownField(),
          SelectDistrictDropDownField(),
        ],
      ),
    );
  }

  Widget SelectCityDropDownField() {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.red,
            ),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.location_city,
            color: Color(0xFFCB3126),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: Color(0xFFCB3126),
            ),
          ),
        ),
        items: citys
            .map(
              (e) => DropdownMenuItem<String>(
                value: e.value,
                child: e.child,
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedCity = value.toString();
          });
        },
      ),
    );
  }

  Widget SelectDistrictDropDownField() {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.red,
            ),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.location_city,
            color: Color(0xFFCB3126),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: Color(0xFFCB3126),
            ),
          ),
        ),
        key: selectedCity == "Kahramanmaraş"
            ? const Key('districts')
            : const Key('districts2'),
        items: districtsItem(),
        onChanged: (value) {
          setState(() {
            selectedDistrict = value.toString();
          });
        },
      ),
    );
  }

  districtsItem() {
    switch (selectedCity) {
      case "Kahramanmaraş":
        return kahramanmarasDistricts;
      case "Diyarbakır":
        return diyarbakirDistricts;
    }
  }
}
