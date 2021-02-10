import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:linkmanager/translation/AppLocalizations.dart';

class TimePickers extends StatefulWidget {
  final List workingTimes;

  TimePickers({this.workingTimes});

  @override
  _TimePickersState createState() => _TimePickersState();
}

class _TimePickersState extends State<TimePickers> {
  List workingTime = [];

  @override
  void initState() {
    workingTime = widget.workingTimes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: workingTime.length,
            itemBuilder: (BuildContext context, int i) {
              return Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(AppLocalizations.of(context).translate('from_time')),
                      FlatButton(
                        onPressed: (){
                          showDatePicker(null, i , true);
                        },
                        child: Text(
                          getTime(workingTime[i], true) == ''
                              ? 'Start Date'
                              : getTime(workingTime[i], true),
                          style:
                              TextStyle(fontSize: 16, color: Colors.blueGrey),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(AppLocalizations.of(context).translate('to_time')),
                      FlatButton(
                        child: Text(
                          getTime(workingTime[i], true) == ''
                              ? 'Start Date'
                              : getTime(workingTime[i], true),
                          style:
                              TextStyle(fontSize: 16, color: Colors.blueGrey),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          icon: Icon(
                            Icons.delete_outline,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            workingTime.removeAt(i);
                            setState(() {});
                          })
                    ],
                  ),
                ),
              );
            }),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: 50.0,
          child: OutlineButton.icon(
            onPressed: () {
              workingTime.add('');
              setState(() {});
            },
            icon: Icon(
              Icons.add,
              color: Colors.deepPurpleAccent,
            ),
            label: Text(
              '${AppLocalizations.of(context).translate('add_time')}',
              style: TextStyle(color: Colors.deepPurpleAccent),
            ),
            borderSide: BorderSide(width: 1, color: Colors.deepPurpleAccent),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ],
    ));
  }

  getTime(range, bool startDate) {
    try {
      List<String> time = range.split('-');
      if (startDate)
        return time[0];
      else
        return time[1];
    } catch (e) {
      print('error: $e');
    }
  }

  showDatePicker(DateTime date, int position, bool startDate) {
    DatePicker.showTimePicker(context,
        showTitleActions: true, currentTime: date, onChanged: (date) {
      print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) async {
      setNewRange(DateFormat("hh:mm").format(date));
      setState(() {

      });
    });
  }

  setNewRange(selectTime, int position, bool startDate){
    try{
      List<String> time = workingTime[position].split('-');
      if(time.length > 1) {
        
      }
    }catch(e){

    }
  }
}
