extern double Level=1.35470;
extern int n=10;
bool Price_is_high = false;
bool Low_price = false;

int start()
{
   double Price=Bid;
   if (Low_price==true)
      return;
      
   if (NormalizeDouble(Price,Digits)>= NormalizeDouble(Level,Digits)) {
      Price_is_high == true;
      Alert("Price has been bigger then Level");
   }
      
   if (Price_is_high==true && NormalizeDouble(Price,Digits) <= NormalizeDouble(Level-n*Point, Digits)) {
      My_alert();
      Alert(" Is station variable Level - n*Point", Level-n*Point); 
   }
   return;
}

void My_alert() {
   Alert("Price is low line now");
   return;
}