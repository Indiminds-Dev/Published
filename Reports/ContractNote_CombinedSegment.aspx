<%@ page language="C#" autoeventwireup="true" inherits="Reports_ContractNote_CombinedSegment, App_Web_wttsrqio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ContractNote_CombinedSegment</title>
    <!--External Style-->
    <!--Internal Style-->
    <link type="text/css" href="../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <style type="text/css">       
        #MainFull { padding:5px; width:995px}
        #Container1 { width: 550px; padding:5px}
        #Container3 { width: 500px; padding:5px}
        .LableWidth { width:120px;}
        .ContentWidth { width:125px; height:21px;}
        .ABS_ContentWidth { width:260px; height:21px;}
        .labelCont { font-size:13px; margin-top:7px;}      
        .btnRight { margin-right:18px; float:right;} 
        .txt_left { text-align:left;}
        .txt_right { text-align:right;}  
        .frmleftCont{float:left; margin:2px; padding:2px; height:26px; border: solid 1px  #D1E0F3; font-size:12px;}                                         
   </style>
    <!--External Javascript-->

    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>

    <!--Start For Ajax-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <link type="text/css" href="../CentralData/CSS/GenericAjaxStyle.css" rel="Stylesheet" />
    <!--End For Ajax-->
    <!--Internal Javascript-->

    <script language="javascript" type="text/javascript">
        function fn_GoToMain()
        {
            window.location="../Reports/ContractNote.aspx";
        }      
        function PageLoad()///Call Into Page Load
        {          
           HideShow('C1_Row2_Col4','H');
           HideShow('C1_Row2_Col5','H');
           HideShow('C1_Row4_Col3','H');
           HideShow('Container2','H');
           HideShow('Row1','H');
           HideShow('C3_Row0','S'); 
           HideShow('div_location','H'); 
           HideShow('div_PdfLocation','H');
           HideShow('div_success','H');
           HideShow('div_fail','H');  
           HideShow('DivDosPrntGrid','H'); 
           HideShow('divFilter','H');         
           HideShow('C3_GeneratPDF','H');         
           HideShow('C1_Row7','H'); 
           HideShow('divPeriod','S');
           HideShow('divDate','S');
           HideShow('divDateRange','H')
        } 
        function Hide(obj)
        {
           document.getElementById(obj).style.display='none';
        }
        function Show(obj)
        {
           document.getElementById(obj).style.display='inline';
        }
       
        function Fn_printAll()
        {
            HideShow("C1_Row4_Col3",'H');
            HideShow('C3_Row1','S');
            HideShow('C3_Row0','S');
            
            cBtnupdate.SetEnabled(false);
            cbtnPrintAll.SetEnabled(false);
            cbtnPrintAll.SetText('Please Wait !!'); 
            cCbpExportPanel.PerformCallback(cCmbRptType.GetValue().toUpperCase()+'~');
        }
        
        function fn_show()
        {      
              
             HideShow("C1_Row4_Col3",'H');
             HideShow('C3_Row1','S');
             HideShow('C3_Row0','S');
             HideShow('LoadingDiv', 'S');
             
             if(cCmbRptType.GetValue().toUpperCase()=='DOS')
                {
                    cBtnupdate.SetEnabled(false);
                    cBtnupdate.SetText('Please Wait !!'); 
                    cbtnPrintAll.SetEnabled(false);
                    //HideShow('td_image','S');
                    //document.getElementById('img_id').src="../images/contractimages.gif";
                    //document.getElementById('S1').innerHTML="Please Wait..";
                     cGvDOSPrintView.PerformCallback("Bind~");
                }
             if(cCmbRptType.GetValue().toUpperCase()=='PDF')
                {
                    cBtnupdate.SetEnabled(false);
                    cBtnupdate.SetText('Please Wait !!'); 
                    cCbpExportPanel.PerformCallback(cCmbRptType.GetValue().toUpperCase()+'~');                                      
                }
            if(cCmbRptType.GetValue().toUpperCase()=='ECN')
                {
                    cBtnupdate.SetEnabled(false);
                    cBtnupdate.SetText('Please Wait !!');  
                    cCbpExportPanel.PerformCallback(cCmbRptType.GetValue().toUpperCase()+'~');                                     
                }
               
        }        
        function fn_ReportType(obj)//FnddlGeneration(obj)
        {
           if(obj=="PDF")
           {
               HideShow('C1_Row4','S');
               GetObjectID('txtEmpName').value="";
               GetObjectID('txtEmpName_hidden').value="";
               GetObjectID('chkSignature').checked=false;
               HideShow('C1_Row4_Col3','H');
               HideShow('div_location','H');
               HideShow('div_PdfLocation','H');
               HideShow('div_forchkbox','S');
               HideShow('div_BothSidePrnt','S');
               HideShow('div_ShowTotlBrkg','S');
               HideShow('div_ShowBrnchName','S');
               HideShow('div_AverageType','S');   
               HideShow('C1_Row7','H');
               HideShow('Div_RptOf','S');  
               HideShow('div_ntPrntngAnnexure','S');  
               cBtnupdate.SetText('Generate');
               HideShow('divPeriod','S');
               HideShow('divDate','S');
               HideShow('divDateRange','H')     
               cRblDatePeriod.SetSelectedIndex(0);
               //New Work
               cRblClient.SetSelectedIndex(0);
               cRblBranch.SetSelectedIndex(0);
               cRblGroup.SetSelectedIndex(0);
               CtxtCNoteNo.SetEnabled(false);
               CtxtCNoteNo.SetText('0000');
               HideShow('Container2','H');
               HideShow('C1_Row6','S');
               cBtnupdate.SetEnabled(true);
               //End of New Work
           }
           if(obj=="ECN")
           {
               //New Work
               cRblClient.SetSelectedIndex(0);
               cRblBranch.SetSelectedIndex(0);
               cRblGroup.SetSelectedIndex(0);
               CtxtCNoteNo.SetEnabled(false);
               CtxtCNoteNo.SetText('0000');
               HideShow('Container2','H');
               //End of New Work
               HideShow('C1_Row4','H');
               GetObjectID('txtEmpName').value="";
               GetObjectID('txtEmpName_hidden').value="";
               GetObjectID('chkSignature').checked=false;
               HideShow('C1_Row4_Col3','H'); 
               HideShow('div_location','H');
               HideShow('div_PdfLocation','H');
               HideShow('div_forchkbox','H');
               HideShow('div_BothSidePrnt','H');
               HideShow('div_ShowTotlBrkg','H');
               HideShow('div_ShowBrnchName','H'); 
               HideShow('div_AverageType','H');  
               HideShow('C1_Row7','H'); 
               HideShow('Div_RptOf','H');
               HideShow('div_ntPrntngAnnexure','H');   
               cBtnupdate.SetText('Generate'); 
               HideShow('divPeriod','H');
               HideShow('divDate','S');
               HideShow('divDateRange','H')
               //New Work
               HideShow('C1_Row6','S');
               cBtnupdate.SetEnabled(true);
               //End of New Work
           }
           if(obj=="DOS")
           {
               //New Work
               cRblClient.SetSelectedIndex(0);
               cRblBranch.SetSelectedIndex(0);
               cRblGroup.SetSelectedIndex(0);
               CtxtCNoteNo.SetEnabled(false);
               CtxtCNoteNo.SetText('0000');
               HideShow('Container2','H');
               //End of New Work
               HideShow('C1_Row4','H');
               GetObjectID('txtEmpName').value="";
               GetObjectID('txtEmpName_hidden').value="";
               GetObjectID('chkSignature').checked=false;
               HideShow('C1_Row4_Col3','H'); 
               HideShow('div_location','S');
               HideShow('div_PdfLocation','H');
               HideShow('div_forchkbox','S');
               HideShow('div_BothSidePrnt','H');
               HideShow('div_ShowTotlBrkg','H');
               HideShow('div_ShowBrnchName','H');  
               HideShow('div_AverageType','S');  
               HideShow('C1_Row7','S'); 
               HideShow('Div_RptOf','H'); 
               HideShow('div_ntPrntngAnnexure','H');  
               //HideShow('td_image','H');  
               cBtnupdate.SetText('View Records');  
               HideShow('divPeriod','H');
               HideShow('divDate','S');
               HideShow('divDateRange','H')  
               //New Work
               HideShow('C1_Row6','S');
               cBtnupdate.SetEnabled(true);
               //End of New Work  
           }
             
        }
        function ajaxFunction()
        {
                   
                    
                    var aa="";
                    var path="";
                    path=document.getElementById('hdnpath').value;
                    var xmlhttp;
                    if (window.XMLHttpRequest)
                    {
                        xmlhttp=new XMLHttpRequest();
                    }
                    else
                    {
                        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                        
                    }
                    xmlhttp.onreadystatechange=function()
                    {
                         if(xmlhttp.readyState==4)
                         {       
                             var a=xmlhttp.responseText;
                             if(a!="")
                             {
                                    
                                 CreateFile(a);
                             }
                         }
                    }
                    xmlhttp.open("GET","Defaultnew.aspx?path="+path+"&reportformat=combined",true); 
                    xmlhttp.send(null);
                    
            }
     function CreateFile(value)
     {
           var rand_no = Math.random();        
            var now = new Date();
            var then = now.getFullYear()+'_'+(now.getMonth()+1)+'_'+now.getDate();
                then += '_'+now.getHours()+'_'+now.getMinutes()+'_'+now.getSeconds(); 
            var destination=document.getElementById('hdnLocationPath').value;
            var fso ;
            try
            {
                fso = new ActiveXObject("Scripting.FileSystemObject");
            }
            catch(err)
            {
                //HideShow('td_image','H');
                PageLoad();
                cBtnupdate.SetEnabled(true);
                cBtnupdate.SetText('View Records'); 
                //HideShow('div_location','S');
                
                HideShow('C1_Row4','H');
               GetObjectID('txtEmpName').value="";
               GetObjectID('txtEmpName_hidden').value="";
               GetObjectID('chkSignature').checked=false;
               HideShow('C1_Row4_Col3','H'); 
                HideShow('div_location','S'); 
                HideShow('div_PdfLocation','H');
                alert("Please Enable The option\n'Initialize and Script Active X controls not marked as safe for scripting' \n Under 'Active X Controls & Piug-Ins' \n from Internet options -> Security Settings");

            }
            varFileObject = fso.OpenTextFile(destination, 2, true,0);
            varFileObject.write(value);
            varFileObject.close();
             //HideShow('td_image','H');
            PageLoad();
            cBtnupdate.SetEnabled(true);
            cbtnPrintAll.SetEnabled(true);
            HideShow('C1_Row7','S');
            cBtnupdate.SetText('View Records');
            cbtnPrintAll.SetText('Print All');
            HideShow('C1_Row4','H');
            GetObjectID('txtEmpName').value="";
            GetObjectID('txtEmpName_hidden').value="";
            GetObjectID('chkSignature').checked=false;
            HideShow('C1_Row4_Col3','H'); 
            HideShow('div_location','S');
            HideShow('div_PdfLocation','H');
            alert("Print Send To Printer");
            
        }
        function fn_GroupBy(obj)
        {
            GetObjectID('<%=lstSelection.ClientID%>').length=0;             
            if(obj=="C")
            { 
                cRblClient.SetSelectedIndex(0);     
                fn_Client('A');                
                HideShow('C1_Row2_Col4','H'); 
                HideShow('C1_Row2_Col5','H');
                HideShow('C1_Row2_Col3','S');
                CallServer("CallAjax-Client","");              
            }
            if(obj=="B")
            {
                cRblBranch.SetSelectedIndex(0);     
                fn_Branch('A'); 
                HideShow('C1_Row2_Col3','H');  
                HideShow('C1_Row2_Col5','H');               
                HideShow('C1_Row2_Col4','S');               
                CallServer("CallAjax-Branch",""); 
            }           
            if(obj=="G")                
            { 
                HideShow('C1_Row2_Col3','H'); 
                HideShow('C1_Row2_Col4','H');
                HideShow('Container2','H');
                HideShow('C1_Row2_Col5','S');
                HideShow('C1_Row2_Col6','H');
                cCmbGroupType.PerformCallback("GroupType~");
             }
        }      
        function fn_Client(obj)
        {  
            if(obj=="A")
            {
                SetValue('HiddenField_ClientBranchGroup','');                                          
                GetObjectID('<%=lstSelection.ClientID%>').length=0;
                //New Work
                CtxtCNoteNo.SetEnabled(false);
                CtxtCNoteNo.SetText('0000');
                //End of New Work
                HideShow('Container2','H');
                HideShow('C1_Row6','S');
                CallServer("CallAjax-Client","");
            }
            else if((obj=="S")||(obj=="ABS")||(obj=="D"))
            {               
                if(GetObjectID('Container2').style.display=="inline")
                {
                    //New Work
                    //cRblClient.SetSelectedIndex(0);
                    CtxtCNoteNo.SetEnabled(false);
                    CtxtCNoteNo.SetText('0000');
                    //End of New Work
                    lnkBtnAddFinalSelection();                        	
                }
                else
                {
                    //New Work
                    CtxtCNoteNo.SetEnabled(true);
                    if ((obj=="ABS")||(obj=="D"))
                    {
                        CtxtCNoteNo.SetEnabled(false);
                        CtxtCNoteNo.SetText('0000');
                    }
                    //End of New Work 
                   HideShow('Container2','S');
                   HideShow('C1_Row6','H');
                   CallServer("CallAjax-Client",""); 
                   //GetObjectID('txtSelectionID').focus();
                }
            }                         
        }        
        function fn_Branch(obj)
        {  
            if(obj=="A")
            {
                SetValue('HiddenField_ClientBranchGroup','');
                GetObjectID('<%=lstSelection.ClientID%>').length=0;
                //New Work
                CtxtCNoteNo.SetEnabled(false);
                CtxtCNoteNo.SetText('0000');
                //End of New Work
                HideShow('Container2','H');
                HideShow('C1_Row6','S');
            }
            else if((obj=="S")||(obj=="ABS")||(obj=="D"))
            {               
                if(GetObjectID('Container2').style.display=="inline")
                {
                   //New Work
                   //cRblBranch.SetSelectedIndex(0);
                   CtxtCNoteNo.SetEnabled(false);
                   CtxtCNoteNo.SetText('0000');
                   //End of New Work
                   lnkBtnAddFinalSelection();                        	
                }
                else
                {
                   //New Work
                   CtxtCNoteNo.SetEnabled(false);
                   CtxtCNoteNo.SetText('0000');
                   //End of New Work
                   HideShow('Container2','S');
                   HideShow('C1_Row6','H');
                   CallServer("CallAjax-Branch",""); 
                   //GetObjectID('txtSelectionID').focus();
                } 
            }                         
        }
        function CmbGroupType_EndCallback()
        {
           if(cCmbGroupType.cpBindGroupType!=undefined)
           {
               if(cCmbGroupType.cpBindGroupType=="Y")
               {
                    cCmbGroupType.SetSelectedIndex(0);  
                    SetValue('HiddenField_ClientBranchGroup','');
               }
               else if(cCmbGroupType.cpBindGroupType=="N")
               {
                    cCmbGroupType.SetEnabled(false);                   
               }
           }          
           Height('500','500');
        }
        function fn_CmbGroupType(obj)
        {
            if(obj=="0")
            {
               //New Work
               CtxtCNoteNo.SetEnabled(false);
               CtxtCNoteNo.SetText('0000');
               //End of New Work
               HideShow('C1_Row2_Col6','H');
               alert('Please Select Group Type !');
               cbtnShow.SetEnabled(false);
            }
            else
            {
               //New Work
               //cRblGroup.SetSelectedIndex(0);
               CtxtCNoteNo.SetEnabled(false);
               CtxtCNoteNo.SetText('0000');
               //End of New Work
               HideShow('C1_Row2_Col6','S');
               cbtnShow.SetEnabled(true);
            }
           Height('500','500');
        }      
        function fn_Group(obj)
        {  
            if(obj=="A")
            {
                SetValue('HiddenField_ClientBranchGroup','');                                          
                GetObjectID('<%=lstSelection.ClientID%>').length=0;
                //New Work
                CtxtCNoteNo.SetEnabled(false);
                CtxtCNoteNo.SetText('0000');
                //End of New Work
                HideShow('Container2','H');
                HideShow('C1_Row6','S');
            }
            else if((obj=="S")||(obj=="ABS")||(obj=="D"))
            {               
                if(GetObjectID('Container2').style.display=="inline")
                {                
                   //New Work
                   //cRblGroup.SetSelectedIndex(0);
                   CtxtCNoteNo.SetEnabled(false);
                   CtxtCNoteNo.SetText('0000');
                   //End of New Work
                   lnkBtnAddFinalSelection();                        	
                }
                else
                {
                   //New Work
                   CtxtCNoteNo.SetEnabled(false);
                   CtxtCNoteNo.SetText('0000');
                   //End of New Work
                   HideShow('Container2','S');
                   HideShow('C1_Row6','H');
                   CallServer("CallAjax-Group~"+cCmbGroupType.GetText(),"");
                   //GetObjectID('txtSelectionID').focus();
                } 
            }                         
        }
        function fn_DatePeriod(obj)
        {
            if(obj=="D")
            {
                HideShow('DivDate','S');
                HideShow('DivDateRange','H');
                HideShow('div_PdfLocation','H');
            }
            else
            {
                HideShow('DivDate','H');
                HideShow('DivDateRange','S');
                HideShow('div_PdfLocation','S');
                cCmbPdfLocation.PerformCallback('LOCCHG');
            }
        }
        function NORECORD()
        {
             alert('No Record Found !!!');  
             Reset();                    
        }
        function ErrorMsg(msg)
        {
            if(msg=="ClientErr")
                alert("There is No Proper Client Selection!!!");
            else if(msg=="BranchErr")
                alert("There is No Proper Branch Selection!!!");
            else if(msg=="GroupErr")
                alert("There is No Proper Group Selection!!!");
            else 
                alert("No of Period Generated : "+msg+" .");
        }
       function Reset()
        {
           cCmbGroupBy.SetSelectedIndex(0); 
           cCmbGroupBy.SetEnabled(true); 
           cRblClient.SetSelectedIndex(0);
           cRblClient.SetEnabled(true); 
           cRblBranch.SetSelectedIndex(0);
           cRblBranch.SetEnabled(false); 
           cRblGroup.SetSelectedIndex(0);
           cRblGroup.SetEnabled(false); 
           cCmbGroupType.SetSelectedIndex(0);
           cCmbGroupType.SetEnabled(false);  
           GetObjectID('<%=lstSelection.ClientID%>').length=0;
           SetValue('HiddenField_ClientBranchGroup','');                                          
           Height('500','500');
       }       
       function cCbpExportPanel_EndCallBack()
       {
            btnopenpopup.SetEnabled(true);
           if(cCbpExportPanel.cppdfclick!=null)
           {
               var WhichCall=cCbpExportPanel.cppdfclick.split('~')[0]; 
               if(WhichCall=="Success")
               {
                 cBtnupdate.SetEnabled(true);
                 cBtnupdate.SetText('Generate');
                 if(cRblDatePeriod.GetValue()=="D") document.getElementById('btnPdfExport').click();
                 HideShow('LoadingDiv', 'H');
               }
               else if(WhichCall=="SuccessP")
               {
                var Location= cCbpExportPanel.cppdfclick.split('~')[1]; 
                alert("PDF Generated Successfully At '"+Location+"'");
                HideShow('LoadingDiv', 'H');
                cBtnupdate.SetEnabled(true);
                cBtnupdate.SetText('Generate');
               }
              
           } 
           if(cCbpExportPanel.cpdosprint!=null)
           {
               if(cCbpExportPanel.cpdosprint=="click")
               {
                   document.getElementById('btndosprint').click()
               }
              
           } 
           if ((cCbpExportPanel.cpallcontract != null) && (cCbpExportPanel.cpecnenable != null)) {

               var allcontract = cCbpExportPanel.cpallcontract;
               var ecnenable = cCbpExportPanel.cpecnenable;
               document.getElementById('<%=B_allcontract.ClientID %>').innerHTML = cCbpExportPanel.cpallcontract;
                document.getElementById('<%=B_ecnenable.ClientID %>').innerHTML = cCbpExportPanel.cpecnenable;
                document.getElementById('<%=B_deliveryrpt.ClientID %>').innerHTML = cCbpExportPanel.cpdeliveryrpt;
                HideShow('Row1', 'S');
                HideShow('LoadingDiv', 'H'); 
                if (cCbpExportPanel.cpsign != null) {
                    if ((cCbpExportPanel.cpsign == 'false') || (ecnenable == '0')) {
                        btnopenpopup.SetEnabled(false);
                    }
                    else {
                        btnopenpopup.SetEnabled(true);
                    }
                }
                cBtnupdate.SetEnabled(true);
                cBtnupdate.SetText('Generate');

           }
            if ((cCbpExportPanel.cpallcontractpop != null) && (cCbpExportPanel.cpecnenablepop != null))
            {
                document.getElementById('<%=B_allcontractpop.ClientID %>').innerHTML=cCbpExportPanel.cpallcontractpop;
                document.getElementById('<%=B_ecnenablepop.ClientID %>').innerHTML=cCbpExportPanel.cpecnenablepop;
                var remn=document.getElementById('<%=B_allcontractpop.ClientID %>').innerHTML=cCbpExportPanel.cpallcontractpop;
                var remn1=document.getElementById('<%=B_ecnenablepop.ClientID %>').innerHTML=cCbpExportPanel.cpecnenablepop;
                
                if (remn=='0' || remn1=='0')
                {
                    //alert('1sttt');
                    Hide('btnremain');
                }
                else
                {
                    //alert('2nd');
                    Show('btnremain');
                }
               // alert('11');
                Hide('btnokdiv');
                Hide('div_fail');
                Hide('div_success');
                cPopUp_ScripAlert.Show();
            
            }
       }
       function btnsendall_Click()
        {
            cCbpSuggestISIN.PerformCallback('all');
        }
       function btnsendremaining_Click()
        {
            cCbpSuggestISIN.PerformCallback('remaining');
        }
         function btnok_Click()  
            {
                window.location='../reports/ContractNote.aspx';
            }
        function btncancel_Click()
            {
                
                cPopUp_ScripAlert.Hide();
                
            }
        function CbpSuggestISIN_EndCallBack()
    {
//        alert(cCbpSuggestISIN.cpdownloadcomplete11);
//        alert(cCbpSuggestISIN.cpdownloadcomplete12);
         if (cCbpSuggestISIN.cpallsendtclick != null)
            {
                 document.getElementById('btnecn').click()
            }
        
        if (cCbpSuggestISIN.cpdownloadcomplete != null)
            {
            
                if (cCbpSuggestISIN.cpdownloadcomplete='yes')
                    {
                        Hide('td_image');
                        document.getElementById('BtnForExportEvent3').click();
                    }
            }
            
             if (cCbpSuggestISIN.cpsuccessandfailmsg != null)
              {
                if (cCbpSuggestISIN.cpsuccessandfailmsg=='totalsuccess')
                    {
                        
                        alert('All Mail Send Successfully');
                        FnddlGeneration('4');
                       
                        
                    }
                     if (cCbpSuggestISIN.cpsuccessandfailmsg=='totalfail')
                    {
                        
                        alert('Official Emailid not found for all sending mail');
                        FnddlGeneration('4');
                       
                        
                    }
                     if (cCbpSuggestISIN.cpsuccessandfailmsg=='fewsuccessandfewfail')
                    {
                        
                        alert('Some Official Emailid not found \n Rest emails has been Sent.');
                        FnddlGeneration('4');
                       
                        
                    }
            }
            
             if (cCbpSuggestISIN.cpnorecord != null)
                {
                if (cCbpSuggestISIN.cpnorecord='norecord')
                    {
                        
                        alert('No Record Found.');
                        FnddlGeneration('4');
                       
                        
                    }
                }
            
        if ((cCbpSuggestISIN.cpallcontractpops != null) && (cCbpSuggestISIN.cpecnenablepops != null))
            {
                
                
                document.getElementById('<%=B_allcontractpop.ClientID %>').innerHTML=cCbpSuggestISIN.cpallcontractpops;
                document.getElementById('<%=B_ecnenablepop.ClientID %>').innerHTML=cCbpSuggestISIN.cpecnenablepops;
                var remn2=cCbpSuggestISIN.cpallcontractpops;
                var remn3=cCbpSuggestISIN.cpecnenablepops;
                if (remn2=='0' || remn3=='0')
               {                   
                    Hide('btnremain');
                    Hide('btnall');
                    Hide('cancel');

                    
                }
                else
                {
                Show('btnremain');
                Hide('btnall');
                Hide('cancel');

                   
                }
                if (remn3!='0')
                //if('<%=Session["Error"]%>'=='err')
                {
                    Show('div_fail');
                    Hide('div_success');
               
                }
                else
                {
                    Hide('div_fail');
                      Show('div_success');
                      
                }
                 Show('btnokdiv');
                 
                
            }
            if (cCbpSuggestISIN.cpNoPDFGenerated != null)
            {
                alert("No of PDF Successfully Generated : "+cCbpSuggestISIN.cpNoPDFGenerated);
                cCbpSuggestISIN.cpNoPDFGenerated=null;
                cBtnGeneratePdf.SetEnabled(true);
                cBtnGeneratePdf.SetText("Click To Generate");
                HideShow('LoadingDiv', 'H');
            }
         
    }
    
        function ASPxCBP_PDFGenerate_EndCallBack()
        {
            alert('its Called');
        }
        function ShowHideFilter(obj)
         {
           
            if(obj=='v1')
                {
                    if(document.getElementById('<%=B_allcontract.ClientID %>').innerHTML=='0')
                     alert('You dont have any record to export')
                    else
                        document.getElementById('BtnForExportEvent').click()
                }
            if(obj=='v2')
             {
                 if(document.getElementById('<%=B_ecnenable.ClientID %>').innerHTML=='0')
                     alert('You dont have any record to export')
                 else
                    document.getElementById('BtnForExportEvent1').click()
             }
            if(obj=='v3')
             {
                if(document.getElementById('<%=B_deliveryrpt.ClientID %>').innerHTML=='0')
                     alert('You dont have any record to export')
                else
                    document.getElementById('BtnForExportEvent2').click()
             }
            //cCbptxtSelectionID.PerformCallback(obj);
       
         }
        function fn_showpopup()
        {
        
            
            if(document.getElementById('txtdigitalName_hidden').value!="")
            {
                   
                    cCbpExportPanel.PerformCallback('showpopup');
             }
             else
             {
                 alert('Please select Signature !!');
             }
            
       }
       function fn_GenearatePDF()
       {
        cBtnGeneratePdf.SetEnabled(false);
        cBtnGeneratePdf.SetText("Please Wait..");
        HideShow('LoadingDiv', 'S');
        cCbpSuggestISIN.PerformCallback('GeneratePDF');
       }
       function ChkSignature()
       {
          var chkbox=GetObjectID('chkSignature');
          if(chkbox.checked)
          {
              HideShow('C1_Row4_Col3','S');
              GetObjectID('txtEmpName').focus();                
          }
          else
          {
              HideShow('C1_Row4_Col3','H');
              GetObjectID('txtEmpName_hidden').value="";
              GetObjectID('txtEmpName').value="";
          } 
       }       
       function DateChange(positionDate)
       {
          var FYS='<%=Session["FinYearStart"]%>';
          var FYE='<%=Session["FinYearEnd"]%>';
          var LFY='<%=Session["LastFinYear"]%>';
          DevE_CheckForFinYear(positionDate,FYS,FYE,LFY);
       }
       function GvDOSPrintView_EndCallBack()
       {
         if(cGvDOSPrintView.cpprint=="click")
         {
           document.getElementById('btndosprint').click();
         }
         HideShow('DivDosPrntGrid','S'); 
         cBtnupdate.SetEnabled(true);
         cBtnupdate.SetText('View Records');  
         HideShow('Row0','H');
         HideShow('divFilter','S');     
         Height('500','500');    
       }
       function OnGridFocusedRowChanged() 
       {
         cGvDOSPrintView.GetSelectedFieldValues('UID', OnGetRowValues);
       } 
       function OnGetRowValues(values) 
       {
            RowID = 'n';
            for(var j = 0; j < values.length; j ++) {
                if(RowID != 'n')
                    RowID += ',' + values[j];
                else
                
                    RowID = values[j];
                   
            }
       }
       function SelectAll(objCheckAll)
       {
         var inputs=document.getElementsByTagName("input");
         for (var i = 0; i < inputs.length; i++)
         {  
             if (inputs[i].type == "checkbox")
             {  
             //alert('123');
//               if(inputs[i].className=='dxtl__Sel')
//                    {
                        if(objCheckAll.checked==true)
                            {
                                if(inputs[i].checked==false)
                                  inputs[i].click();  
                            }
                         else
                            if(inputs[i].checked==true)
                                inputs[i].click(); 
//                    }
                
             }  
         
         }  
       }
       function OnAllCheckedChanged(s, e)
       {
         if(cchkExclude.GetChecked()== false)
         {
          if (s.GetChecked())
            cGvDOSPrintView.SelectRows();
          else
            cGvDOSPrintView.UnselectRows();
         }
       }
       function OnSelectedCheckedChanged(s, e)
       {
          var inputs = document.getElementsByTagName("input");
          
          for (var i = 0; i < inputs.length; i++)
          { 
             if (inputs[i].type == "checkbox")
             {  
                if (s.GetChecked())
                {
                    inputs[i].click();  
                }
                else
                if(inputs[i].checked==true)
                   inputs[i].click(); 
             }
          }
//          if (s.GetChecked())
//            cGvDOSPrintView.UnselectRows();
//          else
//            cGvDOSPrintView.SelectRows();
       }
       function SelectExclude(objCheckAllExc)
       {
           var inputs=document.getElementsByTagName("input");
           //alert(inputs.length);
           for (var i = 0; i < inputs.length; i++)
           {  
                  if (inputs[i].type == "checkbox")
                     {  
                     //alert('456');
//                       if(inputs[i].className=='dxtl__Sel')
//                            {
                                if(objCheckAllExc.checked==true)
                                    {
                                       inputs[i].click();  
                                    }
                                 else
                                    if(inputs[i].checked==true)
                                        inputs[i].click(); 
//                            }
                        
                     }  
             
            }    
        
        
        }
       function fn_Filter()
       {
         HideShow('Row0','S');
         HideShow('divFilter','H');   
       }
       function fn_DosPrnt()
       {
        cbtnDosPrnt1.SetEnabled(false);
        cbtnDosPrnt1.SetText('Please Wait..!!');  
        cbtnDosPrnt2.SetEnabled(false);
        cbtnDosPrnt2.SetText('Please Wait..!!');   
        if (RowID==undefined || RowID=='n')
        {
           alert ('Please Select Atleast one Item !!..');
           cbtnDosPrnt1.SetEnabled(true);
           cbtnDosPrnt1.SetText('Print');  
           cbtnDosPrnt2.SetEnabled(true);
           cbtnDosPrnt2.SetText('Print'); 
        }
        else
            cGvDOSPrintView.PerformCallback("Print~");
           //cCbpExportPanel.PerformCallback(cCmbRptType.GetValue().toUpperCase()+'~');  
       }
         
    </script>

    <!-- CallAjax and Receive Server Script-->

    <script language="javascript" type="text/javascript">       
        FieldName='none';
        function btnAddToList_click()
        {
            var txtName = GetObjectID('txtSelectionID');
            if(txtName != '')
            {
                var txtId = GetValue('txtSelectionID_hidden');
                var listBox = GetObjectID('lstSelection');
                var listLength = listBox.length;               
                var opt = new Option();
                opt.value = txtId;
                opt.text = txtName.value;
                listBox[listLength]=opt;
                txtName.value='';
            }
            else
                alert('Please Search Name And Then Add!');
            txtName.focus();
            txtName.select();   
        }
        function lnkBtnAddFinalSelection()
	    {
	        var listBox = GetObjectID('lstSelection');         
            var listID='';
            var i;
            if(listBox.length > 0)
            {                             
                for(i=0;i<listBox.length;i++)
                {
                    if(listID == '')
                        listID = listBox.options[i].value+'!'+listBox.options[i].text;
                    else
                        listID += '^' + listBox.options[i].value+'!'+listBox.options[i].text;
                }
                CallServer(listID,"");  
                var j;
                for(j=listBox.options.length-1;j>=0;j--)
                {
                    listBox.remove(j);
                } 
                HideShow('Container2','H');
                HideShow('C1_Row6','S');                    
            }
            else if((GetObjectID('Container2').style.display=="inline") && (listBox.length == 0))
            { 
                if((cCmbGroupBy.GetSelectedIndex()==0) && (cRblClient.GetSelectedIndex()==1))
                {             
                     alert("Please Select Atleast One Client Item!!!");
                     //New Work
                     CtxtCNoteNo.SetEnabled(true);
                     CtxtCNoteNo.SetText('0000');
                     //End of New Work
                }   
                else if((cCmbGroupBy.GetSelectedIndex()==1) && (cRblBranch.GetSelectedIndex()==1) )
                {             
                    alert("Please Select Atleast One Branch Item!!!");
                }
                else if((cCmbGroupBy.GetSelectedIndex()==2) && (cRblGroup.GetSelectedIndex()==1))
                {             
                     alert("Please Select Atleast One Group Item!!!");
                }                                   
            }
	    }
	    function lnkBtnRemoveFromSelection()
        {   
            var listBox = GetObjectID('lstSelection');
            var tLength = listBox.length;                
            var arrTbox = new Array();
            var arrLookup = new Array();
            var i;
            var j = 0;
            for (i = 0; i < listBox.options.length; i++) 
            {
                if (listBox.options[i].selected && listBox.options[i].value != "") 
                {                        
                }
                else 
                {
                    arrLookup[listBox.options[i].text] = listBox.options[i].value;
                    arrTbox[j] = listBox.options[i].text;
                    j++;
                }
            }
            listBox.length = 0;
            for (i = 0; i < j; i++) 
            {
                var no = new Option();
                no.value = arrLookup[arrTbox[i]];
                no.text = arrTbox[i];
                listBox[i]=no;
            }
        }
        function string_contains(containerString, matchBySubString)
        {
            if(containerString.indexOf(matchBySubString) == -1)
            {
                return false;
            }
            else
            {
                return true;
            }
        }          
        function ReceiveServerData(rValue)
        {            
            var Data=rValue.split('@');           
            if(Data[1]!="undefined")
            {
                 if((Data[0]=='Branch')||(Data[0]=='Group')||(Data[0]=='Client'))
                    SetValue('HiddenField_ClientBranchGroup',Data[1]);                                                     
            } 
            if(Data[0]=='AjaxQuery')
            {                
                AjaxComQuery = Data[1];               
                var AjaxList_TextBox=GetObjectID('txtSelectionID');
                AjaxList_TextBox.value='';
                AjaxList_TextBox.attachEvent('onkeyup',CallGenericAjaxJS);
             }              
        }
        function CallGenericAjaxJS(e)
        {
            var AjaxList_TextBox=GetObjectID('txtSelectionID');
            AjaxList_TextBox.focus();
            AjaxComQuery=AjaxComQuery.replace("\'","'");
            //var GenericAjaxListAspxPath = '../CentralData/Pages/GenericAjaxList.aspx';            
            ajax_showOptions(AjaxList_TextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main');
        }
        function CallAjax(obj1,obj2,obj3,Query)
        {
            var CombinedQuery=new String(Query);
            //var GenericAjaxListAspxPath = '../CentralData/Pages/GenericAjaxList.aspx';
            ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
        }
        function keyVal(obj)
        {
           var WhichCall=obj.split("~")[4];
           if(WhichCall=="DIGISIGN")
           {
            var isEtoken=obj.split("~")[2];
            if(isEtoken=="E")
            {
                HideShow("C3_button","H");
                HideShow("C3_GeneratPDF","S");
            }
            else
            {
                HideShow("C3_button","S");
                HideShow("C3_GeneratPDF","H");
            }
           }
        }
        function EmailNotFound(obj)
        {  
            var Emails=document.getElementById("hdnEmailNotFound").value;
            alert('Email not Found!!!\n'+Emails);
            Page_Load();
        }
       //New work 04/05/2023
//       function DateChecking(dtFrom,dtTo)
//       {
//            DevE_CompareDateForMin(dtFrom,dtTo,"To Date Can Not Be Minimum Than From Date!!!");
//            var d = new Date(dtFrom.GetDate());
//            d.setDate(d.getDate()+30);
//            DevE_CompareDateToMax(dtTo,d,"not called");
//       }   
      function DateCompare(DateobjFrm,DateobjTo)
    {
        var Msg="To Date Can Not Be Less Than From Date!!!";
        DevE_CompareDateForMin(DateobjFrm,DateobjTo,Msg);
    }
    function DevE_CompareDateForMin(DateObjectFrm,DateObjectTo,Msg)    
    {
        var SelectedDate = new Date(DateObjectFrm.GetDate());
        var monthnumber = SelectedDate.getMonth();
        var monthday    = SelectedDate.getDate();
        var year        = SelectedDate.getYear();
        var SelectedDateValueFrm=new Date(year, monthnumber, monthday);
        
        var SelectedDate = new Date(DateObjectTo.GetDate());
        monthnumber = SelectedDate.getMonth();
        monthday    = SelectedDate.getDate();
        year        = SelectedDate.getYear();
        var SelectedDateValueTo=new Date(year, monthnumber, monthday);
        var SelectedDateNumericValueFrm=SelectedDateValueFrm.getTime();
        var SelectedDateNumericValueTo=SelectedDateValueTo.getTime();
        if(SelectedDateNumericValueFrm>SelectedDateNumericValueTo)
        {
            alert(Msg);
            DateObjectTo.SetDate(new Date(DateObjectFrm.GetDate()));
        }
    }
    function DateChangeForFrom()
    {    
        var dateFrom ='<%=Session["FinYearStart"]%>';    
        var dateTo ='<%=Session["FinYearEnd"]%>';
        
        var MonthDate=cDtFrom.GetDate().getMonth()+1;
        var DayDate=cDtFrom.GetDate().getDate();
        var YearDate=cDtFrom.GetDate().getYear();
        var objdateFrom;
        var objdateTo;
        
        var objDateFromMonth;
        var objDateFromYear;
        var objDateToMonth;
        var objDateToYear;
        
        var n = dateFrom.indexOf("/");
        if(n>0)
        {
              objdateFrom=dateFrom.split('/');
              objdateTo=dateTo.split('/');
              
              objDateFromMonth=objdateFrom[0] ;
              objDateFromYear=objdateFrom[2].split(' ')[0];
              
              objDateToMonth=objdateTo[0] ;
              objDateToYear=objdateTo[2].split(' ')[0];
             
        }
        else
        {
             objdateFrom=dateFrom.split('-');
             objdateTo=dateTo.split('-');
               objDateFromMonth=objdateFrom[0] ;
              objDateFromYear=objdateFrom[2].split(' ')[0];
              
              objDateToMonth=objdateTo[0] ;
              objDateToYear=objdateTo[2].split(' ')[0];
        }
        if(!((MonthDate>=objDateFromMonth && YearDate==objDateFromYear)|| (MonthDate<=objDateToMonth && YearDate==objDateToYear)))
        {
             alert('Enter Date Is Outside Of Financial Year !!');
             if(new Date()<new Date(dateTo))
                cDtFrom.SetDate(new Date());
             else if(new Date()>new Date(dateFrom))
                cDtFrom.SetDate(new Date(dateFrom));
             else
                 cDtFrom.SetDate(new Date(dateTo));
             return false;
        }    
        else
        {
            return true;
        }
    }

    function DateChangeForTo()
    {    
        var dateFrom ='<%=Session["FinYearStart"]%>';    
        var dateTo ='<%=Session["FinYearEnd"]%>';
        var MonthDate=cDtTo.GetDate().getMonth()+1;
        var DayDate=cDtTo.GetDate().getDate();
        var YearDate=cDtTo.GetDate().getYear();
        var objdateFrom;
        var objdateTo;
        
        var objDateFromMonth;
        var objDateFromYear;
        var objDateToMonth;
        var objDateToYear;
        
        var n = dateFrom.indexOf("/");
        if(n>0)
        {
              objdateFrom=dateFrom.split('/');
              objdateTo=dateTo.split('/');
              
              objDateFromMonth=objdateFrom[0] ;
              objDateFromYear=objdateFrom[2].split(' ')[0];
              
              objDateToMonth=objdateTo[0] ;
              objDateToYear=objdateTo[2].split(' ')[0];
             
        }
        else
        {
             objdateFrom=dateFrom.split('-');
             objdateTo=dateTo.split('-');
             
             objDateFromMonth=objdateFrom[0] ;
             objDateFromYear=objdateFrom[2].split(' ')[0];
              
             objDateToMonth=objdateTo[0] ;
             objDateToYear=objdateTo[2].split(' ')[0];
        }
        if(!((MonthDate>=objDateFromMonth && YearDate==objDateFromYear)|| (MonthDate<=objDateToMonth && YearDate==objDateToYear)))
        {
             alert('Enter Date Is Outside Of Financial Year !!');
              if(new Date()<new Date(dateTo))
                cDtTo.SetDate(new Date());
             else if(new Date()>new Date(dateFrom))
                cDtTo.SetDate(new Date(dateFrom));
             else
                 cDtTo.SetDate(new Date(dateTo));
             return false;
        }    
        else
        {
            return true;
        }
    }
    //End of New work 04/05/2023
    </script>

</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div id="MainFull">
            <div id="Header" class="Header">
                <div id="divReset" style="font-size: 7; text-align: right; margin-right: 100px;">
                    <dxe:ASPxButton ID="btnGoToMain" runat="server" AutoPostBack="False" ClientInstanceName="cGoToMain"
                        Text="Go To Main Selection" Font-Size="7" TabIndex="0" CssClass="btnRight">
                        <clientsideevents click="function(s,e){fn_GoToMain();}" />
                        <paddings padding="0" paddingbottom="0" paddingleft="0" paddingright="0" />
                    </dxe:ASPxButton>
                </div>
                 <div id="divFilter" style="font-size: 7; text-align: right; margin-right: 100px;">
                    <dxe:ASPxButton ID="btnFilter" runat="server" AutoPostBack="False" ClientInstanceName="cbtnFilter"
                        Text="Filter" Font-Size="7" ForeColor="blue" TabIndex="0" CssClass="btnRight">
                        <clientsideevents click="function(s,e){fn_Filter();}" />
                        <paddings padding="0" paddingbottom="0" paddingleft="0" paddingright="0" />
                    </dxe:ASPxButton>
                </div>
                ContractNote CombinedSegment <span class="clear"></span>
            </div>
            <div id="Row0" class="Row">
                <div id="Container1" class="container">
                    <div id="C1_Row1" class="Row">
                        <div id="C1_Row1_Col1" class="LFloat_Lable LableWidth">
                            <asp:Label ID="lblRptType" runat="server" Text="Report Gen Type : "></asp:Label>
                        </div>
                        <div id="C1_Row1_Col2" class="LFloat_Content">
                            <dxe:ASPxComboBox ID="CmbRptType" runat="server" ValueType="System.String" ClientInstanceName="cCmbRptType"
                                SelectedIndex="0" Width="160px" TabIndex="0">
                                <items>
                                    <dxe:ListEditItem Text="PDF" Value="PDF"></dxe:ListEditItem>
                                    <dxe:ListEditItem Text="ECN" Value="ECN"></dxe:ListEditItem>
                                    <dxe:ListEditItem Text="DosPrint(Preprinted)" Value="DOS"></dxe:ListEditItem>
                                </items>
                                <clientsideevents selectedindexchanged="function(s, e) {fn_ReportType(s.GetValue());}" />
                            </dxe:ASPxComboBox>
                        </div>
                    </div>
                    <span class="clear"></span>
                    <div id="C1_Row11" class="Row">
                        <div id="C1_Row11_Col1" class="LFloat_Lable LableWidth">
                            <asp:Label ID="Label3" runat="server" Text="Segment : "></asp:Label>
                        </div>
                        <div id="C1_Row11_Col2" class="LFloat_Content">
                            <dxe:ASPxRadioButtonList ID="RbSegment" runat="server" SelectedIndex="0" ItemSpacing="20px"
                                Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                ClientInstanceName="cRblBranch" Width="160px">
                                <border borderwidth="0px" />
                                <paddings paddingtop="1px"></paddings>
                                <clientsideevents valuechanged="function(s, e) {fn_Branch(s.GetValue());}" />
                                <items>
                                <dxe:ListEditItem Text="Current Segment" Value="True"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="All" Value="False" ></dxe:ListEditItem>
                                </items>
                            </dxe:ASPxRadioButtonList>
                        </div>
                    </div>
                    <span class="clear"></span>
                    <div id="C1_Row2" class="Row">
                        <div id="C1_Row2_Col1" class="LFloat_Lable LableWidth">
                            <asp:Label ID="lblGroupBy" runat="server" Text="Group By : "></asp:Label>
                        </div>
                        <div class="left">
                            <div id="C1_Row2_Col2" class="LFloat_Content ContentWidth">
                                <dxe:ASPxComboBox ID="CmbGroupBy" runat="server" ValueType="System.String" ClientInstanceName="cCmbGroupBy"
                                    SelectedIndex="0" TabIndex="0" Width="125px">
                                    <items>
                                        <dxe:ListEditItem Text="Client" Value="C"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Branch" Value="B"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Group" Value="G"></dxe:ListEditItem>
                                    </items>
                                    <clientsideevents selectedindexchanged="function(s, e) {fn_GroupBy(s.GetValue());}" />
                                </dxe:ASPxComboBox>
                            </div>
                            <div class="left">
                                <div>
                                    <div id="C1_Row2_Col3" class="LFloat_Content ABS_ContentWidth">
                                        <dxe:ASPxRadioButtonList ID="RblClient" runat="server" SelectedIndex="0" ItemSpacing="20px"
                                            Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                            ClientInstanceName="cRblClient">
                                            <items>
                                                <dxe:ListEditItem Text="All" Value="A" />
                                                <dxe:ListEditItem Text="Selected" Value="S" />
                                                <dxe:ListEditItem Text="AllButSelected" Value="D" />
                                            </items>
                                            <clientsideevents valuechanged="function(s, e) {fn_Client(s.GetValue());}" />
                                            <border borderwidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                </div>
                                <div>
                                    <div id="C1_Row2_Col4" class="LFloat_Content ABS_ContentWidth">
                                        <dxe:ASPxRadioButtonList ID="RblBranch" runat="server" SelectedIndex="0" ItemSpacing="20px"
                                            Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                            ClientInstanceName="cRblBranch">
                                            <items>
                                                <dxe:ListEditItem Text="All" Value="A" />
                                                <dxe:ListEditItem Text="Selected" Value="S" />
                                                <dxe:ListEditItem Text="AllButSelected" Value="D" />
                                            </items>
                                            <clientsideevents valuechanged="function(s, e) {fn_Branch(s.GetValue());}" />
                                            <border borderwidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                    <span class="clear"></span>
                                </div>
                                <div id="C1_Row2_Col5">
                                    <div class="LFloat_Content ContentWidth">
                                        <dxe:ASPxComboBox ID="CmbGroupType" ClientInstanceName="cCmbGroupType" runat="server"
                                            Font-Size="11px" TabIndex="0" Width="125px" OnCallback="CmbGroupType_Callback">
                                            <clientsideevents valuechanged="function(s, e) {fn_CmbGroupType(s.GetValue());}"
                                                endcallback="CmbGroupType_EndCallback" />
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="C1_Row2_Col6" class="LFloat_Content ABS_ContentWidth" style="display: none;
                                        margin-top: 3px;">
                                        <dxe:ASPxRadioButtonList ID="RblGroup" runat="server" SelectedIndex="0" ItemSpacing="20px"
                                            Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                            ClientInstanceName="cRblGroup">
                                            <items>
                                                <dxe:ListEditItem Text="All" Value="A" />
                                                <dxe:ListEditItem Text="Selected" Value="S" />
                                                <dxe:ListEditItem Text="AllButSelected" Value="D" />
                                            </items>
                                            <clientsideevents valuechanged="function(s, e) {fn_Group(s.GetValue());}" />
                                            <border borderwidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                    <span class="clear"></span>
                                </div>
                                <span class="clear"></span>
                            </div>
                            <span class="clear"></span>
                        </div>
                        <span class="clear"></span>
                    </div>
                    <span class="clear"></span>
                    <div id="DivPeriod" class="Row">
                        <div id="div18" class="LFloat_Lable LableWidth">
                            <asp:Label ID="lblPeriod" runat="server" Text="Select Period : "></asp:Label>
                        </div>
                        <div id="divPeriodContent" class="LFloat_Content ABS_ContentWidth">
                            <dxe:ASPxRadioButtonList ID="RblDatePeriod" runat="server" SelectedIndex="0" ItemSpacing="30px"
                                Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                ClientInstanceName="cRblDatePeriod">
                                <items>
                                    <dxe:ListEditItem Text="As On Date" Value="D"/>
                                    <dxe:ListEditItem Text="Date Range" Value="P" />
                                </items>
                                <clientsideevents valuechanged="function(s, e) {fn_DatePeriod(s.GetValue());}" />
                                <border borderwidth="0px" />
                            </dxe:ASPxRadioButtonList>
                        </div>
                    </div>
                    <span class="clear"></span>
                    <div id="divDate" class="Row">
                        <div id="C1_Row3_Col1" class="LFloat_Lable LableWidth">
                            <asp:Label ID="lblDate" runat="server" Text="Date : "></asp:Label>
                        </div>
                        <div id="C1_Row3_Col2" class="LFloat_Content ContentWidth">
                            <dxe:ASPxDateEdit ID="dtPosition" runat="server" ClientInstanceName="cdtPosition"
                                DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                                Width="125px" Font-Size="11px" TabIndex="0">
                                <dropdownbutton text="Select">
                                </dropdownbutton>
                                <%--New Work 04/05/2023--%>
                                <clientsideevents datechanged="function(s,e){DateChange(cdtPosition);}"></clientsideevents>
                                <%--<clientsideevents datechanged="function(s,e){DateCompare(cdtPosition);}"></clientsideevents>--%>
                                <%--End of New Work 04/05/2023--%>
                            </dxe:ASPxDateEdit>
                        </div>
                        <span class="clear"></span>
                    </div>
                    <div id="DivDateRange" class="Row">
                        <div id="Div16" class="LFloat_Lable LableWidth">
                            <asp:Label ID="Label10" runat="server" Text="Date Range : "></asp:Label>
                        </div>
                        <div id="Div17" class="LFloat_Content ContentWidth">
                            <dxe:ASPxDateEdit ID="DtFrom" runat="server" ClientInstanceName="cDtFrom"
                                DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                                Width="125px" Font-Size="11px" TabIndex="0">
                                <dropdownbutton text="From">
                                </dropdownbutton>
                                <%--New Work 04/05/2023--%>
                                <%--<clientsideevents datechanged="function(s,e){DateChecking(cDtFrom,cDtTo);}"></clientsideevents>--%>
                                <clientsideevents datechanged="function(s,e){DateChangeForFrom();DateCompare(cDtFrom,cDtTo);}" />
                                <%--End of New Work 04/05/2023--%>
                            </dxe:ASPxDateEdit>
                        </div>
                        <div id="Div1" class="LFloat_Content ContentWidth">
                            <dxe:ASPxDateEdit ID="DtTo" runat="server" ClientInstanceName="cDtTo"
                                DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                                Width="125px" Font-Size="11px" TabIndex="0">
                                <dropdownbutton text="To">
                                </dropdownbutton>
                                <%--New Work 04/05/2023--%>
                                <%--<clientsideevents datechanged="function(s,e){DateChecking(cDtFrom,cDtTo);}"></clientsideevents>--%>
                                <clientsideevents datechanged="function(s,e){DateChangeForTo();DateCompare(cDtFrom,cDtTo);}" />
                                <%--End of New Work 04/05/2023--%>
                            </dxe:ASPxDateEdit>
                        </div>
                        <span class="clear"></span>
                    </div>
                    <span class="clear"></span>
                    <div id="Div_RptOf" class="Row">
                        <div id="Div12" class="LFloat_Lable LableWidth">
                            <asp:Label ID="Label8" runat="server" Text="Report Type : "></asp:Label>
                        </div>
                        <div id="Div13" class="LFloat_Content">
                            <dxe:ASPxComboBox ID="CmbRptOf" runat="server" ValueType="System.String" ClientInstanceName="cCmbRptOf"
                                SelectedIndex="0" Width="160px" TabIndex="0">
                                <items>
                                    <dxe:ListEditItem Text="Contract Note" Value="1"></dxe:ListEditItem>
                                    <dxe:ListEditItem Text="Trade Annexure" Value="2"></dxe:ListEditItem>
                                </items>
                                <%--<clientsideevents selectedindexchanged="function(s, e) {fn_ReportType(s.GetValue());}" />--%>
                            </dxe:ASPxComboBox>
                        </div>
                        <%--New Work--%>
                        <%--New Work 05/12/2024--%>
                        <%--<div id="Div19" class="LFloat_Lable">
                            <asp:Label ID="Label12" runat="server" Text="Select ContractNotes No.: "></asp:Label>
                            <dxe:ASPxTextBox ID="txtCNoteNo" runat="server" Width="125px" MaxLength="4" CssClass="upper" ClientEnabled="false" ClientInstanceName="CtxtCNoteNo">
                                <MaskSettings Mask="<0..9999>"/>
                            </dxe:ASPxTextBox>
                        </div>--%>
                        <div id="Div19" class="LFloat_Lable">
                            <asp:Label ID="Label12" runat="server" Text="Select ContractNotes No.: "></asp:Label>
                            <dxe:ASPxTextBox ID="txtCNoteNo" runat="server" Width="125px" MaxLength="10" CssClass="upper" ClientEnabled="false" ClientInstanceName="CtxtCNoteNo">
                                <MaskSettings Mask="<0..9999999999>"/>
                            </dxe:ASPxTextBox>
                        </div>
                        <%--End of New Work 05/12/2024--%>
                        <%--End of New Work--%>
                        <span class="clear"></span>
                    </div>
                    
                    <span class="clear"></span>
                    <div id="C1_Row4" class="Row">
                        <div id="C1_Row4_Col1" class="LFloat_Lable LableWidth">
                            <asp:Label ID="lblAddSignatory" runat="server" Text="Add Signatory : "></asp:Label>
                        </div>
                        <div id="C1_Row4_Col2" class="left">
                            <div class="LFloat_Content">
                                <input id="chkSignature" type="checkbox" onclick="ChkSignature()" runat="server" />
                            </div>
                            <div id="C1_Row4_Col3" class="left">
                                <div class="LFloat_Lable LableWidth">
                                    <asp:Label ID="lblEmplist" runat="server" Text="Employee:"></asp:Label>
                                </div>
                                <div id="C1_Row4_Col4" class="LFloat_Content">
                                    <asp:TextBox ID="txtEmpName" runat="server" Width="205px"></asp:TextBox>
                                </div>
                                <span class="clear"></span>
                            </div>
                            <span class="clear"></span>
                        </div>
                        <span class="clear"></span>
                    </div>
                    <span class="clear"></span>
                    <div id="div_forchkbox" class="Row">
                        <div id="div2" class="LFloat_Lable LableWidth">
                            <asp:Label ID="Label2" runat="server" Text="Only Contractnote"></asp:Label>
                        </div>
                        <div id="div3" class="LFloat_Content">
                            <asp:CheckBox ID="chkonlybill" runat="server" />
                        </div>
                        <span class="clear"></span>
                    </div>
                    <span class="clear"></span>
                    <div id="div_BothSidePrnt" class="Row">
                        <div id="div4" class="LFloat_Lable LableWidth">
                            <asp:Label ID="Label4" runat="server" Text="Both Side Printing"></asp:Label>
                        </div>
                        <div id="div5" class="LFloat_Content">
                            <asp:CheckBox ID="chkBothSidePrnt" runat="server" />
                        </div>
                        <span class="clear"></span>
                    </div>
                    <span class="clear"></span>
                    <div id="div_ShowTotlBrkg" class="Row">
                        <div id="div6" class="LFloat_Lable LableWidth" style="width:180px">
                            <asp:Label ID="Label5" runat="server" Text="Dont Show Total Brokerage:"></asp:Label>
                        </div>
                        <div id="div7" class="LFloat_Content">
                            <asp:CheckBox ID="chkTotlBrkg" runat="server" />
                        </div>
                        <span class="clear"></span>
                    </div>
                    <span class="clear"></span>
                    <div id="div_ShowBrnchName" class="Row">
                        <div id="div9" class="LFloat_Lable LableWidth" style="width:180px">
                            <asp:Label ID="Label6" runat="server" Text="Dont Show BranchName:"></asp:Label>
                        </div>
                        <div id="div10" class="LFloat_Content">
                            <asp:CheckBox ID="chkBrnchName" runat="server" />
                        </div>
                        <span class="clear"></span>
                    </div>
                    <span class="clear"></span>
                    <div id="div_AverageType" class="Row">
                        <div id="div8" class="LFloat_Lable LableWidth" style="width:290px">
                            <asp:Label ID="Label7" runat="server" Text="Dont Show OrderNo\TradeNo for Avrg Trade:"></asp:Label>
                        </div>
                        <div id="div11" class="LFloat_Content">
                            <asp:CheckBox ID="chkAvgType" runat="server" />
                        </div>
                        <span class="clear"></span>
                    </div>
                    <span class="clear"></span>
                    <div id="div_ntPrntngAnnexure" class="Row">
                        <div id="div14" class="LFloat_Lable LableWidth" style="width:180px">
                            <asp:Label ID="Label9" runat="server" Text="Dont Print Trade Annexure:"></asp:Label>
                        </div>
                        <div id="div15" class="LFloat_Content">
                            <asp:CheckBox ID="chkTradeAnnexure" runat="server" />
                        </div>
                        <span class="clear"></span>
                    </div>
                    <br class="clear" />
                    <div id="div_location" class="Row">
                        <div id="div_label" class="LFloat_Lable LableWidth">
                            <asp:Label ID="Label1" runat="server" Text="Location :"></asp:Label>
                        </div>
                        <div id="div_control1" class="LFloat_Content">
                            <asp:DropDownList ID="ddlLocation" Font-Size="12px" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div id="div_PdfLocation" class="Row">
                        <div id="div20" class="LFloat_Lable LableWidth">
                            <asp:Label ID="Label11" runat="server" Text="Report Save Location :"></asp:Label>
                        </div>
                        <div id="div21" class="LFloat_Content">
                             <dxe:ASPxComboBox ID="CmbPdfLocation" ClientInstanceName="cCmbPdfLocation" runat="server"
                                            Font-Size="11px" TabIndex="0" Width="200px" OnCallback="CmbPdfLocation_Callback">
                             </dxe:ASPxComboBox>
                        </div>
                    </div>
                    <br class="clear" />
                    <div id="row3_col1pop" class="Info" style="font-size:14px; width:250px; line-height:0.2">
                        Provided Billing is done for the day.
                    </div>
                    <br class="clear" />
                    <div style="float:left; width: 300px;">
                        <div id="C1_Row6" style="float:left">
                            <dxe:ASPxButton ID="btnshow" runat="server" CssClass="btnUpdate" AutoPostBack="False"
                                Height="5px" Text="Generate" Width="101px" ClientInstanceName="cBtnupdate">
                                <clientsideevents click="function (s, e) {fn_show();}" />
                            </dxe:ASPxButton>
                            <asp:HiddenField ID="hdnIsAnnexture" runat="server" />
                        </div>
                        <div id="C1_Row7" style="float:left;margin-left:10px">
                            <dxe:ASPxButton ID="btnPrintAll" runat="server" CssClass="btnUpdate" AutoPostBack="False"
                                Height="5px" Text="Print All" Width="110px" ClientInstanceName="cbtnPrintAll">
                                <clientsideevents click="function (s, e) {Fn_printAll();}" />
                            </dxe:ASPxButton>
                        </div>
                    </div>
                </div>
                <div id="Container2" class="container">
                    <div id="C2_Row0" class="Row">
                        <div id="C2_Row0_Col1" class="LFloat_Content">
                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="300px" TabIndex="0"></asp:TextBox>
                        </div>
                        <div id="C2_Row0_Col2" class="LFloat_Lable">
                            <a href="javascript:void(0);" tabindex="0" onclick="btnAddToList_click()"><span class="lnkBtnAjax green">
                                Add to List</span></a>
                        </div>
                    </div>
                    <div id="C2_Row1" class="Row">
                        <div id="C2_Row1_Col1" class="LFloat_Content finalSelectedBox">
                            <asp:ListBox ID="lstSelection" runat="server" Font-Size="12px" Height="100px" Width="400px"
                                TabIndex="0"></asp:ListBox>
                        </div>
                    </div>
                    <div id="C2_Row2" class="Row">
                        <div id="C2_Row2_Col1" class="LFloat_Lable">
                            <a href="javascript:void(0);" tabindex="0" onclick="lnkBtnAddFinalSelection()"><span
                                class="lnkBtnAjax blue">Done</span></a>&nbsp;&nbsp; <a href="javascript:void(0);"
                                    tabindex="0" onclick="lnkBtnRemoveFromSelection()"><span class="lnkBtnAjax red">Remove</span></a>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div id="DivDosPrntGrid" class="left">
              <div class="left" style="padding-bottom: 10px">
                  <dxe:ASPxButton ID="btnDosPrnt1" runat="server" CssClass="btnUpdate" AutoPostBack="False"
                        Height="5px" Text="Print" ToolTip="Print Selected" Width="101px" ClientInstanceName="cbtnDosPrnt1">
                        <clientsideevents click="function (s, e) {fn_DosPrnt();}" />
                  </dxe:ASPxButton>
              </div>
              <div class="left" style="padding-bottom: 10px;height:10px;width:130px; border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid; margin-left: 4px;">
                <dxe:ASPxCheckBox ID="chkExclude" runat="server" ClientInstanceName="cchkExclude" Text="Exclude Selected"
                    ToolTip="Select/Deselect all rows">
                    <clientsideevents checkedchanged="OnSelectedCheckedChanged"></clientsideevents>
                </dxe:ASPxCheckBox>
                <%--<asp:CheckBox ID="chkExclude" onclick="SelectExclude(this);" runat="Server" Text="Exclude Selected " Font-Size="Small" />--%>
              </div>
              <dxwgv:ASPxGridView ID="GvDOSPrintView" runat="server" AutoGenerateColumns="False"
                    ClientInstanceName="cGvDOSPrintView" KeyFieldName="UID" OnCustomCallback="GvDOSPrintView_CustomCallback"
                    OnHtmlRowCreated="GvDOSPrintView_HtmlRowCreated" OnProcessColumnAutoFilter="GvDOSPrintView_ProcessColumnAutoFilter"
                    Width="960px">
                    <ClientSideEvents EndCallback="function(s, e) {GvDOSPrintView_EndCallBack();}" />
                    <ClientSideEvents SelectionChanged="function(s, e) { OnGridFocusedRowChanged(); }" />
                   <Columns>
                        <dxwgv:GridViewCommandColumn HeaderStyle-HorizontalAlign="Center"
                            ShowSelectCheckbox="True" VisibleIndex="0" Width="40px">
                            <HeaderTemplate>
                              <dxe:ASPxCheckBox ID="cbAll" runat="server" BackColor="White" ClientInstanceName="cbAll"
                                    OnInit="cbAll_Init"
                                    ToolTip="Select/Deselect all rows">
                                    <clientsideevents checkedchanged="OnAllCheckedChanged"></clientsideevents>
                                </dxe:ASPxCheckBox>
                                  <%-- --%>
                               
                            </HeaderTemplate>
                        </dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="SerialNo" FieldName="SerialNo" VisibleIndex="0" Width="42px">
                            <CellStyle  CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataColumn Caption="Client Name"  HeaderStyle-HorizontalAlign="Center" FieldName="ClientName" 
                            VisibleIndex="2" Width="155px">
                            <CellStyle  CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn Caption="ContractNoteNo" FieldName="contractnoteno" 
                            VisibleIndex="3" Width="90px">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn Caption="Segment" FieldName="ExchangeSegment" VisibleIndex="4" Width="80px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn Caption="TCode" FieldName="CurrentSeg_TCode" VisibleIndex="5" Width="95px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn Caption="SettlmntNoType" FieldName="Settno" VisibleIndex="6"
                            Width="100px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn Caption="Branch Name" HeaderStyle-HorizontalAlign="Center" FieldName="BranchName" VisibleIndex="7"
                            Width="200px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" AllowGroup="false" AllowSort="false" />
                    <Settings GridLines="Both" ShowGroupPanel="True" ShowHorizontalScrollBar="True" />
                    <Styles>
                        <FocusedRow BackColor="#FCA977" HorizontalAlign="Left" VerticalAlign="Top">
                        </FocusedRow>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                    <SettingsPager AlwaysShowPager="False" Mode="ShowAllRecords"
                         ShowSeparators="True">
                    </SettingsPager>
                </dxwgv:ASPxGridView>
                <div class="left" style="padding-top: 10px">
                  <dxe:ASPxButton ID="btnDosPrnt2" runat="server" CssClass="btnUpdate" AutoPostBack="False"
                        Height="5px" Text="Print" ToolTip="Print Selected" Width="101px" ClientInstanceName="cbtnDosPrnt2">
                        <clientsideevents click="function (s, e) {fn_DosPrnt();}" />
                  </dxe:ASPxButton>
                </div>
            </div>
            <div id="Row1" class="Row">
                <div id="Container3" class="container">
                    <div id="C3_Row0" style="margin-left: 10px;">
                        <table class="gridcellleft" cellpadding="0" cellspacing="0" border="1" style="padding: 2px;">
                            <tr style="background-color: lavender; text-align: left; font-size: 12px;">
                                <td colspan="5">
                                    <b>ECN Related Detail </b>
                                </td>
                            </tr>
                            <tr style="background-color: #DBEEF3; font-size: 12px;">
                                <td>
                                    <b>Total Client</b>
                                </td>
                                <td>
                                    <b>ECN ENABLE</b>
                                </td>
                                <td>
                                    <b>DELIVERED</b>
                                </td>
                            </tr>
                            <tr style="background-color: #eee;">
                                <td>
                                    <b style="text-align: right; margin-right: 5px" id="B_allcontract" runat="server"></b>
                                    <a href="javascript:ShowHideFilter('v1');"><span style="color: Blue; text-decoration: underline;
                                        font-size: 11px; margin-right: 2px;" id="spantotal">View Detail</span></a>
                                </td>
                                <td>
                                    <b style="text-align: right; margin-right: 5px" id="B_ecnenable" runat="server"></b>
                                    <a href="javascript:ShowHideFilter('v2');"><span style="color: Blue; text-decoration: underline;
                                        font-size: 11px; margin-right: 2px;" id="spanonlyimport">View Detail</span></a>
                                </td>
                                <td>
                                    <b style="text-align: right; margin-right: 5px" id="B_deliveryrpt" runat="server"></b>
                                    <a href="javascript:ShowHideFilter('v3');"><span style="color: Blue; text-decoration: underline;
                                        font-size: 11px; margin-right: 2px;" id="spannotimport">View Detail</span></a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <span class="clear"></span>
                    <div id="C3_Row1">
                        <div id="C3_Row1_Col1" class="LFloat_Lable LableWidth">
                            <asp:Label ID="lblSigname" runat="server" Text="Signature : "></asp:Label>
                        </div>
                        <div id="C3_Row1_Col2" class="LFloat_Content ">
                            <asp:TextBox ID="txtdigitalName" runat="server" Width="300px"></asp:TextBox>
                        </div>
                    </div>
                    <span class="clear"></span>
                    <div id="td_msg" runat="server">
                        <asp:Label ID="Location" runat="server" Text="You Dont have Permission to sent ECN/ Contact to Administrator"
                            ForeColor="red" Font-Bold="true"></asp:Label>
                    </div>
                    <span class="clear"></span>
                    <div id="C3_button">
                        <dxe:ASPxButton ID="btnopenpopup" runat="server" CssClass="btnUpdate" AutoPostBack="False"
                            Height="5px" Text="Click to Send" Width="175px">
                            <clientsideevents click="function (s, e) {fn_showpopup();}" />
                        </dxe:ASPxButton>
                    </div>
                     <div id="C3_GeneratPDF">
                        <dxe:ASPxButton ID="BtnGeneratePdf" ClientInstanceName="cBtnGeneratePdf" runat="server" CssClass="btnUpdate" AutoPostBack="False"
                            Height="5px" Text="Click to Generate" Width="175px">
                            <clientsideevents click="function (s, e) {fn_GenearatePDF();}" />
                        </dxe:ASPxButton>
                    </div>
                </div>
                <dxpc:ASPxPopupControl ID="PopUp_ScripAlert" runat="server" ClientInstanceName="cPopUp_ScripAlert"
                    Width="340px" HeaderText="ECN Detail Information" PopupHorizontalAlign="Center"
                    PopupVerticalAlign="Middle" CloseAction="None" Modal="True" ShowCloseButton="False">
                    <ContentCollection>
                        <dxpc:PopupControlContentControl runat="server">
                            <dxcp:ASPxCallbackPanel ID="CbpSuggestISIN" runat="server" ClientInstanceName="cCbpSuggestISIN"
                                BackColor="White" OnCallback="CbpSuggestISIN_Callback" LoadingPanelText="Sending....Please Wait !!"
                                LoadingPanelStyle-Font-Bold="true" LoadingPanelStyle-Cursor="wait" LoadingPanelStyle-ForeColor="gray"
                                LoadingPanelImage-Url='../images/Animated_Email.gif'>
                                <ClientSideEvents EndCallback="CbpSuggestISIN_EndCallBack" />
                                <PanelCollection>
                                    <dxp:panelcontent runat="server">
                                        <div id="div_fail" style="color: Red; font-weight: bold; font-size: 12px;">
                                            An Internal Error Occured during sending some ECNs.Please send Remaing.
                                        </div>
                                        <div id="div_success" style="color: Green; font-weight: bold; font-size: 12px;">
                                            Successfully send ECNs.
                                        </div>
                                        <%--<asp:Label runat="server" ID="div_success" Text="efgh"></asp:Label>--%>
                                        <br />
                                        <br />
                                        <div style="font-weight: bold; color: black; background-color: gainsboro; border-right: silver thin solid;
                                            border-top: silver thin solid; border-left: silver thin solid; border-bottom: silver thin solid;">
                                            No of ECN Sent : <b style="text-align: right" id="B_allcontractpop" runat="server"></b>
                                            <br />
                                            <%--<asp:Image src='../Documents/Animated_Email.gif' runat="server" />--%>
                                            <br />
                                            Remaining ECN (To Be Sent) : <b style="text-align: right" id="B_ecnenablepop" runat="server">
                                            </b>
                                        </div>
                                        <br />
                                        <br />
                                        <div class="frmleftCont" id="btnall">
                                            <dxe:ASPxButton ID="btnsendall" runat="server" AutoPostBack="False" Text="Send All">
                                                <clientsideevents click="function (s, e) {btnsendall_Click();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <div class="frmleftCont" id="btnremain">
                                            <dxe:ASPxButton ID="btnsendremaining" runat="server" AutoPostBack="False" Text="Send Remaining">
                                                <clientsideevents click="function (s, e) {btnsendremaining_Click();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <div class="frmleftCont" id="btnokdiv">
                                            <dxe:ASPxButton ID="btnok" runat="server" AutoPostBack="False" Text="Close">
                                                <clientsideevents click="function (s, e) {btnok_Click();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <div class="frmleftCont" id="cancel">
                                            <dxe:ASPxButton ID="btncancel" runat="server" AutoPostBack="False" Text="Cancel">
                                                <clientsideevents click="function (s, e) {btncancel_Click();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                    </dxp:panelcontent>
                                </PanelCollection>
                            </dxcp:ASPxCallbackPanel>
                        </dxpc:PopupControlContentControl>
                    </ContentCollection>
                    <HeaderStyle BackColor="LightGray" ForeColor="Black" />
                </dxpc:ASPxPopupControl>
                
            </div>
            <div style="display: none">
                <asp:TextBox ID="txtEmpName_hidden" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtdigitalName_hidden" runat="server" Width="300px"></asp:TextBox>
                <asp:TextBox ID="txtSelectionID_hidden" runat="server"></asp:TextBox>
                <asp:HiddenField ID="HiddenField_ClientBranchGroup" runat="server" />
                <asp:Button ID="btnPdfExport" runat="server" OnClick="btnPdfExport_Click" />
                <asp:Button ID="btndosprint" runat="server" OnClick="btndosprint_Click" />
                <asp:HiddenField ID="hdnEmailNotFound" runat="server" />
                <asp:HiddenField ID="hdnpath" runat="server" />
                <asp:HiddenField ID="hdnLocationPath" runat="server" />
                <asp:Button ID="BtnForExportEvent" runat="server" OnClick="cmbExport_SelectedIndexChanged"
                    BackColor="#DDECFE" BorderStyle="None" />
                <asp:Button ID="BtnForExportEvent1" runat="server" OnClick="cmbExport1_SelectedIndexChanged"
                    BackColor="#DDECFE" BorderStyle="None" />
                <asp:Button ID="BtnForExportEvent2" runat="server" OnClick="cmbExport2_SelectedIndexChanged"
                    BackColor="#DDECFE" BorderStyle="None" />
                <dxcp:ASPxCallbackPanel ID="CbpExportPanel" runat="server" ClientInstanceName="cCbpExportPanel"
                    OnCallback="CbpExportPanel_Callback">
                    <PanelCollection>
                        <dxp:panelcontent runat="server">
                        </dxp:panelcontent>
                    </PanelCollection>
                    <ClientSideEvents EndCallback="cCbpExportPanel_EndCallBack" />
                </dxcp:ASPxCallbackPanel>
            </div>
        </div>
        <div id='LoadingDiv' style='display:none;position: absolute; font-family: arial; font-size: 30; left: 50%; top: 20%; background-color: white; layer-background-color: white; height: 80; width: 150;'>
            <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td height='25' align='center' bgcolor='#FFFFFF'>
                                    <img src='../images/progress.gif' width='18' height='18'></td>
                                <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                    <font size='1' face='Tahoma'><strong align='center'>Please Wait..</strong></font></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
