import 'package:fitflex/features/food/presentation/view_model/food_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _calorieController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  String? selectedFoodId;

  @override
  void initState() {
    super.initState();
    context.read<FoodBloc>().add(LoadFood());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Food Management'),
          backgroundColor: Colors.purple,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Manage Foods'),
              Tab(text: 'Log Food'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildManageFoodTab(),
            _buildLogFoodTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildManageFoodTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTextField(_nameController, 'Food Name'),
          const SizedBox(height: 10),
          _buildTextField(
            _calorieController,
            'Calories',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            ),
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
            child: const Text('Add Food'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<FoodBloc, FoodState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurple,
                    ),
                  );
                }

                if (state.error != null) {
                  return Center(
                    child: Text(
                      'Error: ${state.error}',
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                  );
                }

                if (state.foods.isEmpty) {
                  return const Center(
                    child: Text(
                      'No food items found.',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: state.foods.length,
                  itemBuilder: (context, index) {
                    final food = state.foods[index];
                    return Card(
                      color: Colors.grey[900],
                      child: ListTile(
                        title: Text(
                          food.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '${food.calorie} kcal',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit,
                                  color: Colors.deepPurpleAccent),
                              onPressed: () =>
                                  _showUpdateDialog(context, food.id!),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Colors.redAccent),
                              onPressed: () {
                                context
                                    .read<FoodBloc>()
                                    .add(DeleteFood(foodId: food.id!));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogFoodTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          return Column(
            children: [
              DropdownButtonFormField<String>(
                dropdownColor: Colors.grey[900],
                value: selectedFoodId,
                decoration: const InputDecoration(
                  labelText: 'Select Food',
                  labelStyle: TextStyle(color: Colors.purple),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                ),
                iconEnabledColor: Colors.white,
                items: state.foods.map((food) {
                  return DropdownMenuItem(
                    value: food.id!,
                    child: Text(
                      food.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedFoodId = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildTextField(
                _quantityController,
                'Quantity (g)',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (selectedFoodId != null &&
                      _quantityController.text.isNotEmpty) {
                    // Handle log food logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Food logged successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    _quantityController.clear();
                  }
                },
                child: const Text('Log Food'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.purple),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple, width: 2),
        ),
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, String foodId) {
    TextEditingController updateNameController = TextEditingController();
    TextEditingController updateCalorieController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title:
              const Text('Update Food', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(updateNameController, 'New Food Name'),
              const SizedBox(height: 10),
              _buildTextField(
                updateCalorieController,
                'New Calories',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                if (updateNameController.text.isNotEmpty &&
                    updateCalorieController.text.isNotEmpty) {
                  // Add update logic here
                  Navigator.pop(context);
                }
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
