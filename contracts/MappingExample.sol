pragma solidity ^0.6.0;

contract MappingExample{
    mapping(uint => bool ) public myMapping;
    mapping(address => bool ) public myAddressMapping;

    function setValues(uint _index)public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {

        myAddressMapping[msg.sender] = true;
    }
}