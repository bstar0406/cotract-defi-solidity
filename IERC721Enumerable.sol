pragma solidity ^0.8.0;
import "IERC165.sol";
// Following is OPTIONAL functionality as well, allows NFT contract to publish full list of their NFTs
interface ERC721Enumerable is IERC165 {
    function totalSupply() external view returns (uint256);
    function tokenByIndex(uint256 _index) external view returns (uint256);
    function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256);
}