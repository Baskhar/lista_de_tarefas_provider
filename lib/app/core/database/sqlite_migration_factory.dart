import 'package:todo_list_provider/app/core/database/migrations/migrationv1.dart';

import 'migrations/migration.dart';

class SqliteMigrationFactory{
  List<Migration> getCreateMigration()=>[
    Migrationv1(),
  ];
  List<Migration> getUpgradeMigration(int verion)=>[];
}