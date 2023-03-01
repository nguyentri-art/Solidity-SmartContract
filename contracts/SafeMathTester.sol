// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

// những version trước 0.6 hiện tượng unchecked tràng flow sẻ tự động quay lại không báo lỗi, 
// từ những version 0.8 trở đi sẻ thông báo lỗi .

contract SafeMathTester {
    uint8 public bigNumber = 255; // unchecked
    uint8 public smallNumber = 100;

    function add() public {
        bigNumber = bigNumber + 1;
        smallNumber = smallNumber - 1;
    }

}

 
