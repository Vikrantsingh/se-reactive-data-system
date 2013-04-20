<div style="visibility:hidden; float:left" >

 <?php  
  // Standard inclusions        
     @include("pChart/pData.class");     
    @include("pChart/pChart.class");     
       
     // Dataset definition      
     $DataSet = new pData;     
//     $DataSet->ImportFromCSV("Sample/bulkdata.csv",",",array(1,2,3),FALSE,0);     
	//////////////////edit from here
	for($i=0;$i<6;$i++) 
	  {  
	   $DataSet->AddPoint(($i*22)%30,"Serie1");  
	   $DataSet->AddPoint(($i*32)%30,"Serie2");  
	   $DataSet->AddPoint(($i*55)%30,"Serie3");  
	   $DataSet->AddPoint(($i*15)%30,"Serie4");  
	   $DataSet->AddPoint(($i*79)%30,"Serie5");  

	  } 
	  
	  
	
	/////////Don't Edit
    $DataSet->AddAllSeries();     
    $DataSet->SetAbsciseLabelSerie();  
	//////////////////edit from here
   
    $DataSet->SetSerieName("Ram","Serie1");     
    $DataSet->SetSerieName("Shyam","Serie2");     
    $DataSet->SetSerieName("Hari","Serie3");     
    $DataSet->SetSerieName("Ravi","Serie3");     
    $DataSet->SetSerieName("Raju","Serie3");     
    $DataSet->SetYAxisName("Present");  
    $DataSet->SetYAxisUnit("days");
    $DataSet->SetXAxisName("Month");  


	  //////////////////
	 $DataSet->AddPoint("Jan","XLabel");  
	 $DataSet->AddPoint("Feb","XLabel");  
	 $DataSet->AddPoint("Mar","XLabel"); 
	 $DataSet->AddPoint("Apr","XLabel"); 
	 $DataSet->AddPoint("May","XLabel"); 
	 $DataSet->AddPoint("Jun","XLabel"); 
//	 $DataSet->AddPoint(array("Jan","Feb","Mar"),"XLabel");
	 $DataSet->SetAbsciseLabelSerie("XLabel"); 
	 $DataSet->RemoveSerie("XLabel"); 



	//$DataSet->SetYAxisFormat("time");  
    //$DataSet->SetXAxisFormat("day");  
	
	
	
	
   	/////////Don't Edit below
    // Initialise the graph     
  /*  $Test = new pChart(700,430);     
    $Test->setFontProperties("Fonts/tahoma.ttf",8);     
    $Test->setGraphArea(70,30,680,200);     
    $Test->drawFilledRoundedRectangle(7,7,693,243,5,240,240,240);     
    $Test->drawRoundedRectangle(5,5,695,245,5,230,230,230);     
    $Test->drawGraphArea(255,255,255,TRUE);  
    $Test->drawScale($DataSet->GetData(),$DataSet->GetDataDescription(),SCALE_NORMAL,150,150,150,TRUE,0,2);     
    $Test->drawGrid(4,TRUE,230,230,230,50);  
    */
	  $Test = new pChart(800,250);     
    $Test->setFontProperties("Fonts/tahoma.ttf",8);     
     $Test->drawGraphAreaGradient(90,90,90,90,TARGET_BACKGROUND);

	$Test->setGraphArea(70,30,680,200);     
	
//    $Test->drawFilledRoundedRectangle(7,7,793,243,5,240,240,240);     
//    $Test->drawFilledRoundedRectangle(7,7,793,243,5,240,255,255);     
  //  $Test->drawRoundedRectangle(5,5,795,245,5,230,230,230);     
//    $Test->drawGraphArea(255,255,255,TRUE);  

 $Test->drawGraphAreaGradient(40,40,40,-50);
 
 
// $Test->setFixedScale($VMin,$VMax,$Divisions=5,$VXMin=0,$VXMin=0,$XDivisions=5)

 $Test->setFixedScale(0,30,5,0,0,5);/////////////index intervals

 $Test->drawScale($DataSet->GetData(),$DataSet->GetDataDescription(),SCALE_NORMAL,255,255,255,TRUE,0,0);
//    $Test->drawScale($DataSet->GetData(),$DataSet->GetDataDescription(),SCALE_NORMAL,150,150,150,TRUE,0,2);     
    $Test->drawGrid(4,TRUE,230,230,230,10);  
    
	
	#  $Test = new pChart(700,230);  
