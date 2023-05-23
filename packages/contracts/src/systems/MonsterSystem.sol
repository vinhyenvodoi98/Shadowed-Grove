// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import { System } from "@latticexyz/world/src/System.sol";
import { Monsters, MonstersData } from "../codegen/Tables.sol";
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
    Monsters.set(id, owner, MonstersData({
      x: x,
      y: y,
      health: health,
      attack: attack,
      defence: defence,
      image: image
    }));
    id += 1;
  }
}
