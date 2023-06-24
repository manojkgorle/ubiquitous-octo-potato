import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
// https://github.com/projectsophon/hardhat-circom
import "hardhat-circom";
// circuits
import circuits = require("./circuits.config.json");

// set env var to the root of the project
process.env.BASE_PATH = __dirname;
const PRIVATE_KEY =
  "0x386d0fbabcb5ddd1e1d8974c3247b9d3a1f0ad449958934625494e9ae9f06ca0";
const GOERLI_RPC_URL =
  "https://eth-goerli.g.alchemy.com/v2/97Ulo0kNVx3z6yt7PbJkjFVYo30tfu5e";
// tasks
import "./tasks/newcircuit.ts";

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: "0.8.17",
      },
      {
        version: "0.6.11",
      },
    ],
  },
  circom: {
    // (optional) Base path for input files, defaults to `./circuits/`
    inputBasePath: "./circuits",
    // (required) The final ptau file, relative to inputBasePath, from a Phase 1 ceremony
    ptau: "powersOfTau28_hez_final_12.ptau",
    // (required) Each object in this array refers to a separate circuit
    circuits: JSON.parse(JSON.stringify(circuits)),
  },
  networks: {
    goerli: {
      url: GOERLI_RPC_URL,
      accounts: [PRIVATE_KEY],
      chainId: 5,
    },
  },
};

export default config;
