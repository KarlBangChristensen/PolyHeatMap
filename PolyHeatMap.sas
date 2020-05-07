%macro PolyHeatMap(dat, var); 
  PROC CORR DATA=&dat. polychoric nosimple;* outplc=pc;
    VAR &var.;
    ods output polychoriccorr=pc;
  RUN;
  * stolen from https://blogs.sas.com/content/iml/2014/08/18/heat-map-in-sas.html;
  proc template;              
    define statgraph heatmap;
    dynamic _X _Y _Z _T;      
     begingraph;
     entrytitle _T;           
      layout overlay;
        heatmapparm x=_X y=_Y colorresponse=_Z / 
           name="heatmap" primary=true
           xbinaxis=false ybinaxis=false; 
        continuouslegend "heatmap";
      endlayout;
    endgraph;
    end;
  run;
  proc sgrender data=pc template=Heatmap; 
     dynamic _X='Var' _Y='WithVar' _Z='Corr' _T="Basic Heat Map";
  run;
 %mend PolyHeatMap;