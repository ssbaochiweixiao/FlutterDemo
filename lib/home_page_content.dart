import 'package:flutter/material.dart';
import 'package:day01/DetailPage.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HomePageContent extends StatelessWidget {

  static Database? _database;

// // 打开数据库的方法
  static Future<void> _openDatabase() async {

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'Database/Translate2.db');

    print(path);
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // 创建示例表，你可按实际需求调整表结构、表名和字段等
        await db.execute(
            'CREATE TABLE TestTable(request_id TEXT, nameData TEXT, plantInfo TEXT, plantHow TEXT, plantCondition TEXT, diagnosisData TEXT, plantCulture TEXT, image_urls BLOB, creatTime REAL, updateTime REAL, name TEXT, userName TEXT, BotanicalName TEXT, feature TEXT, HealthState TEXT, isDiagnose INTEGER, diagnoseRequest TEXT, diagnoseMore INTEGER, source TEXT, selectIndex TEXT)');
      },
    );
  }




  // 插入数据方法
  static Future<void> _insertData() async {
    if (_database!= null) {
      await _database!.insert(
        'TestTable',
        {'nameData': 'Bob', 'plantInfo': 28},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
  // 查询数据方法
  static Future<List<Map<String, dynamic>>> _queryData() async {
    if (_database!= null) {
      return await _database!.query('TestTable');
    }
    return [];
  }

  // 更新数据方法
  static Future<void> _updateData() async {
    if (_database!= null) {
      await _database!.update(
        'TestTable',
        {'age': 29},
        where: 'name =?',
        whereArgs: ['Bob'],
      );
    }
  }

  // 删除数据方法
  static Future<void> _deleteData() async {
    if (_database!= null) {
      await _database!.delete(
        'TestTable',
        where: 'name =?',
        whereArgs: ['Bob'],
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("welcome to HomePage"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await _openDatabase();
                await _insertData();
                print('数据插入成功');
              },
              child: Text("插入数据"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await _openDatabase();
                final data = await _queryData();
                print('查询到的数据: $data');
              },
              child: Text("查询数据"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await _openDatabase();
                await _updateData();
                print('数据更新成功');
              },
              child: Text("更新数据"),
            ),
          ],
        ),
      ),
    );
  }
}

