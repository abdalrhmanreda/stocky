import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cart.dart';
import 'package:project1/home.dart';
import 'package:sqflite/sqflite.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeNav(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  List<Widget> screen = [
    HomeScreen(),
    CartScreen(),
    CartScreen(),
  ];

  late Database database;

  void createDataBase() async {
    database = await openDatabase(
      'cart.db',
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE cart(id INTEGER PRIMARY KEY ,image TEXT , title TEXT ,description TEXT ,price double , sizes TEXT )')
            .then((value) {
          print('tabl');
        }).catchError((error) {
          print(error.toString());
        });
      },
      onOpen: (db) {
        getDataFromDatabase(db);

        emit(OpenDataBaseSuccessState());
//        getDataFromDatabase(db);
      },
    );
  }

  void insertIntoDataBase({
    required String image,
    required String title,
    required String price,
    required String sizes,
    required String description,
  }) async {
    await database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO cart(image  , title  ,description  ,price  , sizes   ) VALUES("$image", "$title", "$description" , "$price" , "$sizes" )');
    }).then((value) {
      emit(InsertIntoDataBaseSuccessState());
      getDataFromDatabase(database);
    }).catchError((error) {
      emit(InsertIntoDataBaseErrorState());
    });
  }

  List<Map> products = [];

  void getDataFromDatabase(database) async {
    products = [];
    try {
      var data = await database.rawQuery('SELECT DISTINCT * from cart');
      for (var element in data) {
        products.add(element);
      }
      print(products);
      emit(GetDataFromDatabaseSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetDataFromDatabaseErrorState());
    }
  }
}
