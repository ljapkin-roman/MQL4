int start(){
   double myMa;
   myMa = iMA(NULL, 0, 30, 0, 0, PRICE_CLOSE, 0);
   Comment("myMa is ", myMa);
   return 0;
}