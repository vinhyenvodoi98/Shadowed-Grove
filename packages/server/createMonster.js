const sdk = require('api')('@scenario-api/v1.0#12tjoxblhyk6cef');
const { NFTStorage, File } = require('nft.storage')
const mime = require('mime')
const fs = require('fs')
const path = require('path')
const axios = require('axios')

require('dotenv').config()

const createMonster = async () => {
  const auth = Buffer.from(`${process.env.SCENARIO_API_KEY}:${process.env.SCENARIO_SECRET_API_KEY}`).toString('base64');
  sdk.auth(`Basic ${auth}`);

  await sdk.postModelsInferencesByModelId({
    parameters: {
      type: 'txt2img',
      enableSafetyCheck: false,
      prompt: 'digital art, cartoon, 2d platformer, game asset, small hybrid beast, a creature, ferocious, sharp teeth, stand on 4 legs, Portrait, magical, scary, small',
      numSamples: 1,
      guidance: 10,
    }
  }, {modelId: 'KJgC_PKgR02eTTMLOqXeHQ'})

  await sleep(60000);

  const { data } = await sdk.getModelsInferencesByModelId({pageSize: '1', modelId: 'KJgC_PKgR02eTTMLOqXeHQ'})
  const image = data.inferences[0].images[0]
  return image
}

async function uploadImageIPFS(imagePath) {
  // load the file from disk
  const { NFT_STORAGE_TOKEN } = process.env
  // create a new NFTStorage client using our API key
  const nftstorage = new NFTStorage({ token: NFT_STORAGE_TOKEN })

  const data = await convertImageToBlob(imagePath)
  // call client.store, passing in the image & metadata
  return nftstorage.storeBlob(data)
}

function convertImageToBlob(imagePath) {
  return new Promise((resolve, reject) => {
    fs.readFile(imagePath, (err, data) => {
      if (err) {
        reject(err);
        return;
      }

      const blob = new Blob([data], { type: 'image/jpeg' });
      resolve(blob);
    });
  });
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function downloadImage(url, filename) {
  const response = await axios({
    method: 'GET',
    url: url,
    responseType: 'stream'
  });

  const writer = fs.createWriteStream(filename);
  response.data.pipe(writer);

  return new Promise((resolve, reject) => {
    writer.on('finish', resolve);
    writer.on('error', reject);
  });
}

function deleteImage(filename) {
  fs.unlink(filename, (err) => {
    if (err) {
      console.error('error:', err);
    } else {
      console.log('image in local delete successfully!');
    }
  });
}

const monsterBuilder = async () => {
  const { id, url } = await createMonster()
  await downloadImage(url, "image.png")

  const result = await uploadImageIPFS("image.png")
  console.log(result)
  deleteImage("image.png")
  return result
}

module.exports = {
  monsterBuilder
}
