import { useComponentValue, useEntityQuery, useRow, useRows } from "@latticexyz/react";
import { GameMap } from "./maps/GameMap";
import { useMUD } from "./MUDContext";
import { useKeyboardMovement } from "./game-controller/useKeyboardMovement";
import { hexToArray } from "@latticexyz/utils";
import { TerrainType, terrainTypes } from "./types/terrainTypes";
import { Has, getComponentValueStrict, Entity } from "@latticexyz/recs";
import Bag from "./components/bag";
import Status from "./components/status";

export const GameBoard = () => {
  useKeyboardMovement();

  const {
    components: { Monsters, MapConfig, Player, Position },
    network: { playerEntity, singletonEntity,storeCache },
    systemCalls: { spawn },
  } = useMUD();

  const canSpawn = useComponentValue(Player, playerEntity)?.value !== true;

  const players = useEntityQuery([Has(Player), Has(Position)]).map((entity) => {
    const position = getComponentValueStrict(Position, entity);
    return {
      entity,
      x: position.x,
      y: position.y,
      emoji: entity === playerEntity ? "🤠" : "🥸",
    };
  });

  const mapConfig = useComponentValue(MapConfig, singletonEntity);
  if (mapConfig == null) {
    throw new Error(
      "map config not set or not ready, only use this hook after loading state === LIVE"
    );
  }

  const { width, height, terrain: terrainData } = mapConfig;
  const terrain = Array.from(hexToArray(terrainData)).map((value, index) => {
    const { emoji } =
      value in TerrainType ? terrainTypes[value as TerrainType] : { emoji: "" };
    return {
      x: index % width,
      y: Math.floor(index / width),
      emoji,
    };
  });

  const monsters = useRows(storeCache, { table: "Monsters"})
  return (
    <div className="relative">
      <GameMap
        width={width}
        height={height}
        terrain={terrain}
        onTileClick={canSpawn ? spawn : undefined}
        players={players}
        monsters={monsters}
      />
      <div className="absolute bottom-10 right-10">
        <Bag />
      </div>
      <div className="absolute top-5 left-5">
        <Status />
      </div>
    </div>
  );
};
