// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol"; 
import "@openzeppelin/contracts/access/Ownable.sol"; 

contract MyToken is ERC20, ERC20Burnable, Ownable {
     constructor() ERC20("KOINS", "KNS"){} 
 
    function mintTokens(address _address, uint _value) public onlyOwner { 
        _mint(_address, _value);
    } 

    function getBalance() public view returns(uint256) {
        return balanceOf(msg.sender);
    }
 
    function transferTokens(address _address, uint _value) external {
       require(balanceOf(msg.sender) >= _value, "You do not have enough KOINS.");
       approve(msg.sender, _value);
       transferFrom(msg.sender, _address, _value);
    } 
 
    function burntok(uint _value) external { 
        require(balanceOf(msg.sender) >= _value, "You do not have enough KOINS.");
        burn(_value);
    }
}
