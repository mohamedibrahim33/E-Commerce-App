import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableCartProduct(
      $columnName TEXT NOt NULL,
      $columnImage TEXT NOt NULL,
      $columnPrice TEXT NOt NULL,
      $columnQuantity INTEGER NOt NULL,
      $columnProductId TEXT NOt NULL)
      ''');
    });
  }

  Future<List<CartProductsModel>> getAllProduct() async {
    var dbHelper = await database;
    List<Map> map = await dbHelper.query(tableCartProduct);
    List<CartProductsModel> list = map.isNotEmpty
        ? map
            .map((product) =>
                CartProductsModel.fromJson(product as Map<String, dynamic>))
            .toList()
        : [];
    return list;
  }

  insert(CartProductsModel model) async {
    var dbHelper = await database;
    await dbHelper.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('insert ok');
  }

  update(CartProductsModel model) async {
    var dbHelper = await database;
    await dbHelper.update(tableCartProduct, model.toJson(),
        where: '$columnProductId=?', whereArgs: [model.productId]);
    print('update ok');
  }
}
