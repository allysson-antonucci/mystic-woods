# Mystic Woods
This project was developed using Godot 4.3 and focuses on implementing a **Finite State Machine (FSM)** system for both the player and enemy behaviors.
The player controls a character exploring a forest environment while facing an enemy with simple AI mechanics. The project was designed to study state management, movement systems, combat behavior, and enemy detection logic.

## Player FSM
The player character uses a Finite State Machine to manage its behaviors and transitions between states:

- *Idle* – Default resting state.
- *Run* – Handles character movement and navigation.
- *Attack* – Triggered during combat actions.
- *Dead* – Triggered when the player is hit by the enemy, resulting in an immediate game over (one-hit kill system).

This structure improves code organization and makes it easier to expand gameplay mechanics in the future.

## Enemy FSM

The enemy also uses an FSM-based architecture to control its AI behavior:

- *Idle* – Default inactive state.
- *Follow* – Enemy follows the player after detection.
- *TakeDamage* – Triggered when the enemy receives damage.
- *Dead* – Handles enemy death behavior.

The FSM approach helps separate responsibilities and keeps the enemy AI modular and maintainable.

## RayCast2D Detection System

The enemy uses a RayCast2D node to detect the player within its line of sight. This allows the enemy to identify obstacles and react only when the player is visible.

When the raycast collides with the player, the enemy transitions from the *Idle* state to the *Follow* state, creating a simple but effective detection and pursuit system.

<p align="center">
 <img width="588" height="495" alt="image" src="https://github.com/user-attachments/assets/b1a9f36a-9648-41dd-90e4-00c9f29697e2" />
</p>

## Play the Game

Play it on itch.io:  
https://allysson-nn.itch.io/mystic-woods

## Technologies Used

- Godot 4.3
- GDScript

## Assets & Credits

The following assets were used in this project:

- https://game-endeavor.itch.io/mystic-woods
  (Used for characters and environment)
