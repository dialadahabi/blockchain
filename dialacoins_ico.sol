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
        // Mapping
        return equity_dialacoins[investor];
    }
    
    // Getting the equity in USD of an investor.
     function equity_in_usd(address investor) external constant returns (uint) {
        // Mapping
        return equity_usd[investor];
    }
    
    // Buy Dialacoins
    function buy_dialacoins(address investor, uint usd_invested) external 
    can_buy_dialacoins(usd_invested) {
        uint dialacoins_bought = usd_invested * usd_to_dialacoins;
        equity_dialacoins[investor] += dialacoins_bought;
        equity_usd[investor] += equity_dialacoins[investor] / usd_to_dialacoins;
        total_dialacoins_bought += dialacoins_bought;
    }
    
    // Sell Dialacoins
    function sell_dialacoins(address investor, uint dialacoins_to_sell) external {
        equity_dialacoins[investor] -= dialacoins_to_sell;
        equity_usd[investor] = equity_dialacoins[investor] / usd_to_dialacoins;
        total_dialacoins_bought -= dialacoins_to_sell;
    }
}