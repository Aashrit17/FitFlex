import 'package:fitflex/features/food/presentation/view_model/food_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _calorieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Foods')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Food Name'),
            ),
            TextField(
              controller: _calorieController,
              decoration: InputDecoration(labelText: 'Calories'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _calorieController.text.isNotEmpty) {
                  context.read<FoodBloc>().add(
                        AddFood(
                          foodName: _nameController.text,
                          foodCalorie: int.parse(_calorieController.text),
                        ),
                      );
                  _nameController.clear();
                  _calorieController.clear();
                }
              },
              child: Text('Add Food'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<FoodBloc, FoodState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state.error != null) {
                    return Center(child: Text('Error: ${state.error}'));
                  }

                  if (state.foods.isEmpty) {
                    return Center(child: Text('No food items found.'));
                  }

                  return ListView.builder(
                    itemCount: state.foods.length,
                    itemBuilder: (context, index) {
                      final food = state.foods[index];
                      return ListTile(
                        title: Text(food.name),
                        subtitle: Text('${food.calorie} kcal'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                _showUpdateDialog(context, food.id!);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                context
                                    .read<FoodBloc>()
                                    .add(DeleteFood(foodId: food.id!));
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, String foodId) {
    TextEditingController _updateNameController = TextEditingController();
    TextEditingController _updateCalorieController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Food'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _updateNameController,
                decoration: InputDecoration(labelText: 'New Food Name'),
              ),
              TextField(
                controller: _updateCalorieController,
                decoration: InputDecoration(labelText: 'New Calories'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_updateNameController.text.isNotEmpty &&
                    _updateCalorieController.text.isNotEmpty) {
                  // Implement update food logic in the bloc
                  // context.read<FoodBloc>().add(UpdateFood(foodId, _updateNameController.text, int.parse(_updateCalorieController.text)));

                  Navigator.pop(context);
                }
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
