//+------------------------------------------------------------------+
//|                                          Rapid Price Monitor.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                   https://www.traditycapital.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.traditycapital.com"
#property version   "1.00"
// Define the time interval in seconds
input int TimeIntervalSeconds = 5;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Initialize variables
   double prevPrice = 0.0;
   
   // Main loop
   while (!IsStopped())
     {
      // Get the current price
      double currentPrice = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      
      // Calculate price velocity in percentage
      double priceVelocityPercentage = NormalizeDouble(((currentPrice - prevPrice) / prevPrice) * 100,4);
      
      // Output the result to the Experts tab in MetaTrader
      Print(priceVelocityPercentage, "%");
      
      // Store the current price for the next iteration
      prevPrice = currentPrice;
      
      // Sleep for the specified time interval
      Sleep(TimeIntervalSeconds * 1000);
     }
   
   return(INIT_SUCCEEDED);
  }
