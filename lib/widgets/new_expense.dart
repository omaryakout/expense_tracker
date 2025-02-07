import 'package:flutter/material.dart';
import 'package:expense_tracker_omar/models/expense.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.addExpense});
  void Function(Expense expense) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate;
  Category _category = Category.cinema;

  void _presentDatePicker() async {
    final intialDate = DateTime.now();
    final lastDate =
        DateTime(intialDate.year - 50, intialDate.month, intialDate.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: intialDate,
        firstDate: lastDate,
        lastDate: intialDate);
    setState(() {
      selectedDate = pickedDate;
    });
    print(selectedDate);
  }

  void submitData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final invalidAmout = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        invalidAmout ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text('please selectdate'),
            content: Text('please insert valid date to ensure that'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('okay'))
            ]),
      );
    } else {
      widget.addExpense(Expense(
          title: _titleController.text,
          amount: enteredAmount,
          dateTime: selectedDate!,
          category: _category));
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      print(width);
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'ENTER TITLE'),
                  maxLength: 50,
                ),
                Row(
                 
                  children: [
                    Expanded(
                        child: TextField(
                      controller: _amountController,
                      decoration: InputDecoration(labelText: 'ENTER AMOUNT'),
                      keyboardType: TextInputType.number,
                    )),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_view_week)),
                    Text(selectedDate == null
                        ? 'please select Date'
                        : formatter.format(selectedDate!)),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    DropdownButton(
                      value: _category,
                      items: Category.values
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value.name.toUpperCase()),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        } else {
                          setState(() {
                            _category = value;
                          });
                        }
                      },
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('cancel')),
                    ElevatedButton(
                      style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.only(left: 35,right: 35)) ),
                      onPressed: submitData,
                      child: Text('save expense'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
