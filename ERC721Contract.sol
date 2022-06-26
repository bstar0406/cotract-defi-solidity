// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './IERC721.sol';
import './IERC721Receiver.sol';
import './IERC721Metadata.sol';
import './IERC165.sol';
import './Address.sol';
import './Context.sol';
import './Strings.sol';

contract myNFT is Context, IERC721, ERC165, IERC721Metadata {

    using Address for address;
    using Strings for uint256;

    string private _name;
    string private _symbol;

    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;
    
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {
        return
            // type()returns the type of the interface, interfaceId property returns the intrerface id of the interface by XORing all its func selectors
            interfaceId == type(IERC721).interfaceId ||
            interfaceId == type(IERC721Metadata).interfaceId ||
            // Calling supportsInterface() of any parent contract
            super.supportsInterface(interfaceId);
    }

    function balanceOf(address owner) public view virtual override returns (address) {
        require(owner != address(0), "Owner cannot be the zero address");
        return _balances[owner];
    }

    function ownerOf(uint256 tokenId) public view virtual override returns (address) {
        // Returns the addr of the addr owning the tokenId
        address owner = _owners[tokenId];
        require(owner != address(0), "Owner cannot be the zero address");
        return owner;
    }

    /// @notice IERC721Metadata implementation

    function name() public view virtual override returns (string memory) {
        return _symbol;
    }

    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    function tokenURI(uint256 tokenId) public virtual override view returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for non-existent token");

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString())) : "";
    }

    function _baseURI() internal view virtual returns (string memory) {
        // The base URI
        return "";
    }

    function approve(address to, uint256 tokenId) public virtual override {
        address owner = ERC721.ownerOf(tokenId);
        require(to != owner, "ERC721: Cannot approve owner");
        require(
            _msgSender() == owner || isApprovedForAll(owner, _msgSender()),
            "ERC721: approver is not owner for approved for all"
        );
        _approve(to, tokenId);
    }

}