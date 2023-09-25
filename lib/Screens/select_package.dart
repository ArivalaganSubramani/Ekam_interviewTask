import 'package:ekam_interviewtask/Model/doctor_model.dart';
import 'package:ekam_interviewtask/Model/package_model.dart';
import 'package:ekam_interviewtask/Network/apiConstant.dart';
import 'package:ekam_interviewtask/Network/apiService.dart';
import 'package:ekam_interviewtask/Screens/review_booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Package extends StatefulWidget {
  const Package({Key? key,required this.doctorDetails,required this.selectedKey,required this.selectedValues}) : super(key: key);

  final Doctordetails? doctorDetails;
  final String selectedKey;
  final String selectedValues;

  @override
  State<Package> createState() => _PackageState();
}

class _PackageState extends State<Package> {
  int selectedTileIndex = -1;

  String selectedPackage = '';

  String dropdownValue = '30 min';

  var packageDetails ;

  var Duration;
  var Package ;


  @override
  initState() {
    getPackageDetails();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Package'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select Duration"),
          packageDetails == null ? SizedBox.shrink() : Padding(
            padding: const EdgeInsets.all(20.0),
            child: InputDecorator(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isDense: true,
                  isExpanded: true,
                  value: dropdownValue,

                  items: buildDropdownItems(packageDetails?.duration),

                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text("Select Package"),
          SizedBox(height: 10),
          Container(
            height: 420,
            child: Expanded(
              child: Package == null ? SizedBox.shrink() : ListView.builder(
                  itemCount: Package.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.asset('assets/${Package[index]}.png'),
                      title: Text(
                        Package[index],
                        textScaleFactor: 1.5,
                      ),
                      trailing: Radio<int>(
                                value: index,
                                groupValue: selectedTileIndex,
                                onChanged: (value) {
                                setState(() {
                                selectedTileIndex = value!;
                                selectedPackage = Package[index];
                                });
                             },
                           ),
                       onTap: () {
                         setState(() {
                           selectedTileIndex = index;
                           selectedPackage = Package[index];
                         });
                       },
                      subtitle: Text('Book appointment to consult doctor'),
                      selected: selectedTileIndex == index,

                    );

                  }// title: Text("List item $index"));
                  ),
            ),
          ),

          Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: Size(250, 50),
                ),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ReviewSummary(doctorDetails: widget.doctorDetails, selectedKey: widget.selectedKey ,selectedValues: widget.selectedValues, dropdownValue: dropdownValue, selectedPackage: selectedPackage)));


                },
                child: Text('Next'),
              )

          ),

      ],
      ),
    );
  }
  void getPackageDetails() async {
    var apiResponse = await ApiService().getApiData(ApiConstants.AppointmentOptins);
    packageDetails = packageFromJson(apiResponse!);
    setState(() {
      Duration = packageDetails.duration;
      Package = packageDetails.package;

    });
  }

  List<DropdownMenuItem<String>> buildDropdownItems(List<String> items) {
    return items.map((String item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      );
    }).toList();
  }


}
