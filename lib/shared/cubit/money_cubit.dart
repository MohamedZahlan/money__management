import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_management/shared/cubit/money_states.dart';
import 'package:sqflite/sqflite.dart';

class MoneyCubit extends Cubit<MoneyStates> {
  MoneyCubit() : super(MoneyInitialState());

  static MoneyCubit get(context) => BlocProvider.of(context);
  List<Map> transaction = [];
  late Database database;
  var date;
  // // this method for create database
  Future createDataBase() async {
    return openDatabase(
      'money.db',
      version: 1,
      onCreate: (database, version) async {
        debugPrint('Database created');
        await database
            .execute(
                "CREATE TABLE money (id INTEGER PRIMARY KEY, title TEXT, amount TEXT, date TEXT, time TEXT)")
            .then((value) {
          debugPrint('Table created');
        }).catchError((error) {
          emit(MoneyCreateTableErrorState());
          debugPrint('we found error when created table ${error.toString()}');
        });
      },
      onOpen: (database) {
        debugPrint('database opened');
        getDataFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(MoneyCreateDataBaseSuccessState());
    });
  }

  // //this method for insert to database
  Future insertToDataBase({
    required String title,
    required String amount,
    required String date,
    required String time,
  }) async {
    await database.transaction((txn) async {
      return await txn
          .rawInsert(
              'INSERT INTO money ("title", "amount","date","time") VALUES("$title","$amount","$date","$time")')
          .then((value) {
        debugPrint('$value Inserted Successfully');
        getDataFromDatabase(database);
        emit(MoneyInsertSuccessToDataBaseState());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(MoneyInsertErrorToDataBaseState());
      });
    });
  }

  void getDataFromDatabase(database) {
    database.rawQuery('SELECT * FROM money').then((value) {
      transaction = value;
      emit(MoneyGetTransactionSuccessState());
    });
  }

  void deleteFromDataBase({
    required int id,
  }) {
    database.rawDelete('DELETE From money WHERE id = ?', [id]).then((value) {
      emit(MoneyDeleteSuccessFromDataBaseState());
      getDataFromDatabase(database);
    });
  }
}
