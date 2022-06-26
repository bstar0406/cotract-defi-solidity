pragma solidity ^0.8.0;
import "IERC165.sol";

interface IERC721 is IERC165 {

    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId );
    event Approval (address indexed _from, address indexed _approved, address indexed _tokenId);
    event ApprovalForAll(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);
    
    // Counts and returns all NFTs owned by an address
    function balanceOf(address _owner) external view returns (address);
    // Finds and returns the owner of an NFT
    function ownerOf(uint256 _tokenId) external view returns (address);
    // Transfers NFTs from one address to another, throws if other address can't receive NFT
    // i.e, it is a contarct but doesnt implement the ERC721TokenReceiver interface
    // Throws unless msg.sender is current owner, an authorized operator (e.g., wallet) or the approved address for this NFT
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable;
    // Identical to above function; just sets data param to "" automatically
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external;
    // Transfers NFT but sender must confirm that receiving address is capable of receiving the NFT
    function transferFrom(address _from, address _to, uint256 _tokenId) external;
    // Approve thirdparty to transfer/ handle the NFT
    function approve(address _approved, uint256 _tokenId) external payable;
    // Approve thirdparty to handle/ transfer all NFTs of approver address
    function setApproveForAll(address _operator, bool _approved) external;
    // Returns the approved address for a given NFT
    function getApproved(uint256 _tokenId) external view returns (address);
    // Checks if given address is the approved address for a given address' NFTs
    function isApprovedForAll(address, _owner, address _operator) external view returns (bool);
}
