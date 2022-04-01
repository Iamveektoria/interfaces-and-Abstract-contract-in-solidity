//SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "./ISimpleStorage.sol";
import "./AbstractSimpleStorage.sol";

contract SimpleStorageUser is AbstractSimpleStorage{
    function callAdd(address _addr, string memory _name, uint _age, string memory _country) external {
        ISimpleStorage(_addr).add(_name, _age, _country);
    }
}