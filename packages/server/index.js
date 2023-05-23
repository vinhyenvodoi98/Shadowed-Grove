const Web3 = require('web3');
const { ANVIL } = require('./config/network');
const { monsterBuilder } = require('./createMonster');
const MonsterAbi = require('./out/IMonsterSystem.sol/IMonsterSystem.json')
const world = require("./worlds.json")

require('dotenv').config()

const main = async () => {
  const web3 = new Web3(ANVIL.providerOrUrl)
  const account = web3.eth.accounts.wallet.add(process.env.PRIVATE_KEY)
  getBalance(account.address)

  const monsterSystemContract = world[ANVIL.chainId].address
  const instanceMonsterSystem = new web3.eth.Contract(MonsterAbi.abi, monsterSystemContract)
  console.log(monsterSystemContract)
  // const image = await monsterBuilder()
  const image = "bafybeig5ouxzjhankpl5m22dhr22dpkfareb346anj2aroguh3wjz6sdaa"
  const x = Math.floor(Math.random() * 20);
  const y = Math.floor(Math.random() * 20);
  await instanceMonsterSystem.methods.generate(image,x,y).send({
    from: account.address,
    gasLimit: 3000000,
    gasPrice: 5000000000
  })

  console.log("create done")
}

const getBalance = async(address) => {
  const web3 = new Web3(ANVIL.providerOrUrl)
  let balance = await web3.eth.getBalance(address)
  console.log("Master Addresses Balance: ",balance)
}

main()
