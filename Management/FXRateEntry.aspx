<%@ page language="C#" autoeventwireup="true" inherits="management_FXRateEntry, App_Web_vvdfezxa" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Transaction FX-Rate</title>

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />
    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>
    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />
    <script type="text/javascript" src="../modalfiles/modal.js"></script>
    <style type="text/css">
    /* New Work 26/01/2022 */
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
		z-index:32767;
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
		z-index:3000;
	}
	/* End of New Work 26/01/2022 */
    form {
		display:inline;
	}	
    </style>

    <script type="text/javascript" language="javascript">
        //New Work 26/01/2022
        function CallAjax(obj1,obj2,obj3,Query)
        {
            var CombinedQuery=new String(Query);
            ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');       
        }
             
       function replaceChars(entry) 
       {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out)>-1) {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
        } 
        
        function ShowHideFilter(obj)
        {
            cGridFXRate.PerformCallback('Show~'+obj+'~');
        } 
        function callback()
        {
            cGridFXRate.PerformCallback();
        }
        //End of New Work 26/01/2022
         sRateDateType='';
         sEntryDate='';
         sFromDate='';
         sToDate='';
         sRadioAll='';
         sCurrencyType='';
         sFromCurrency='';
         sToCurrency='';
         bindParams='';       
         dRateDate='';
         dFromCurrency='';
         dToCurrency='';
         dRate='';
           function BindAfterSaveParam()
           {     
               //======== Start Search Main Filter Parameter after Insert again Grid bind
               sRateDateType= cCmbDateType.GetValue();        
              if(sRateDateType=="0")
               {
                   sEntryDate=cdtentrydate.GetDate(); 
                   sEntryDate=ChangeDateFormat_CalToDB(sEntryDate);                
                   sFromDate='';                
                   sToDate='';            
               }
              else
              {
                  sEntryDate='';
                  sFromDate=cPeriodDateFrom.GetDate();
                  sFromDate=ChangeDateFormat_CalToDB(sFromDate);
                  sToDate=cPeriodDateTo.GetDate();
                  sToDate=ChangeDateFormat_CalToDB(sToDate);
              }                 
               sRadioAll=document.getElementById("rdbFxRateCurrencyAll");
              if(sRadioAll.checked)
              {
                 sCurrencyType='All';
                 //New Work 26/01/2022
                 //sFromCurrency='0';
                 //sToCurrency='0';
                 //End of New Work 26/01/2022
              }
              else
              {
                 sCurrencyType='Selected';
                 //New Work 26/01/2022
                 //sFromCurrency=cCmbFromCurrency.GetValue();
                 //sToCurrency=cCmbToCurrency.GetValue();
                 //End of New Work 26/01/2022
              } 
                bindParams=sRateDateType+'@'+sEntryDate+'@'+sFromDate+'@'+sToDate+'@'+sCurrencyType+'@'+sFromCurrency+'@'+sToCurrency+'@';
               //==============End Search Main Filter Parameter after Insert again Grid bind              
            }  
            function SignOff()
            {
              window.parent.SignOff()
            }
            function Page_Load()
            {
                height();
                cCmbDateType.Focus();
                document.getElementById('periodDate').style.display='none';
                document.getElementById('currencyRange').style.display='none';
            }
            function height()
            {        
               if(document.body.scrollHeight>=200)
                window.frameElement.height = document.body.scrollHeight;
               else
                window.frameElement.height = '200px';
                window.frameElement.Width = document.body.scrollWidth;
            }
            FieldName="none";
            function ChangeDateFormat_CalToDB(obj)
            {
                var SelectedDate = new Date(obj);            
                var monthnumber = SelectedDate.getMonth() + 1;
                var monthday    = SelectedDate.getDate();
                var year        = SelectedDate.getYear();            
                var changedDateValue=year+'-'+monthnumber+'-'+monthday;
                return changedDateValue;
            }
            function ChangeDateFormat_SetCalenderValue(obj)
            {       
                var SelectedDate = new Date(obj);
                var monthnumber = SelectedDate.getMonth();
                var monthday    = SelectedDate.getDate();
                var year        = SelectedDate.getYear();            
                var changeDateValue=new Date(year, monthnumber, monthday);
                return changeDateValue;            
             } 
            function DateCompare(DateobjFrm,DateobjTo)
            {
                var Msg="To Date Can Not Be Less Than From Date!!!";
                DevE_CompareDateForMin(DateobjFrm,DateobjTo,Msg);
            } 
            //New Work 26/01/2022
            function setDateTypeaftershow(obj)
            { 
                var dateType=obj;
                if(dateType=="1")
                {
                   Hide('entryDate');
                    Show('periodDate');
                }
                else
                {
                  Show('entryDate');
                  Hide('periodDate');
                }
            }
            //End of New Work 26/01/2022
            function fndDateType(obj)
            { 
                var dateType=obj.GetValue();               
                if(dateType=="1")
                {
                   Hide('entryDate');
                    Show('periodDate');
                }
                else
                {
                  Show('entryDate');
                  Hide('periodDate');
                }
            }
           function fndCurrencyType(obj)
            {                
                if(obj!="All")
                {
                    Show('currencyRange');
                }
                else
                {
                    Hide('currencyRange');                                                
                }
            }
            function Hide(obj)
            {
              document.getElementById(obj).style.display='none';
            }
            function Show(obj)
            {
              document.getElementById(obj).style.display='inline';
            }
            //New Work 26/01/2022
