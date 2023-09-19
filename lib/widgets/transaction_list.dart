import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management/shared/shared_components/components.dart';
import '../shared/cubit/money_cubit.dart';
import '../shared/network/shared.styles/colors.dart';

class TransactionList extends StatelessWidget {
  final List<Map> transaction;
  const TransactionList({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat.yMMMd().add_jms();
    return SizedBox(
      height: screenHeight(context) / 2,
      child: transaction.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Card(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: screenHeight(context) / 20,
                  ),
                  const Text("لا توجد مصاريف حتي الآن"),
                  SizedBox(
                    height: screenHeight(context) / 10,
                  ),
                  Image(
                    image: const AssetImage('assets/images/waiting.png'),
                    height: screenHeight(context) / 4,
                    color: primaryColor,
                  )
                ],
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildTransactionItem(transaction[index], context, dateFormat),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: transaction.length),
    );
  }

  Widget buildTransactionItem(Map model, context, dateFormat) => Column(
        children: [
          Card(
            elevation: 5.0,
            margin: EdgeInsets.symmetric(
                horizontal: screenWidth(context) / 25,
                vertical: screenHeight(context) / 100),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundColor: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text(
                      "\$ ${model['amount']}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
              title: Text(
                model['title'],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                model['date'].toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              trailing: IconButton(
                onPressed: () {
                  MoneyCubit.get(context).deleteFromDataBase(id: model['id']);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ); // Dismissible => to swipe
}
