//+------------------------------------------------------------------+
//|                                                    gamScript.mq4 |
//|                                                          liapkin |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

//| Script program start function                                    |
//+------------------------------------------------------------------+
double BB1=NormalizeDouble(iCustom(NULL,0,"Gambit",2,0),Digits); // верхняя линия боллинджера для установки тп по баю
double LL=NormalizeDouble(iCustom(NULL,0,"Gambit",4,0),Digits);  // нижняя линия боллинджера для установки тп по селу
double Prots=0.1;
string Symb=Symbol();
double Stoh=iStochastic(NULL,0,5,3,3,MODE_SMA,1,0,0);
void OnStart()
  {
   double Min_Dist=MarketInfo(Symb,MODE_STOPLEVEL);            //Минимальная дистанция
   double Min_Lot=MarketInfo(Symb,MODE_MINLOT);             //Минимальная стоимость лота
   double Free=AccountFreeMargin();                          //Свободные средства
   double One_Lot=MarketInfo(Symb,MODE_MARGINREQUIRED);      //Стоимость лота
  // double Lot=MathFloor(Free*Prots/One_Lot/Min_Lot)*Min_Lot;  //Лоты
   double Lot=1;
   
   double tiket;
   
//установка ордера на покупку   
   if (iMA(NULL,0,10,0,0,0,0)>iMA(NULL,0,20,0,0,0,0)&&Low[2]<Low[1]&&High[2]<High[1]&&Close[1]>iMA(NULL,0,20,0,0,0,0))
   {      
      tiket=OrderSend(Symb,OP_BUY,Lot*Stoh,Ask,0,Low[2]-10*Point,BB1);
      Comment(StringFormat("цена покупки = %G\nTP = %G\nSL = %G\nошибка - %G",Ask,BB1,iMA(NULL,0,20,0,0,0,0)-10*Point));
   }
   
//установка ордера на продажу
   if (iMA(NULL,0,10,0,0,0,0)<iMA(NULL,0,20,0,0,0,0))
   {
      tiket=OrderSend(Symb,OP_SELL,Lot*(100-Stoh),Bid,0,High[2]+10*Point,LL);
      Comment(StringFormat("цена продажи = %G\nTP = %G\nSL = %G\nошибка - %G",Bid,LL,iMA(NULL,0,20,0,0,0,0)+10*Point,GetLastError()));
   }
}