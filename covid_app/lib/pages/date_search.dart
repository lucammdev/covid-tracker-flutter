import 'package:covid_app/components/statistics_list.dart';
import 'package:flutter/material.dart';

class DateSearch extends StatefulWidget {
  const DateSearch({super.key});

  @override
  State<DateSearch> createState() => _DateSearchState();
}

class _DateSearchState extends State<DateSearch> {
  late dynamic _dateTime;
  dynamic _statistics;

  @override
  void initState() {
    _dateTime = DateTime.now();
    _statistics = const Text('escolha uma data');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('CovidT - Busca por Data',),
      backgroundColor: const Color.fromARGB(255, 56, 226, 56)
      
      ),
      body: Center(
        child: Column(  
        children: [
        Container(
          margin: const EdgeInsets.all(16),
          child:ElevatedButton(
          child: const Text('Escolha uma data'),
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: DateTime.utc(2020, 2, 26),
                    lastDate: DateTime.now())
                .then((date) {
              setState(() {
                _dateTime = date;
                String converted =
                    '${date?.year.toString()}${(date?.month.toString())?.length == 2 ? date?.month.toString() : '0${date?.month.toString()}'}${(date?.day.toString())?.length == 2 ? date?.day.toString() : '0${date?.day.toString()}'}';
                _statistics = StatisticsList(args: 'brazil/$converted');
              });
            });
          },
        )),
        SizedBox(
          height: 400,
          child: _statistics,
        ),
      ])),
    );
  }
}
