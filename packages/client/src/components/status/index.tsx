import { useState } from "react";
import { gearTypes, GearType } from "../../types/gearTypes";

export default function Status() {

  return (
    <div className="bg-slate-500/50 w-64 h-8 rounded grid grid-cols-3" >
      <div className="p-1">
        { gearTypes[GearType.Heart].emoji }: 100
      </div>
      <div className="p-1">
        { gearTypes[GearType.Attack].emoji }:
      </div>
      <div className="p-1">
        { gearTypes[GearType.Defense].emoji }:
      </div>
    </div>
  )
}