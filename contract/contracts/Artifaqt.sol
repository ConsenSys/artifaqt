pragma solidity ^0.4.24;

import "./eip721/EIP721.sol";


contract Artifaqt is EIP721 {
    // TODO: remove this function, only testing basic stuff now
    function mintForMyself() public {
        addToken(msg.sender, totalSupply());
    }
}