//            function CmbFromCurrency_EndCallback()
//            {
//               cCmbFromCurrency.SetSelectedIndex(0);
//               cCmbFromCurrency.Focus();
//            }           
//            function OnCmbFromCurrency_ValueChange()
//            {
//               cCmbToCurrency.PerformCallback("SelectedFC~" + cCmbFromCurrency.GetValue());
//            }           
//            function CmbToCurrency_EndCallback()
//            {
//              cCmbToCurrency.SetSelectedIndex(0);
//              cCmbToCurrency.Focus();
//            }
//            
//            function btnShowClick()
//            {     
//               //======== Start Search Main Filter Parameter on Page Load
//                sRateDateType= cCmbDateType.GetValue();        
//                if(sRateDateType=="0")
//                {
//                    sEntryDate=cdtentrydate.GetDate(); 
//                    sEntryDate=ChangeDateFormat_CalToDB(sEntryDate);                
//                    sFromDate='';                
//                    sToDate='';            
//                }
//                else
//                {
//                    sEntryDate='';
//                    sFromDate=cPeriodDateFrom.GetDate();
//                    sFromDate=ChangeDateFormat_CalToDB(sFromDate);
//                    sToDate=cPeriodDateTo.GetDate();
//                    sToDate=ChangeDateFormat_CalToDB(sToDate);
//                }
//                sRadioAll=document.getElementById("rdbFxRateCurrencyAll");
//                if(sRadioAll.checked)
//                {
//                    sCurrencyType='All';
//                    sFromCurrency='0';
//                    sToCurrency='0';
//                }
//                else
//                {
//                    sCurrencyType='Selected';
//                    sFromCurrency=cCmbFromCurrency.GetValue();
//                    sToCurrency=cCmbToCurrency.GetValue();
//                }
//                 bindParams=sRateDateType+'@'+sEntryDate+'@'+sFromDate+'@'+sToDate+'@'+sCurrencyType+'@'+sFromCurrency+'@'+sToCurrency+'@';
//                  //======== End Search Main Filter Parameter on Page Load   
//               cGridFXRate.PerformCallback('Show~'+bindParams+'~');
//            }
//            function OnCmbAddFromCurrency_ValueChange()
//            {           // alert("Hi-FromCurrency_ValueChang");
//                if(cCmbAddToCurrency.cpEditaddtc==undefined)
//                {
//                //alert("cpEditaddtc-FromCur-ValuChange-"+cCmbAddToCurrency.cpEditaddtc);
//                    cCmbAddToCurrency.PerformCallback("AddSelectedFC~" + cCmbAddFromCurrency.GetValue());
//                }
//            }            
//            function CmbAddToCurrency_EndCallback()
//            {
//                if(cCmbAddToCurrency.cpaddtc!=undefined)
//                {
//                    if(cCmbAddToCurrency.cpaddtc!="0")
//                    {               
//                      cCmbAddToCurrency.SetValue(cCmbAddToCurrency.cpaddtc);
//                    } 
//                     else
//                    {
//                        cCmbAddToCurrency.SetSelectedIndex(0);
//                    }   
//                 }
//                 if(cCmbAddToCurrency.cpEditaddtc!=undefined)
//                 {
//                  //alert("ToCurrency_EndCallb-cpEditaddtc-"+cCmbAddToCurrency.cpEditaddtc);
//                  //alert("Hi-disabled");
//                    if(cCmbAddToCurrency.cpEditaddtc!="0")
//                    {               
//                      cCmbAddToCurrency.SetValue(cCmbAddToCurrency.cpEditaddtc);
//                      cCmbAddToCurrency.SetEnabled(false);
//                      cCmbAddFromCurrency.SetEnabled(false);
//                      cDtAddRateDate.SetEnabled(false);                  
//                    }
//                    else
//                    {
//                   // alert("Hi-Enabled");
//                        cCmbAddToCurrency.SetSelectedIndex(0);
//                        cCmbAddToCurrency.SetEnabled(true);
//                        cCmbAddFromCurrency.SetEnabled(true);
//                        cDtAddRateDate.SetEnabled(true);                  
//                    }                
//                 }
//                //New Work
//                //cCmbAddToCurrency.Focus();
//                //End of New Work
//            }
            
//            function ResetAfterSave()
//            {
//                 cDtAddRateDate.SetDate(new Date());
//                 cCmbAddFromCurrency.SetValue(0);
//                 cCmbAddToCurrency.SetValue(0); 
//                 document.getElementById('txtAddFXRate.ClientID').value='';
//                 cPopUp_FXRate.Hide();
//                 BindAfterSaveParam();
//                 cGridFXRate.PerformCallback("Show~"+bindParams+'~'); 
//            }
            
