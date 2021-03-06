//+------------------------------------------------------------------+
//|                                           Test_ScriptByDenis.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012-2020, Vladimir Khlystov"
#property link      "cmillion@narod.ru"
#property strict
#property show_inputs
#property description "Скрипт закрывает заданный процент от позиции на которую его бросили мышью"
extern double Percent = 50;//процент закрытия ордера
extern int slippage = 20;
double MINLOT,MAXLOT;
void OnStart()
  {
//---
   MINLOT = MarketInfo(Symbol(),MODE_MINLOT);
   MAXLOT = MarketInfo(Symbol(),MODE_MAXLOT);
   double Price = NormalizeDouble(WindowPriceOnDropped(),Digits);
   string txt=StringConcatenate("The script removal or closure order ",
   DoubleToStr(Price-slippage*Point,Digits)," - ",
   DoubleToStr(Price+slippage*Point,Digits)," start ",TimeToStr(TimeCurrent(),TIME_DATE|TIME_SECONDS));
   RefreshRates();
   Comment("Orders total ", OrdersTotal());
  }
//+------------------------------------------------------------------+
