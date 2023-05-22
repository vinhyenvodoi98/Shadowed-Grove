import { useComponentValue } from "@latticexyz/react";
import { useMUD } from "../../MUDContext";
import { gearTypes, GearType } from "../../types/gearTypes";

export default function Status() {
  const {
    components: { Hero },
    network: { playerEntity },
  } = useMUD()

  const status = useComponentValue(Hero, playerEntity);
  return (
    <div className="bg-slate-500/50 w-64 h-8 rounded grid grid-cols-3" >
      <div className="p-1">
        { gearTypes[GearType.Heart].emoji }: {status?.health}
      </div>
      <div className="p-1">
        { gearTypes[GearType.Attack].emoji }: {status?.attack}
      </div>
      <div className="p-1">
        { gearTypes[GearType.Defense].emoji }: {status?.defence}
      </div>
    </div>
  )
}