export enum GearType {
  Bag = 1,
  Close = 2,
  Heart = 3,
  Attack = 4,
  Defense = 5
}

type GearConfig = {
  name: string;
  emoji: string;
};

export const gearTypes: Record<GearType, GearConfig> = {
  [GearType.Bag]: {
    name: "Bag",
    emoji: "🎒",
  },
  [GearType.Close]: {
    name: "Close",
    emoji: "❌",
  },
  [GearType.Heart]: {
    name: "Heart",
    emoji: "❤️‍🔥",
  },
  [GearType.Attack]: {
    name: "Attack",
    emoji: "🤺",
  },
  [GearType.Defense]: {
    name: "Defense",
    emoji: "🛡️",
  },
};