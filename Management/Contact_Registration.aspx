<%@ page language="C#" autoeventwireup="true" inherits="management_Contact_Registration, App_Web_zsukfi_p" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Contact Registration</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>

    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:100;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:5;
	}
	
	form{
		display:inline;
	}
	
	</style>
    <style type="text/css">
a {
    color:#000;
 }
</style>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script language="javascript" type="text/javascript">
     function ChangeDateFormat_CalToDB(obj)
            {
                var SelectedDate = new Date(obj);            
                var monthnumber = SelectedDate.getMonth() + 1;
                var monthday    = SelectedDate.getDate();
                var year        = SelectedDate.getYear();            
                var changedDateValue=year+'-'+monthnumber+'-'+monthday;
                return changedDateValue;
            }
////=======
//		sEntryDate=cdtentrydate.GetDate(); 
//                sEntryDate=ChangeDateFormat_CalToDB(sEntryDate); 

//===================================
            function ChangeDateFormat_SetCalenderValue(obj)
            {       
                var SelectedDate = new Date(obj);
                var monthnumber = SelectedDate.getMonth();
                var monthday    = SelectedDate.getDate();
                var year        = SelectedDate.getYear();            
                var changeDateValue=new Date(year, monthnumber, monthday);
                return changeDateValue;            
             }

//======= 
//                var currentDate=ChangeDateFormat_SetCalenderValue('<%=Session["NowDate"]%>');
//                cDtAddRateDate.SetDate(currentDate);      

    
    
    function SignOff()
    {
        window.parent.SignOff()
    }
    EditPopUpID='';
    function fn_btnCancel()
        {
            cPopup_StatutoryRegistration.Hide();
        }
        function ForcePostBack()
        {
          // alert("test");
            document.getElementById("hdnBannedPAN").value='n';
            document.getElementById("hdnDuplicatePAN").value='n';
           __doPostBack();
        }
    function Reset()
    {       
        document.getElementById('<%=hiddenedit.ClientID%>').value='';
        cchkPan.SetChecked(false);
        ccmbSR.SetSelectedIndex(0);
        cCmbProofType.SetSelectedIndex(0);
        HideShow('PanCheck','S');   
        //cCmbProofNumber.SetText('');
        ctxtNumber.SetText('');
        ctxtIssuePlace.SetText('');
        cdtValid.SetDate(new Date());
        cdtIssue.SetDate(new Date());
    }    
    function fn_PopOpen()
    {
        Reset();
        cPopup_StatutoryRegistration.Show(); 
        fn_ComboIndexChange('1');  
        
        cbtnSave_Registration.SetText('Save');
        ctxtNumber.SetText('');
            ctxtIssuePlace.SetText('Not Applicable');
            ctxtRegAuthName.SetText('Not Applicable');
            cCmbProofNumber.SetText('Not Applicable');
            ctxtNumber.SetEnabled(true);
             ccmbSR.SetEnabled(true);
           cCmbProofType.SetEnabled(false);
           cCmbProofNumber.SetEnabled(false);
           ctxtIssuePlace.SetEnabled(false);
           cdtValid.SetEnabled(false);
           cdtIssue.SetEnabled(false);
           ccmbVerify.SetEnabled(true);
           ctxtRegAuthName.SetEnabled(false);
             
    }
    function fn_PopEditOpen(keyValue)
    {
        //New Work
        var WhichRights = document.getElementById('hdnRights').value;
        if(WhichRights !="F" && keyValue!="")
        {
          alert("You have no Rights to Edit Data.");
        }
        else
        {
        //End of New Work
            grid.PerformCallback("Edit~"+keyValue); 
        //New Work
        }
        //End of New Work
    }
    function fn_Delete(keyValue)
    {
        //New Work
        var WhichRights = document.getElementById('hdnRights').value;
        if(WhichRights !="F")
        {
          alert("You have no Rights to Delete.");
        }
        else
        {
        //End of New Work
         document.getElementById("hdnBannedPAN").value='n';
         document.getElementById("hdnDuplicatePAN").value='n';
         grid.PerformCallback("DeleteItem~"+keyValue); 
        //New Work
        }
        //End of New Work
    }
    function fn_CheckChange(s,e)
    {
        if (s.GetChecked())
        {
            ctxtNumber.SetText('PAN_EXEMPT');
            ctxtIssuePlace.SetText('');
            ctxtRegAuthName.SetText('Not Applicable');
            cCmbProofNumber.SetText('');
            //
            ctxtNumber.SetEnabled(false);
           ccmbSR.SetEnabled(true);
           cCmbProofType.SetEnabled(true);
           cCmbProofNumber.SetEnabled(true);
           ctxtIssuePlace.SetEnabled(true);
           cdtValid.SetEnabled(true);
           cdtIssue.SetEnabled(true);
           ccmbVerify.SetEnabled(true);
           ctxtRegAuthName.SetEnabled(false)
           
            cCmbProofType.SetValue(1);
            
        }
        else
        {
            ctxtNumber.SetText('');
            ctxtIssuePlace.SetText('Not Applicable');
            ctxtRegAuthName.SetText('Not Applicable');
            cCmbProofNumber.SetText('Not Applicable');
            ctxtNumber.SetEnabled(true);
             ccmbSR.SetEnabled(true);
           cCmbProofType.SetEnabled(false);
           cCmbProofNumber.SetEnabled(false);
           ctxtIssuePlace.SetEnabled(false);
           cdtValid.SetEnabled(false);
           cdtIssue.SetEnabled(false);
           ccmbVerify.SetEnabled(true);
           ctxtRegAuthName.SetEnabled(false)
        }
    }
    function fn_ComboIndexChange(ele)
    {   
       
            ctxtNumber.SetText('');
            ctxtNumber.SetEnabled(true);
            cdtValid.SetDate(new Date());
            cdtIssue.SetDate(new Date());
       
        
        if(ele=='1')
        {
           ctxtNumber.SetText('');
           ctxtNumber.SetEnabled(true);
           ccmbSR.SetEnabled(true);
           cCmbProofType.SetEnabled(false);
           ctxtIssuePlace.SetText('Not Applicable');
           cCmbProofNumber.SetEnabled(false);
           ctxtIssuePlace.SetEnabled(false);
           cdtValid.SetEnabled(false);
           cdtIssue.SetEnabled(false);
           ccmbVerify.SetEnabled(true);
           ctxtRegAuthName.SetEnabled(false);
           HideShow('PanCheck','S');
        
        }
        
       else if((ele=='5') || (ele=='3'))
        {

         ctxtNumber.SetText('');
          ctxtIssuePlace.SetText('');
            ctxtNumber.SetEnabled(true);
             ccmbSR.SetEnabled(true);
           cCmbProofType.SetEnabled(false);
           cCmbProofNumber.SetEnabled(false);
           ctxtIssuePlace.SetEnabled(true);
           cdtValid.SetEnabled(false);
           cdtIssue.SetEnabled(true);
           ccmbVerify.SetEnabled(true);
           ctxtRegAuthName.SetEnabled(false);
            HideShow('PanCheck','H');
        
        }

        else if((ele=='2') || (ele=='4') || (ele=='6') || (ele=='9')|| (ele=='11'))
        {
             ctxtNumber.SetText('');
            ctxtIssuePlace.SetText('');
            ctxtRegAuthName.SetText('Not Applicable');
            cCmbProofNumber.SetText('Not Applicable');
            ctxtNumber.SetEnabled(true);
             ccmbSR.SetEnabled(true);
           cCmbProofType.SetEnabled(false);
           cCmbProofNumber.SetEnabled(false);
           ctxtIssuePlace.SetEnabled(true);
           cdtValid.SetEnabled(true);
           cdtIssue.SetEnabled(true);
           ccmbVerify.SetEnabled(true);
           ctxtRegAuthName.SetEnabled(false);
           HideShow('PanCheck','H');
        }
        else if((ele=='7') || (ele=='8'))
        {
             ctxtNumber.SetText('');
            ctxtIssuePlace.SetText('');
            ctxtRegAuthName.SetText('Not Applicable');
            cCmbProofNumber.SetText('Not Applicable');
            ctxtNumber.SetEnabled(true);
             ccmbSR.SetEnabled(true);
           cCmbProofType.SetEnabled(false);
           cCmbProofNumber.SetEnabled(false);
           ctxtIssuePlace.SetEnabled(true);
           cdtValid.SetEnabled(false);
           cdtIssue.SetEnabled(true);
           ccmbVerify.SetEnabled(true);
           ctxtRegAuthName.SetEnabled(false);
           HideShow('PanCheck','H');
        }
        
        else if((ele=='10') || (ele=='13'))
        {
              ctxtNumber.SetText('');
            ctxtIssuePlace.SetText('');
            ctxtRegAuthName.SetText('');
            cCmbProofNumber.SetText('Not Applicable');
            ctxtNumber.SetEnabled(true);
             ccmbSR.SetEnabled(true);
           cCmbProofType.SetEnabled(false);
           cCmbProofNumber.SetEnabled(false);
           ctxtIssuePlace.SetEnabled(true);
           cdtValid.SetEnabled(false);
           cdtIssue.SetEnabled(true);
           ccmbVerify.SetEnabled(false);
           ctxtRegAuthName.SetEnabled(true);
           HideShow('PanCheck','H');
              
        }
        else if(ele=='12')
        {
            ctxtNumber.SetText('');
            ctxtIssuePlace.SetText('');
            ctxtRegAuthName.SetText('');
            ctxtRegAuthName.SetText('Not Applicable');
            cCmbProofNumber.SetText('Not Applicable');
            ctxtNumber.SetEnabled(true);
            ccmbSR.SetEnabled(true);
           cCmbProofType.SetEnabled(false);
           cCmbProofNumber.SetEnabled(false);
           ctxtIssuePlace.SetEnabled(true);
           cdtValid.SetEnabled(false);
           cdtIssue.SetEnabled(true);
           ccmbVerify.SetEnabled(true);
           ctxtRegAuthName.SetEnabled(true);
           HideShow('PanCheck','H');
              
        }
        else if(ele=='14')
        {
           ctxtNumber.SetText('');
           ctxtNumber.SetEnabled(true);
           ccmbSR.SetEnabled(true);
           cCmbProofType.SetEnabled(false);
           ctxtIssuePlace.SetText('Not Applicable');
           cCmbProofNumber.SetEnabled(false);
           ctxtIssuePlace.SetEnabled(false);
           cdtValid.SetEnabled(false);
           cdtIssue.SetEnabled(false);
           ccmbVerify.SetEnabled(true);
           ctxtRegAuthName.SetEnabled(false);
           HideShow('PanCheck','H');
        
        }
       
    }    
    function btnSave_Registration()
    {

        var type=ccmbSR.GetText();
//        var validuntildt=ChangeDateFormat_CalToDB(cdtValid.GetDate());
//        var issuedate=ChangeDateFormat_CalToDB(cdtIssue.GetDate());
        var validuntildt=cdtValid.GetDate();
        var issuedate=cdtIssue.GetDate();
        
       
//        if((issuedate.split('-')[0].length)<'4')
//            issuedate='19'+issuedate;
//            
//        if((validuntildt.split('-')[0].length)<'4')
//            validuntildt='19'+validuntildt;
        
            
        if(type=="PanCard")  
            {   
                var chk=cchkPan.GetChecked();
                if (ctxtNumber.GetText()=='')
                    {
                        alert('Pan No Required !!');
                        ctxtNumber.Focus();
                    }
                else
                    {
                        if(chk==true)
                            {
                                if (cCmbProofNumber.GetText()=='')
                                    {
                                        alert('Proof No Required !!');
                                        cCmbProofNumber.Focus();
                                    }
                                else if (ctxtIssuePlace.GetText()=='')
                                    {
                                        alert('Place Required !!');
                                        ctxtIssuePlace.Focus();
                                    }  
                                else
                                    {
                                     if(GetObjectID('hiddenedit').value=='')
                                        grid.PerformCallback('savenew~'+type+'~'+chk+'~'+cCmbProofType.GetValue()+'~'+cCmbProofNumber.GetText()+'~'+ctxtNumber.GetText()+'~'+ctxtIssuePlace.GetText()+'~'+validuntildt+'~'+issuedate+'~'+ccmbVerify.GetText());
                                     else
                                        grid.PerformCallback('saveold~'+type+'~'+chk+'~'+cCmbProofType.GetValue()+'~'+cCmbProofNumber.GetText()+'~'+ctxtNumber.GetText()+'~'+ctxtIssuePlace.GetText()+'~'+validuntildt+'~'+issuedate+'~'+ccmbVerify.GetText()+'~'+GetObjectID('hiddenedit').value);
                                    }
                            }
                                    
                        else
                            {
                                if(GetObjectID('hiddenedit').value=='')
                                    grid.PerformCallback('savenew~'+type+'~'+chk+'~'+ctxtNumber.GetText()+'~'+ccmbVerify.GetText());
                                else
                                    grid.PerformCallback('saveold~'+type+'~'+chk+'~'+ctxtNumber.GetText()+'~'+ccmbVerify.GetText()+'~'+GetObjectID('hiddenedit').value);
                            }
                    }
                    
            }
       else if((type=="VoterId")||(type=="SEBI Registration")||(type=="MAPIN CODE"))
            {
                if (ctxtNumber.GetText()=='')
                    {
                        alert('No Required !!');
                        ctxtNumber.Focus();
                    }
                 else if (ctxtIssuePlace.GetText()=='')
                    {
                        alert('Place Required !!');
                        ctxtIssuePlace.Focus();
                    }  
                 
                else 
                    {
                      if(GetObjectID('hiddenedit').value=='')
                            grid.PerformCallback('savenew~'+type+'~'+ctxtNumber.GetText()+'~'+ctxtIssuePlace.GetText()+'~'+issuedate+'~'+ccmbVerify.GetText());
                        else
                            grid.PerformCallback('saveold~'+type+'~'+ctxtNumber.GetText()+'~'+ctxtIssuePlace.GetText()+'~'+issuedate+'~'+ccmbVerify.GetText()+'~'+GetObjectID('hiddenedit').value);
                     }
            }     
            
            
            
        else if((type=="MOA"))
            {
                if (ctxtNumber.GetText()=='')
                    {
                        alert('No Required !!');
                        ctxtNumber.Focus();
                    }
                 else if (ctxtIssuePlace.GetText()=='')
                    {
                        alert('Place Required !!');
                        ctxtIssuePlace.Focus();
                    }  
                 else if (ctxtRegAuthName.GetText()=='')
                    {
                        alert('Reg. Auth Name Required !!');
                        ctxtRegAuthName.Focus();
                    }  
                else 
                    {
                        if(GetObjectID('hiddenedit').value=='')
                            grid.PerformCallback('savenew~'+type+'~'+ctxtNumber.GetText()+'~'+ctxtIssuePlace.GetText()+'~'+validuntildt+'~'+issuedate+'~'+ctxtRegAuthName.GetText());
                        else
                            grid.PerformCallback('saveold~'+type+'~'+ctxtNumber.GetText()+'~'+ctxtIssuePlace.GetText()+'~'+validuntildt+'~'+issuedate+'~'+ctxtRegAuthName.GetText()+'~'+GetObjectID('hiddenedit').value);
                    }
            }
            
            else if(type=="Other")
            {
                if (ctxtRegAuthName.GetText()=='')
                    {
                        alert('Reg. Auth Name Required !!');
                        ctxtRegAuthName.Focus();
                    }
                else if(issuedate==null)
                    {
                    alert('Date field cannot be blanked !!');
                    cdtIssue.Focus();
                    cdtIssue.SetDate(new Date());
                    
                    
                    }   
                else 
                    {
                        if(GetObjectID('hiddenedit').value=='')
                            grid.PerformCallback('savenew~'+type+'~'+ctxtNumber.GetText()+'~'+ctxtIssuePlace.GetText()+'~'+validuntildt+'~'+issuedate+'~'+ctxtRegAuthName.GetText());
                        else
                            grid.PerformCallback('saveold~'+type+'~'+ctxtNumber.GetText()+'~'+ctxtIssuePlace.GetText()+'~'+validuntildt+'~'+issuedate+'~'+ctxtRegAuthName.GetText()+'~'+GetObjectID('hiddenedit').value);
                    }
            }
            
        else if(type=="CIN")
            {
                if (ctxtNumber.GetText()=='')
                    {
                        alert('No Required !!');
                        ctxtNumber.Focus();
                    }
                 else if (ctxtIssuePlace.GetText()=='')
                    {
                        alert('Place Required !!');
                        ctxtIssuePlace.Focus();
                    }  
                 else if (ctxtRegAuthName.GetText()=='')
                    {
                        alert('Reg. Auth Name Required !!');
                        ctxtRegAuthName.Focus();
                    }  
                else 
                    {
                        if(GetObjectID('hiddenedit').value=='')
                            grid.PerformCallback('savenew~'+type+'~'+ctxtNumber.GetText()+'~'+ctxtIssuePlace.GetText()+'~'+validuntildt+'~'+issuedate+'~'+ctxtRegAuthName.GetText()+'~'+ccmbVerify.GetText());
                        else
                            grid.PerformCallback('saveold~'+type+'~'+ctxtNumber.GetText()+'~'+ctxtIssuePlace.GetText()+'~'+validuntildt+'~'+issuedate+'~'+ctxtRegAuthName.GetText()+'~'+ccmbVerify.GetText()+'~'+GetObjectID('hiddenedit').value);
                    }
            }
            else if(type=="AdharCard")
            {
            
             if (ctxtNumber.GetText()=='')
                {
                    alert('No Required !!');
                    ctxtNumber.Focus();
                }                               
            else
                {
                 if(GetObjectID('hiddenedit').value=='')
                    grid.PerformCallback('savenew~'+type+'~'+ctxtNumber.GetText()+'~'+ccmbVerify.GetText());
                else
                    grid.PerformCallback('saveold~'+type+'~'+ctxtNumber.GetText()+'~'+ccmbVerify.GetText()+'~'+GetObjectID('hiddenedit').value);
                }
            }

            else if(type=="GSTIN")
            {
            
             if (ctxtNumber.GetText()=='')
                {
                    alert('No Required !!');
                    ctxtNumber.Focus();
                }                               
            else
                {
                 if(GetObjectID('hiddenedit').value=='')
                    grid.PerformCallback('savenew~'+type+'~'+ctxtNumber.GetText()+'~'+ccmbVerify.GetText());
                else
                    grid.PerformCallback('saveold~'+type+'~'+ctxtNumber.GetText()+'~'+ccmbVerify.GetText()+'~'+GetObjectID('hiddenedit').value);
                }
            }
            
            //Rev: 15Apr2024
            else if(type=="CKYC")
            {
            
             if (ctxtNumber.GetText()=='')
                {
                    alert('No Required !!');
                    ctxtNumber.Focus();
                }                               
            else
                {
                 if(GetObjectID('hiddenedit').value=='')
                    grid.PerformCallback('savenew~'+type+'~'+ctxtNumber.GetText()+'~'+ccmbVerify.GetText());
                else
                    grid.PerformCallback('saveold~'+type+'~'+ctxtNumber.GetText()+'~'+ccmbVerify.GetText()+'~'+GetObjectID('hiddenedit').value);
                }
            }
            //Rev: 15Apr2024...End

           else
            {
                if (ctxtNumber.GetText()=='')
                    {
                        alert('No Required !!');
                        ctxtNumber.Focus();
                    }
                 else if (ctxtIssuePlace.GetText()=='')
                    {
                        alert('Place Required !!');
                        ctxtIssuePlace.Focus();
                    }
                    
                 
                else
                    {
                        if(GetObjectID('hiddenedit').value=='') 
                            grid.PerformCallback('savenew~'+type+'~'+ctxtNumber.GetText()+'~'+ctxtIssuePlace.GetText()+'~'+validuntildt+'~'+issuedate+'~'+ccmbVerify.GetText());
                        else
                            grid.PerformCallback('saveold~'+type+'~'+ctxtNumber.GetText()+'~'+ctxtIssuePlace.GetText()+'~'+validuntildt+'~'+issuedate+'~'+ccmbVerify.GetText()+'~'+GetObjectID('hiddenedit').value);
                    }
            }
            GetObjectID('hiddenedit').value='';
        
    }
