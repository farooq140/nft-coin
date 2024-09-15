// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";
import {MoodNft} from "../../src/MoodNft.sol";
import {Test, console} from "forge-std/Test.sol";
import {MintBasicNft} from "../../script/Interaction.s.sol";

contract MoodNftIntergationTest is Test{
       MoodNft moodNft;
       DeployBasicNft public deployer;
   string public constant HAPPY_SVG_URI =  'data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkdG';
   string public constant SAD_SVG_URI =
       'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAyNHB4IiBoZWlnaHQ9IjEwMj';
   address user = makeAddr("user");
    function setUp() public{
        deployer = new DeployBasicNft();
        moodNft = deployer.run();
    }
    function testViewTokenURIIntergration() public {
        vm.prank(user);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }

}