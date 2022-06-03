// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Ownable.sol";
import "./ERC20.sol";

contract ZSTToken is Ownable, ERC20{

    address private _IAPAddress = 0x2348e0DB2661dF498863331553c55e9A4C180079;
    uint256 private _maxtotalSupply = 5000000000 * 10 ** decimals();
    
    event IAPToken(
        address indexed from, 
        string gameID,
        string itemID,
        string chkPoint,
        uint8 permanence
    );

    constructor (string memory tokenName, string memory simbol) Ownable() ERC20(tokenName, simbol){
        _mint(msg.sender,  _maxtotalSupply);
    }

    function burn(uint256 _value) external onlyOwner {
        _burn(_msgSender(), _value);
    }

    function setIAPAddress(address IAPAddress_) external onlyOwner {
        _IAPAddress = IAPAddress_;
    }

    function getIAPAddress() external view onlyOwner returns (address) {
        return _IAPAddress;
    }

    function IapToken(
        string memory gameID_,
        string memory itemID_,
        string memory chkPoint_,
        uint256 itemPrice_,
        uint8 permanence_) external returns (bool) {

        bool successTransfer = transfer(_IAPAddress, itemPrice_);

        if(successTransfer){
            emit IAPToken(_msgSender(), gameID_, itemID_, chkPoint_, permanence_);
        }

        return successTransfer;

    }

}
