import 'package:drift/drift.dart';

part 'main.g.dart';

@DataClassName('TodoCategory')
class TodoCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

@TableIndex(name: 'item_title', columns: {#title})
class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text().nullable()();
  IntColumn get categoryId => integer().references(TodoCategories, #id)();

  TextColumn get generatedText => text().nullable().generatedAs(
      title + const Constant(' (') + content + const Constant(')'))();
}

abstract class TodoCategoryItemCount extends View {
  TodoItems get todoItems;
  TodoCategories get todoCategories;

  Expression<int> get itemCount => todoItems.id.count();

  @override
  Query as() => select([
        todoCategories.name,
        itemCount,
      ]).from(todoCategories).join([
        innerJoin(todoItems, todoItems.categoryId.equalsExp(todoCategories.id))
      ]);
}