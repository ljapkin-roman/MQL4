//+------------------------------------------------------------------+
//|                                                    gamScript.mq4 |
//|                                                          liapkin |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

//| Script program start function                                    |
//+------------------------------------------------------------------+
double BB1=NormalizeDouble(iCustom(NULL,0,"Gambit",2,0),5); // верхняя линия боллинджера для установки тп по баю
double LL=NormalizeDouble(iCustom(NULL,0,"Gambit",4,0),5);  // нижняя линия боллинджера для установки тп по селу
double Prots=0.1;
string Symb=Symbol();

void OnStart()
  {
   double Min_Dist=MarketInfo(Symb,MODE_STOPLEVEL);            //Минимальная дистанция
   double Min_Lot=MarketInfo(Symb,MODE_MINLOT);             //Минимальная стоимость лота
   double Free=AccountFreeMargin();                          //Свободные средства
   double One_Lot=MarketInfo(Symb,MODE_MARGINREQUIRED);      //Стоимость лота
   double Lot=MathFloor(Free*Prots/One_Lot/Min_Lot)*Min_Lot;  //Лоты
   double PriceB=NormalizeDouble(iMA(NULL,0,10,0,0,0,1)+10*Point,5);              //цена покупки
   double PriceC=NormalizeDouble(iMA(NULL,0,10,0,0,0,1)-10*Point,5);              //цена продажи

   double tiket;     
   
   if (iMA(NULL,0,10,0,0,0,0)>iMA(NULL,0,20,0,0,0,0))
   {
      
      tiket=OrderSend(Symb,OP_BUYSTOP, Lot, PriceB,2, iMA(NULL,0,20,0,0,0,0)-10*Point, BB1);
      Comment("MA10 bigger MA20");
   }
   
   if (iMA(NULL,0,10,0,0,0,0)<iMA(NULL,0,20,0,0,0,0))
   {
      tiket=OrderSend(Symb,OP_SELLSTOP, Lot, PriceC,2, iMA(NULL,0,20,0,0,0,0)+10*Point, LL);
   }
}