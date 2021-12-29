// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./token/ERC20/Ownable.sol";
import "./token/ERC20/ERC20.sol";

contract ZSTToken is Ownable, ERC20{

    uint256 private _maxtotalSupply = 5000000000 * 10 ** decimals();

    constructor () Ownable() ERC20("ZENSTY Token", "ZST"){
        _mint(msg.sender,  _maxtotalSupply);
    }

    function burn(uint256 _value) external onlyOwner {
        _burn(_msgSender(), _value);
    }

}