//            function CmbAddFromCurrency_EndCallback()
//            {
//                if(cCmbAddFromCurrency.cpaddfc!="0")
//                {
//                  cCmbAddFromCurrency.SetValue(cCmbAddFromCurrency.cpaddfc);                  
//                }
//                else
//                {
//                   cCmbAddFromCurrency.SetValue(1);
//                }
//                cCmbAddToCurrency.PerformCallback('AddSelectedFC~'+cCmbAddFromCurrency.GetValue()+'~');
//                cCmbAddFromCurrency.Focus();                          
//             //==========================
//             if(cCmbAddFromCurrency.cpEntryAlreadyExist!= undefined)
//             {
//                 if(cCmbAddFromCurrency.cpEntryAlreadyExist=="Y")
//                 {
//                    alert("Unable To Add Record. Record Already Exist!!!");
//                    ResetAfterSave();              
//                 }             
//             }   
//             if(cCmbAddFromCurrency.cpAdd!= undefined)
//             {
//                if(cCmbAddFromCurrency.cpAdd=="Y")
//                 {
//                     alert("Record Add Successfully!!");
//                     ResetAfterSave();                                          
//                 }
//                 if(cCmbAddFromCurrency.cpAdd=="N")
//                 {
//                   alert("Unable To Add Record.Please Try Again!!!");
//                   ResetAfterSave();                                             
//                 }
//             }           
//             if(cCmbAddFromCurrency.cpUpdate!= undefined)
//             {
//                 if(cCmbAddFromCurrency.cpUpdate=="Y")
//                 {
//                   alert("Record Updated Successfully!!!");
//                   ResetAfterSave();
//                 }
//                 if(cCmbAddFromCurrency.cpUpdate=="N")
//                 {
//                   alert("Unable To Update Record.Please Try Again!!!");
//                   ResetAfterSave();             
//                 }              
//             } 
//               //==========================
//            }
            //End of New Work 26/01/2022
            function GridFXRate_EndCallBack()
            {
                 if(cGridFXRate.cpDelete != undefined)
                 {
                   if(cGridFXRate.cpDelete=="Y")
                    {
                        alert("Record Deleted Successfully!!!");  
                    }
                    if(cGridFXRate.cpDelete=="N")
                    {
                         alert("There Is Some Problem Occured During Deleteing. Please Try Once Again!!!");
                    }                                 
                 } 
                 height();                
             }
             function onBtnDeleteClick(ratedate,fromCurrency,toCurrency)
             {
                dRatedate=ratedate;
                dFromCurrency=fromCurrency;
                dToCurrency=toCurrency;
                BindAfterSaveParam();
                cDeleteConfirmPopUp.Show();             
             } 
             function btnDeleteOKClick()
             {
                BindAfterSaveParam();                         
                cGridFXRate.PerformCallback('Delete~'+dRatedate+'~'+dFromCurrency+'~'+dToCurrency+'~'+bindParams+'~');           
             }
             function Reset()
             {
                dFromCurrency="0";
                dToCurrency="0";                
                dRate="";
                //New Work
                var GetDate = (cdtentrydate.GetValue() != null) ? cdtentrydate.GetValue() : "";
                //End of New Work
                var currentDate=ChangeDateFormat_SetCalenderValue('<%=Session["NowDate"]%>');
                //New Work
                //cDtAddRateDate.SetDate(currentDate);
                //New Work 26/01/2022
//                cDtAddRateDate.SetDate(GetDate);
//                //End of New Work
//                cCmbAddFromCurrency.SetValue(dFromCurrency);
//                cCmbAddToCurrency.SetSelectedIndex(dToCurrency);
//                document.getElementById('txtAddFXRate.ClientID').value=dRate;
//                cDtAddRateDate.SetEnabled(true);
//                cCmbAddFromCurrency.SetEnabled(true);
//                cCmbAddToCurrency.SetEnabled(true);
                //End of New Work 26/01/2022
             }
             //New Work 26/01/2022
//             function OnAddNewButtonClick()
//             {
//                Reset();               
//                document.getElementById('PopUp_FXRate_btnAdd').style.display="inline";
//                document.getElementById('PopUp_FXRate_btnUpdate').style.display="none";
//                cCmbAddFromCurrency.PerformCallback('LoadCombos~'+dFromCurrency+'~');
//                cPopUp_FXRate.Show();     
//             }
//             function  IsAddValidate()
//             {      
//                dRateDate= cDtAddRateDate.GetDate();     
//                dFromCurrency=cCmbAddFromCurrency.GetValue();
//                dToCurrency=cCmbAddToCurrency.GetValue();    
//                dRate = document.getElementById('txtAddFXRate.ClientID').value.trim(); 
//                    if(dRateDate==null)
//                    {
//                        alert("Please Select A Date");
//                        cDtAddRateDate.Focus();
//                        return false;                       
//                    }
//                    if(dFromCurrency=="")
//                    {
//                        alert("Please Select From Currency.");
//                        cCmbAddFromCurrency.Focus();
//                        return false;
//                    }
//                    if(dToCurrency=="")
//                    {
//                        alert("Please Select To Currency.");
//                        cCmbAddToCurrency.Focus();
//                        return false;
//                    }
//                    if(dRate=="")
//                    {
//                        alert("Please Enter FX Rate.");
//                        document.getElementById('txtAddFXRate.ClientID').focus();
//                        return false;
//                    } 
//                   return true;
//             }     
//             function btnAddButtonClick()
//             {
//                if(IsAddValidate())
//                {
//                    dRateDate= cDtAddRateDate.GetDate();
//                    dRateDate=ChangeDateFormat_CalToDB(dRateDate);
//                    dFromCurrency=cCmbAddFromCurrency.GetValue();
//                    dToCurrency=cCmbAddToCurrency.GetValue(); 
//                    dRate=document.getElementById('txtAddFXRate.ClientID').value.trim();                  
//                    cCmbAddFromCurrency.PerformCallback('Insert~'+dRateDate+'~'+dFromCurrency+'~'+dToCurrency+'~'+dRate+'~'); 
//                }
//             }
             function convert(str) {
                  var date = new Date(str),
                    mnth = ("0" + (date.getMonth() + 1)).slice(-2),
                    day = ("0" + date.getDate()).slice(-2);
                  return [date.getFullYear(), mnth, day].join("-");
                }
             function OnAddNewButtonClick(obj)
             {
                var GetDate = (cdtentrydate.GetValue() != null) ? cdtentrydate.GetValue() : "";
                var currentDate=convert(GetDate);
                var URL="FXRatePopup.aspx?id="+obj + "&dt=" + currentDate + "";
                var GridParams="";
                editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Add/Edit FX Rates", "width=1100px,height=200px,center=1,resize=1,top=-1", "recal");
                editwin.onclose=function()
                 {
                    cGridFXRate.PerformCallback('Show~'+GridParams+'~');
                 }
             }
             //End of New Work 26/01/2022
              function OnEditButtonClick(ratedate,fromCurrency,toCurrency,rate)
             {
                //New Work 26/01/2022
//                Reset();
//                document.getElementById('PopUp_FXRate_btnAdd').style.display="none";
//                document.getElementById('PopUp_FXRate_btnUpdate').style.display="inline";
//                dRateDate=ratedate;
//                dFromCurrency=fromCurrency;
//                dToCurrency=toCurrency;
//                dRate=rate;
//                cCmbAddFromCurrency.PerformCallback('LoadCombos~'+dFromCurrency+'~'); 
//                cCmbAddToCurrency.PerformCallback('LoadAddTCEditMode~'+dToCurrency+'~');
//                dRateDate=ChangeDateFormat_SetCalenderValue(dRateDate);
//                cDtAddRateDate.SetDate(dRateDate);         
//                document.getElementById('txtAddFXRate.ClientID').value=dRate; 
//                
//                cPopUp_FXRate.Show();
                
                var URL="FXRatePopup.aspx?id=Edit" + "&dt=" + ratedate + "&fcur=" + fromCurrency +"&tcur=" + toCurrency +"&rt=" + rate + "";
                var GridParams="";
                editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Add/Edit FX Rates", "width=1100px,height=200px,center=1,resize=1,top=-1", "recal");
                editwin.onclose=function()
                 {
                    cGridFXRate.PerformCallback('Show~'+GridParams+'~');
                 }
                 //End of New Work 26/01/2022
             } 
             //New Work 26/01/2022
