<%@ page language="C#" autoeventwireup="true" inherits="Kra_KraDoc_Imagedelete, App_Web_l9bhfzmo" %>

<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Untitled Page</title>
    <!--External Scripts file-->
    <!--Other Script-->

    <script type="text/javascript" src="../CentralData/JSScript/jquery-1.7.2.min.js"></script>

    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>

    <link type="text/css" href="../CentralData/CSS/GenericCss.css" rel="Stylesheet" />

      <script type="text/javascript" src="../KRA/JS/lightbox.js"></script>

    <link type="text/css" href="../KRA/CSS/lightbox.css" rel="stylesheet" />

    <script language="javascript" type="text/javascript">

 
         
  
var counter=0;
var staticimagecount=0;
FieldName='last';
    function SignOff()
    {
        window.parent.SignOff();
       
    }
    
function imageanchorset(obj,docname)
    { 
            if (obj.split('~')[0]!='none')
            {
                        if(obj.split('~')[0]=="No Image")
                        {
                            GetObjectID('img1').src="../CentralData/Images/noimage.jpg";
                            GetObjectID('a1').href="../CentralData/Images/noimage.jpg";
                            GetObjectID('a1').title="No Image Available";
                            GetObjectID('S1').innerHTML="No Image Available";
                        }
                        else
                        {
                            GetObjectID('img1').src="../Kra/KRADOC/"+obj.split('~')[0];
                            GetObjectID('a1').href="../Kra/KRADOC/"+obj.split('~')[0];
                            GetObjectID('a1').title=docname.split('~')[0];
                            GetObjectID('S1').innerHTML=docname.split('~')[0];
                        }
                        GetObjectID('a1').rel="lightbox[roadtrip]";
               
                        GetObjectID('su1').style.display='inline';
                        GetObjectID('err1').style.display='none';
                        SetStyle("S1","Color","317A00");
                    
                 
                       if(obj.split('~')[0]=="No Image")
                                    {
                                        GetObjectID('su1').style.display='none';
                                        GetObjectID('err1').style.display='none';
                                        SetStyle('S1','Color','Maroon');
                                    
                                    }  
                
                    if (obj.split('~')[1]!=undefined)
                    {
                        //GetObjectID('divtest2').style.setAttribute("marginLeft","50px", false);
                        if(obj.split('~')[1]=="No Image")
                        {
                            GetObjectID('img2').src="../CentralData/Images/noimage.jpg";
                            GetObjectID('a2').href="../CentralData/Images/noimage.jpg";
                            GetObjectID('a2').title="No Image Available";
                            GetObjectID('S2').innerHTML="No Image Available";
                        }
                        else
                        {
                            GetObjectID('img2').src="../Kra/KRADOC/"+obj.split('~')[1];
                            GetObjectID('a2').href="../Kra/KRADOC/"+obj.split('~')[1];
                            GetObjectID('a2').title=docname.split('~')[1];
                            GetObjectID('S2').innerHTML=docname.split('~')[1];
                        }
                        GetObjectID('a2').rel="lightbox[roadtrip]";
                        
                        
                                GetObjectID('su2').style.display='inline';
                                GetObjectID('err2').style.display='none';
                                SetStyle("S2","Color","317A00");
                           
                                if(obj.split('~')[1]=="No Image")
                                    {
                                        GetObjectID('su2').style.display='none';
                                        GetObjectID('err2').style.display='none';
                                        SetStyle('S2','Color','Maroon');
                                    
                                    }
                        
                    }
                    else
                    {
                        HideShow('row1_col2','H');
                        HideShow('row1_col3','H');
                        HideShow('row2_col1','H');
                        HideShow('row2_col2','H');
                        HideShow('row2_col3','H');
                        HideShow('row3_col1','H');
                        HideShow('row3_col2','H');
                        HideShow('row3_col3','H');
                        GetObjectID('su2').style.display='none';
                        GetObjectID('err2').style.display='none';
                    }
                    if (obj.split('~')[2]!=undefined)
                    {
                        
                        if(obj.split('~')[2]=="No Image")
                        {
                            GetObjectID('img3').src="../CentralData/Images/noimage.jpg";
                            GetObjectID('a3').href="../CentralData/Images/noimage.jpg";
                            GetObjectID('a3').title="No Image Available";
                            GetObjectID('S3').innerHTML="No Image Available";
                        }
                        else
                        {
                            GetObjectID('img3').src="../Kra/KRADOC/"+obj.split('~')[2];
                            GetObjectID('a3').href="../Kra/KRADOC/"+obj.split('~')[2];
                            GetObjectID('a3').title=docname.split('~')[2];
                            GetObjectID('S3').innerHTML=docname.split('~')[2];
                        }
                        GetObjectID('a3').rel="lightbox[roadtrip]";
                       
                                GetObjectID('su3').style.display='inline';
                                GetObjectID('err3').style.display='none';
                                SetStyle("S3","Color","317A00");
                           
                                if(obj.split('~')[2]=="No Image")
                                    {
                                        GetObjectID('su3').style.display='none';
                                        GetObjectID('err3').style.display='none';
                                        SetStyle('S3','Color','Maroon');
                                    
                                    }
                        
                    }
                    else
                    {
                        HideShow('row1_col3','H');
                        HideShow('row2_col1','H');
                        HideShow('row2_col2','H');
                        HideShow('row2_col3','H');
                        HideShow('row3_col1','H');
                        HideShow('row3_col2','H');
                        HideShow('row3_col3','H');
                        GetObjectID('su3').style.display='none';
                        GetObjectID('err3').style.display='none';
                    }
                    if (obj.split('~')[3]!=undefined)
                    {
                        
                        if(obj.split('~')[3]=="No Image")
                        {
                            GetObjectID('img4').src="../CentralData/Images/noimage.jpg";
                            GetObjectID('a4').href="../CentralData/Images/noimage.jpg";
                            GetObjectID('a4').title="No Image Available";
                            GetObjectID('S4').innerHTML="No Image Available";
                        }
                        else
                        {
                            GetObjectID('img4').src="../Kra/KRADOC/"+obj.split('~')[3];
                            GetObjectID('a4').href="../Kra/KRADOC/"+obj.split('~')[3];
                            GetObjectID('a4').title=docname.split('~')[3];
                            GetObjectID('S4').innerHTML=docname.split('~')[3];
                        }
                        GetObjectID('a4').rel="lightbox[roadtrip]";
                       
                                GetObjectID('su4').style.display='inline';
                                GetObjectID('err4').style.display='none';
                                SetStyle("S4","Color","317A00");
                            
                                if(obj.split('~')[3]=="No Image")
                                    {
                                        GetObjectID('su4').style.display='none';
                                        GetObjectID('err4').style.display='none';
                                        SetStyle('S4','Color','Maroon');
                                    
                                    }
                        
                    }
                    else
                    {
                        HideShow('row2_col1','H');
                        HideShow('row2_col2','H');
                        HideShow('row2_col3','H');
                        HideShow('row3_col1','H');
                        HideShow('row3_col2','H');
                        HideShow('row3_col3','H');
                        GetObjectID('su4').style.display='none';
                        GetObjectID('err4').style.display='none';
                    }
                    if (obj.split('~')[4]!=undefined)
                    {
                    
                        if(obj.split('~')[4]=="No Image")
                        {
                            GetObjectID('img5').src="../CentralData/Images/noimage.jpg";
                            GetObjectID('a5').href="../CentralData/Images/noimage.jpg";
                            GetObjectID('a5').title="No Image Available";
                            GetObjectID('S5').innerHTML="No Image Available";
                        }
                        else
                        {
                            GetObjectID('img5').src="../Kra/KRADOC/"+obj.split('~')[4];
                            GetObjectID('a5').href="../Kra/KRADOC/"+obj.split('~')[4];
                            GetObjectID('a5').title=docname.split('~')[4];
                            GetObjectID('S5').innerHTML=docname.split('~')[4];
                        }
                        GetObjectID('a5').rel="lightbox[roadtrip]";
                        
                                GetObjectID('su5').style.display='inline';
                                GetObjectID('err5').style.display='none';
                                SetStyle("S5","Color","317A00");
                           
                                if(obj.split('~')[4]=="No Image")
                                    {
                                        GetObjectID('su5').style.display='none';
                                        GetObjectID('err5').style.display='none';
                                        SetStyle('S5','Color','Maroon');
                                    
                                    }
                    }
                    else
                    {
                        HideShow('row2_col2','H');
                        HideShow('row2_col3','H');
                        HideShow('row3_col1','H');
                        HideShow('row3_col2','H');
                        HideShow('row3_col3','H');
                        GetObjectID('su5').style.display='none';
                        GetObjectID('err5').style.display='none';
                    }
                    if (obj.split('~')[5]!=undefined)
                    {
                        if(obj.split('~')[5]=="No Image")
                        {
                            GetObjectID('img6').src="../CentralData/Images/noimage.jpg";
                            GetObjectID('a6').href="../CentralData/Images/noimage.jpg";
                            GetObjectID('a6').title="No Image Available";
                            GetObjectID('S6').innerHTML="No Image Available";
                        }
                        else
                        {
                            GetObjectID('img6').src="../Kra/KRADOC/"+obj.split('~')[5];
                            GetObjectID('a6').href="../Kra/KRADOC/"+obj.split('~')[5];
                            GetObjectID('a6').title=docname.split('~')[5];
                            GetObjectID('S6').innerHTML=docname.split('~')[5];
                        }
                        
                        GetObjectID('a6').rel="lightbox[roadtrip]";
                        
                      
                       
                                GetObjectID('su6').style.display='inline';
                                GetObjectID('err6').style.display='none';
                                SetStyle('S6','Color','317A00');
                            
                                if(obj.split('~')[5]=="No Image")
                                    {
                                        GetObjectID('su6').style.display='none';
                                        GetObjectID('err6').style.display='none';
                                        SetStyle('S6','Color','Maroon');
                                    
                                    }
                                
                        
                    }
                    else
                    {
                        HideShow('row2_col3','H');
                        HideShow('row3_col1','H');
                        HideShow('row3_col2','H');
                        HideShow('row3_col3','H');
                        GetObjectID('su6').style.display='none';
                        GetObjectID('err6').style.display='none';
                    }
                    
                    
                    
                    
                    if (obj.split('~')[6]!=undefined)
                    {
                        
                        if(obj.split('~')[6]=="No Image")
                        {
                            GetObjectID('img7').src="../CentralData/Images/noimage.jpg";
                            GetObjectID('a7').href="../CentralData/Images/noimage.jpg";
                            GetObjectID('a7').title="No Image Available";
                            GetObjectID('S7').innerHTML="No Image Available";
                        }
                        else
                        {
                            GetObjectID('img7').src="../Kra/KRADOC/"+obj.split('~')[6];
                            GetObjectID('a7').href="../Kra/KRADOC/"+obj.split('~')[6];
                            GetObjectID('a7').title=docname.split('~')[6];
                            GetObjectID('S7').innerHTML=docname.split('~')[6];
                        }
                        GetObjectID('a7').rel="lightbox[roadtrip]";
                       
                                GetObjectID('su7').style.display='inline';
                                GetObjectID('err7').style.display='none';
                                SetStyle('S7','Color','317A00');
                           
                                 if(obj.split('~')[6]=="No Image")
                                    {
                                        GetObjectID('su7').style.display='none';
                                        GetObjectID('err7').style.display='none';
                                        SetStyle('S7','Color','Maroon');
                                    
                                    }
                        
                    }
                    else
                    {
                        
                        HideShow('row3_col1','H');
                        HideShow('row3_col2','H');
                        HideShow('row3_col3','H');
                        GetObjectID('su7').style.display='none';
                        GetObjectID('err7').style.display='none';
                    }
                    if (obj.split('~')[7]!=undefined)
                    {
                        if(obj.split('~')[7]=="No Image")
                        {
                            GetObjectID('img8').src="../CentralData/Images/noimage.jpg";
                            GetObjectID('a8').href="../CentralData/Images/noimage.jpg";
                            GetObjectID('a8').title="No Image Available";
                            GetObjectID('S8').innerHTML="No Image Available";
                        }
                        else
                        {
                            GetObjectID('img8').src="../Kra/KRADOC/"+obj.split('~')[7];
                            GetObjectID('a8').href="../Kra/KRADOC/"+obj.split('~')[7];
                            GetObjectID('a8').title=docname.split('~')[7];
                            GetObjectID('S8').innerHTML=docname.split('~')[7];
                        }
                        GetObjectID('a8').rel="lightbox[roadtrip]";
                        
                                GetObjectID('su8').style.display='inline';
                                GetObjectID('err8').style.display='none';
                                SetStyle('S8','Color','317A00');
                           
                                if(obj.split('~')[7]=="No Image")
                                    {
                                        GetObjectID('su8').style.display='none';
                                        GetObjectID('err8').style.display='none';
                                        SetStyle('S8','Color','Maroon');
                                    
                                    }
                        
                    }
                    else
                    {
                        
                        
                        HideShow('row3_col2','H');
                        HideShow('row3_col3','H');
                        GetObjectID('su8').style.display='none';
                        GetObjectID('err8').style.display='none';
                    }
                     if (obj.split('~')[8]!=undefined)
                    {
                        if(obj.split('~')[7]=="No Image")
                        {
                            GetObjectID('img9').src="../CentralData/Images/noimage.jpg";
                            GetObjectID('a9').href="../CentralData/Images/noimage.jpg";
                            GetObjectID('a9').title="No Image Available";
                            GetObjectID('S9').innerHTML="No Image Available";
                        }
                        else
                        {
                            GetObjectID('img9').src="../Kra/KRADOC/"+obj.split('~')[8];
                            GetObjectID('a9').href="../Kra/KRADOC/"+obj.split('~')[8];
                            GetObjectID('a9').title=docname.split('~')[8];
                            GetObjectID('S9').innerHTML=docname.split('~')[8];
                        }
                        GetObjectID('a9').rel="lightbox[roadtrip]";
                        
                                GetObjectID('su9').style.display='inline';
                                GetObjectID('err9').style.display='none';
                                SetStyle('S9','Color','317A00');
                           
                                if(obj.split('~')[8]=="No Image")
                                    {
                                        GetObjectID('su9').style.display='none';
                                        GetObjectID('err9').style.display='none';
                                        SetStyle('S9','Color','Maroon');
                                    
                                    }
                        
                    }
                    else
                    {
                        
                        
                        
                        HideShow('row3_col3','H');
                        GetObjectID('su9').style.display='none';
                        GetObjectID('err9').style.display='none';
                    }
             }
             
             
             
         else
            {
                HideShow('divmain','H');
                alert('No Such Image Present  !!');
                parent.editwin.close();
            }
         if((obj.split('~')[0]=="No Image") || (obj.split('~')[1]=="No Image") ||(obj.split('~')[2]=="No Image") ||(obj.split('~')[3]=="No Image") ||(obj.split('~')[4]=="No Image") ||(obj.split('~')[5]=="No Image") ||(obj.split('~')[6]=="No Image") ||(obj.split('~')[7]=="No Image") ||(obj.split('~')[8]=="No Image") )
            {
                
                btnok.SetEnabled(false);
                //HideShow('row5_col1','S');
            }
            else
            {
                btnok.SetEnabled(true);
                //HideShow('row5_col1','H');
            }
            //btnproceed.SetEnabled(false);
            btnok.SetEnabled(false);
            HideShow('row5_col2','S');
            
    
    }
    function changevalueandpicture(val)
    {
        
        
        if (val=="err1")   
        { 
           // GetObjectID('divtest').style.display='none';
            GetObjectID('su1').style.display='inline';
            GetObjectID('err1').style.display='none';
            SetStyle('S1','Color','317A00');
            //GetObjectID('divtest2').style.setAttribute("marginLeft","0px", false);
           
            counter=counter+1;
         }
        if (val=="su1")
        {
            
            GetObjectID('su1').style.display='none';
            GetObjectID('err1').style.display='inline';
            SetStyle('S1','Color','Red');
            //GetObjectID('divtest2').style.setAttribute("marginLeft","0px", false);
            //cCbpSuggestdocument.PerformCallback("img~su1");
            if (counter!="0")
                counter=counter-1
            else
                counter;
           
            
        }
        if (val=="err2")
        {
            GetObjectID('su2').style.display='inline';
            GetObjectID('err2').style.display='none';
            SetStyle('S2','Color','317A00');
            counter=counter+1;
            
            
        }
        if (val=="su2")
        {
            GetObjectID('su2').style.display='none';
            GetObjectID('err2').style.display='inline';
            SetStyle('S2','Color','Red');
             if (counter!="0")
                counter=counter-1
             else
                counter;
         }
        if (val=="err3")
        {
            GetObjectID('su3').style.display='inline';
            GetObjectID('err3').style.display='none';
            SetStyle('S3','Color','317A00');
            counter=counter+1;
            
            
        }
        if (val=="su3")
        {
            GetObjectID('su3').style.display='none';
            GetObjectID('err3').style.display='inline';
            SetStyle('S3','Color','Red');
             if (counter!="0")
                counter=counter-1
             else
                counter;
            
            
        }
        if (val=="err4")
        {
            GetObjectID('su4').style.display='inline';
            GetObjectID('err4').style.display='none';
            SetStyle('S4','Color','317A00');
            counter=counter+1;
            
        }
        if (val=="su4")
        {
            GetObjectID('su4').style.display='none';
            GetObjectID('err4').style.display='inline';
            SetStyle('S4','Color','Red');
             if (counter!="0")
                counter=counter-1
             else
                counter;
            
        }
        if (val=="err5")
        {
            GetObjectID('su5').style.display='inline';
            GetObjectID('err5').style.display='none';
            SetStyle('S5','Color','317A00');
            counter=counter+1;
            
        }
        if (val=="su5")
        {
            GetObjectID('su5').style.display='none';
            GetObjectID('err5').style.display='inline';
            SetStyle('S5','Color','Red');
            if (counter!="0")
             counter=counter-1
            else
              counter;
            
        }
        if (val=="err6")
        {
            GetObjectID('su6').style.display='inline';
            GetObjectID('err6').style.display='none';
            SetStyle('S6','Color','317A00');
            counter=counter+1;
            
        }
        if (val=="su6")
        {
            GetObjectID('su6').style.display='none';
            GetObjectID('err6').style.display='inline';
            SetStyle('S6','Color','Red');
             if (counter!="0")
                counter=counter-1
             else
                counter;
            
        }
        
        
        if (val=="err7")
        {
            GetObjectID('su7').style.display='inline';
            GetObjectID('err7').style.display='none';
            SetStyle('S7','Color','317A00');
            counter=counter+1;
            
        }
        if (val=="su7")
        {
            GetObjectID('su7').style.display='none';
            GetObjectID('err7').style.display='inline';
            SetStyle('S7','Color','Red');
             if (counter!="0")
                counter=counter-1
             else
                counter;
            
        }
        
        if (val=="err8")
        {
            GetObjectID('su8').style.display='inline';
            GetObjectID('err8').style.display='none';
            SetStyle('S8','Color','317A00');
            counter=counter+1;
            
        }
        if (val=="su8")
        {
            GetObjectID('su8').style.display='none';
            GetObjectID('err8').style.display='inline';
            SetStyle('S8','Color','Red');
             if (counter!="0")
                counter=counter-1
             else
                counter;
            
        }
        
        if (val=="err9")
        {
            GetObjectID('su9').style.display='inline';
            GetObjectID('err9').style.display='none';
            SetStyle('S9','Color','317A00');
            counter=counter+1;
            
        }
        if (val=="su9")
        {
            GetObjectID('su9').style.display='none';
            GetObjectID('err9').style.display='inline';
            SetStyle('S9','Color','Red');
             if (counter!="0")
                counter=counter-1
             else
                counter;
            
        }
        
        if ((GetObjectID('err1').style.display=='inline')|| (GetObjectID('err2').style.display=='inline')||(GetObjectID('err3').style.display=='inline')||(GetObjectID('err4').style.display=='inline')||(GetObjectID('err5').style.display=='inline')||(GetObjectID('err6').style.display=='inline')||(GetObjectID('err7').style.display=='inline')||(GetObjectID('err8').style.display=='inline')||(GetObjectID('err9').style.display=='inline'))
        {
             btnok.SetEnabled(true);
             HideShow('row5_col2','H');
        }
        else
        {
             HideShow('row5_col2','S');
             btnok.SetEnabled(false);
         }
        
        
    }
    function height()
    {
        if(document.body.scrollHeight>=300)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '300px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    
  function btncancel_Click()
    {
    parent.editwin.close();
    }
   function btnproceed_Click()
    {
    var verify=GetObjectID('<%=B_cpverifieddoc.ClientID %>').innerHTML;
    var totaldoc=GetObjectID('<%=B_cptotaldoc.ClientID %>').innerHTML;
    cCbpSuggestdocument.PerformCallback("proceed~"+verify+"~"+totaldoc);
    
    }
    function btnok_Click()
     {
        var incrementerrorimage="";
        var counter1="";
//        for (var pom=0;pom<staticimagecount; pom++)
//        {
                if (GetObjectID('err1').style.display!='none')
                {
                    if (incrementerrorimage=="")
                        incrementerrorimage="err1";
                     else
                        incrementerrorimage=incrementerrorimage+"$"+"err1";
                 }
             
            if (GetObjectID('err2').style.display!='none')
             {
                if (incrementerrorimage=="")
                    incrementerrorimage="err2";
                 else
                    incrementerrorimage=incrementerrorimage+"$"+"err2";
               }
            if (GetObjectID('err3').style.display!='none')
              {
                if (incrementerrorimage=="")
                    incrementerrorimage="err3";
                 else
                    incrementerrorimage=incrementerrorimage+"$"+"err3";
              }
              if (GetObjectID('err4').style.display!='none')
              {
                if (incrementerrorimage=="")
                    incrementerrorimage="err4";
                 else
                    incrementerrorimage=incrementerrorimage+"$"+"err4";
              }
              if (GetObjectID('err5').style.display!='none')
              {
                if (incrementerrorimage=="")
                    incrementerrorimage="err5";
                 else
                    incrementerrorimage=incrementerrorimage+"$"+"err5";
              }
              
                  if (GetObjectID('err6').style.display!='none')
                  {
                    if (incrementerrorimage=="")
                        incrementerrorimage="err6";
                     else
                        incrementerrorimage=incrementerrorimage+"$"+"err6";
                  }
              
              
              if (GetObjectID('err7').style.display!='none')
              {
                if (incrementerrorimage=="")
                    incrementerrorimage="err7";
                 else
                    incrementerrorimage=incrementerrorimage+"$"+"err7";
              }
              if (GetObjectID('err8').style.display!='none')
              {
                if (incrementerrorimage=="")
                    incrementerrorimage="err8";
                 else
                    incrementerrorimage=incrementerrorimage+"$"+"err8";
              }
              if (GetObjectID('err9').style.display!='none')
              {
                if (incrementerrorimage=="")
                    incrementerrorimage="err9";
                 else
                    incrementerrorimage=incrementerrorimage+"$"+"err9";
              }
        //}
        if (incrementerrorimage!="")
        counter1=incrementerrorimage.split('$').length;
        else
        counter1=0;
        
          cCbpSuggestdocument.PerformCallback("openpopup~"+counter1+"~"+incrementerrorimage);
     }
    function btncancelpopup_Click()
        {
        cPopUp_ScripAlert.Hide();
        }
     function CbpSuggestdocument_EndCallBack()
        {
            if ((cCbpSuggestdocument.cptotaldoc != null) && (cCbpSuggestdocument.cpverifieddoc != null))
            {
                
                GetObjectID('<%=B_cptotaldoc.ClientID %>').innerHTML=cCbpSuggestdocument.cptotaldoc;
                GetObjectID('<%=B_cpverifieddoc.ClientID %>').innerHTML=cCbpSuggestdocument.cpverifieddoc;
                if (GetObjectID('<%=B_cpverifieddoc.ClientID %>').innerHTML=='0')
                {
                
                    GetObjectID('row3_col1pop').style.display='none';
                    GetObjectID('row4_col1pop').style.display='inline';
                    

                    
                 }
                 else
                 {
                      GetObjectID('row3_col1pop').style.display='inline';
                    GetObjectID('row4_col1pop').style.display='none';
                    

                 }
                    cPopUp_ScripAlert.Show();
             }  
             if (cCbpSuggestdocument.cpupdatedoc != null)
             {
                cPopUp_ScripAlert.Hide();
                parent.editwin.close();
             }
            
        }
      
    

    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: ButtonFace">
    <form id="form1" runat="server">
        <div>
            <div style="margin-left: 50px; padding: 5px;" id="divmain">
                <div class="left" id="divtest">
                    <div>
                        <div style="float: left; margin-left: 20px;">
                            <img id="su1" onclick="changevalueandpicture('su1')" alt="" src="../CentralData/Images/docexists.png"
                                title="Select To Delete" style="cursor: pointer;" height="18px" width="18px" />
                        </div>
                        <div style="float: left;">
                            <img id="err1" alt="" src="../CentralData/Images/docdelete.png" onclick="changevalueandpicture('err1')"
                                title="Select To Undelete" height="18px" style="cursor: pointer;" width="18px" />
                        </div>
                    </div>
                    <br class="clear" />
                    <div style="float: left; width: 150px; margin-left: 20px;" id="row1_col1">
                        <a id="a1">
                            <img id="img1" width="150px" height="100px" style="border: 1px solid Teal;" alt="" />
                            <span id="S1" style="font-size: 12px; font-family: Arial; font-weight: bold;"></span>
                        </a>
                    </div>
                </div>
                <div class="left" style="margin-left: 50px;" id="divtest2">
                    <div>
                        <div style="float: left; margin-left: 20px;">
                            <img id="su2" alt="" src="../CentralData/Images/docexists.png" style="cursor: pointer;"
                                onclick="changevalueandpicture('su2')" title="Select To Delete" height="18px"
                                width="18px" />
                        </div>
                        <div style="float: left;">
                            <img id="err2" alt="" src="../CentralData/Images/docdelete.png" style="cursor: pointer;"
                                onclick="changevalueandpicture('err2')" title="Select To Undelete" height="18px"
                                width="18px" />
                        </div>
                    </div>
                    <br class="clear" />
                    <div style="float: left; width: 150px; margin-left: 20px;" id="row1_col2">
                        <a id="a2">
                            <img id="img2" width="150px" height="100px" style="border: 1px solid Teal;" alt="" />
                            <span id="S2" style="font-size: 12px; font-family: Arial; font-weight: bold"></span>
                        </a>
                    </div>
                </div>
                <div class="left" style="margin-left: 50px;">
                    <div>
                        <div style="float: left; margin-left: 20px;">
                            <img id="su3" alt="" src="../CentralData/Images/docexists.png" style="cursor: pointer;"
                                onclick="changevalueandpicture('su3')" title="Select To Delete" height="18px"
                                width="18px" />
                        </div>
                        <div style="float: left;">
                            <img id="err3" alt="" src="../CentralData/Images/docdelete.png" title="Select To Undelete"
                                height="18px" style="cursor: pointer;" onclick="changevalueandpicture('err3')"
                                width="18px" />
                        </div>
                    </div>
                    <br class="clear" />
                    <div id="row1_col3" style="width: 150px; margin-left: 20px;">
                        <a id="a3">
                            <img id="img3" width="150px" height="100px" style="border: 1px solid Teal;" alt="" />
                            <span id="S3" style="font-size: 12px; font-family: Arial; font-weight: bold"></span>
                        </a>
                    </div>
                </div>
                <br class="clear" />
                <div class="left">
                    <div>
                        <div style="float: left; margin-left: 20px;">
                            <img id="su4" alt="" src="../CentralData/Images/docexists.png" title="Select To Delete"
                                height="18px" style="cursor: pointer;" onclick="changevalueandpicture('su4')"
                                width="18px" />
                        </div>
                        <div style="float: left;">
                            <img id="err4" alt="" src="../CentralData/Images/docdelete.png" title="Select To Undelete"
                                height="18px" style="cursor: pointer;" onclick="changevalueandpicture('err4')"
                                width="18px" />
                        </div>
                    </div>
                    <br class="clear" />
                    <div style="float: left; width: 150px; margin-left: 20px;" id="row2_col1">
                        <a id="a4">
                            <img id="img4" width="150px" height="100px" style="border: 1px solid Teal;" alt="" />
                            <span id="S4" style="font-size: 12px; font-family: Arial; font-weight: bold"></span>
                        </a>
                    </div>
                </div>
                <div class="left" style="margin-left: 50px;">
                    <div>
                        <div style="float: left; margin-left: 20px;">
                            <img id="su5" alt="" src="../CentralData/Images/docexists.png" title="Select To Delete"
                                height="18px" style="cursor: pointer;" onclick="changevalueandpicture('su5')"
                                width="18px" />
                        </div>
                        <div style="float: left;">
                            <img id="err5" alt="" src="../CentralData/Images/docdelete.png" title="Select To Undelete"
                                height="18px" style="cursor: pointer;" onclick="changevalueandpicture('err5')"
                                width="18px" />
                        </div>
                    </div>
                    <br class="clear" />
                    <div style="float: left; width: 150px; margin-left: 20px;" id="row2_col2">
                        <a id="a5">
                            <img id="img5" width="150px" height="100px" style="border: 1px solid Teal;" alt="" />
                            <span id="S5" style="font-size: 12px; font-family: Arial; font-weight: bold"></span>
                        </a>
                    </div>
                </div>
                <div class="left" style="margin-left: 50px;">
                    <div>
                        <div style="float: left; margin-left: 20px;">
                            <img id="su6" alt="" src="../CentralData/Images/docexists.png" title="Select To Delete"
                                height="18px" style="cursor: pointer;" onclick="changevalueandpicture('su6')"
                                width="18px" />
                        </div>
                        <div style="float: left;">
                            <img id="err6" alt="" src="../CentralData/Images/docdelete.png" title="Select To Undelete"
                                height="18px" style="cursor: pointer;" onclick="changevalueandpicture('err6')"
                                width="18px" />
                        </div>
                    </div>
                    <br class="clear" />
                    <div id="row2_col3" style="width: 150px; margin-left: 20px;">
                        <a id="a6">
                            <img id="img6" width="150px" height="100px" style="border: 1px solid Teal;" alt="" />
                            <span id="S6" style="font-size: 12px; font-family: Arial; font-weight: bold"></span>
                        </a>
                    </div>
                </div>
                <br class="clear" />
                <div class="left">
                    <div>
                        <div style="float: left; margin-left: 20px;">
                            <img id="su7" alt="" src="../CentralData/Images/docexists.png" style="cursor: pointer;"
                                onclick="changevalueandpicture('su7')" title="Select To Delete" height="18px"
                                width="18px" />
                        </div>
                        <div style="float: left;">
                            <img id="err7" alt="" src="../CentralData/Images/docdelete.png" style="cursor: pointer;"
                                onclick="changevalueandpicture('err7')" title="Select To Undelete" height="18px"
                                width="18px" />
                        </div>
                    </div>
                    <br class="clear" />
                    <div style="float: left; width: 150px; margin-left: 20px;" id="row3_col1">
                        <a id="a7">
                            <img id="img7" width="150px" height="100px" style="border: 1px solid Teal;" alt="" />
                            <span id="S7" style="font-size: 12px; font-family: Arial; font-weight: bold"></span>
                        </a>
                    </div>
                </div>
                <div class="left" style="margin-left: 50px;">
                    <div>
                        <div style="float: left; margin-left: 20px;">
                            <img id="su8" alt="" src="../CentralData/Images/docexists.png" style="cursor: pointer;"
                                onclick="changevalueandpicture('su8')" title="Select To Delete" height="18px"
                                width="18px" />
                        </div>
                        <div style="float: left;">
                            <img id="err8" alt="" src="../CentralData/Images/docdelete.png" style="cursor: pointer;"
                                onclick="changevalueandpicture('err8')" title="Select To Undelete" height="18px"
                                width="18px" />
                        </div>
                    </div>
                    <br class="clear" />
                    <div style="float: left; width: 150px; margin-left: 20px;" id="row3_col2">
                        <a id="a8">
                            <img id="img8" width="150px" height="100px" style="border: 1px solid Teal;" alt="" />
                            <span id="S8" style="font-size: 12px; font-family: Arial; font-weight: bold"></span>
                        </a>
                    </div>
                </div>
                <div class="left" style="margin-left: 50px;">
                    <div>
                        <div style="float: left; margin-left: 20px;">
                            <img id="su9" alt="" src="../CentralData/Images/docexists.png" title="Select To Delete"
                                height="18px" style="cursor: pointer;" onclick="changevalueandpicture('su9')"
                                width="18px" />
                        </div>
                        <div style="float: left;">
                            <img id="err9" alt="" src="../CentralData/Images/docdelete.png" title="Select To Undelete"
                                height="18px" style="cursor: pointer;" onclick="changevalueandpicture('err9')"
                                width="18px" />
                        </div>
                    </div>
                    <br class="clear" />
                    <div id="row3_col3" style="width: 150px; margin-left: 20px;">
                        <a id="a9">
                            <img id="img9" width="150px" height="100px" style="border: 1px solid Teal;" alt="" />
                            <span id="S9" style="font-size: 12px; font-family: Arial; font-weight: bold"></span>
                        </a>
                    </div>
                </div>
            </div>
            <br class="clear" />
            <div style="margin-left: 25px;">
                <div id="row4_col1" style="margin-left: 50px; margin-top: 10px; float: left">
                    <dxe:ASPxButton ID="btnok" runat="server" AutoPostBack="False" Text="Delete Selected">
                        <ClientSideEvents Click="function (s, e) {btnok_Click();}" />
                    </dxe:ASPxButton>
                </div>
                <div id="cancel" style="margin-left: 15px; margin-top: 10px; float: left">
                    <dxe:ASPxButton ID="btncancel" runat="server" AutoPostBack="False" Text="Close">
                        <ClientSideEvents Click="function (s, e) {btncancel_Click();}" />
                    </dxe:ASPxButton>
                </div>
            </div>
          
            <br class="clear" />
            <div id="row5_col2" style="color: Maroon; margin-left: 75px; font-weight: bold; background-color: Silver;
                border-bottom: 1px solid black;">
                Please Select &nbsp;&nbsp;(<img id="Img10" alt="" src="../CentralData/Images/docexists.png"
                    height="18px" style="cursor: pointer; vertical-align: bottom;" width="18px" />)&nbsp;&nbsp;
                To Delete image(s) !!
            </div>
        </div>
        <br class="clear" />
        <dxpc:ASPxPopupControl ID="PopUp_ScripAlert" runat="server" ClientInstanceName="cPopUp_ScripAlert"
            Width="500px" HeaderText="Document Verification Finalization" PopupHorizontalAlign="Center"
            PopupVerticalAlign="Middle" CloseAction="None" Modal="True" ShowCloseButton="False">
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <dxcp:ASPxCallbackPanel ID="CbpSuggestdocument" runat="server" ClientInstanceName="cCbpSuggestdocument"
                        BackColor="White" OnCallback="CbpSuggestdocument_Callback" LoadingPanelText="Please Wait !!"
                        LoadingPanelStyle-Font-Bold="true" LoadingPanelStyle-Cursor="wait" LoadingPanelStyle-ForeColor="gray">
                        <ClientSideEvents EndCallback="CbpSuggestdocument_EndCallBack" />
                        <PanelCollection>
                            <dxp:panelcontent runat="server">
                                <div style="font-weight: bold; color: black; background-color: gainsboro; border-right: silver thin solid;
                                    border-top: silver thin solid; border-left: silver thin solid; border-bottom: silver thin solid;">
                                    Total No of Document : <b style="text-align: right" id="B_cptotaldoc" runat="server">
                                    </b>
                                    <br />
                                    <br />
                                    To Be Deleted Document : <b style="text-align: right" id="B_cpverifieddoc" runat="server">
                                    </b>
                                </div>
                                <br class="clear" />
                                <div>
                                    <div id="row3_col1pop" class="Warning">
                                        Choosen Document Will Be Deleted. Do You want To Proceed ?
                                    </div>
                                    <div id="row4_col1pop" class="Success">
                                        No Documents Will Be Deleted !!!
                                    </div>
                                </div>
                                <br />
                                <br />
                                <div class="left" id="dvbtnproceed" style="width: 80px">
                                    <dxe:ASPxButton ID="btnproceed" runat="server" AutoPostBack="False" Text="Proceed">
                                        <ClientSideEvents Click="function (s, e) {btnproceed_Click();}" />
                                    </dxe:ASPxButton>
                                </div>
                                <div class="left" id="btnback">
                                    <dxe:ASPxButton ID="btncancelpopup" runat="server" AutoPostBack="False" Text="Back">
                                        <ClientSideEvents Click="function (s, e) {btncancelpopup_Click();}" />
                                    </dxe:ASPxButton>
                                </div>
                            </dxp:panelcontent>
                        </PanelCollection>
                    </dxcp:ASPxCallbackPanel>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" ForeColor="Black" />
        </dxpc:ASPxPopupControl>
    </form>
</body>
</html>
