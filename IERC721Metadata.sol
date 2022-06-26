// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "IERC165.sol";

// Following is an OPTIONAL functionality for NFT contracts if they want to be more expressive
interface ERC721Metatdata is IERC721 {
    function name() external view returns (string _name);
    function symbol() external view returns (string _symbol);
    // This URI links to a JSON file that confirms to the ERC721 Json schema and provides details about the token
    function tokenURI(uint256 _tokenId) external view returns (string);
}
