// SPDX-License-Identifier: MIT

pragma solidity 0.8.35;

/**
 * @title DeployCarsNFTCollection
 * @author Jose L Imoberdorf
 * @dev Script to deploy the CarsNFTCollection contract
 */

import {Script} from "forge-std/Script.sol";
import {CarsNFTCollection} from "../src/CarsNFTCollection.sol"; // Inicializamos nuestro SC

contract DeployCarsNFTCollection is Script { // Inicializamos el SC

/**
 * @dev Deploys the CarsNFTCollection contract  
 */
function run() external returns(CarsNFTCollection){
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    vm.startBroadcast(deployerPrivateKey); // Similar to startPrank, but it will sign transactions with the private key provided. This is useful for deploying contracts or sending transactions from an externally owned account (EOA) during a script execution.

    string memory name_     = "Cars NFT";
    string memory symbol_   = "CARSNFT";
    uint256 totalSupply_    = 4;
    string memory baseUri_  = "ipfs://bafybeiegk7stppf32zvss5fyhxwbdv7zr3qlace7uem4l75mapjb2zgboi/";

    CarsNFTCollection nftCollection = new CarsNFTCollection(name_, symbol_, totalSupply_, baseUri_);

    vm.stopBroadcast();
    return nftCollection;
}


}