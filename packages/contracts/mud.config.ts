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
        owner: "bytes32",
      },
      schema: {
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
    // MonsterCatchAttempt: {
    //   ephemeral: true,
    //   dataStruct: false,
    //   keySchema: {
    //     encounter: "bytes32",
    //   },
    //   schema: {
    //     result: "MonsterCatchResult",
    //   },
    // },
    Movable: "bool",
    Obstruction: "bool",
    OwnedBy: "bytes32",
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
