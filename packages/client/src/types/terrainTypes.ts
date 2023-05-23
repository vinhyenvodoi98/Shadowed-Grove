import TreeImage from '../assets/tree.png';
import RockImage from '../assets/smallrock.png';

export enum TerrainType {
  TallGrass = 1,
  Boulder,
}

type TerrainConfig = {
  emoji: any;
};

export const terrainTypes: Record<TerrainType, TerrainConfig> = {
  [TerrainType.TallGrass]: {
    emoji: TreeImage,
  },
  [TerrainType.Boulder]: {
    emoji: RockImage,
  },
};
