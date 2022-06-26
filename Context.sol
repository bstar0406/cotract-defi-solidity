// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Whe dealing with meta-transactions, account sending and account paying for tx may not be the same
// Thus, more secure than just calling msg.sender or msg.value
// Meta tx are those tx that contains the actual tx which was signed by the owner of funds and sent to an operator
// The operator (e.g., NFT controller), takes this signed tx and submits it the network, paying the fees itself
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}