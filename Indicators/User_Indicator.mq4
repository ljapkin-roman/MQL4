//+------------------------------------------------------------------+
//|                                                 iFractals_v2.mq4 |
//|                      Copyright © 2011, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#property indicator_chart_window

#property indicator_buffers 3
#property indicator_color1 Blue
#property indicator_color2 Red
#property indicator_width1 1
#property indicator_width2 1

//---- input parameters
extern int P=24;
extern int frctl_zoom=30;
//---- indicator buffers
double Fractal_H[],Fractal_L[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
//---- indicators
   SetIndexBuffer(0,Fractal_H);
   SetIndexStyle(0,DRAW_ARROW);
   SetIndexArrow(0,217);
   SetIndexBuffer(1,Fractal_L);
   SetIndexStyle(1,DRAW_ARROW);
   SetIndexArrow(1,218);
   SetIndexEmptyValue(0,0.0);
   SetIndexEmptyValue(1,0.0);
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start()
  {
   //int    counted_bars=IndicatorCounted();
//----
int i,firstbar,lastbar;
 
firstbar=WindowFirstVisibleBar();
 
if (firstbar<WindowBarsPerChart())
   {
    lastbar=1;
   }
   else
   {
    lastbar=firstbar-WindowBarsPerChart();
   }
//----
for(i=lastbar;i<=firstbar;i++)   
     {
      if (iMA(NULL,0,10,0,0,0,i+1)>iMA(NULL,0,20,0,0,0,i)&&Low[i+1]<Low[i]&&High[i+1]<High[i]&&iMA(NULL,0,10,0,0,0,i)>Close[i]&&Close[i]>iMA(NULL,0,20,0,0,0,i)&&(Close[i+1]+Open[i+1])/2<Close[i]) Fractal_L[i]=Low [i]-Point*frctl_zoom;
      if (iMA(NULL,0,10,0,0,0,i+1)<iMA(NULL,0,20,0,0,0,i)&&Low[i+1]>Low[i]&&High[i+1]>High[i]&&iMA(NULL,0,10,0,0,0,i)<Close[i]&&Close[i]<iMA(NULL,0,20,0,0,0,i)&&(Close[i+1]+Open[i+1])/2>Close[i]) Fractal_H[i]=High[i]+Point*frctl_zoom;
     }
//----
   return(0);
  }
//+-----------------------------------------------------------------------+
      //if (iMA(NULL,0,10,0,0,0,i+1)>iMA(NULL,0,20,0,0,0,i)&&Low[i+1]<Low[i]&&High[i+1]<High[i]&&iMA(NULL,0,10,0,0,0,i)>Close[i]&&Close[i]>iMA(NULL,0,20,0,0,0,i)) Fractal_H[i]=High[i]+Point*frctl_zoom;
      //if (iMA(NULL,0,10,0,0,0,i+1)<iMA(NULL,0,20,0,0,0,i)&&Low[i+1]>Low[i]&&High[i+1]>High[i]&&iMA(NULL,0,10,0,0,0,i)<Close[i]&&Close[i]<iMA(NULL,0,20,0,0,0,i)) Fractal_L[i]=Low [i]-Point*frctl_zoom;