#  $Test->reportWarnings("GD");  
#  $Test->setFixedScale(-12,12);  
#  $Test->setFontProperties("Fonts/tahoma.ttf",8);     
#  $Test->setGraphArea(65,30,570,185);     
#  $Test->drawFilledRoundedRectangle(7,7,693,223,5,240,240,240);     
#  $Test->drawRoundedRectangle(5,5,695,225,5,230,230,230);     
#  $Test->drawGraphArea(255,255,255,TRUE);  
#  $Test->drawScale($DataSet->GetData(),$DataSet->GetDataDescription(),SCALE_NORMAL,150,150,150,TRUE,0,2,TRUE,3);     
#  $Test->drawGrid(4,TRUE,230,230,230,50); 
	
	  
    // Draw the 0 line     
    $Test->setFontProperties("Fonts/tahoma.ttf",6);     
    $Test->drawTreshold(0,143,55,72,TRUE,TRUE);     
      
    // Draw the line graph  
   // $Test->drawLineGraph($DataSet->GetData(),$DataSet->GetDataDescription());     
    //$Test->drawPlotGraph($DataSet->GetData(),$DataSet->GetDataDescription(),3,2,255,255,255);     
	
	
	  // Draw the cubic curve graph  
//  $Test->drawCubicCurve($DataSet->GetData(),$DataSet->GetDataDescription());  


 $Test->setShadowProperties(3,3,0,0,0,30,4);
 $Test->drawCubicCurve($DataSet->GetData(),$DataSet->GetDataDescription());
 $Test->clearShadow();
 $Test->drawFilledCubicCurve($DataSet->GetData(),$DataSet->GetDataDescription(),.1,30);
 $Test->drawPlotGraph($DataSet->GetData(),$DataSet->GetDataDescription(),3,2,255,255,255,true);
 $Test->clearScale();

/*

 $DataSet->RemoveSerie("Serie1");
 $DataSet->AddSerie("Serie2");
 $DataSet->SetYAxisName("Web Hits");
 $Test->drawScale($DataSet->GetData(),$DataSet->GetDataDescription(),SCALE_NORMAL,213,217,221,TRUE,0,0);
 $Test->drawGrid(4,TRUE,230,230,230,10);
 $Test->setShadowProperties(3,3,0,0,0,30,4);
 $Test->drawCubicCurve($DataSet->GetData(),$DataSet->GetDataDescription());
 $Test->clearShadow();
 $Test->drawFilledCubicCurve($DataSet->GetData(),$DataSet->GetDataDescription(),.1,30);
 $Test->drawPlotGraph($DataSet->GetData(),$DataSet->GetDataDescription(),3,2,255,255,255);


*/


//    $Test->drawFilledCubicCurve($DataSet->GetData(),$DataSet->GetDataDescription(),.1,30); 

	 // Set labels  
 // $Test->setFontProperties("Fonts/tahoma.ttf",8);  
//  $Test->setLabel($DataSet->GetData(),$DataSet->GetDataDescription(),"Ram","2","Daily incomes",221,230,174);  
//  $Test->setLabel($DataSet->GetData(),$DataSet->GetDataDescription(),"Serie2","6","Production break",239,233,195);  
   
// Write values on Serie1 & Serie2  
 $Test->setFontProperties("Fonts/tahoma.ttf",8);     
 $Test->writeValues($DataSet->GetData(),$DataSet->GetDataDescription(),"Serie1");  
  $Test->writeValues($DataSet->GetData(),$DataSet->GetDataDescription(),"Serie2");  
   $Test->writeValues($DataSet->GetData(),$DataSet->GetDataDescription(),"Serie3");  
	  /*
    // Finish the graph     
    $Test->setFontProperties("Fonts/tahoma.ttf",8);     
    $Test->drawLegend(700,120,$DataSet->GetDataDescription(),255,255,255);     
    $Test->setFontProperties("Fonts/tahoma.ttf",10);     
    $Test->drawTitle(60,22,"Monthly Attendance",50,50,50,585);     
	*/
	 // Write the title
 $Test->setFontProperties("fonts/MankSans.ttf",16);
 $Test->setShadowProperties(1,1,0,0,0);
 $Test->drawTitle(0,0,"Monthly Attendance",255,255,255,660,30,TRUE);

 $Test->clearShadow();

 $Test->setFontProperties("Fonts/tahoma.ttf",8);     
     $Test->drawLegend(700,20,$DataSet->GetDataDescription(),255,255,255);     	

 // Add an image  
  $Test->drawFromPNG("Sample/logo.png",690,200);  

    $Test->Render("examplev1321.png");        
//    $Test->Stroke("examplev1v.png");
	        
?> 
</div>
Graph <img src="examplev1321.png"  />