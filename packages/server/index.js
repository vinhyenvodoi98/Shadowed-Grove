const Web3 = require('web3');
const { ANVIL } = require('./config/network');

const main = async () => {
  const web3 = new Web3(ANVIL.providerOrUrl)
  const address = "0x0693D1E741EB47543A83Ea861F6BAd396b57AaF2"
  let balance = await web3.eth.getBalance(address)
  console.log("Addresses Balance: ",balance)
}

main()