//             function IsUpdateValidate()
//             {
//                dRateDate= cDtAddRateDate.GetDate();     
//                dFromCurrency=cCmbAddFromCurrency.GetValue();
//                dToCurrency=cCmbAddToCurrency.GetValue();    
//                dRate = document.getElementById('txtAddFXRate.ClientID').value.trim();
//                 if(dRateDate==null)
//                    {
//                        alert("Please Select A Date");
//                        cDtAddRateDate.Focus();
//                        return false;
//                    }
//                    if(dFromCurrency=="")
//                    {
//                        alert("Please Select From Currency.");
//                        cCmbAddFromCurrency.Focus();
//                        return false;
//                    }
//                    if(dToCurrency=="")
//                    {
//                        alert("Please Select To Currency.");
//                        cCmbAddToCurrency.Focus();
//                        return false;
//                    }
//                    if(dRate=="")
//                    {
//                        alert("Please Enter FX Rate.");
//                        document.getElementById('txtAddFXRate.ClientID').focus();
//                        return false;
//                    } 
//                   return true;
//             }     
//             function btnUpdateButtonClick()
//             {
//               if(IsUpdateValidate())
//               {  
//                  dRateDate= cDtAddRateDate.GetDate();
//                  dRateDate=ChangeDateFormat_CalToDB(dRateDate);
//                  dFromCurrency=cCmbAddFromCurrency.GetValue();
//                  dToCurrency=cCmbAddToCurrency.GetValue(); 
//                  dRate=document.getElementById('txtAddFXRate.ClientID').value.trim();                  
//                  cCmbAddFromCurrency.PerformCallback('Update~'+dRateDate+'~'+dFromCurrency+'~'+dToCurrency+'~'+dRate+'~'); 
//                }
//             }
//             function btnCancelButtonClick()
//             {
//               cPopUp_FXRate.Hide();       
//             } 
             //End of New Work 26/01/2022
              function ddlExport_OnChange()
            {
              var ddlExport=document.getElementById("<%=ddlExport.ClientID%>");  
              document.getElementById('btnExport').click();                                
              ddlExport.options[0].selected=true; 
             
            }                
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>
            <div class="TableMain100">
                <div class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Transaction Fx Rate Entry</span></strong>
                </div>
            </div>
            <div class="pageContent">
                <%--style="width: 1000px"--%>
                <div id="dvMainFilter" class="frmContent" style="width: 1000px">
                    <div id="forDate">
                        <div class="frmleftContent" style="width: 90px; line-height: 20px">
                            <asp:Label ID="lblDate" runat="server" Text="Date : " Font-Size="12px"></asp:Label>
                        </div>
                        <div class="left"">
                            <div class="frmleftContent">
                                <dxe:ASPxComboBox ID="CmbDateType" SelectedIndex="0" ClientInstanceName="cCmbDateType"
                                    runat="server" AutoPostBack="false" Width="125px" Height="25px" Font-Size="11px">
                                    <Items>
                                        <dxe:ListEditItem Value="0" Text="For a Date"></dxe:ListEditItem>
                                        <dxe:ListEditItem Value="1" Text="For a Period"></dxe:ListEditItem>
                                    </Items>
                                    <ClientSideEvents ValueChanged="function(s,e){fndDateType(cCmbDateType);}" />
                                </dxe:ASPxComboBox>
                            </div>
                            <div class="left">
                                <div id="entryDate" class="frmleftContent">
                                    <dxe:ASPxDateEdit ID="dtentrydate" runat="server" ClientInstanceName="cdtentrydate"
                                        DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                                        Width="125px" Height="25px" Font-Size="11px">
                                        <DropDownButton Text="Get Date">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                </div>
                                <div id="periodDate" class="left" style="display: none;">
                                    <div class="frmleftContent">
                                        <dxe:ASPxDateEdit ID="PeriodDateFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                            Width="125px" Height="25px" Font-Size="11px" EditFormatString="dd-MM-yyyy" ClientInstanceName="cPeriodDateFrom">
                                            <DropDownButton Text="From">
                                            </DropDownButton>
                                        </dxe:ASPxDateEdit>
                                    </div>
                                    <div class="frmleftContent">
                                        <dxe:ASPxDateEdit ID="PeriodDateTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                            Width="125px" Height="25px" Font-Size="11px" EditFormatString="dd-MM-yyyy" ClientInstanceName="cPeriodDateTo">
                                            <DropDownButton Text="To">
                                            </DropDownButton>
                                            <ClientSideEvents DateChanged="function(s,e){DateCompare(cPeriodDateFrom,cPeriodDateTo);}">
                                            </ClientSideEvents>
                                        </dxe:ASPxDateEdit>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <span class="clear"></span>
                    <div id="forCurrency">
                        <div class="frmleftContent" style="width: 90px; line-height: 20px">
                            <asp:Label ID="lblFxCurrency" runat="server" Text="FX Currency : " Font-Size="12px"></asp:Label>
                        </div>
                        <div class="left">
                            <div class="frmleftContent" style="width: 125px; font-size:11px">
                                <asp:RadioButton ID="rdbFxRateCurrencyAll" runat="server" Checked="True" GroupName="cc"
                                    AutoPostBack="false" onclick="fndCurrencyType('All')"/>All<asp:RadioButton
                                        ID="rdbFxRateCurrencySelected" runat="server" GroupName="cc" AutoPostBack="false"
                                        onclick="fndCurrencyType('Selected')" />Selected
                            </div>
                            <div id="currencyRange" class="left">
                                <div class="frmleftContent">
                                    <div style="float: left; line-height: 20px; font-size:12px">
                                        <asp:Label ID="lblFC" runat="server" Text="From Currency : "></asp:Label>
                                    </div>
                                    <div style="float: left; font-size:12px">
                                    <%--CallbackPageSize="10"--%>
                                        <%--New Work 26/01/2022--%>
                                        <%--<dxe:ASPxComboBox ID="CmbFromCurrency" runat="server" ClientInstanceName="cCmbFromCurrency"
                                            DropDownStyle="DropDown" BackColor="white" Font-Bold="False" ForeColor="Black"
                                            ValueType="System.Int32" Width="180px" Height="25px" Font-Size="11px"
                                            EnableIncrementalFiltering="true" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True">
                                            <ClientSideEvents ValueChanged="function(s,e){
                                                                                    var indexr = s.GetSelectedIndex();
                                                                                    OnCmbFromCurrency_ValueChange(indexr)
                                                                                    }" EndCallback="CmbFromCurrency_EndCallback">
                                            </ClientSideEvents>
                                        </dxe:ASPxComboBox>--%>
                                        <asp:TextBox ID="txtFromCurrency" runat="server" Width="205px"></asp:TextBox>
                                        <asp:TextBox ID="txtFromCurrency_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                        <%--End of New Work 26/01/2022--%>
                                    </div>
                                </div>
                                <div class="frmleftContent">
                                    <div style="float: left; line-height: 20px; font-size:12px">
                                        <asp:Label ID="lblTC" runat="server" Text="To Currency : "></asp:Label>
                                    </div>
                                    <div style="float: left">
                                    <%--CallbackPageSize="10"--%>
                                        <%--New Work 26/01/2022--%>
                                        <%--<dxe:ASPxComboBox ID="CmbToCurrency" runat="server" ClientInstanceName="cCmbToCurrency"
                                            DropDownStyle="DropDown" BackColor="white" Font-Bold="False" ForeColor="Black"
                                            ValueType="System.Int32" Width="180px" Height="25px" Font-Size="11px"
                                            EnableIncrementalFiltering="true" EnableCallbackMode="True" EnableSynchronization="True" OnCallback="CmbToCurrency_Callback">
                                            <ClientSideEvents EndCallback="CmbToCurrency_EndCallback"></ClientSideEvents>
                                        </dxe:ASPxComboBox>--%>
                                        <asp:TextBox ID="txtToCurrency" runat="server" Width="205px"></asp:TextBox>
                                        <asp:TextBox ID="txtToCurrency_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                        <%--End of New Work 26/01/2022--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <span class="clear"></span>
                    <div class="right" style="padding: 4px 10px 4px 4px">
                        <%--New Work 26/01/2022--%>
                        <%--<dxe:ASPxButton ID="btnShow" runat="server" AutoPostBack="False" ClientInstanceName="cbtnShow"
                            CssClass="frmbtn" Text="Show" Width="101px">
                            <ClientSideEvents Click="function(s,e){btnShowClick();}" />
                        </dxe:ASPxButton>--%>
                        <asp:Button ID="btnShow" runat="server" CssClass="btn" Text="Show" Width="101px" Height="27px" OnClick="btnShow_Click" AccessKey="S" ValidationGroup="a" />
                        <%--End of New Work 26/01/2022--%>
                    </div>
                </div>
                <br class="clear" />
                <%--New Work 26/01/2022--%>
                <div id="ShowFilter">
                    <div class="left" id="btnShowFilter" style="margin-bottom: 2px;display: none;">
                        <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                           Show Filter</span></a>
                        <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                           All Records</span></a>
                    </div>
                </div>
                <%--End of New Work 26/01/2022--%>
                <div id="dvExprt_Filter">
                    <div class="right" id="btnfilter" style="margin-bottom: 2px">
                        <asp:DropDownList ID="ddlExport" runat="server" Onchange="ddlExport_OnChange()">
                            <asp:ListItem Value="E" Selected="True">Export</asp:ListItem>
                            <asp:ListItem Value="X">Excel</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="left">
                    </div>
                </div>
                <br class="clear" />
                <%--New Work 26/01/2022--%>
                <%--<div id="dvGvw">
                    <dxwgv:ASPxGridView ID="GridFXRate" KeyFieldName="Date" Width="100%" runat="Server"
                        AutoGenerateColumns="False" ClientInstanceName="cGridFXRate" OnCustomCallback="GridFXRate_CustomCallback">
                        <ClientSideEvents EndCallback="function(s, e) {GridFXRate_EndCallBack();}" />
                        <Templates>
                            <TitlePanel>
                                <div style="width: 100%">
                                </div>
                            </TitlePanel>
                            <EditForm>
                            </EditForm>
                        </Templates>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                        <Styles>
                            <Header CssClass="gridheader" ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <FocusedGroupRow CssClass="gridselectrow">
                            </FocusedGroupRow>
                            <FocusedRow CssClass="gridselectrow" BackColor="#FCA977">
                            </FocusedRow>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" />
                        <SettingsText PopupEditFormCaption="Add/Update FX-Rate" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Srl No" VisibleIndex="0" Width="5%">
                                <DataItemTemplate>
                                    <%# Container.ItemIndex+1%>
                                </DataItemTemplate>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataDateColumn FieldName="Date" Width="15%" Caption="Rate Date" VisibleIndex="1">
                                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                                </PropertiesDateEdit>
                                <EditFormSettings Visible="False"></EditFormSettings>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                            
                            <dxwgv:GridViewDataTextColumn FieldName="FromCurrencyID" VisibleIndex="2" Visible="False">
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn FieldName="ToCurrencyID" VisibleIndex="3" Visible="False">
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="From Currency" FieldName="From_Currency" VisibleIndex="4"
                                Width="15%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="To Currency" FieldName="To_Currency" VisibleIndex="5"
                                Width="15%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="Fx Rate" FieldName="FXRate_Rate" VisibleIndex="6"
                                Width="12%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Right" />
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="Type" FieldName="Type" VisibleIndex="7" Width="7%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Status" VisibleIndex="8"
                                Width="7%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="Create User" FieldName="Create_User" VisibleIndex="9"
                                Width="15%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="Action" VisibleIndex="10">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnEditButtonClick('<%#Convert.ToDateTime(Eval("Date"))%>','<%#Eval("FromCurrencyID")%>','<%#Eval("ToCurrencyID")%>','<%#Eval("FXRate_Rate") %>')">
                                        Edit</a>&nbsp;&nbsp; <a href="javascript:void(0);" onclick="onBtnDeleteClick('<%#Convert.ToDateTime(Eval("Date"))%>','<%#Eval("FromCurrencyID")%>','<%#Eval("ToCurrencyID")%>')">
                                            Delete</a>
                                </DataItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle ForeColor="White">
                                    <HoverStyle BackColor="#000040">
                                    </HoverStyle>
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="OnAddNewButtonClick()"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                </HeaderTemplate>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                        <SettingsText EmptyDataRow="No Data To Display" />
                    </dxwgv:ASPxGridView>
                </div>
                <br class="clear" />--%>
                
                <div>
                    <dxwgv:ASPxGridView ID="GridFXRate" runat="server" AutoGenerateColumns="False" KeyFieldName="Date" Width="100%" 
                            ClientInstanceName="cGridFXRate" OnCustomCallback="GridFXRate_CustomCallback">
                        <ClientSideEvents EndCallback="function(s, e) {GridFXRate_EndCallBack();}" />
                            <Templates>
                                <EditForm>
                                </EditForm>
                            </Templates>
                            <Settings ShowGroupPanel="false" />
                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Srl No" VisibleIndex="0" Width="5%">
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                    <DataItemTemplate>
                                        <%# Container.ItemIndex+1%>
                                    </DataItemTemplate>
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataDateColumn FieldName="Date" Caption="Rate Date" Width="15%" VisibleIndex="1">
                                    <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                                    </PropertiesDateEdit>
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataDateColumn>
                                                                
                                <dxwgv:GridViewDataTextColumn FieldName="From_Currency" Caption="From Currency" Width="15%" VisibleIndex="2">
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="To_Currency" Caption="To Currency" Width="15%" VisibleIndex="3">
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="FXRate_Rate" Caption="Fx Rate" Width="12%" VisibleIndex="4">
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="Right" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn Caption="Type" FieldName="Type" VisibleIndex="5" Width="7%">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Status" VisibleIndex="6" Width="7%">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="Create_User" Caption="Create User" Width="15%" VisibleIndex="7">
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn VisibleIndex="8" Width="10%">
                                    <%--<EditButton Visible="false"></EditButton>
                                    <DeleteButton Visible="True"></DeleteButton>--%>
                                    
                                    <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnEditButtonClick('<%#Convert.ToDateTime(Eval("Date"))%>','<%#Eval("FromCurrencyID")%>','<%#Eval("ToCurrencyID")%>','<%#Eval("FXRate_Rate") %>')">
                                        Edit</a>&nbsp;&nbsp; <a href="javascript:void(0);" onclick="onBtnDeleteClick('<%#Convert.ToDateTime(Eval("Date"))%>','<%#Eval("FromCurrencyID")%>','<%#Eval("ToCurrencyID")%>')">
                                            Delete</a>
                                </DataItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddNewButtonClick('Add')"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="FromCurrencyID" VisibleIndex="9" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="ToCurrencyID" VisibleIndex="10" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <Settings ShowGroupPanel="False" ShowStatusBar="Visible" ShowFilterRow="False"/>
                            <Styles>
                                <Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="gridheader">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <FocusedGroupRow CssClass="gridselectrow">
                                </FocusedGroupRow>
                                <FocusedRow CssClass="gridselectrow">
                                </FocusedRow>
                            </Styles>
                            <SettingsPager NumericButtonCount="20" PageSize="10" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <Settings ShowHorizontalScrollBar="true" />
                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px"
                                EditFormColumnCount="1" />
                            <SettingsText PopupEditFormCaption="Add/Modify " ConfirmDelete="Are you sure to Delete this Record!" />
                        </dxwgv:ASPxGridView>
                </div>
                <%--End of New Work 26/01/2022--%>
                <%--New Work 26/01/2022--%>
                <%--<div id="dvPopup">
                    <dxpc:ASPxPopupControl ID="PopUp_FXRate" runat="server" ClientInstanceName="cPopUp_FXRate"
                        HeaderText="Add/Update FX-Rate" Left="250" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="TopSides"
                        ShowSizeGrip="False" Top="100" Width="700px" CloseAction="CloseButton" Modal="True">
                        <ContentCollection>
                            <dxpc:PopupControlContentControl runat="server">
                                <div style="width: 100%">--%>
                                <%--End of New Work 26/01/2022--%>
                                    <%--New Work--%>
                                    <%--New Work 26/01/2022--%>
                                   <%-- <div class="left" style="width: 49%">
                                        <div class="frmpopupleftCont" style="width: 100px">
                                            From currency :
                                        </div>
                                        <div class="left" style="margin-top: 2px">--%>
                                        <%--End of New Work 26/01/2022--%>
                                        <%--CallbackPageSize="10"--%>
                                            <%--New Work 26/01/2022--%>
                                            <%--<dxe:ASPxComboBox ID="CmbAddFromCurrency" runat="server" ClientInstanceName="cCmbAddFromCurrency"
                                                DropDownStyle="DropDown" BackColor="White" Font-Bold="False" ForeColor="Black"
                                                Font-Size="10px" ValueType="System.Int32" Width="180px"
                                                EnableIncrementalFiltering="true" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                                OnCallback="CmbAddFromCurrency_Callback">
                                                <ClientSideEvents ValueChanged="function(s,e){
                                                                                    OnCmbAddFromCurrency_ValueChange()
                                                                                    }" EndCallback="CmbAddFromCurrency_EndCallback">
                                                </ClientSideEvents>
                                            </dxe:ASPxComboBox>
                                        </div>
                                    </div>--%>
                                    <%--End of New Work 26/01/2022--%>
                                    <%--End of New Work--%>
                                    <%--New Work 26/01/2022--%>
                                    <%--<div class="right" style="width: 49%">
                                        <div class="frmpopupleftCont" style="width: 100px">
                                            To Currency :
                                        </div>
                                        <div class="left" style="margin-top: 2px">--%>
                                        <%--End of New Work 26/01/2022--%>
                                        <%--CallbackPageSize="10"--%>
                                            <%--New Work 26/01/2022--%>
                                            <%--<dxe:ASPxComboBox ID="CmbAddToCurrency" runat="server" ClientInstanceName="cCmbAddToCurrency"
                                                DropDownStyle="DropDown" BackColor="White" Font-Bold="False" ForeColor="Black"
                                                Font-Size="10px" ValueType="System.Int32" Width="180px"
                                                EnableIncrementalFiltering="true" EnableCallbackMode="True" EnableSynchronization="True" OnCallback="CmbAddToCurrency_Callback">
                                                <ClientSideEvents EndCallback="CmbAddToCurrency_EndCallback"></ClientSideEvents>
                                            </dxe:ASPxComboBox>
                                        </div>
                                    </div>--%>
                                    <%--End of New Work 26/01/2022--%>
                                    <%--New Work--%>
                                    <%--<div class="left" style="width: 49%">
                                        <div class="frmpopupleftCont" style="width: 100px">
                                            From currency :
                                        </div>
                                        <div class="left" style="margin-top: 2px">
                                            <dxe:ASPxComboBox ID="CmbAddFromCurrency" runat="server" ClientInstanceName="cCmbAddFromCurrency"
                                                DropDownStyle="DropDown" BackColor="White" Font-Bold="False" ForeColor="Black"
                                                Font-Size="10px" ValueType="System.Int32" Width="180px" CallbackPageSize="10"
                                                EnableIncrementalFiltering="true" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                                OnCallback="CmbAddFromCurrency_Callback">
                                                <ClientSideEvents ValueChanged="function(s,e){
                                                                                    OnCmbAddFromCurrency_ValueChange()
                                                                                    }" EndCallback="CmbAddFromCurrency_EndCallback">
                                                </ClientSideEvents>
                                            </dxe:ASPxComboBox>
                                        </div>
                                    </div>--%>
                                    <%--End of New Work--%>
                                <%--New Work 26/01/2022--%>
                                <%--</div>
                                <span class="clear"></span>
                                <div>--%>
                                <%--End of New Work 26/01/2022--%>
                                    <%--New Work--%>
                                    <%--New Work 26/01/2022--%>
                                    <%--<div class="left" style="width: 49%">
                                        <div class="frmpopupleftCont" style="width: 172px">
                                            Rate Date :
                                        </div>
                                        <div class="left" style="margin-top: 2px">
                                            <dxe:ASPxDateEdit ID="DtAddRateDate" runat="server" Width="108px" ClientInstanceName="cDtAddRateDate"
                                                EditFormatString="dd-MM-yyyy" EditFormat="Custom" DateOnError="Today" UseMaskBehavior="True">
                                                <ButtonStyle Width="13px">
                                                </ButtonStyle>
                                            </dxe:ASPxDateEdit>
                                        </div>
                                    </div>--%>
                                    <%--End of New Work 26/01/2022--%>
                                    <%--End of New Work--%>
                                    <%--New Work 26/01/2022--%>
                                    <%--<div class="right" style="width: 49%">
                                        <div class="frmpopupleftCont" style="width: 100px">
                                            FX Rate :
                                        </div>
                                        <div class="left" style="margin-top: 2px">
                                            <asp:TextBox ID="txtAddFXRate" runat="server" Width="180px"></asp:TextBox>
                                        </div>
                                    </div>--%>
                                    <%--End of New Work 26/01/2022--%>
                                    <%--New Work--%>
                                    <%--<div class="left" style="width: 49%">
                                        <div class="frmpopupleftCont" style="width: 172px">
                                            Rate Date :
                                        </div>
                                        <div class="left" style="margin-top: 2px">
                                            <dxe:ASPxDateEdit ID="DtAddRateDate" runat="server" Width="108px" ClientInstanceName="cDtAddRateDate"
                                                EditFormatString="dd-MM-yyyy" EditFormat="Custom" DateOnError="Today" UseMaskBehavior="True">
                                                <ButtonStyle Width="13px">
                                                </ButtonStyle>
                                            </dxe:ASPxDateEdit>
                                        </div>
                                    </div>--%>
                                    <%--End of New Work--%>
                                <%--New Work 26/01/2022--%>
                                <%--</div>
                                <span class="clear"></span>
                                <div style="padding-top: 6px; margin-right: 17px; width: 200px;" class="right">--%>
                                <%--End of New Work 26/01/2022--%>
                                    <%--New Work--%>
                                    <%--New Work 26/01/2022--%>
                                    <%--<div class="left">
                                        <div class="left">
                                            <dxe:ASPxButton ID="btnAdd" runat="server" AutoPostBack="False" ClientInstanceName="cbtnAdd"
                                                Text="Add" Width="98px">
                                                <ClientSideEvents Click="function(s,e){btnAddButtonClick();}" />
                                            </dxe:ASPxButton>
                                            <dxe:ASPxButton ID="btnUpdate" runat="server" AutoPostBack="False" ClientInstanceName="cbtnUpdate"
                                                Text="Update" Width="98px">
                                                <ClientSideEvents Click="function(s,e){btnUpdateButtonClick();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                    </div>--%>
                                    <%--End of New Work 26/01/2022--%>
                                    <%--End of New Work--%>
                                    <%--New Work 26/01/2022--%>
                                    <%--<div class="right" style="vertical-align: bottom">
                                        <dxe:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" ClientInstanceName="cbtnCancel"
                                            Text="Cancel" Width="98px">
                                            <ClientSideEvents Click="function(s,e){btnCancelButtonClick();}" />
                                        </dxe:ASPxButton>
                                    </div>--%>
                                    <%--End of New Work 26/01/2022--%>
                                    <%--New Work--%>
                                    <%--<div class="left">
                                        <div class="left">
                                            <dxe:ASPxButton ID="btnAdd" runat="server" AutoPostBack="False" ClientInstanceName="cbtnAdd"
                                                Text="Add" Width="98px">
                                                <ClientSideEvents Click="function(s,e){btnAddButtonClick();}" />
                                            </dxe:ASPxButton>
                                            <dxe:ASPxButton ID="btnUpdate" runat="server" AutoPostBack="False" ClientInstanceName="cbtnUpdate"
                                                Text="Update" Width="98px">
                                                <ClientSideEvents Click="function(s,e){btnUpdateButtonClick();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                    </div>--%>
                                    <%--End of New Work--%>
                                <%--New Work 26/01/2022--%>
                               <%-- </div>
                            </dxpc:PopupControlContentControl>
                        </ContentCollection>
                        <HeaderStyle BackColor="LightGray" ForeColor="Black" />
                    </dxpc:ASPxPopupControl>
                </div>--%>
                <%--End of New Work 26/01/2022--%>
                <br />
                <div id="dvCnfPopup">
                    <dxpc:ASPxPopupControl ID="DeleteConfirmPopUp" runat="server" ClientInstanceName="cDeleteConfirmPopUp"
                        HeaderText="Confirm" Left="100" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                        ShowSizeGrip="False" Top="100" Width="387px" CloseAction="None" Modal="True">
                        <ContentCollection>
                            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                <div style="margin-bottom: 3px">
                                    Are You Sure.You Want To Delete This Record.
                                </div>
                                <div>
                                    <div class="left">
                                        <dxe:ASPxButton ID="btnDeleteOK" runat="server" AutoPostBack="False" Height="6px"
                                            Text="OK" Width="122px">
                                            <ClientSideEvents Click="function (s, e) { btnDeleteOKClick(); cDeleteConfirmPopUp.Hide(); }" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div class="left" style="margin-left: 5px">
                                        <dxe:ASPxButton ID="btnDeleteCancel" runat="server" AutoPostBack="False" Text="Cancel"
                                            Width="120px">
                                            <ClientSideEvents Click="function (s, e) {cDeleteConfirmPopUp.Hide();}" />
                                        </dxe:ASPxButton>
                                    </div>
                                </div>
                            </dxpc:PopupControlContentControl>
                        </ContentCollection>
                    </dxpc:ASPxPopupControl>
                </div>
                <div style="display: none">
                    <asp:HiddenField ID="hdnDPSessionValue" runat="server" />
                    <asp:Button ID="btnExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                        OnClick="btnExport_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
