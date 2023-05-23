// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import { System } from "@latticexyz/world/src/System.sol";
import { Monsters, MonstersData, Hero, Position } from "../codegen/Tables.sol";
import { addressToEntityKey } from "../addressToEntityKey.sol";

contract MonsterSystem is System {
  uint256 public id;
  function generate(string memory image, uint32 x, uint32 y) public {
    address monsterOwner = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    require(_msgSender() == monsterOwner, "not in encounter");
    bytes32 owner = addressToEntityKey(_msgSender());

    uint32 health = 100;
    uint32 attack = 10;
    uint32 defence = 5;

    // Monsters.set(id, player, health, attack, defence, image);
    Monsters.set(id, MonstersData({
      x: x,
      y: y,
      owner: owner,
      health: health,
      attack: attack,
      defence: defence,
      image: image
    }));
    id += 1;
  }

  function fight(uint256 _id) public {
    bytes32 player = addressToEntityKey(address(_msgSender()));

    uint32 currentX = Position.getX(player);
    uint32 currentY = Position.getY(player);
    uint32 monsterCurrentX = Monsters.getX(_id);
    uint32 monsterCurrentY = Monsters.getY(_id);
    require(currentX == monsterCurrentX && currentY == monsterCurrentY, "Monster and Player should near!");
    uint32 attack = Hero.getAttack(player);
    uint32 monterHealth = Monsters.getHealth(_id);
    uint32 newMonterHealth = monterHealth - attack;
    bytes32 monsterOwner = Monsters.getOwner(_id);
    uint32 monsterAttack = Monsters.getAttack(_id);
    string memory monsterImage = Monsters.getImage(_id);
    uint32 monsterDefence = Monsters.getDefence(_id);

    if (newMonterHealth <= 0) {
      Monsters.set(_id, MonstersData({
      x: monsterCurrentX,
      y: monsterCurrentY,
      owner: player,
      health: 0,
      attack: monsterAttack,
      defence: monsterDefence,
      image: monsterImage
      }));
    } else {
      Monsters.set(_id, MonstersData({
      x: monsterCurrentX,
      y: monsterCurrentY,
      owner: monsterOwner,
      health: newMonterHealth,
      attack: monsterAttack,
      defence: monsterDefence,
      image: monsterImage
      }));
    }
  }
}
