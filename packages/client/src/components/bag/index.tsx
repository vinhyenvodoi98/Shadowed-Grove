import { useComponentValue, useEntityQuery } from "@latticexyz/react";
import { Has } from "@latticexyz/recs";
import { useState } from "react";
import { useMUD } from "../../MUDContext";
import { gearTypes, GearType } from "../../types/gearTypes";

export default function Bag() {
  const {
    components: { Monsters },
    systemCalls: { },
    network: { },
  } = useMUD()
  // let master: Entity = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266";
  const monsters = useEntityQuery([Has(Monsters)])

  const [showModal, setShowModal] = useState(false);
  return (
    <>
      <button className="bg-slate-500/50 font-semibold w-12 h-12 py-2 px-2 rounded-full"
        type="button"
        // onClick={()=> generate()}
        onClick={() => setShowModal(true)}
      >
        { gearTypes[GearType.Bag].emoji }
      </button>
      {showModal ? (
        <>
          <div
            className="justify-center items-center flex overflow-x-hidden overflow-y-auto fixed inset-0 z-50 outline-none focus:outline-none"
          >
            <div className="relative w-auto my-6 mx-auto max-w-3xl">
              {/*content*/}
              <div className="border-0 rounded-lg shadow-lg relative flex flex-col w-96 h-96 bg-white outline-none focus:outline-none">
                {/*header*/}
                <div className="flex text-black items-start justify-between py-2 px-5  border-b border-solid border-slate-200 rounded-t">
                  <h3 className="p-1 text-2xl font-semibold">
                    🧸 Collections
                  </h3>
                  <button
                    className="p-1 ml-auto bg-transparent border-0 text-black float-right text-3xl leading-none font-semibold outline-none focus:outline-none"
                    onClick={() => setShowModal(false)}
                  >
                    <span className="bg-transparent text-black opacity-3 text-2xl block outline-none focus:outline-none">
                      { gearTypes[GearType.Close].emoji }
                    </span>
                  </button>
                </div>
                {/*body*/}
                <div className="relative p-6 grid grid-cols-5 gap-4">
                  {monsters.map((monster, id) => (
                    <MonsterImage id={monster} key={id} />
                  ))}
                </div>
              </div>
            </div>
          </div>
          <div className="opacity-25 fixed inset-0 z-40 bg-black"></div>
        </>
      ) : null}
    </>
  )
}

export function MonsterImage(id: any) {
  const {
    components: { Monsters },
    systemCalls: { },
    network: { playerEntity },
  } = useMUD()
  const monster = useComponentValue(Monsters, id.id)
  if(playerEntity && monster && monster.owner.includes(playerEntity.substring(2))){
    return (
      <div className="border-slate-100 rounded-md w-12 h-12 flex items-center justify-center bg-gray-200/50">
        <img alt="image description" className="rounded-md"
          src={`https://${monster?.image}.ipfs.nftstorage.link`} />
      </div>
    )
  } else {
    return <></>
  }
}
