pragma solidity ^0.5.13;

contract StartStopUpdateExample{

address owner;
bool public paused;

constructor() public{
    owner = msg.sender; // address that is initiating the tx
}
    function sendMoney() public payable{

    }

function setPaused(bool _paused) public{
    paused = _paused;
}
    function withDrawAllMoney(address payable _to) public {
        require(msg.sender == owner , " Not Authorized for the Tx...");
        require(!paused,"Contract is Paused! ");
        _to.transfer(address(this).balance);
    }

    function destroySmartContract(address payable _to)public {
        require(msg.sender == owner , " Not Authorized for the Tx...");
        selfdestruct(_to);
    }
}