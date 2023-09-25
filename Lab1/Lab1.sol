// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library ArrayUtils {
    // Function to sort an array of integers in ascending order
    function sort(uint[] memory array) internal pure returns (uint[] memory){
        uint[] memory sortedArray = array; // Create a new array
        uint n = sortedArray.length;
        for (uint i = 0; i < n - 1; i++) {
            for (uint j = i + 1; j < n; j++) {
                if (sortedArray[i] > sortedArray[j]) {
                    uint temp = sortedArray[i];
                    sortedArray[i] = sortedArray[j];
                    sortedArray[j] = temp;
                }
            }
        }
        return sortedArray; // Return the new array
    }

    // Function to remove duplicates from an array of integers
    function unique(uint[] memory array) internal pure returns (uint[] memory) {
        uint[] memory uniqueArray = new uint[](array.length); // Create a new array
        uint n = 0;
        for (uint i = 0; i < array.length; i++) {
            bool isDuplicate = false;
            for (uint j = 0; j < n; j++) {
                if (uniqueArray[j] == array[i]) {
                    isDuplicate = true;
                    break;
                }
            }
            if (!isDuplicate) {
                uniqueArray[n] = array[i];
                n++;
            }
        }
        uint[] memory result = new uint[](n);
        for (uint i = 0; i < n; i++) {
            result[i] = uniqueArray[i];
        }
        return result; // Return the new array
    }
}

contract MyContract {
    // Declare an array of integers
    uint[] myArray;

    // Function to add an element to the array
    function addElement(uint element) public {
        myArray.push(element);
    }

    function getArr() public view returns (uint[] memory) {
       return myArray;
    }

    // Function to sort the array using the library
    function sortArray() public returns (uint[] memory){
        myArray = ArrayUtils.sort(myArray);
        return myArray;
    }

    // Function to remove duplicates from the array using the library
    function removeDuplicates() public returns (uint[] memory){
        myArray = ArrayUtils.unique(myArray);
        return myArray;
    }
}