//    function DuplicatePanInsertionConfirmation()
//    {
//       var i=confirm("Are you sure to enter this duplicate PAN");
//       if(i==true)
//       {
//        j=confirm("Are you sure to enter this duplicate PAN");
//          if(j==true)
//           {
//            k=confirm("Are you sure to enter this duplicate PAN");
//            if(k==true)
//            {
//              return true;
//            }
//       }
//       return false;
//    }   
//    function BannedPanInsertionConfirmation()
//    {
//       var i=confirm("Are you sure to enter this banned PAN");
//       if(i==true)
//       {
//        j=confirm("Are you sure to enter this banned PAN");
//          if(j==true)
//           {
//            k=confirm("Are you sure to enter this banned PAN");
//            if(k==true)
//            {
//              return true;
//            }
//       }
//       return false;
//    }    
        
    function grid_EndCallBack()
    {
        if(grid.cpinsert!=null) 
            {
            // alert(grid.cpinsert);
                if(grid.cpinsert=='success')
                    {
                        alert('Inserted Successfully');
                        cPopup_StatutoryRegistration.Hide();
                        grid.PerformCallback('onlybind~1');
                        
                    }
                   
                else
                {
                  
                      if(grid.cppanMsg!=null)
                      {
                      var l=false;
                         // alert(grid.cppanMsg);
                         var i=confirm(grid.cppanMsg);
                         if(i==false)
                         {
                           var j=confirm("Are you sure enter this PAN ?");
                           if (j==true)
                           {
                             var k=confirm("Are you sure enter this PAN ?");
                             if (k==true)
                             {
                                 l=confirm("Are you sure enter this PAN ?");
                             }
                           }
                           if(l==true)
                           {
                              //pbm
                              if(grid.cppanDuplicate!=null)
                              {
                                document.getElementById("hdnDuplicatePAN").value='y';
                              }
                              else if (grid.cppanBanned!=null)
                              {
                                  document.getElementById("hdnBannedPAN").value='y';
                                 
                              }
                              
                              btnSave_Registration();
                           }
                           else 
                           {
                               document.getElementById("hdnDuplicatePAN").value='n';
                                 document.getElementById("hdnBannedPAN").value='n';
                              cPopup_StatutoryRegistration.Hide();
                             grid.PerformCallback('onlybind~1');
                           }
                         }
                         else 
                         {
                           cPopup_StatutoryRegistration.Hide();
                           grid.PerformCallback('onlybind~1');
                         }
                      }
                     
                      else {
                             alert('Error on Insertion/n Please Try again!!');
                      }
                     
                    }
                    
            }
        if(grid.cpupdate!=null) 
            {
               // alert(grid.cpupdate);
                if(grid.cpupdate=='success')
                    {
                        alert('Update Successfully');
                        cPopup_StatutoryRegistration.Hide();
                        grid.PerformCallback('onlybind~1');
                        
                    }
                   
                else
                {
                    if(grid.cppanMsg!=null)
                      {
                         // alert(grid.cppanMsg);
                         var l=false;
                        var i= confirm(grid.cppanMsg);
                        if(i==false)
                         {
                           var j=confirm("Are you sure enter this PAN ?");
                           if (j==true)
                           {
                             var k=confirm("Are you sure enter this PAN ?");
                             if (k==true)
                             {
                                 l=confirm("Are you sure enter this PAN ?");
                             }
                           }
                           if(l==true)
                           {
                               if(grid.cppanDuplicate!=null)
                              {
                                document.getElementById("hdnDuplicatePAN").value='y';
                              }
                              else if (grid.cppanBanned!=null)
                              {
                                  document.getElementById("hdnBannedPAN").value='y';
                              }
                              
                              btnSave_Registration();
                           }
                               else 
                               {
                                document.getElementById("hdnDuplicatePAN").value='n';
                                 document.getElementById("hdnBannedPAN").value='n';
                                  cPopup_StatutoryRegistration.Hide();
                                 grid.PerformCallback('onlybind~1');
                               }
                           }
                        else 
                        {
                            cPopup_StatutoryRegistration.Hide();
                           grid.PerformCallback('onlybind~1');
                        }
                        
                      }
                      else 
                      {
                          alert('Error on Updation/n Please Try again!!');
                    }
                    
                    }
                    
            }
            if(grid.cpdelete!=null)
            {
                if(grid.cpdelete=='deleteok')
                    {
                        alert('Deleted Successfully');
                        grid.PerformCallback('onlybind~1');
                        
                    }
                else
                    alert('Error on Deletion/n Please Try again!!');
                
            }
            if(grid.cpalreadyexist!=null)
            {
                alert(grid.cpalreadyexist.split('~')[1]+' Type of Document Already Exist For You');
            
            }
            if(grid.cpedit!=null)
            {
            
                ccmbSR.SetText(grid.cpedit.split('~')[0]);
                if(ccmbSR.GetText()=='PanCard')
                    {
                        if(grid.cpedit.split('~')[3]=='PAN_EXEMPT')
                            {
                                cchkPan.SetChecked(true);
                                ctxtRegAuthName.SetText('Not Applicable');
                                ctxtNumber.SetEnabled(false);
                                ccmbSR.SetEnabled(false);
                                cCmbProofType.SetEnabled(true);
                                cCmbProofNumber.SetEnabled(true);
                                ctxtIssuePlace.SetEnabled(true);
                                cdtValid.SetEnabled(true);
                                cdtIssue.SetEnabled(true);
                                ccmbVerify.SetEnabled(true);
                                ctxtRegAuthName.SetEnabled(false)
                                cCmbProofType.SetValue(grid.cpedit.split('~')[1]);
                                cCmbProofNumber.SetText(grid.cpedit.split('~')[2]);
                                ctxtNumber.SetText(grid.cpedit.split('~')[3]);
                                ctxtIssuePlace.SetText(grid.cpedit.split('~')[4]);
                                cdtValid.SetDate(ChangeDateFormat_SetCalenderValue(grid.cpedit.split('~')[5]));
                                cdtIssue.SetDate(ChangeDateFormat_SetCalenderValue(grid.cpedit.split('~')[6]));
                                ccmbVerify.SetText(grid.cpedit.split('~')[8]);
                               
                            }
                        else
                            {
                                cchkPan.SetChecked(false);
                                ctxtIssuePlace.SetText('Not Applicable');
                                ctxtRegAuthName.SetText('Not Applicable');
                                cCmbProofNumber.SetText('Not Applicable');
                                ctxtNumber.SetEnabled(true);
                                ccmbSR.SetEnabled(false);
                                cCmbProofType.SetEnabled(false);
                                cCmbProofNumber.SetEnabled(false);
                                ctxtIssuePlace.SetEnabled(false);
                                cdtValid.SetEnabled(false);
                                cdtIssue.SetEnabled(false);
                                ccmbVerify.SetEnabled(true);
                                ctxtRegAuthName.SetEnabled(false)
                                cCmbProofType.SetValue(1);
                                ctxtNumber.SetText(grid.cpedit.split('~')[3]);
                                cdtValid.SetDate(new Date());
                                cdtIssue.SetDate(new Date());
                                ccmbVerify.SetText(grid.cpedit.split('~')[8]);
                                
                            }
                        
                        
                    }
                    
                    else if (ccmbSR.GetText()=="VoterId" || ccmbSR.GetText()=="MAPIN CODE" || ccmbSR.GetText()=="SEBI Registration")
                    {
                        ctxtNumber.SetText(grid.cpedit.split('~')[3]);
                        ctxtIssuePlace.SetText(grid.cpedit.split('~')[4]);
                        cdtValid.SetDate(ChangeDateFormat_SetCalenderValue(grid.cpedit.split('~')[5]));
                        cdtIssue.SetDate(ChangeDateFormat_SetCalenderValue(grid.cpedit.split('~')[6]));
                        ctxtRegAuthName.SetText(grid.cpedit.split('~')[7]);
                        ccmbVerify.SetText(grid.cpedit.split('~')[8]);
                        cCmbProofType.SetValue(1);
                        ctxtRegAuthName.SetText('Not Applicable');
                        cCmbProofNumber.SetText('Not Applicable');
                        ctxtNumber.SetEnabled(true);
                        ccmbSR.SetEnabled(false);
                        cCmbProofType.SetEnabled(false);
                        cCmbProofNumber.SetEnabled(false);
                        ctxtIssuePlace.SetEnabled(true);
                        cdtValid.SetEnabled(false);
                        cdtIssue.SetEnabled(true);
                        ccmbVerify.SetEnabled(true);
                        ctxtRegAuthName.SetEnabled(false);
                        HideShow('PanCheck','H');
                    
                    }
                    
                   else if((ccmbSR.GetText()=="MOA")|| (ccmbSR.GetText()=="Other"))
                    {
                        ctxtNumber.SetText(grid.cpedit.split('~')[3]);
                        ctxtIssuePlace.SetText(grid.cpedit.split('~')[4]);
                        cdtValid.SetDate(ChangeDateFormat_SetCalenderValue(grid.cpedit.split('~')[5]));
                        cdtIssue.SetDate(ChangeDateFormat_SetCalenderValue(grid.cpedit.split('~')[6]));
                        ctxtRegAuthName.SetText(grid.cpedit.split('~')[7]);
                        cCmbProofType.SetValue(1);
                        
                        cCmbProofNumber.SetText('Not Applicable');
                        ctxtNumber.SetEnabled(true);
                        ccmbSR.SetEnabled(false);
                        cCmbProofType.SetEnabled(false);
                        cCmbProofNumber.SetEnabled(false);
                        ctxtIssuePlace.SetEnabled(true);
                        cdtValid.SetEnabled(false);
                        cdtIssue.SetEnabled(true);
                        ccmbVerify.SetEnabled(false);
                        ctxtRegAuthName.SetEnabled(true);
                        HideShow('PanCheck','H');
                    }
                else if (ccmbSR.GetText()=="CIN")
                    {
                        ctxtNumber.SetText(grid.cpedit.split('~')[3]);
                        ctxtIssuePlace.SetText(grid.cpedit.split('~')[4]);
                        cdtValid.SetDate(ChangeDateFormat_SetCalenderValue(grid.cpedit.split('~')[5]));
                        cdtIssue.SetDate(ChangeDateFormat_SetCalenderValue(grid.cpedit.split('~')[6]));
                        ctxtRegAuthName.SetText(grid.cpedit.split('~')[7]);
                        ccmbVerify.SetText(grid.cpedit.split('~')[8]);
                        cCmbProofType.SetValue(1);
                        cCmbProofNumber.SetText('Not Applicable');
                        ctxtNumber.SetEnabled(true);
                        ccmbSR.SetEnabled(false);
                        cCmbProofType.SetEnabled(false);
                        cCmbProofNumber.SetEnabled(false);
                        ctxtIssuePlace.SetEnabled(true);
                        cdtValid.SetEnabled(false);
                        cdtIssue.SetEnabled(true);
                        ccmbVerify.SetEnabled(true);
                        ctxtRegAuthName.SetEnabled(true);
                        HideShow('PanCheck','H');
                    
                    }
                else if(ccmbSR.GetText()=="AdharCard")
                    {
                     
                        
                        ctxtIssuePlace.SetText('Not Applicable');
                        ctxtRegAuthName.SetText('Not Applicable');
                        cCmbProofNumber.SetText('Not Applicable');
                        ctxtNumber.SetEnabled(true);
                        ccmbSR.SetEnabled(false);
                        cCmbProofType.SetEnabled(false);
                        cCmbProofNumber.SetEnabled(false);
                        ctxtIssuePlace.SetEnabled(false);
                        cdtValid.SetEnabled(false);
                        cdtIssue.SetEnabled(false);
                        ccmbVerify.SetEnabled(true);
                        ctxtRegAuthName.SetEnabled(false)
                        cCmbProofType.SetValue(1);
                        ctxtNumber.SetText(grid.cpedit.split('~')[3]);
                        cdtValid.SetDate(new Date());
                        cdtIssue.SetDate(new Date());
                        ccmbVerify.SetText(grid.cpedit.split('~')[8]);
                         HideShow('PanCheck','H');
            
                    }   
                else if(ccmbSR.GetText()=="GSTIN")
                    {
                        ctxtIssuePlace.SetText('Not Applicable');
                        ctxtRegAuthName.SetText('Not Applicable');
                        cCmbProofNumber.SetText('Not Applicable');
                        ctxtNumber.SetEnabled(true);
                        ccmbSR.SetEnabled(false);
                        cCmbProofType.SetEnabled(false);
                        cCmbProofNumber.SetEnabled(false);
                        ctxtIssuePlace.SetEnabled(false);
                        cdtValid.SetEnabled(false);
                        cdtIssue.SetEnabled(false);
                        ccmbVerify.SetEnabled(true);
                        ctxtRegAuthName.SetEnabled(false)
                        cCmbProofType.SetValue(1);
                        ctxtNumber.SetText(grid.cpedit.split('~')[3]);
                        cdtValid.SetDate(new Date());
                        cdtIssue.SetDate(new Date());
                        ccmbVerify.SetText(grid.cpedit.split('~')[8]);
                         HideShow('PanCheck','H');
            
                    }   
                //Rev: 15Apr2024
                else if(ccmbSR.GetText()=="CKYC")
                    {
                        ctxtIssuePlace.SetText('Not Applicable');
                        ctxtRegAuthName.SetText('Not Applicable');
                        cCmbProofNumber.SetText('Not Applicable');
                        ctxtNumber.SetEnabled(true);
                        ccmbSR.SetEnabled(false);
                        cCmbProofType.SetEnabled(false);
                        cCmbProofNumber.SetEnabled(false);
                        ctxtIssuePlace.SetEnabled(false);
                        cdtValid.SetEnabled(false);
                        cdtIssue.SetEnabled(false);
                        ccmbVerify.SetEnabled(true);
                        ctxtRegAuthName.SetEnabled(false)
                        cCmbProofType.SetValue(1);
                        ctxtNumber.SetText(grid.cpedit.split('~')[3]);
                        cdtValid.SetDate(new Date());
                        cdtIssue.SetDate(new Date());
                        ccmbVerify.SetText(grid.cpedit.split('~')[8]);
                         HideShow('PanCheck','H');
                    }   
                //Rev: 15Apr2024...End
                
                else
                    {
                        ctxtNumber.SetText(grid.cpedit.split('~')[3]);
                        ctxtIssuePlace.SetText(grid.cpedit.split('~')[4]);
                        cdtValid.SetDate(ChangeDateFormat_SetCalenderValue(grid.cpedit.split('~')[5]));
                        cdtIssue.SetDate(ChangeDateFormat_SetCalenderValue(grid.cpedit.split('~')[6]));
                        ccmbVerify.SetText(grid.cpedit.split('~')[8]);
                        cCmbProofType.SetValue(1);
                        ctxtRegAuthName.SetText('Not Applicable');
                        cCmbProofNumber.SetText('Not Applicable');
                        ctxtNumber.SetEnabled(true);
                        ccmbSR.SetEnabled(false);
                        cCmbProofType.SetEnabled(false);
                        cCmbProofNumber.SetEnabled(false);
                        ctxtIssuePlace.SetEnabled(true);
                        cdtValid.SetEnabled(true);
                        cdtIssue.SetEnabled(true);
                        ccmbVerify.SetEnabled(true);
                        ctxtRegAuthName.SetEnabled(false);
                        HideShow('PanCheck','H');
                    }
                    GetObjectID('hiddenedit').value=grid.cpedit.split('~')[9];
                    cbtnSave_Registration.SetText('Update');
                    cPopup_StatutoryRegistration.Show();
            
           }
       }
    
    
    function disp_prompt(name)
    {
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Contact_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Contact_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="Contact_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="Contact_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="Contact_Document.aspx"; 
        }
        else if ( name == "tab12")
        {
        //alert(name);
        document.location.href="Contact_FamilyMembers.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        //document.location.href="Contact_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Contact_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="Contact_Deposit.aspx"; 
        }
        else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="Contact_Remarks.aspx"; 
        }
        else if ( name == "tab10")
        {
        //alert(name);
        document.location.href="Contact_Education.aspx"; 
        }
        else if ( name == "tab11")
        {
        //alert(name);
        document.location.href="contact_brokerage.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
            document.location.href="contact_other.aspx"; 
        }
         else if(name=="tab13")
        {
             document.location.href="contact_Subscription.aspx";
        }
       //New Work 30-12-2021
        else if(name=="tab14")
        {
             document.location.href="Contact_Nominee.aspx";
        }
        //End of New Work 30-12-2021
    }
    function change()
    {
        compSegment.PerformCallback();
    }
    function CallAjaxForSubBroker(objid,objfunc,objevent)
    {
        ajax_showOptions(objid,objfunc,objevent);
    }
    //New Work
    function CallAjaxForCustodian(objid,objfunc,objevent)
    {
        ajax_showOptions(objid,objfunc,objevent);
    }
    //End of New Work
    function CallAjaxForDealer(objid,objfunc,objevent)
    {
        ajax_showOptions(objid,objfunc,objevent);
    }
    function DrpValueSelect(objval)
    {
        if(objval!='')
        {
           
            var obj=objval.split('~');
            if(obj[0]=='Show')
            {
                compCompany.SetValue(obj[1]);
            }
            else    
            {
                compSegment.SetValue(obj[0]);
                compSegment.SetEnabled(false);
                document.getElementById(obj[1]).value=obj[2];
                if(obj[4]!='')
                    document.getElementById(obj[3]).value=obj[4];
                cComboSwapMapinSebi.SetValue(obj[5]);
            }
        }
    }
     function Emailcheck(obj,obj2)
     {
        if(obj2 !='N')
         {  
              dt=confirm('This entity has been banned by SEBI see the details: '+ obj2 +' !!!.\n\nDo You Want To Delete???');
              if(dt)
                {
                 obj='Delete';
                 grid.PerformCallback(obj);
                 }
                 else
                 { 
                         if(obj !='b')
                          {         
                              doIt=confirm(obj +' has same PAN number!!!.\n\n Do You Want To Delete???');
                              if(doIt)
                              {
                               obj='Delete';
                               grid.PerformCallback(obj);
                               }
                               else
                               { 
                                   IScON =confirm('Warning!!.\n\n Are You Sure You Want Accept This PAN Number??.\n\nClick OK For Accept,Otherwise Click Cancel');
                                   if(IScON)
                                    {
                                           INT =confirm('Warning!!.\n\n Are You Sure You Want Accept This PAN Number??.\n\nClick OK For Accept,Otherwise Click Cancel');
                                           if(INT)
                                            {
                                                       INR =confirm('Warning!!.\n\n Are You Sure You Want Accept This PAN Number??.\n\nClick OK For Accept,Otherwise Click Cancel');
                                                       if(INR)
                                                        {
                                                        alert('Your PAN Number Has Been Accepted.')
                                                        }
                                                        else
                                                        {
                                                         obj='Delete';
                                                         grid.PerformCallback(obj);
                                                        }
                                                        
                                            }
                                            else
                                            {
                                             obj='Delete';
                                             grid.PerformCallback(obj);
                                            }
                                            
                                    }
                                    else
                                    {
                                    obj='Delete';
                                    grid.PerformCallback(obj);
                                    }                        
                               
                               }
                            }
                            else
                            {
                                 BNRT =confirm('Warning!!.\n\n Are You Sure You Want Accept This PAN Number??.\n\nClick OK For Accept,Otherwise Click Cancel');
                                   if(BNRT)
                                    {
                                           SGH =confirm('Warning!!.\n\n Are You Sure You Want Accept This PAN Number??.\n\nClick OK For Accept,Otherwise Click Cancel');
                                           if(SGH)
                                            {
                                                       BNT =confirm('Warning!!.\n\n Are You Sure You Want Accept This PAN Number??.\n\nClick OK For Accept,Otherwise Click Cancel');
                                                       if(BNT)
                                                        {
                                                        alert('Your PAN Number Has Been Accepted.')
                                                        }
                                                        else
                                                        {
                                                         obj='Delete';
                                                         grid.PerformCallback(obj);
                                                        }
                                                        
                                            }
                                            else
                                            {
                                             obj='Delete';
                                             grid.PerformCallback(obj);
                                            }
                                            
                                    }
                                    else
                                    {
                                    obj='Delete';
                                    grid.PerformCallback(obj);
                                    } 
                                 } 
                     
                 
                 }
                 
                 
                 
                 
                 
         } 
        else if(obj !='b')
        {         
            doIt=confirm(obj +' Has Same PAN Number!!!.\n\nDo You Want To Delete???');
            if(doIt)
                {
                   obj='Delete';
                   grid.PerformCallback(obj);
                }
            else
                {              
                   ISON =confirm('Warning!!.\n\n Are You Sure You Want Accept This PAN Number??.\n\nClick OK For Accept,Otherwise Click Cancel');
                   if(ISON)
                    {
                                      IJK =confirm('Warning!!.\n\n Are You Sure You Want Accept This PAN Number??.\n\nClick OK For Accept,Otherwise Click Cancel');
                                       if(IJK)
                                        {
                                               MKJ =confirm('Warning!!.\n\n Are You Sure You Want Accept This PAN Number??.\n\nClick OK For Accept,Otherwise Click Cancel');
                                               if(MKJ)
                                                {
                                                  alert('Your PAN Number Has Been Accepted.')                                   
                                                }
                                               else
                                                {
                                                  obj='Delete';
                                                  grid.PerformCallback(obj);                                  
                                                     
                                                 }                                    
                                        }
                                       else
                                        {
                                          obj='Delete';
                                          grid.PerformCallback(obj);                                  
                                             
                                        }                                   
                    }
                   else
                    {
                      obj='Delete';
                      grid.PerformCallback(obj);                                  
                         
                    }  
                }
       
        }

    }
    
