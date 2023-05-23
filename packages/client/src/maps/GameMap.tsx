import { Entity } from "@latticexyz/recs";
import { twMerge } from "tailwind-merge";
import { useMUD } from "../MUDContext";
import { gearTypes, GearType } from "../types/gearTypes";
import cloverImage from '../assets/clover.png';
import manImage from '../assets/man.png';

type Props = {
  width: number;
  height: number;
  onTileClick?: (x: number, y: number) => void;
  terrain?: {
    x: number;
    y: number;
    emoji: string;
  }[];
  players?: {
    x: number;
    y: number;
    emoji: string;
    entity: Entity;
  }[];
  monsters?: any[]
};

export const GameMap = ({
  width,
  height,
  onTileClick,
  terrain,
  players,
  monsters,
}: Props) => {
  const {
    network: { playerEntity },
    systemCalls: { fight },
  } = useMUD();

  const rows = new Array(width).fill(0).map((_, i) => i);
  const columns = new Array(height).fill(0).map((_, i) => i);

  return (
    <div className="inline-grid p-2 bg-gray-700 relative overflow-hidden">
      {rows.map((y) =>
        columns.map((x) => {
          const terrainEmoji = terrain?.find(
            (t) => t.x === x && t.y === y
          )?.emoji;

          const playersHere = players?.filter((p) => p.x === x && p.y === y);
          const mainPlayerHere = playersHere?.find(
            (p) => p.entity === playerEntity
          );

          const monstersDataHere = monsters?.filter((p) => p.value.x === x && p.value.y === y && p.value.owner.includes("f39fd6e51aad88f6f4ce6ab8827279cfffb92266"))
          if(playersHere && monstersDataHere && monstersDataHere.length > 0 && playersHere.length > 0 && monstersDataHere[0].value.x === playersHere[0].x && monstersDataHere[0].value.y === playersHere[0].y){
            console.log("fight")
            fight(monstersDataHere[0].key.id, monstersDataHere[0].value.x, monstersDataHere[0].value.y)
          }
          return (
            <div
              key={`${x},${y}`}
              className={twMerge(
                "w-8 h-8 flex items-center justify-center bg-cover bg-center",
                onTileClick ? "cursor-pointer hover:ring" : null
              ) }
              style={{
                gridColumn: x + 1,
                gridRow: y + 1,
                backgroundImage: `url(${cloverImage})`
              }}
              onClick={() => {
                onTileClick?.(x, y);
              }}
            >
              <div className="flex flex-wrap gap-1 items-center justify-center relative">
                {terrainEmoji ? (
                  <div className="absolute inset-0 flex items-center justify-center w-8 h-8 top-[-16px] left-[-16px] bg-cover bg-center pointer-events-none" style={{ backgroundImage: `url(${terrainEmoji})`}} />
                ) : null}
                {monstersDataHere && monstersDataHere[0] ? (
                  <div className="absolute inset-0 flex items-center justify-center top-[-16px] left-[-16px] h-8 w-8 pointer-events-none">
                    <div className="absolute bg-slate-500/50 w-16 h-8 top-[-32px] rounded" >
                      <div className="p-1">
                        { gearTypes[GearType.Heart].emoji }: {monstersDataHere[0].value.health}
                      </div>
                    </div>
                    <img alt="image description" className="rounded-md top-0"
                      src={`https://${monstersDataHere[0].value.image}.ipfs.nftstorage.link`} />
                  </div>
                ) : null}
                <div className="relative">
                  {playersHere?.map((p) => (
                    <div key={p.entity} className="h-8 w-8 top-[-16px] left-[-16px] bg-center bg-cover pointer-events-none" style={{ backgroundImage: `url(${manImage})`}}></div>
                  ))}
                </div>
              </div>
            </div>
          );
        })
      )}
    </div>
  );
};
