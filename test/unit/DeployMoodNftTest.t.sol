//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {Test, console} from "forge-std/Test.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri () public view {
        string memory expectedUri =
            "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj4NCiAgPHRleHQgeD0iMjAwIiB5PSIyNTAiIGZpbGw9ImJsYWNrIj4NCiAgICBIaSEgWW91IGRlY29kZWQgdGhpcyF7IiAifQ0KICA8L3RleHQ+DQo8L3N2Zz4NCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0K";
        string memory svg =
            '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"500\" height=\"500\"><text x=\"200\" y=\"250\" fill=\"black\">Hi! You decoded this!</text></svg>';

        string memory actualUri = deployer.svgToImageUri(svg);
        console.log("actual",actualUri,"expectUri", expectedUri);
        assert(keccak256(abi.encodePacked(expectedUri)) == 
            keccak256(abi.encodePacked(actualUri))
            );
    }
}
