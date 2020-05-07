# PolyHeatMap

A simple SAS macro that computes a polychoric correlation matrix and represents it using a heatmap. 

```
%let url=https://raw.githubusercontent.com/KarlBangChristensen/PolyHeatMap/master;
filename PMH URL "&url/PolyHeatMap.sas";
%include PMH;

%PolyHeatMap(
	dat=SASUSER.CAT, 
	var=hoster slim trykken etage hjemme tryg sover energi);
 ```
