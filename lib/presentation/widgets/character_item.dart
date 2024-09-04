import 'package:flutter/material.dart';
import '../../data/models/pokemon.dart';

class CharacterItem extends StatelessWidget {
  final Pokemon pokemon;

  CharacterItem({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Widget
          pokemon.sprites.frontDefault != null && pokemon.sprites.frontDefault.isNotEmpty
              ? FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif', // Path to your placeholder image
            image: pokemon.sprites.frontDefault,
            fit: BoxFit.cover,
            height: 100,
            width: 100,
          )
              : Image.asset(
            'assets/images/placeholder.png', // Path to your placeholder image
            height: 100,
            width: 100,
          ),
          SizedBox(height: 10),
          Text(
            pokemon.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text('Height: ${pokemon.height}'),
          Text('Weight: ${pokemon.weight}'),
          // You can add more details like types, stats, etc.
        ],
      ),
    );
  }
}
