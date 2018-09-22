// Dialacoins ICO

contract dialacoin_ico {
    
    // Total number of Dialacoins available for sale.
    uint public max_dialacoins = 1000000;
    
    // USD to Dialacoins conversion rate.
    uint public usd_to_dialacoins = 1000;
    
    // Total number of Dialacoins that have been bought by the investors.
    uint public total_dialacoins_bought = 0;
    
    // Mapping from investor address to its equity in Dialacoins and USD.
    mapping(address => uint) equity_dialacoins;
    mapping(address => uint) equity_usd;
    
    // Check if an investor can buy Dialacoins.
    modifier can_buy_dialacoins(uint usd_invested) {
        require (usd_invested * usd_to_dialacoins + total_dialacoins_bought <= max_dialacoins);
        _;
    }
    
    // Getting the equity in Dialacoins of an investor.
    function equity_in_dialacoins(address investor) external constant returns (uint) {
        return equity_dialacoins[investor];
    }
    
    // Getting the equity in USD of an investor.
     function equity_in_usd(address investor) external constant returns (uint) {
        return equity_usd[investor];
    }
}