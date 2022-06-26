// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "IERC165.sol";

// If a wallet/broker/auction app aims to accept transfers of NFTs, then it MUST implement the following interface
interface ERC721Receiver is IERC721{
    // Upon receipt of an NFT, returns own function selector
    function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes _data) external returns(bytes4);
}