pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Allowance is Ownable{

    mapping(address => uint) public allowance;

    function addAllowance(address _to,uint _amount)public onlyOwner{
            allowance[_to] = _amount;
    }

    modifier ownerOrAllowed(uint _amount){
        require(islyOwner() || allowance[msg.sender] >= _amount," You are not Authorized!");
        _;
    }

    function reduceAllowance(address _to,uint _amount) internal{
             allowance[_to] -= _amount;
    }
}
    contract SharedWallet is Allowance {

        function withdrawMoney(address payable _to,uint _amount) public ownerOrAllowed(_amount){

            require(amount <= address(this).balance," Not Sufficient Funds..");

            if(!isOwner()){
                reduceAllowance(msg.sender,_amount);
            }
            _to.transfer(_amount);
        }

        function () external payable {

        }
    }
