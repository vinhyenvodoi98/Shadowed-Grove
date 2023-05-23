import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  enums: {
    TerrainType: ["None", "TallGrass", "Boulder"],
  },
  tables: {
    Encounter: {
      keySchema: {
        player: "bytes32",
      },
      schema: {
        exists: "bool",
        monster: "bytes32",
        catchAttempts: "uint256",
      },
    },
    Hero: {
      keySchema: {
        player: "bytes32",
      },
      schema: {
        health: "uint32",
        attack: "uint32",
        defence: "uint32",
      }
    },
    Monsters: {
      keySchema: {
        id: "uint256",
      },
      schema: {
        x: "uint32",
        y: "uint32",
        owner: "bytes32",
        health: "uint32",
        attack: "uint32",
        defence: "uint32",
        image: "string",
      }
    },
    EncounterTrigger: "bool",
    Encounterable: "bool",
    MapConfig: {
      keySchema: {},
      dataStruct: false,
      schema: {
        width: "uint32",
        height: "uint32",
        terrain: "bytes",
      },
    },
    Movable: "bool",
    Obstruction: "bool",
    Player: "bool",
    Position: {
      dataStruct: false,
      schema: {
        x: "uint32",
        y: "uint32",
      },
    },
  },
});