//     FieldName='ASPxPageControl1_gridMembership_DXTDGScol8'
 

   
    
     FieldName='ASPxPageControl1_gridMembership_DXTDGScol8';
     
 

     
    </script>

    <form id="form1" runat="server">
        <table width="100%">
            <tr>
                <td class="EHEADER" style="text-align: center">
                    <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
        <table class="TableMain100">
            <tr>
                <td>
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="5" ClientInstanceName="page"
                        Font-Size="10px">
                        <TabPages>
                            <dxtc:TabPage Name="General">
                                <TabTemplate>
                                    <span style="font-size: x-small">General</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="CorresPondence">
                                <TabTemplate>
                                    <span style="font-size: x-small">CorresPondence</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Bank Details">
                                <TabTemplate>
                                    <span style="font-size: x-small">Bank</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="DP Details">
                                <TabTemplate>
                                    <span style="font-size: x-small">DP</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Documents">
                                <TabTemplate>
                                    <span style="font-size: x-small">Documents</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Registration">
                                <TabTemplate>
                                    <span style="font-size: x-small">Registration</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                        <dxtc:ASPxPageControl ID="ASPxPageControl2" runat="server" ActiveTabIndex="0" width="100%"
                                            ClientInstanceName="page">
                                            <tabpages>
                                                <dxtc:TabPage Name="Statutory Registrations" >
                                                <TabTemplate ><span style="font-size:x-small">Statutory&nbsp;Registrations</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                                    <ContentCollection>
                                                        <dxw:ContentControl runat="server">
                                                            <dxwgv:ASPxGridView ID="gridRegisStatutory"  KeyFieldName="crg_id"
                                                                ClientInstanceName="grid" runat="server" Width="100%" AutoGenerateColumns="False"
                                                                OnInitNewRow="gridRegisStatutory_InitNewRow" OnRowValidating="gridRegisStatutory_RowValidating"  OnCustomCallback="gridRegisStatutory_CustomCallback">
                                                                <Columns>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_id" ReadOnly="True" VisibleIndex="0"
                                                                        Visible="False">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_cntId" VisibleIndex="0" Visible="False">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                      
                                                                    <dxwgv:GridViewDataComboBoxColumn  Caption="Type" FieldName="crg_type" VisibleIndex="0">
                                                                        <PropertiesComboBox  EnableSynchronization="False"  EnableIncrementalFiltering="True"
                                                                            ValueType="System.String">
                                                                            
                                                                            <Items>
                                                                                <dxe:ListEditItem Text="Pan Card"   Value="Pancard" >
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="Passport" Value="Passport">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="Ration Card" Value="RationCard">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="Driving License" Value="DrivingLicense">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="Voter Id" Value="VoterId">
                                                                                </dxe:ListEditItem>
                                                                               
                                                                                <dxe:ListEditItem Text="Social Security Number" Value="SSNumber">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="SEBI Registration" Value="SEBIRegn">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="MAPIN CODE" Value="MpCode">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="RBI Ref. No" Value="RbiNo">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="MOA" Value="MOA">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="FMC Registration" Value="FmCRegis">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="CIN" Value="CIN">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="Other" Value="Other">
                                                                                </dxe:ListEditItem>
                                                                                 <dxe:ListEditItem Text="Adhar Card" Value="AdharId">
                                                                                </dxe:ListEditItem>
                                                                                 <dxe:ListEditItem Text="GSTIN" Value="GSTINId">
                                                                                </dxe:ListEditItem>
                                                                                 <dxe:ListEditItem Text="CKYC" Value="CKYC">
                                                                                </dxe:ListEditItem>
                                                                            </Items>
                                                                        </PropertiesComboBox>
                                                                        <EditFormSettings Caption="Type" Visible="True" VisibleIndex="0" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                                    
                                                                  
                                                                    
                                                                    
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_Number" VisibleIndex="1" Caption="Number">
                                                                        <EditFormSettings Caption="Number" Visible="True" VisibleIndex="1" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataComboBoxColumn  Caption="Proof Type" FieldName="crg_PanExmptProofType" VisibleIndex="8" Visible="false">
                                                                        <PropertiesComboBox  EnableSynchronization="False" EnableIncrementalFiltering="true"
                                                                            ValueType="System.String">
                                                                            
                                                                            <Items>
                                                                               
                                                                                <dxe:ListEditItem Text="Mapin ID" Value="1">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="Passport" Value="2">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="Voter ID" Value="3">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="Driving License" Value="4">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="Ration Card" Value="5">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="Registration Details" Value="6">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="UID (Aadhar ID)" Value="7">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="GSTIN" Value="8">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="CKYC" Value="9">
                                                                                </dxe:ListEditItem>
                                                                                
                                                                            </Items>
                                                                        </PropertiesComboBox>
                                                                        <EditFormSettings Caption="Proof Type" Visible="True" VisibleIndex="2" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_registrationAuthority" VisibleIndex="6"
                                                                        Caption="Registration Authority Name" Visible="False">
                                                                        <EditFormSettings Caption="Registration Authority Name/Remarks" Visible="True" VisibleIndex="6" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_PanExmptProofNumber" VisibleIndex="6"
                                                                        Caption="Proof Number" Visible="False">
                                                                        <EditFormSettings Caption="Proof Number" Visible="True" VisibleIndex="3" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_place" VisibleIndex="2" Caption="Place of Issue">
                                                                        <EditFormSettings Caption="Place of Issue" Visible="True" VisibleIndex="3" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataDateColumn Caption="Date of Issue" FieldName="crg_Date" Visible="false">
                                                                        <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MM yyyy" UseMaskBehavior="True">
                                                                        </PropertiesDateEdit>
                                                                        <EditFormSettings Caption="Date of Issue" Visible="True" VisibleIndex="4" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataDateColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_Date1" Caption="Date of Issue" VisibleIndex="3">
                                                                        <EditFormSettings Caption="Date of Issue" Visible="false" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataDateColumn Caption="Valid Untill" FieldName="crg_validDate" Visible="false">
                                                                        <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MM yyyy" UseMaskBehavior="True">
                                                                        </PropertiesDateEdit>
                                                                        <EditFormSettings Caption="Valid Untill" Visible="True" VisibleIndex="5" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataDateColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_validDate1" VisibleIndex="4" Caption="Valid Untill">
                                                                        <EditFormSettings Caption="Valid Untill" Visible="false" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataComboBoxColumn Caption="Verify" FieldName="crg_verify" Visible="false">
                                                                        <PropertiesComboBox EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                                            ValueType="System.String">
                                                                            <Items>
                                                                                <dxe:ListEditItem Text="Verified" Value="Verified">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="Not Verified" Value="Not Verified">
                                                                                </dxe:ListEditItem>
                                                                            </Items>
                                                                        </PropertiesComboBox>
                                                                        <EditFormSettings Caption="Verify" Visible="True" VisibleIndex="7" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                                    <dxwgv:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="5" Visible="False">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataDateColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="CreateUser" VisibleIndex="5" Visible="False">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataDateColumn FieldName="LastModifyDate" VisibleIndex="5" Visible="False">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataDateColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="LastModifyUser" VisibleIndex="5" Visible="False">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn ReadOnly="True" >
                                                        <DataItemTemplate>
                                                            <a href="javascript:void(0);" onclick="fn_PopEditOpen('<%# Container.KeyValue %>')">
                                                                Edit</a>
                                                                <a href="javascript:void(0);" onclick="fn_Delete('<%# Container.KeyValue %>')">
                                                                Delete</a>
                                                        </DataItemTemplate>
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <HeaderTemplate>
                                                                            <a href="javascript:void(0);" onclick="fn_PopOpen();"><span style="color: #000099;
                                                                                text-decoration: underline">Add New</span> </a>
                                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <%--<dxwgv:GridViewCommandColumn VisibleIndex="5">
                                                                      
                                                                        <DeleteButton Visible="True">
                                                                        </DeleteButton>
                                                                        <HeaderTemplate>
                                                                            <a href="javascript:void(0);" onclick="fn_PopOpen();"><span style="color: #000099;
                                                                                text-decoration: underline">Add New</span> </a>
                                                                        </HeaderTemplate>
                                                                    </dxwgv:GridViewCommandColumn>--%>
                                                                </Columns>
                                                                <StylesEditors>
                                                                    <ProgressBar Height="25px">
                                                                    </ProgressBar>
                                                                </StylesEditors>
                                                                <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="300px" PopupEditFormHorizontalAlign="Center"
                                                                    PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px"
                                                                    EditFormColumnCount="1" />
                                                                <Styles>
                                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                    </Header>
                                                                    <LoadingPanel ImageSpacing="10px">
                                                                    </LoadingPanel>
                                                                </Styles>
                                                                <Settings ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                                <SettingsText PopupEditFormCaption="Add/Modify Registration" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                                                    <FirstPageButton Visible="True">
                                                                    </FirstPageButton>
                                                                    <LastPageButton Visible="True">
                                                                    </LastPageButton>
                                                                </SettingsPager>
                                                                <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                                <Templates>
                                                                    <TitlePanel>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td align="center" style="width: 50%">
                                                                                    <span style="color: White; font-weight: bold; font-size: 12px; text-align: center">Statutory Registrations.</span>
                                                                                </td>
                                                                                <%-- <td align="right">
                                                                            <table width="200">
                                                                                <tr>
                                                                                    
                                                                                   
                                                                                    <td>
                                                                                        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"   Height="18px" Width="88px" AutoPostBack="False">
                                                                                            <clientsideevents click="function(s, e) {grid.AddNewRow();}" />
                                                                                        </dxe:ASPxButton>
                                                                                    </td>
                                                                                                                        
                                                                                     
                                                                                  </tr>
                                                                              </table>
                                                                          </td>   --%>
                                                                            </tr>
                                                                        </table>
                                                                    </TitlePanel>
                                                                    <EditForm>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="width: 25%">
                                                                                </td>
                                                                                <td style="width: 50%">
                                                                                    <controls>
                                                                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                                                                </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                                                                            </controls>
                                                                                    <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                                            runat="server">
                                                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                                            runat="server">
                                                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                    </div>
                                                                                </td>
                                                                                <td style="width: 25%">
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </EditForm>
                                                                </Templates>
                                                                  <ClientSideEvents EndCallback="function(s, e) {Emailcheck(s.cpHeight,s.cpWidth);}" />
                                                                    <ClientSideEvents EndCallback="function (s, e) {grid_EndCallBack();}" />
                                                            </dxwgv:ASPxGridView>
                                                            
            <dxpc:ASPxPopupControl ID="Popup_StatutoryRegistration" runat="server" ClientInstanceName="cPopup_StatutoryRegistration"
            Width="600px" HeaderText="Client Statutory Registration Details" PopupHorizontalAlign="WindowCenter"
            Height="500px" PopupVerticalAlign="WindowCenter" CloseAction="CloseButton" Modal="True">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="SRPopupControlContentControl" runat="server">
                    <div id="divSR" style="height:300px;width:480px;padding-left:80px;">
                    <div style="margin-bottom:10px; width:430px;">
                        <div style="float:left;width:130px;">Type: </div>
                        <div style="float:left;">
                            <dxe:ASPxComboBox ID="cmbSR" ClientInstanceName="ccmbSR" runat="server" Width="170px" Height="25px" 
                               ValueType="System.String" AutoPostBack="false" EnableSynchronization="False">
                                <Items>
                                   <%-- <dxe:ListEditItem Text="select" />--%>
                                    <dxe:ListEditItem Text="PanCard" Value="1" />
                                    <dxe:ListEditItem Text="Passport" Value="2" />
                                    <dxe:ListEditItem Text="Ration Card" Value="3" />
                                    <dxe:ListEditItem Text="Driving License" Value="4" />
                                    <dxe:ListEditItem Text="VoterId" Value="5" />
                                    
                                    <dxe:ListEditItem Text="Social Security Number" Value="6" />
                                    <dxe:ListEditItem Text="SEBI Registration" Value="7" />
                                    <dxe:ListEditItem Text="MAPIN CODE" Value="8" />
                                    <dxe:ListEditItem Text="RBI Ref.No" Value="9" />
                                    <dxe:ListEditItem Text="MOA" Value="10" />
                                    <dxe:ListEditItem Text="FMC Registration" Value="11" />
                                    <dxe:ListEditItem Text="CIN" Value="12" />
                                    <dxe:ListEditItem Text="Other" Value="13" />
                                    <dxe:ListEditItem Text="AdharCard" Value="14" />
                                    <dxe:ListEditItem Text="GSTIN" Value="15" />
                                    <dxe:ListEditItem Text="CKYC" Value="16" />
                                </Items>
                                <ClientSideEvents SelectedIndexChanged="function (s, e) {fn_ComboIndexChange(s.GetValue());}" />
                            </dxe:ASPxComboBox>                    
                        </div>
                        <div id="PanCheck" style="padding-left:10px;float:left;">
                            <dxe:ASPxCheckBox ID="chkPan" ClientInstanceName="cchkPan" runat="server" Text="PAN_EXEMPT">
                            <ClientSideEvents CheckedChanged="function (s, e) {fn_CheckChange(s,e);}" />
                            </dxe:ASPxCheckBox>
                        </div>
                                       
                         <br style="clear:both;"/>
                         <br style="clear:both;"/>                 
                         <div id="ProofType">   
                             <div style="float:left;width:130px;">Proof Type &nbsp</div>
                             <div> 
                                <dxe:ASPxComboBox ID="CmbProofType" ClientInstanceName="cCmbProofType" runat="server" Width="170px" Height="25px"  
                                     ValueType="System.String" AutoPostBack="false" EnableSynchronization="False">
                                    <Items>
                                   
                                        <dxe:ListEditItem Text="Mapin ID" Value="1">
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="Passport" Value="2">
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="Voter ID" Value="3">
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="Driving License" Value="4">
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="Ration Card" Value="5">
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="Registration Details" Value="6">
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="UID (Aadhar ID)" Value="7">
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="GSTIN" Value="8">
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="CKYC" Value="9">
                                            </dxe:ListEditItem>
                                    </Items>
                           
                             </dxe:ASPxComboBox>
                          </div>
                         </div>
                         <br style="clear:both;"/>
                         <div id="ProofNumber">
                              <div style="float:left;width:130px;">Proof Number  &nbsp;</div>  
                              <div> 
                                <dxe:ASPxTextBox ID="CmbProofNumber" ClientInstanceName="cCmbProofNumber" ClientEnabled="true" runat="server" Height="25px" Width="170px">
                                </dxe:ASPxTextBox>
                              </div>   
                         </div>
                   
                         <br style="clear:both;" /> 
                         <div id="Number">
                            <div style="float:left;width:130px;">Number:&nbsp</div>
                             <div>
                                <dxe:ASPxTextBox ID="txtNumber" ClientInstanceName="ctxtNumber" ClientEnabled="true" 
                                    runat="server" Height="25px" Width="170px">
                                </dxe:ASPxTextBox>
                             </div>
                    </div>                  
                         
                      
                         <br style="clear:both;"/>                         
                         <div id="PlaceIssue">
                            <div style="float:left;width:130px;">Place of Issue &nbsp;</div>
                             <div>
                                 <dxe:ASPxTextBox ID="txtIssuePlace" ClientInstanceName="ctxtIssuePlace" ClientEnabled="true" 
                                    runat="server" Height="25px" Width="170px">
                                 </dxe:ASPxTextBox>                                   
                             </div>
                         </div>
                         <br style="clear:both;"/>                       
                         <div id="validuntill">
                            <div style="float:left;width:130px;"> Valid Untill &nbsp;</div>
                             <div>
                                 <%--<dxe:ASPxDateEdit ID="ASPxDateEdit4" ClientInstanceName="ctxtSaveAs" ClientEnabled="true" 
                                    runat="server" Height="25px">
                                 </dxe:ASPxDateEdit>--%>
                                 <dxe:ASPxDateEdit ID="dtValid" runat="server" ClientInstanceName="cdtValid" DateOnError="Today"
                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="170px"
                                        Height="25px" Font-Size="11px" TabIndex="0">                                       
                                 </dxe:ASPxDateEdit>                                 
                             </div>                                  
                         </div>
                         <br style="clear:both;"/>                       
                         <div id="dateofissue">
                            <div style="float:left;width:130px;">Date Of Issue&nbsp;</div>
                             <div> 
                                <%--<dxe:ASPxDateEdit ID="ASPxDateEdit5"   runat="server" Height="25px">
                                    <ClientSideEvents Init="function(s,e){ s.SetDate(new Date());}" />
                                </dxe:ASPxDateEdit>--%>                         
                                <dxe:ASPxDateEdit ID="dtIssue" runat="server" ClientInstanceName="cdtIssue" DateOnError="Today"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="170px"
                                            Height="25px" Font-Size="11px" TabIndex="0">                                       
                                </dxe:ASPxDateEdit>
                             </div>       
                         </div>
                   
                    <br style="clear:both;" />                       
                    
                       <div>
                          <div style="float:left;width:130px;height:30px;">Registration Authority Name Remarks &nbsp;</div>
                          <div>
                            <dxe:ASPxTextBox ID="txtRegAuthName" ClientInstanceName="ctxtRegAuthName" ClientEnabled="true" runat="server" Height="25px"
                             Width="170px">
                            </dxe:ASPxTextBox>
                         </div>                        
                       </div>                    
                   
                    <br style="clear:both;" /> 
                       
                   
                        <div>
                            <div style="float:left;width:130px;"> Verify&nbsp;</div>
                            <div>
                                <dxe:ASPxComboBox ID="cmbVerify" ClientInstanceName="ccmbVerify" runat="server" Width="170px" Height="25px"  
                                     ValueType="System.String" AutoPostBack="false" EnableSynchronization="False" SelectedIndex="0">
                                    <Items>
                                            <dxe:ListEditItem Text="Verified" Value="1" >
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="Not Verified" Value="2">
                                            </dxe:ListEditItem>
                                          
                                    </Items>
                             <%--<ClientSideEvents SelectedIndexChanged="function (s, e) {fn_ComboIndexChange(s,e);}" />--%>
                             </dxe:ASPxComboBox>
                            </div>                                                      
                        </div>
                          <br style="clear:both;" />           
                 
                  
                   
                    </div>
                    <div style="margin-left:170px;">
                        <div style="float:left;">
                            <dxe:ASPxButton ID="btnSave_Registration" ClientInstanceName="cbtnSave_Registration" runat="server" AutoPostBack="False" Text="Save">
                                <ClientSideEvents Click="function (s, e) {btnSave_Registration();}" />
                            </dxe:ASPxButton>
                        </div>
                        <div style="float:left;margin-left: 25px;">
                            <dxe:ASPxButton ID="btnCancel_Registration" runat="server" AutoPostBack="False" Text="Cancel">
                                <ClientSideEvents Click="function (s, e) {fn_btnCancel();}" />
                            </dxe:ASPxButton>
                        </div>
                        <br style="clear:both;" />
                    </div>
                    <br style="clear:both;" />
                   
                  </div>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" ForeColor="Black" />
        </dxpc:ASPxPopupControl>
                                                            
                                                            
                                                        </dxw:ContentControl>
                                                        
                                                    </ContentCollection>
                                                </dxtc:TabPage>
                                                
                                                <dxtc:TabPage Name="Exchange/DP Segment Registrations">
                                                <TabTemplate ><span style="font-size:x-small;">Exchange/DP&nbsp;Segment&nbsp;Registrations</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                                    <ContentCollection>
                                                        <dxw:ContentControl runat="server">
                                                            <dxwgv:ASPxGridView ID="gridExchange" ClientInstanceName="exchange" Width="100%"
                                                                runat="server" AutoGenerateColumns="False" KeyFieldName="crg_internalId" DataSourceID="SqlExchange"
                                                                OnRowValidating="gridExchange_RowValidating" OnInitNewRow="gridExchange_InitNewRow"
                                                                OnRowInserting="gridExchange_RowInserting" OnStartRowEditing="gridExchange_StartRowEditing"
                                                                OnRowUpdating="gridExchange_RowUpdating" OnRowDeleting="gridExchange_RowDeleting" OnRowDeleted="gridExchange_RowDeleted" OnCustomJSProperties="gridExchange_CustomJSProperties"
                                                                
                                                                OnHtmlEditFormCreated="gridExchange_HtmlEditFormCreated" >
                                                                <Columns>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_internalId" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_cntID" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataComboBoxColumn Caption="Company" FieldName="crg_company1" VisibleIndex="0">
                                                                        <PropertiesComboBox DataSourceID="SqlComp" ValueField="cmp_internalid" TextField="cmp_Name"
                                                                            ValueType="System.String" EnableIncrementalFiltering="true" EnableSynchronization="False">
                                                                        </PropertiesComboBox>
                                                                        <EditFormSettings Visible="false" VisibleIndex="0" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="crg_exchange1" Caption="Exchange Segment"
                                                                        Visible="true" VisibleIndex="1">
                                                                        <PropertiesComboBox DataSourceID="SqlExchangeSegment" ValueField="exch_internalId"
                                                                            TextField="Exchange" ValueType="System.String" EnableIncrementalFiltering="true"
                                                                            EnableSynchronization="False">
                                                                        </PropertiesComboBox>
                                                                        <EditFormSettings Visible="false" VisibleIndex="1" Caption="Exchange Segment" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_company" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_tcode" VisibleIndex="2" Caption="TCode">
                                                                        <EditFormSettings Caption="Client Id(TCode)" Visible="false" VisibleIndex="2" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_regisDate1" ReadOnly="True" VisibleIndex="3"
                                                                        Caption="Regn. Date">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataDateColumn FieldName="crg_regisDate" Visible="False" VisibleIndex="3">
                                                                        <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MM yyyy" UseMaskBehavior="True">
                                                                        </PropertiesDateEdit>
                                                                        <EditFormSettings Caption="Registration Date" Visible="false" VisibleIndex="3" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataDateColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_businessCmmDate1" ReadOnly="True" VisibleIndex="4"
                                                                        Caption="Buss. Comm Date">
                                                                        <EditFormSettings Visible="False" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataDateColumn FieldName="crg_businessCmmDate" Visible="False" VisibleIndex="4">
                                                                        <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MM yyyy" UseMaskBehavior="True">
                                                                        </PropertiesDateEdit>
                                                                        <EditFormSettings Caption="Business Comm. Date" Visible="True" VisibleIndex="4" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataDateColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_suspensionDate1" ReadOnly="True" VisibleIndex="5"
                                                                        Caption="Sus. Date">
                                                                        <EditFormSettings Visible="False" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataDateColumn FieldName="crg_suspensionDate" Visible="False" VisibleIndex="5">
                                                                        <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MM yyyy" UseMaskBehavior="True">
                                                                        </PropertiesDateEdit>
                                                                        <EditFormSettings Caption="Suspension Date" Visible="false" VisibleIndex="5" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataDateColumn>
                                                                    <dxwgv:GridViewDataMemoColumn FieldName="crg_reasonforSuspension" Visible="False"
                                                                        VisibleIndex="5">
                                                                        <EditFormSettings Caption="Reason For Suspension" Visible="false" VisibleIndex="6" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataMemoColumn>
                                                                    <dxwgv:GridViewCommandColumn VisibleIndex="6">
                                                                        <EditButton Visible="True">
                                                                        </EditButton>
                                                                        <DeleteButton Visible="True">
                                                                        </DeleteButton>
                                                                        <HeaderTemplate>
                                                                            <a href="javascript:void(0);" onclick="exchange.AddNewRow();"><span style="color: #000099;
                                                                                text-decoration: underline">Add New</span> </a>
                                                                        </HeaderTemplate>
                                                                    </dxwgv:GridViewCommandColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_SubBrokerFranchiseeID" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_Dealer" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataDateColumn FieldName="crg_AccountClosureDate" Visible="False">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataDateColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_FrontOfficeBranchCode" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_FrontOfficeGroupCode" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_ParticipantSchemeCode" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_ClearingBankCode" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_SchemeCode" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_STTPattern" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_swapucc" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <%--New Work--%>
                                                                     <dxwgv:GridViewDataTextColumn FieldName="crg_CustodianID" Visible="false">
                                                                        <EditFormSettings Visible="false" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <%--End of New Work--%>
                                                                </Columns>
                                                                <ClientSideEvents EndCallback="function(s,e){DrpValueSelect(s.cpValue);}" />
                                                                <Styles>
                                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                    </Header>
                                                                    <LoadingPanel ImageSpacing="10px">
                                                                    </LoadingPanel>
                                                                </Styles>
                                                                <StylesEditors>
                                                                    <ProgressBar Height="25px">
                                                                    </ProgressBar>
                                                                </StylesEditors>
                                                                <SettingsEditing PopupEditFormHeight="350px" PopupEditFormHorizontalAlign="Center"
                                                                    PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="750px" EditFormColumnCount="1" />
                                                                <Styles>
                                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                    </Header>
                                                                    <LoadingPanel ImageSpacing="10px">
                                                                    </LoadingPanel>
                                                                </Styles>
                                                                <Settings ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                                <SettingsText PopupEditFormCaption="Add/Modify Exchange" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                                                    <FirstPageButton Visible="True">
                                                                    </FirstPageButton>
                                                                    <LastPageButton Visible="True">
                                                                    </LastPageButton>
                                                                </SettingsPager>
                                                                <SettingsBehavior ColumnResizeMode="NextColumn" AllowFocusedRow="true" ConfirmDelete="True" />
                                                                <Templates>
                                                                    <TitlePanel>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td align="center" style="width: 50%">
                                                                                    <span style="color: White; font-weight: bold; font-size: 12px; text-align: center">Exchange/DP
                                                                                        Segment Registrations</span>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </TitlePanel>
                                                                    <EditForm>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Company :
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    <dxe:ASPxComboBox ID="compCompany" runat="server" DataSourceID="SqlComp" ValueField="cmp_internalid"
                                                                                        TextField="cmp_Name" ClientInstanceName="compCompany" EnableIncrementalFiltering="true"
                                                                                        EnableSynchronization="False" ValueType="System.String" Value='<%# Bind("crg_company1") %>'
                                                                                        Width="233px">
                                                                                        <ButtonStyle Width="13px">
                                                                                        </ButtonStyle>
                                                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){change()}" />
                                                                                    </dxe:ASPxComboBox>
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Segment :
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;  font-size: medium; color: Red; width:8px;">
                                                                    
                                                                        </td>
                                                                                <td style="text-align: left">
                                                                                    <dxe:ASPxComboBox ID="compSegment" runat="server" DataSourceID="SqlSegment" ValueField="exch_internalId"
                                                                                        TextField="Exchange" ClientInstanceName="compSegment" EnableIncrementalFiltering="true"
                                                                                        EnableSynchronization="False" OnCallback="compSegment_Callback" ValueType="System.String"
                                                                                        Width="233px">
                                                                                        <ButtonStyle Width="13px">
                                                                                        </ButtonStyle>
                                                                                    </dxe:ASPxComboBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Client ID(TCode) :
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:TextBox ID="txtClientUcc" runat="server" Text='<%# Bind("crg_tcode") %>' Width="230px"></asp:TextBox>
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Registration Date :
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;  font-size: medium; color: Green; width:8px;">
                                                                    *
                                                                        </td>
                                                                                <td style="text-align: left">
                                                                                    <dxe:ASPxDateEdit ID="dtRegistration" runat="server" Value='<%# Bind("crg_regisDate") %>'
                                                                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="233px">
                                                                                        <ButtonStyle Width="13px">
                                                                                        </ButtonStyle>
                                                                                    </dxe:ASPxDateEdit>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Business Comm. Date :
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    <dxe:ASPxDateEdit ID="dtBusienssCommDate" runat="server" Value='<%# Bind("crg_businessCmmDate") %>'
                                                                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="233px">
                                                                                        <ButtonStyle Width="13px">
                                                                                        </ButtonStyle>
                                                                                    </dxe:ASPxDateEdit>
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Suspension Date :
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;  font-size: medium; color: Red; width:8px;">
                                                                    
                                                                        </td>
                                                                                <td style="text-align: left">
                                                                                    <dxe:ASPxDateEdit ID="dtSuspension" runat="server" Value='<%# Bind("crg_suspensionDate") %>'
                                                                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="233px">
                                                                                        <ButtonStyle Width="13px">
                                                                                        </ButtonStyle>
                                                                                    </dxe:ASPxDateEdit>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Sub Broker :
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:TextBox ID="txtSubBroker" runat="server" onkeyup="CallAjaxForSubBroker(this,'SearchByEmployeesSubBroker',event)"
                                                                                        Text='<%# Bind("Franchisee") %>' Width="230px"></asp:TextBox>
                                                                                    <asp:HiddenField ID="txtSubBroker_hidden" runat="server" Value='<%# Bind("crg_SubBrokerFranchiseeID") %>' />
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Dealer :
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;  font-size: medium; color: Red; width:8px;">
                                                                    
                                                                        </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:TextBox ID="txtDealer" runat="server" onkeyup="CallAjaxForDealer(this,'SearchByContact',event)"
                                                                                        Text='<%# Bind("Dealer") %>' Width="230px"></asp:TextBox>
                                                                                    <asp:HiddenField ID="txtDealer_hidden" runat="server" Value='<%# Bind("crg_Dealer") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Closer Date :
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    <dxe:ASPxDateEdit ID="dtCloser" runat="server" Value='<%# Bind("crg_AccountClosureDate") %>'
                                                                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="233px">
                                                                                        <ButtonStyle Width="13px">
                                                                                        </ButtonStyle>
                                                                                    </dxe:ASPxDateEdit>
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Front Office Branch :
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;  font-size: medium; color: Red; width:8px;">
                                                                    
                                                                        </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:TextBox ID="txtFOfficeBranch" runat="server" Text='<%# Bind("crg_FrontOfficeBranchCode") %>'
                                                                                        Width="230px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Front Office Group :
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:TextBox ID="txtFOfficeGroup" runat="server" Text='<%# Bind("crg_FrontOfficeGroupCode") %>'
                                                                                        Width="230px"></asp:TextBox>
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Participant Code :
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;  font-size: medium; color: Green; width:8px;">
                                                                    *
                                                                        </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:TextBox ID="txtParticipantCode" runat="server" Text='<%# Bind("crg_ParticipantSchemeCode") %>'
                                                                                        Width="230px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Clear Bank code :
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:TextBox ID="txtBankCode" runat="server" Text='<%# Bind("crg_ClearingBankCode") %>'
                                                                                        Width="230px"></asp:TextBox>
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Scheme Code :
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;  font-size: medium; color: Red; width:8px;">
                                                                    
                                                                        </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:TextBox ID="txtSchemeCode" runat="server" Text='<%# Bind("crg_SchemeCode") %>'
                                                                                        Width="230px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    STT/StampDuty Patern :
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:DropDownList ID="ddlPatern" runat="server" Width="233px">
                                                                                        <asp:ListItem Text="Day" Value="D"></asp:ListItem>
                                                                                        <asp:ListItem Text="Contract Note" Value="C"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    reason For Suspension :
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;  font-size: medium; color: Red; width:8px;">
                                                                    
                                                                        </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:TextBox ID="txtSuspension" runat="server" Text='<%# Bind("crg_reasonforSuspension") %>'
                                                                                        Width="230px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            
                                                                            <tr>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    STT Purchase/Sale <br /> Value Calculation Method :
                                                                                </td>
                                                                                <td style="text-align: left">
                                          
                                                                                <asp:DropDownList ID="drpSttWap" runat="server" Width="233px">
                                            <asp:ListItem Text="Weighted Average price(WAP)" Value="W"></asp:ListItem>
                                            <asp:ListItem Text="Actual Value" Value="A"></asp:ListItem>
          
          </asp:DropDownList>                                      
                                                                                   
                                                                                </td>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                   SWAP MAPIN with SEBI
                                                                                   (For STP Files)
                                                                                </td>
                                                                                 <td class="EcoheadCon_" style="text-align: left;  font-size: medium; color: Red; width:8px;">
                                                                    
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                 <dxe:ASPxComboBox ID="ComboSwapMapinSebi" runat="server" ClientInstanceName="cComboSwapMapinSebi" Font-Size="10px"
                                                                                    SelectedIndex="0" ValueType="System.String" Width="50px" EnableIncrementalFiltering="True">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Value="N" Text="No"></dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Value="Y" Text="Yes"></dxe:ListEditItem>
                                                                                        
                                                                                    </Items>
                                                                                </dxe:ASPxComboBox>
                                                                                </td>
                                                                            </tr>
                                                                            <%--New Work--%>
                                                                            <tr>
                                                                                <td class="EcoheadCon_" style="text-align: left;">
                                                                                    Custodian(Account Posting) :
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:TextBox ID="txtCustodian" runat="server" ToolTip="Custodian is only mapping with Customers / Clients or Brokers." onkeyup="CallAjaxForCustodian(this,'SearchByEmployeesCustodian',event)"
                                                                                        Text='<%# Bind("Custodian") %>' Width="230px"></asp:TextBox>
                                                                                    <asp:HiddenField ID="txtCustodian_hidden" runat="server" Value='<%# Bind("crg_CustodianID") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <%--End of New Work--%>
                                                                            <tr style="display:none">
                                                                                <td colspan="4">
                                                                                    <asp:Label ID="lblSttWap" runat="Server" Text='<%#Bind("crg_STTWap") %>'></asp:Label> 
                                                                                </td>
                                                                            </tr>
                                                                            
                                                                            <tr>
                                                                                <td style="text-align: right;" colspan="2">
                                                                                    <dxe:ASPxButton ID="btnUpdate" runat="server" Text="Update" ToolTip="Update data"
                                                                                        Height="18px" Width="88px" AutoPostBack="False">
                                                                                        <ClientSideEvents Click="function(s, e) {exchange.UpdateEdit();}" />
                                                                                    </dxe:ASPxButton>
                                                                                </td>
                                                                                <td style="text-align: left;" colspan="2">
                                                                                    <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel data"
                                                                                        Height="18px" Width="88px" AutoPostBack="False">
                                                                                        <ClientSideEvents Click="function(s, e) {exchange.CancelEdit();}" />
                                                                                    </dxe:ASPxButton>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </EditForm>
                                                                </Templates>
                                                            </dxwgv:ASPxGridView>
                                                        </dxw:ContentControl>
                                                    </ContentCollection>
                                                </dxtc:TabPage>
                                                <dxtc:TabPage Name="Other Memberships" Text="Other Memberships">
                                                    <ContentCollection>
                                                        <dxw:ContentControl runat="server">
                                                            <dxwgv:ASPxGridView ID="gridMembership" ClientInstanceName="membership" runat="server" 
                                                                Width="100%" AutoGenerateColumns="False" DataSourceID="Sqlmembership" KeyFieldName="crg_internalid" OnRowDeleted="gridMembership_RowDeleted">
                                                                <Styles>
                                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                    </Header>
                                                                    <LoadingPanel ImageSpacing="10px">
                                                                    </LoadingPanel>
                                                                </Styles>
                                                                <StylesEditors>
                                                                    <ProgressBar Height="25px">
                                                                    </ProgressBar>
                                                                </StylesEditors>
                                                                <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="300px" PopupEditFormHorizontalAlign="Center"
                                                                    PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px"
                                                                    EditFormColumnCount="1" />
                                                                <Styles>
                                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                    </Header>
                                                                    <LoadingPanel ImageSpacing="10px">
                                                                    </LoadingPanel>
                                                                </Styles>
                                                                <Settings ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                                <SettingsText PopupEditFormCaption="Add/Modify Membership" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                                                    <FirstPageButton Visible="True">
                                                                    </FirstPageButton>
                                                                    <LastPageButton Visible="True">
                                                                    </LastPageButton>
                                                                </SettingsPager>
                                                                <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                                <Templates>
                                                                    <TitlePanel>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td align="center" style="width: 50%">
                                                                                    <span style="color: White; font-weight: bold; font-size: 12px; text-align: center">Other
                                                                                        Memberships</span>
                                                                                </td>
                                                                                <%--<td align="right">
                                                                            <table width="200">
                                                                                <tr>
                                                                                    
                                                                                    <td>
                                                                                      
                                                                                    </td>
                                                                                    <td>
                                                                                        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"   Height="18px" Width="88px" AutoPostBack="False">
                                                                                            <clientsideevents click="function(s, e) {membership.AddNewRow();}" />
                                                                                        </dxe:ASPxButton>
                                                                                    </td>
                                                                                                                        
                                                                                     
                                                                                  </tr>
                                                                              </table>
                                                                          </td>   --%>
                                                                            </tr>
                                                                        </table>
                                                                    </TitlePanel>
                                                                    <EditForm>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="width: 25%">
                                                                                </td>
                                                                                <td style="width: 50%">
                                                                                    <controls>
                                                                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                                                                </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                                                                            </controls>
                                                                                    <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                                            runat="server">
                                                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                                            runat="server">
                                                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                    </div>
                                                                                </td>
                                                                                <td style="width: 25%">
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </EditForm>
                                                                </Templates>
                                                                <Columns>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_internalid" ReadOnly="True" Visible="False"
                                                                        VisibleIndex="0">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_cntId" Visible="False" VisibleIndex="0">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn Caption="Membership Number" FieldName="crg_memNumber"
                                                                        VisibleIndex="1">
                                                                        <EditFormSettings Visible="True" VisibleIndex="1" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn Caption="Membership Type" FieldName="crg_memtype" VisibleIndex="2">
                                                                        <EditFormSettings Visible="True" VisibleIndex="2" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataComboBoxColumn Caption="Professional Association" FieldName="crg_idprof"
                                                                        VisibleIndex="0">
                                                                        <PropertiesComboBox DataSourceID="SqlProfessional" ValueField="prof_id" TextField="prof_name"
                                                                            ValueType="System.String" EnableSynchronization="False" EnableIncrementalFiltering="true">
                                                                        </PropertiesComboBox>
                                                                        <EditFormSettings Caption="Professional Association" Visible="True" VisibleIndex="0" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                                    <dxwgv:GridViewDataComboBoxColumn Caption="Validity Type" FieldName="crg_validityType"
                                                                        VisibleIndex="2">
                                                                        <PropertiesComboBox ValueType="System.String" EnableSynchronization="False" EnableIncrementalFiltering="true">
                                                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                                        var value = s.GetValue();
                                                                            if(value == &quot;Limited&quot;)
                                                                            {
                                                                                membership.GetEditor(&quot;crg_memExpDate&quot;).SetClientVisible(true);
                                                                            }
                                                                            else
                                                                            {
                                                                                membership.GetEditor(&quot;crg_memExpDate&quot;).SetClientVisible(false);
                                                                            }
                                                                        }" />
                                                                            <Items>
                                                                                <dxe:ListEditItem Text="Limited" Value="Limited">
                                                                                </dxe:ListEditItem>
                                                                                <dxe:ListEditItem Text="Lifetime" Value="Lifetime">
                                                                                </dxe:ListEditItem>
                                                                            </Items>
                                                                        </PropertiesComboBox>
                                                                        <EditFormSettings Caption="Validity Type" Visible="True" VisibleIndex="3" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                                    <dxwgv:GridViewDataDateColumn Caption="Membership Expiry Date" FieldName="crg_memExpDate"
                                                                        Visible="false">
                                                                        <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MM yyyy" UseMaskBehavior="True">
                                                                        </PropertiesDateEdit>
                                                                        <EditFormSettings Caption="Membership Expiry Date" Visible="True" VisibleIndex="4" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataDateColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="crg_memExpDate1" Caption="Membership Expiry Date"
                                                                        VisibleIndex="3">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn Caption="Notes" FieldName="crg_notes" VisibleIndex="5">
                                                                        <EditFormSettings Caption="Notes" Visible="True" VisibleIndex="5" />
                                                                        <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                        </EditFormCaptionStyle>
                                                                        <CellStyle CssClass="gridcellleft">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="CreateUser" Visible="False" VisibleIndex="5">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataDateColumn FieldName="CreateDate" Visible="False" VisibleIndex="5">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataDateColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="LastModifyUser" Visible="False" VisibleIndex="5">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataDateColumn FieldName="LastModifyDate" Visible="False" VisibleIndex="5">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dxwgv:GridViewDataDateColumn>
                                                                    <dxwgv:GridViewCommandColumn VisibleIndex="6">
                                                                        <EditButton Visible="True">
                                                                        </EditButton>
                                                                        <DeleteButton Visible="True">
                                                                        </DeleteButton>
                                                                        <HeaderTemplate>
                                                                            <a href="javascript:void(0);" onclick="membership.AddNewRow();"><span style="color: #000099;
                                                                                text-decoration: underline">Add New</span> </a>
                                                                        </HeaderTemplate>
                                                                    </dxwgv:GridViewCommandColumn>
                                                                </Columns>
                                                            </dxwgv:ASPxGridView>
                                                            <%--New Work 01/02/2022--%>
                                                            <%--Implemented tbl_master_contactMembership_Log Table--%>
                                                            <%--End of New Work 01/02/2022--%>
                                                            <asp:SqlDataSource ID="Sqlmembership" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                                DeleteCommand="
                                                                INSERT INTO [tbl_master_contactMembership_Log] ([crg_internalid],[crg_cntId],[crg_idprof], [crg_memNumber], [crg_memtype], [crg_validityType], [crg_memExpDate], [crg_notes], 
                                                                [CreateUser], [CreateDate],[LastModifyUser],[LastModifyDate],[LogModifyUser],[LogModifyDate],[LogStatus])
                                                                Select [crg_internalid],[crg_cntId],[crg_idprof], [crg_memNumber], [crg_memtype], [crg_validityType], [crg_memExpDate], [crg_notes], [CreateUser], [CreateDate],[LastModifyUser],
                                                                [LastModifyDate],@LogModifyUser,GETDATE(),'D' From tbl_master_contactMembership WHERE [crg_internalid] = @crg_internalid 
                                                                
                                                                DELETE FROM [tbl_master_contactMembership] WHERE [crg_internalid] = @crg_internalid "
                                                                InsertCommand="INSERT INTO [tbl_master_contactMembership] ([crg_cntId],[crg_idprof], [crg_memNumber], [crg_memtype], [crg_validityType], [crg_memExpDate], [crg_notes], 
                                                                [CreateUser], [CreateDate]) 
                                                                VALUES (@crg_cntId,@crg_idprof, @crg_memNumber, @crg_memtype, @crg_validityType, @crg_memExpDate, @crg_notes, @CreateUser, getdate())
                                                                Declare @RowID int
                                                                SET @RowID=@@identity
                                                                INSERT INTO [tbl_master_contactMembership_Log] ([crg_internalid],[crg_cntId],[crg_idprof], [crg_memNumber], [crg_memtype], [crg_validityType], [crg_memExpDate], [crg_notes], 
                                                                [CreateUser], [CreateDate],[LogStatus]) 
                                                                Select @RowID,@crg_cntId,@crg_idprof, @crg_memNumber, @crg_memtype, @crg_validityType, @crg_memExpDate, @crg_notes, @CreateUser, getdate(),'I' "
                                                                SelectCommand="SELECT *,convert(varchar(11),crg_memExpDate,113) as crg_memExpDate1 FROM [tbl_master_contactMembership] where crg_cntId=@crg_cntId"
                                                                UpdateCommand="UPDATE [tbl_master_contactMembership] SET  [crg_idprof] = @crg_idprof, [crg_memNumber] = @crg_memNumber, [crg_memtype] = @crg_memtype, 
                                                                [crg_validityType] = @crg_validityType, [crg_memExpDate] = @crg_memExpDate, [crg_notes] = @crg_notes,  [LastModifyUser] = @LastModifyUser, [LastModifyDate] = getdate() 
                                                                WHERE [crg_internalid] = @crg_internalid
                                                                
                                                                IF NOT EXISTS(SELECT crg_internalid FROM tbl_master_contactMembership_Log WHERE [crg_internalid] = @crg_internalid AND [crg_idprof] = @crg_idprof AND [crg_memNumber] = @crg_memNumber 
                                                                AND [crg_memtype] = @crg_memtype AND [crg_validityType] = @crg_validityType AND [crg_memExpDate] = @crg_memExpDate AND [crg_notes] = @crg_notes)
                                                                    BEGIN
                                                                        INSERT INTO [tbl_master_contactMembership_Log] ([crg_internalid],[crg_cntId],[crg_idprof], [crg_memNumber], [crg_memtype], [crg_validityType], [crg_memExpDate], [crg_notes], 
                                                                        [CreateUser], [CreateDate],[LastModifyUser],[LastModifyDate],[LogStatus])
                                                                        Select [crg_internalid],[crg_cntId],[crg_idprof], [crg_memNumber], [crg_memtype], [crg_validityType], [crg_memExpDate], [crg_notes], [CreateUser], [CreateDate],[LastModifyUser],
                                                                        [LastModifyDate],'M' From tbl_master_contactMembership WHERE [crg_internalid] = @crg_internalid 
                                                                    END ">
                                                                <DeleteParameters>
                                                                    <asp:Parameter Name="crg_internalid" Type="Int32" />
                                                                    <asp:SessionParameter Name="LogModifyUser" SessionField="userid" Type="int32" />
                                                                </DeleteParameters>
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="crg_cntId" SessionField="KeyVal_InternalID" Type="string" />
                                                                </SelectParameters>
                                                                <InsertParameters>
                                                                    <asp:SessionParameter Name="crg_cntId" SessionField="KeyVal_InternalID" Type="string" />
                                                                    <asp:Parameter Name="crg_idprof" Type="String" />
                                                                    <asp:Parameter Name="crg_memNumber" Type="String" />
                                                                    <asp:Parameter Name="crg_memtype" Type="String" />
                                                                    <asp:Parameter Name="crg_validityType" Type="String" />
                                                                    <asp:Parameter Type="datetime" Name="crg_memExpDate" />
                                                                    <asp:Parameter Name="crg_notes" Type="String" />
                                                                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="int32" />
                                                                </InsertParameters>
                                                                <UpdateParameters>
                                                                    <asp:Parameter Name="crg_idprof" Type="String" />
                                                                    <asp:Parameter Name="crg_memNumber" Type="String" />
                                                                    <asp:Parameter Name="crg_memtype" Type="String" />
                                                                    <asp:Parameter Name="crg_validityType" Type="String" />
                                                                    <asp:Parameter Type="datetime" Name="crg_memExpDate" />
                                                                    <asp:Parameter Name="crg_notes" Type="String" />
                                                                    <asp:SessionParameter Name="LastModifyUser" SessionField="userid" Type="int32" />
                                                                    <asp:Parameter Name="crg_internalid" Type="Int32" />
                                                                </UpdateParameters>
                                                            </asp:SqlDataSource>
                                                        </dxw:ContentControl>
                                                    </ContentCollection>
                                                </dxtc:TabPage>
                                            </tabpages>
                                        </dxtc:ASPxPageControl>
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Other">
                                <TabTemplate>
                                    <span style="font-size: x-small">Other</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Group Member" Text="Group">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Deposit" Text="Deposit">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Remarks" Text="Remarks">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Education" Text="Education">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Trad. Prof." Text="Trad.Prof">
                                <%--<TabTemplate ><span style="font-size:x-small">Trad.Prof</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>--%>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Family Members" Text="Family">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Subscription" Text="Subscription">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <%--New Work 30-12-2021--%>
                            <dxtc:TabPage Name="Nominee">
                                <TabTemplate>
                                    <span style="font-size: x-small;color:Blue;font-weight:bold">Nominee</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <%--End of New Work 30-12-2021--%>
                        </TabPages>
                        <%--New work Contact_Nominee(Tab14) added 30-12-2021--%>
                        <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            var Tab2 = page.GetTab(2);
	                                            var Tab3 = page.GetTab(3);
	                                            var Tab4 = page.GetTab(4);
	                                            var Tab5 = page.GetTab(5);
	                                            var Tab6 = page.GetTab(6);
	                                            var Tab7 = page.GetTab(7);
	                                            var Tab8 = page.GetTab(8);
	                                            var Tab9 = page.GetTab(9);
	                                            var Tab10 = page.GetTab(10);
	                                            var Tab11 = page.GetTab(11);
	                                            var Tab12 = page.GetTab(12);
	                                            var Tab13=page.GetTab(13);
	                                            var Tab14=page.GetTab(14);

	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                            if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
	                                            }
	                                            else if(activeTab == Tab2)
	                                            {
	                                                disp_prompt('tab2');
	                                            }
	                                            else if(activeTab == Tab3)
	                                            {
	                                                disp_prompt('tab3');
	                                            }
	                                            else if(activeTab == Tab4)
	                                            {
	                                                disp_prompt('tab4');
	                                            }
	                                            else if(activeTab == Tab5)
	                                            {
	                                                disp_prompt('tab5');
	                                            }
	                                            else if(activeTab == Tab6)
	                                            {
	                                                disp_prompt('tab6');
	                                            }
	                                            else if(activeTab == Tab7)
	                                            {
	                                                disp_prompt('tab7');
	                                            }
	                                            else if(activeTab == Tab8)
	                                            {
	                                                disp_prompt('tab8');
	                                            }
	                                            else if(activeTab == Tab9)
	                                            {
	                                                disp_prompt('tab9');
	                                            }
	                                            else if(activeTab == Tab10)
	                                            {
	                                                disp_prompt('tab10');
	                                            }
	                                            else if(activeTab == Tab11)
	                                            {
	                                                disp_prompt('tab11');
	                                            }
	                                            else if(activeTab == Tab12)
	                                            {
	                                                disp_prompt('tab12');
	                                            }
	                                             else if(activeTab == Tab13)
	                                            {
	                                               disp_prompt('tab13');
	                                            }
	                                            else if(activeTab == Tab14)
	                                            {
	                                               disp_prompt('tab14');
	                                            }
	                                            
	                                            }"></ClientSideEvents>
                        <ContentStyle>
                            <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                        </ContentStyle>
                        <LoadingPanelStyle ImageSpacing="6px">
                        </LoadingPanelStyle>
                    </dxtc:ASPxPageControl>
                </td>
            </tr>
            <tr>
                <td style="display: none;">
                    <asp:HiddenField runat="server" ID="hiddenedit" />
                </td>
            </tr>
        </table>
        <%-- <asp:SqlDataSource ID="Sqlstatutory" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
         DeleteCommand="DELETE FROM [tbl_master_contactRegistration] WHERE [crg_id] = @crg_id"
            InsertCommand="INSERT INTO [tbl_master_contactRegistration] ([crg_cntId], [crg_type], [crg_Number], [crg_registrationAuthority], [crg_place], [crg_Date], [crg_validDate], [CreateDate], [CreateUser],[crg_contactType],[crg_verify],crg_PanExmptProofType,crg_PanExmptProofNumber) VALUES (@crg_cntId, @crg_type, @crg_Number, @crg_registrationAuthority, @crg_place, @crg_Date, @crg_validDate, getdate(), @CreateUser,'contact',@crg_verify,@crg_PanExmptProofType,@crg_PanExmptProofNumber)"
            SelectCommand="SELECT [crg_id], crg_PanExmptProofType,crg_PanExmptProofNumber,[crg_cntId], [crg_type], [crg_Number], [crg_registrationAuthority], [crg_place], [crg_Date],convert(varchar(11),crg_Date,113) as crg_Date1, [crg_validDate],convert(varchar(11),crg_validDate,113) as crg_validDate1,[crg_verify], [CreateDate], [CreateUser], [LastModifyDate], [LastModifyUser] FROM [tbl_master_contactRegistration] where crg_cntId=@crg_cntId"
            UpdateCommand="UPDATE [tbl_master_contactRegistration] SET  [crg_type] = @crg_type, [crg_Number] = @crg_Number,[crg_PanExmptProofType] = @crg_PanExmptProofType, [crg_PanExmptProofNumber] = @crg_PanExmptProofNumber, [crg_registrationAuthority] = @crg_registrationAuthority, [crg_place] = @crg_place,[crg_contactType]='contact', [crg_Date] = @crg_Date, [crg_validDate] = @crg_validDate, [LastModifyDate] = getdate(), [LastModifyUser] = @LastModifyUser,[crg_verify]=@crg_verify  WHERE [crg_id] = @crg_id">
            <DeleteParameters>
                <asp:Parameter Name="crg_id" Type="Decimal" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="crg_cntId" SessionField="KeyVal_InternalID" Type="string" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter Name="crg_cntId" SessionField="KeyVal_InternalID" Type="string" />
                <asp:Parameter Name="crg_type" Type="String" />
                <asp:Parameter Name="crg_Number" Type="String" />
                <asp:Parameter Name="crg_registrationAuthority" Type="String" />
                <asp:Parameter Name="crg_place" Type="String" />
                <asp:Parameter Type="datetime" Name="crg_Date" />
                <asp:Parameter Type="datetime" Name="crg_validDate" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                <asp:Parameter Name="crg_verify" Type="String" />
                <asp:Parameter Name="crg_PanExmptProofType" Type="int32" />
                <asp:Parameter Name="crg_PanExmptProofNumber" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="crg_type" Type="String" />
                <asp:Parameter Name="crg_Number" Type="String" />
                <asp:Parameter Name="crg_registrationAuthority" Type="String" />
                <asp:Parameter Name="crg_place" Type="String" />
                <asp:Parameter Type="datetime" Name="crg_Date" />
                <asp:Parameter Type="datetime" Name="crg_validDate" />
                <asp:SessionParameter Name="LastModifyUser" SessionField="userid" Type="Decimal" />
                <asp:Parameter Name="crg_id" Type="Decimal" />
                <asp:Parameter Name="crg_verify" Type="String" />
                <asp:Parameter Name="crg_PanExmptProofType" Type="int32" />
                <asp:Parameter Name="crg_PanExmptProofNumber" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>--%>
        <%--New Work && Added a new column as crg_CustodianID--%>
        <%--New Work 01/02/2022--%>
        <%--DeleteCommand="            
            INSERT INTO tbl_master_contactExchange_Log
	        	(crg_internalId, crg_cntID, crg_company, crg_exchange, crg_tcode, crg_regisDate, crg_businessCmmDate, crg_suspensionDate, 
	        	crg_reasonforSuspension, CreateDate, CreateUser, LastModifyDate, LastModifyUser, LogModifyDate, LogModifyUser, LogStatus,
	        	crg_SubBrokerFranchiseeID,crg_Dealer,crg_AccountClosureDate,crg_FrontOfficeBranchCode,crg_FrontOfficeGroupCode,
	        	crg_ParticipantSchemeCode,crg_ClearingBankCode,crg_SchemeCode,crg_STTPattern,crg_STTWap,crg_SegmentID,crg_CustodianID)
	        SELECT 
	        	crg_internalId, crg_cntID, crg_company, crg_exchange, crg_tcode, crg_regisDate, crg_businessCmmDate, crg_suspensionDate, 
	        	crg_reasonforSuspension, CreateDate, CreateUser, LastModifyDate, LastModifyUser, getdate(), @CreateUser, 'D',
	        	crg_SubBrokerFranchiseeID,crg_Dealer,crg_AccountClosureDate,crg_FrontOfficeBranchCode,crg_FrontOfficeGroupCode,
	        	crg_ParticipantSchemeCode,crg_ClearingBankCode,crg_SchemeCode,crg_STTPattern,crg_STTWap,crg_SegmentID,crg_CustodianID 
	        FROM tbl_master_contactExchange WHERE 
	        	crg_internalId=@crg_internalId--%>
        <%--End of New Work 01/02/2022--%>
        <asp:SqlDataSource ID="SqlExchange" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select ce.crg_internalId as crg_internalId,ce.crg_cntID as crg_cntID,ce.crg_exchange as crg_exchange1,ce.crg_company as crg_company1,
            case crg_company when '0' then 'N/A' else (select cmp_name from tbl_master_company where cmp_internalId=ce.crg_company) end as crg_company,
            ce.crg_exchange as crg_exchange,ltrim(rtrim(ce.crg_tcode)) as crg_tcode,
            case when ce.crg_regisDate='1/1/1900 12:00:00 AM' then null else convert(varchar(11),ce.crg_regisDate,113) end as crg_regisDate1,
            case when ce.crg_regisDate='1/1/1900 12:00:00 AM' then null else cast(ce.crg_regisDate as datetime) end as crg_regisDate,
            case when ce.crg_businessCmmDate='1/1/1900 12:00:00 AM' then null else convert(varchar(11),ce.crg_businessCmmDate,113) end as crg_businessCmmDate1,
            case when ce.crg_businessCmmDate='1/1/1900 12:00:00 AM' then null else cast(ce.crg_businessCmmDate as datetime) end as crg_businessCmmDate,
            case when ce.crg_suspensionDate='1/1/1900 12:00:00 AM' then null else convert(varchar(11),ce.crg_suspensionDate,113) end as crg_suspensionDate1,
            case when ce.crg_suspensionDate='1/1/1900 12:00:00 AM' then null else cast(ce.crg_suspensionDate as datetime) end as crg_suspensionDate,
            ltrim(rtrim(ce.crg_reasonforSuspension)) as crg_reasonforSuspension,ce.CreateUser as CreateUser,
            ltrim(rtrim(ce.crg_SubBrokerFranchiseeID)) as crg_SubBrokerFranchiseeID,ltrim(rtrim(ce.crg_Dealer)) as crg_Dealer,
            case when ce.crg_AccountClosureDate='1/1/1900 12:00:00 AM' then null else cast(ce.crg_AccountClosureDate as datetime) end as crg_AccountClosureDate,
            ltrim(rtrim(ce.crg_FrontOfficeBranchCode)) as crg_FrontOfficeBranchCode,ltrim(rtrim(ce.crg_FrontOfficeGroupCode)) as crg_FrontOfficeGroupCode,
            ltrim(rtrim(ce.crg_ParticipantSchemeCode)) as crg_ParticipantSchemeCode,ltrim(rtrim(ce.crg_ClearingBankCode)) as crg_ClearingBankCode,
            ltrim(rtrim(ce.crg_SchemeCode)) as crg_SchemeCode,ltrim(rtrim(ce.crg_STTPattern)) as crg_STTPattern,ce.crg_STTWap as crg_STTWap,
            (select isnull(ltrim(rtrim(cnt_firstname)),'')+' '+isnull(ltrim(rtrim(cnt_middlename)),'')+' '+
            isnull(ltrim(rtrim(cnt_lastname)),'')+' ['+isnull(ltrim(rtrim(cnt_shortName)),'')+']' from tbl_master_contact
             where cnt_internalId=ce.crg_SubBrokerFranchiseeID) as Franchisee,(select isnull(ltrim(rtrim(cnt_firstname)),'')+' '+
             isnull(ltrim(rtrim(cnt_middlename)),'')+' '+isnull(ltrim(rtrim(cnt_lastname)),'')+' ['+isnull(ltrim(rtrim(cnt_ucc)),'')+']' 
             from tbl_master_contact where cnt_internalId=ce.crg_Dealer) as Dealer,Case When crg_swapUCC='Y' Then 1 Else 0 End crg_swapUCC,
            ltrim(rtrim(ce.crg_CustodianID)) as crg_CustodianID,
             (select isnull(ltrim(rtrim(cnt_firstname)),'')+' '+isnull(ltrim(rtrim(cnt_middlename)),'')+' '+
            isnull(ltrim(rtrim(cnt_lastname)),'')+' ['+isnull(ltrim(rtrim(cnt_shortName)),'')+']' from tbl_master_contact
             where cnt_internalId=ce.crg_CustodianID) as Custodian 
             from tbl_master_contactExchange ce where crg_cntID=@crg_cntID"
         
            DeleteCommand="            
            INSERT INTO tbl_master_contactExchange_Log
	        	(crg_internalId, crg_cntID, crg_company, crg_exchange, crg_tcode, crg_regisDate, crg_businessCmmDate, crg_suspensionDate, 
	        	crg_reasonforSuspension, CreateDate, CreateUser, LastModifyDate, LastModifyUser, LogModifyDate, LogModifyUser, LogStatus,
	        	crg_SubBrokerFranchiseeID,crg_Dealer,crg_AccountClosureDate,crg_FrontOfficeBranchCode,crg_FrontOfficeGroupCode,
	        	crg_ParticipantSchemeCode,crg_ClearingBankCode,crg_SchemeCode,crg_STTPattern,crg_STTWap,crg_SegmentID,crg_CustodianID)
	        SELECT 
	        	crg_internalId, crg_cntID, crg_company, crg_exchange, crg_tcode, crg_regisDate, crg_businessCmmDate, crg_suspensionDate, 
	        	crg_reasonforSuspension, CreateDate, CreateUser, LastModifyDate, LastModifyUser, getdate(), @CreateUser, 'D',
	        	crg_SubBrokerFranchiseeID,crg_Dealer,crg_AccountClosureDate,crg_FrontOfficeBranchCode,crg_FrontOfficeGroupCode,
	        	crg_ParticipantSchemeCode,crg_ClearingBankCode,crg_SchemeCode,crg_STTPattern,crg_STTWap,crg_SegmentID,crg_CustodianID 
	        FROM tbl_master_contactExchange WHERE 
	        	crg_internalId=@crg_internalId
            
            delete from tbl_master_contactExchange where crg_internalId=@crg_internalId">
            <SelectParameters>
                <asp:SessionParameter Name="crg_cntID" SessionField="KeyVal_InternalID" Type="string" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="crg_internalId" Type="string" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlComp" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT [cmp_internalid], [cmp_Name] FROM [tbl_master_company] where cmp_internalid in(select distinct exch_compId from tbl_master_companyExchange)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlExchangeSegment" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select exch_internalId,isnull(((select exh_shortName from tbl_master_exchange where exh_cntId=tbl_master_companyExchange.exch_exchId)+' - '+ exch_segmentId),exch_membershipType) as Exchange from tbl_master_companyExchange">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProfessional" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT [prof_id], [prof_name] FROM [tbl_master_profTechBodies]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlSegment" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            ConflictDetection="CompareAllValues" SelectCommand=""></asp:SqlDataSource>
            <asp:HiddenField ID="hdnDuplicatePAN" runat="server" Value="N" />
             <asp:HiddenField ID="hdnBannedPAN" runat="server" Value="N" />
            <asp:HiddenField ID="hdnRights" runat="server" />
    </form>
</body>
</html>
