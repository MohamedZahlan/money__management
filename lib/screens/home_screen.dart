import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_management/shared/cubit/money_cubit.dart';
import 'package:money_management/shared/cubit/money_states.dart';
import 'package:money_management/widgets/chart.dart';
import 'package:money_management/widgets/transaction_list.dart';
import '../shared/shared_components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateController = TextEditingController();
    var titleController = TextEditingController();
    var amountController = TextEditingController();
    var formState = GlobalKey<FormState>();

    return BlocConsumer<MoneyCubit, MoneyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MoneyCubit cubit = MoneyCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("إداره أموالك"),
            actions: [
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth(context) / 30,
                            vertical: screenHeight(context) / 30),
                        child: Form(
                          key: formState,
                          child: Column(
                            children: [
                              TextFormField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                controller: titleController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "أدخل النص",
                                ),
                                style: const TextStyle(
                                    color: Colors.black, fontFamily: 'quran'),
                              ),
                              SizedBox(
                                height: screenHeight(context) / 40,
                              ),
                              TextFormField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                controller: amountController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "أدخل المبلغ",
                                ),
                                style: const TextStyle(
                                    color: Colors.black, fontFamily: 'quran'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "يرجي ادخال المبلغ";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: screenHeight(context) / 40,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.datetime,
                                controller: dateController,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "أختر التاريخ",
                                ),
                                style: const TextStyle(
                                    color: Colors.black, fontFamily: 'quran'),
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2022),
                                    lastDate: DateTime(2025),
                                  ).then((value) {
                                    dateController.text =
                                        DateFormat.yMMMd().format(value!);
                                  });
                                },
                                readOnly: true,
                              ),
                              SizedBox(
                                height: screenHeight(context) / 40,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (formState.currentState!.validate()) {
                                    cubit
                                        .insertToDataBase(
                                            title: titleController.text,
                                            amount: amountController.text,
                                            date: dateController.text,
                                            time: DateTime.now().toString())
                                        .then((value) {
                                      Navigator.pop(context);
                                    });
                                  }
                                },
                                child: Text(
                                  'حفظ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        height: screenHeight(context) / 320,
                                        fontFamily: 'quran',
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white,
                  child: Chart(transaction: cubit.transaction),
                ),
                TransactionList(
                  transaction: cubit.transaction,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) / 30,
                      vertical: screenHeight(context) / 30),
                  child: Form(
                    key: formState,
                    child: Column(
                      children: [
                        TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: titleController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "أدخل النص",
                          ),
                          style: const TextStyle(
                              color: Colors.black, fontFamily: 'quran'),
                        ),
                        SizedBox(
                          height: screenHeight(context) / 40,
                        ),
                        TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: amountController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "أدخل المبلغ",
                          ),
                          style: const TextStyle(
                              color: Colors.black, fontFamily: 'quran'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "يرجي ادخال المبلغ";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: screenHeight(context) / 40,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.datetime,
                          controller: dateController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "أختر التاريخ",
                          ),
                          style: const TextStyle(
                              color: Colors.black, fontFamily: 'quran'),
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2025),
                            ).then((value) {
                              dateController.text =
                                  DateFormat.yMMMd().format(value!);
                            });
                          },
                          readOnly: true,
                        ),
                        SizedBox(
                          height: screenHeight(context) / 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formState.currentState!.validate()) {
                              cubit
                                  .insertToDataBase(
                                      title: titleController.text,
                                      amount: amountController.text,
                                      date: dateController.text,
                                      time: DateTime.now().toString())
                                  .then((value) {
                                Navigator.pop(context);
                              });
                            }
                          },
                          child: Text(
                            'حفظ',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  height: screenHeight(context) / 320,
                                  fontFamily: 'quran',
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
