//+------------------------------------------------------------------+
//|                                                    gamExpert.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double BB1=NormalizeDouble(iCustom(NULL,0,"Gambit",2,0),Digits); // верхняя линия боллинджера для установки тп по баю
double LL=NormalizeDouble(iCustom(NULL,0,"Gambit",4,0),Digits);  // нижняя линия боллинджера для установки тп по селу
double Prots=0.1;
string Symb=Symbol();
double Stoh=iStochastic(NULL,0,5,3,3,MODE_SMA,1,0,0);
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
int OnTick()
  {
  Comment("testy");
  /*
//int    counted_bars=IndicatorCounted();
//----
   double Min_Dist=MarketInfo(Symb,MODE_STOPLEVEL);            //Минимальная дистанция
   double Min_Lot=MarketInfo(Symb,MODE_MINLOT);             //Минимальная стоимость лота
   double Free=AccountFreeMargin();                          //Свободные средства
   double One_Lot=MarketInfo(Symb,MODE_MARGINREQUIRED);      //Стоимость лота
// double Lot=MathFloor(Free*Prots/One_Lot/Min_Lot)*Min_Lot;  //Лоты
   double Lot=1;

   double tiket;
   int i,firstbar,lastbar;
   int    vspread = (int)MarketInfo(NULL,MODE_SPREAD);

   firstbar=WindowFirstVisibleBar();

   if(firstbar<WindowBarsPerChart())
     {
      lastbar=0;
     }
   else
     {
      lastbar=firstbar-WindowBarsPerChart();
     }
//----
   for(i=lastbar; i<=firstbar; i++)
     {
      if(iMA(NULL,0,10,0,0,0,i+1)>iMA(NULL,0,20,0,0,0,i+1)&&Low[i+1]<Low[i]&&High[i+1]<High[i]&&iMA(NULL,0,10,0,0,0,i)>Close[i]&&Close[i]>iMA(NULL,0,20,0,0,0,i)&&(Close[i+1]+Open[i+1])/2<Close[i])
        {
         tiket=OrderSend(Symb,OP_BUY,Lot*Stoh,Ask,0,Low[2]-10*Point,BB1);
         Comment(StringFormat("цена покупки = %G\nTP = %G\nSL = %G\nошибка - %G",Ask,BB1,iMA(NULL,0,20,0,0,0,0)-10*Point));
        }
      if(iMA(NULL,0,10,0,0,0,i+1)<iMA(NULL,0,20,0,0,0,i+1)&&Low[i+1]>Low[i]&&High[i+1]>High[i]&&iMA(NULL,0,10,0,0,0,i)<Close[i]&&Close[i]<iMA(NULL,0,20,0,0,0,i)&&(Close[i+1]+Open[i+1])/2>Close[i])
        {
         tiket=OrderSend(Symb,OP_SELL,Lot*(100-Stoh),Bid,0,High[2]+10*Point,LL);
         Comment(StringFormat("цена продажи = %G\nTP = %G\nSL = %G\nошибка - %G",Bid,LL,iMA(NULL,0,20,0,0,0,0)+10*Point,GetLastError()));
        }
     }
//----
   Comment("our spread ", vspread);*/
   return(0);
  }
//+------------------------------------------------------------------+
