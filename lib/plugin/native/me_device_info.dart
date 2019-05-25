import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:device_info/device_info.dart';


class MeDeviceInfo extends StatefulWidget {
  final String title;
  MeDeviceInfo({
    Key key,
    this.title
  }): super(key: key);

  @override
  _PageState createState() => new _PageState();
}

class _PageState extends State < MeDeviceInfo > {
  final _fTextSize = 19.0;
  final _fBtnSize = 12.0;

  String name = '';
  String systemName = '';
  String systemVersion = '';
  String model = '';
  String localizedModel = '';
  String identifierForVendor = '';
  String isPhysicalDevice = '';
  String utsSysname = '';
  String utsNodename = '';
  String utsRelease = '';
  String utsVersion= '';
  String utsMachine = '';


  void _rowBtn1() async {

  }

  void _initInfo() async {
    IosDeviceInfo info = await DeviceInfoPlugin().iosInfo;
    name = info.name;
    systemName = info.systemName;
    systemVersion = info.systemVersion;
    localizedModel = info.localizedModel;
    identifierForVendor = info.identifierForVendor;
    isPhysicalDevice = info.isPhysicalDevice.toString();

    utsSysname = info.utsname.sysname;
    utsNodename = info.utsname.nodename;
    utsRelease = info.utsname.release;
    utsVersion = info.utsname.version;
    utsMachine = info.utsname.machine;

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final fSpace1 = 6.0;
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: < Widget > [
          _getDisplayText('name: ' + name),
          _getDisplayText('systemName: ' + systemName),
          _getDisplayText('systemVersion: ' + systemVersion),
          _getDisplayText('model: ' + model),
          _getDisplayText('localizedModel: ' + localizedModel),
          _getDisplayText('identifierForVendor: ' + identifierForVendor),
          _getDisplayText('isPhysicalDevice: ' + isPhysicalDevice),
          SizedBox(height: 15,),
          _getDisplayText('utsSysname: ' + utsSysname),
          _getDisplayText('utsNodename: ' + utsNodename),
          _getDisplayText('utsRelease: ' + utsRelease),
          _getDisplayText('utsVersion: ' + utsVersion),
          _getDisplayText('utsMachine: ' + utsMachine),
          SizedBox(height: 30,),
          _getTextBtn('testBtn', _rowBtn1),
          SizedBox(height: fSpace1,),
        ],
      ),
    );
  }


  Widget _getTextBtn(String btnText, Function funcBack) {
    Text text = Text(btnText,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: _fBtnSize,
      ),
    );

    return GestureDetector(
      child: text,
      onTap: () {
        funcBack();
      },
    );
  }

  Widget _getDisplayText(String str) {
    return Text(str,
      style: TextStyle(
        fontSize: _fTextSize,
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    _initInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }
}