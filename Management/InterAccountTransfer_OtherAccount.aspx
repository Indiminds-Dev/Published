
<%@ page language="C#" autoeventwireup="true" inherits="management_InterAccountTransfer_OtherAccount, App_Web_yxggcryg" culture="auto" uiculture="auto" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Journal</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

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
		position:absolute ;
		z-index:5;
	}
	
	form{
		display:inline;
	}
	


	</style>

    <script language="javascript" type="text/javascript">
        function SignOff()
        {
         window.parent.SignOff();
        }
        var isCtrl = false;
        document.onkeyup=function(e)
        {
	        if(event.keyCode == 17) 
	        {
	            isCtrl=false;
	        }
	        if(event.keyCode == 27)
	        {
	            btnCancel_Click();
	        }
        }
     
        function height()
        {
            if(document.body.scrollHeight>=500)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '500px';
            window.frameElement.Width = document.body.scrollWidth;
        }     
        function CallList(obj1,obj2,obj3)
         {
            ajax_showOptions(obj1,obj2,obj3);    
         }  
         function btnCancel_Click()
         {
            var answer = confirm ("Do you Want To Close This Window?");
            if (answer)
                parent.editwin.close();
         }
         function Page_Load()
         {
            document.getElementById("btnSave").disabled=true;
            document.getElementById("btnInsert").disabled=true;
         }
         function Button_Click()
         {
            document.getElementById("btnSave").disabled=false;
            document.getElementById("btnInsert").disabled=false;
         }

         function DateChange()
         {
            
                if(cComboMode.GetValue()!=1)
                {
                    var SelectedDate = new Date(tDate.GetDate());
                    var monthnumber = SelectedDate.getMonth();
                    var monthday    = SelectedDate.getDate();
                    var year        = SelectedDate.getYear();
                    
                    var SelectedDateValue=new Date(year, monthnumber, monthday);
                    ///Checking of Transaction Date For MaxLockDate
                    var MaxLockDate=new Date('<%=Session["LCKJV"]%>');
                    monthnumber = MaxLockDate.getMonth();
                    monthday    = MaxLockDate.getDate();
                    year        = MaxLockDate.getYear();
                    var MaxLockDateNumeric=new Date(year, monthnumber, monthday).getTime();
                    if(SelectedDateValue<=MaxLockDateNumeric)
                    {
                        alert('This Entry Date has been Locked.');
                        MaxLockDate.setDate(MaxLockDate.getDate() + 1);
                        tDate.SetDate(MaxLockDate);
                        return;
                    }
                }
                
                var FYS ="<%=Session["FinYearStart"]%>";
                var FYE ="<%=Session["FinYearEnd"]%>"; 
                var LFY ="<%=Session["LastFinYear"]%>";
                var SelectedDate = new Date(tDate.GetDate());
                var FinYearStartDate = new Date(FYS);
                var FinYearEndDate = new Date(FYE);
                var LastFinYearDate=new Date(LFY);
                
                var monthnumber = SelectedDate.getMonth();
                var monthday    = SelectedDate.getDate();
                var year        = SelectedDate.getYear();
                
                var SelectedDateValue=new Date(year, monthnumber, monthday);
                
                monthnumber = FinYearStartDate.getMonth();
                monthday    = FinYearStartDate.getDate();
                year        = FinYearStartDate.getYear();
                var FinYearStartDateValue=new Date(year, monthnumber, monthday);
                
              
                monthnumber = FinYearEndDate.getMonth();
                monthday    = FinYearEndDate.getDate();
                year        = FinYearEndDate.getYear();
                var FinYearEndDateValue=new Date(year, monthnumber, monthday);
           
                var SelectedDateNumericValue=SelectedDateValue.getTime();
                var FinYearStartDateNumericValue=FinYearStartDateValue.getTime();
                var FinYearEndDatNumbericValue=FinYearEndDateValue.getTime();
                if(SelectedDateNumericValue>=FinYearStartDateNumericValue && SelectedDateNumericValue<=FinYearEndDatNumbericValue)
                {
                }
                else
                {
                   alert('Enter Date Is Outside Of Financial Year !!');
                   if(SelectedDateNumericValue<FinYearStartDateNumericValue)
                   {
                        tDate.SetDate(new Date(FinYearStartDate));
                   }
                   if(SelectedDateNumericValue>FinYearEndDatNumbericValue)
                   {
                        tDate.SetDate(new Date(FinYearEndDate));
                   }
                }
           
                
          }
          function btnInsert_Click()
          {
               document.getElementById('Div1').style.display='inline';
               document.getElementById('btnInsert').disabled=true;
               document.getElementById('btnSave').click();
          }
          function AlertAfterInsert()
            {
                var answer = confirm ("Do You Want To Print this page??");
                if (answer)
                {
                   document.getElementById('btnPrint').click();
                } 
            }
            function OnlyNarration(obj1,obj2,obj3)
             {
                ajax_showOptions(obj1,obj2,obj3);    
             }
         FieldName='txtPrefix';
         function AddButtonClick()
         {
            cDetailsGrid.PerformCallback('Add');
         }
         function CancelButtonClick()
         {
            Asp_SetSpace('txtMainAccount');
            Asp_SetSpace('txtSubAccount');
            Asp_SetSpace('txtMainTAccount');
            ctxtTAmount.SetText('0000000000.00');
            Asp_SetSpace('txtSubTAccount');
            document.getElementById('CbpAcBalance').innerHTML = '';
            document.getElementById('CbpAcBalanceT').innerHTML = '';
            document.getElementById('txtMainAccount').focus();
         }
         function SaveButtonClick()
         {
            if(cDetailsGrid.GetVisibleRowsOnPage() != '0' )
            {
               cDetailsGrid.PerformCallback('Save');
            }
            else
            {
                alert('Please Add Atleast Single Record First');
                document.getElementById('txtMainAccount').focus();
            }
            
         }
         function DiscardButtonClick()
         {
           var data='Are You Sure.It will Discard All Data You Entered';
           var answer = confirm(data)
	       if (answer)
	       {
             cDetailsGrid.PerformCallback('Discard');
           }
         }
         function RefreshButtonClick()
         {
            var data='Back To Initial Position?';
            var answer = confirm(data)
            if (answer)
            {
             if(cDetailsGrid.GetVisibleRowsOnPage() != '0' )
             {   
              cDetailsGrid.PerformCallback('DiscardOnRefresh');
             }
             ctxtTAmount.SetText('0000000000.00');
            document.getElementById('txtSubTAccount').value='';
            document.getElementById('txtSubAccount').value='';
            document.getElementById('txtMainTAccount').value='';
            document.getElementById('txtMainAccount').value='';
            document.getElementById('txtMainAccount').focus();
            document.getElementById('CbpAcBalance').innerHTML = '';
            document.getElementById('CbpAcBalanceT').innerHTML = '';
             document.getElementById('txtNarration').value='';
             document.getElementById('txtBillNo').value='';
             var ddlBranch = document.getElementById("<%=ddlBranch.ClientID%>");
             ddlBranch.options[0].selected=true;
            
            }
            
         }
    
         function EntryButtonClick()
         {
         
             TblMainEntryForm.style.display="inline";
             tdEntryButton.style.display="none";
             document.getElementById('txtMainAccount').focus();
             cDetailsGrid.PerformCallback('Entry');
         }
      
         function Asp_SetSpace(obj)
         {
            document.getElementById(obj).value='';
         }
    
   function CallMainAccount(obj1,obj2,obj3)
        {
           document.getElementById('hdnMainACFlag').value='SOURCE';
           var strQuery_Table = "Master_MainAccount";
           var strQuery_FieldName = " top 10 MainAccount_Name+\' [ \'+rtrim(ltrim(MainAccount_AccountCode))+\' ]\' as MainAccount_Name1,cast(MainAccount_ReferenceID as varchar)+\'~\'+MainAccount_SubLedgerType+\'~MAINAC~\'+MainAccount_AccountType as MainAccount_ReferenceID";
           var strQuery_WhereClause = " (MainAccount_Name like (\'%RequestLetter%\') or MainAccount_AccountCode like (\'%RequestLetter%\')) and isnull(MainAccount_BankCashType,'abc') not in('Cash','Bank')and MainAccount_SubLedgerType <>'Customers' and MainAccount_SubLedgerType <>'NSDL Clients' and MainAccount_SubLedgerType <>'CDSL Clients'";
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
           ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main'); 

        }
       function CallMainAccountTarget(obj1,obj2,obj3)
        {
            document.getElementById('hdnMainACFlag').value='TARGET';
           var strQuery_Table = "Master_MainAccount";
           var strQuery_FieldName = " top 10 MainAccount_Name+\' [ \'+rtrim(ltrim(MainAccount_AccountCode))+\' ]\' as MainAccount_Name1,cast(MainAccount_ReferenceID as varchar)+\'~\'+MainAccount_SubLedgerType+\'~MAINAC~\'+MainAccount_AccountType as MainAccount_ReferenceID";
           var strQuery_WhereClause = " (MainAccount_Name like (\'%RequestLetter%\') or MainAccount_AccountCode like (\'%RequestLetter%\')) and isnull(MainAccount_BankCashType,'abc') not in('Cash','Bank')and MainAccount_SubLedgerType <>'Customers' and MainAccount_SubLedgerType <>'NSDL Clients' and MainAccount_SubLedgerType <>'CDSL Clients'";
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
           ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main'); 

        }
        
        function CallSubAccount(obj1,obj2,obj3)
        {
           document.getElementById('hdnSubACFlag').value='SOURCE';
           var MainAccountCode=document.getElementById("txtMainAccount_hidden").value;
           var SegID=document.getElementById("hdn_SegID_SegmentName").value.split('~')[0];
           var SegmentName=document.getElementById("hdn_SegID_SegmentName").value.split('~')[1];
           var ProcedureName = "SubAccountSelect_New";
           var InputName = "CashBank_MainAccountID#clause#branch#exchSegment#SegmentN";
           var InputType = "V#V#V#V#V";
           var InputValue = MainAccountCode.split('~')[0]+"#RequestLetter#"+'<%=Session["userbranchHierarchy"] %>'+"#'"+'<%=Session["ExchangeSegmentID"] %>'+"'#'"+SegmentName+"'";
           var SplitChar="#";
           var CombinedQuery=ProcedureName+"$"+InputName+"$"+InputType+"$"+InputValue+"$"+SplitChar;
           ajax_showOptions(obj1,obj2,obj3,CombinedQuery,'Main');
        }
        
        function CallSubAccountTarget(obj1,obj2,obj3)
        {
           document.getElementById('hdnSubACFlag').value='TARGET';
           var MainAccountCode=document.getElementById("txtMainTAccount_hidden").value;
           var SegID=document.getElementById("hdn_SegID_SegmentName").value.split('~')[0];
           var SegmentName=document.getElementById("hdn_SegID_SegmentName").value.split('~')[1];
           var ProcedureName = "SubAccountSelect_New";
           var InputName = "CashBank_MainAccountID#clause#branch#exchSegment#SegmentN";
           var InputType = "V#V#V#V#V";
           var InputValue = MainAccountCode.split('~')[0]+"#RequestLetter#"+'<%=Session["userbranchHierarchy"] %>'+"#'"+'<%=Session["ExchangeSegmentID"] %>'+"'#'"+SegmentName+"'";
           var SplitChar="#";
           var CombinedQuery=ProcedureName+"$"+InputName+"$"+InputType+"$"+InputValue+"$"+SplitChar;
           ajax_showOptions(obj1,obj2,obj3,CombinedQuery,'Main');
        }
        function replaceChars(entry) 
        {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out)>-1)
             {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
            
        }
          function CbpAcBalance_EndCallBack()
         {
            var strUndefined=new String(cCbpAcBalance.cpAcBalance);
            if(strUndefined != "undefined")
            {
                document.getElementById('<%=B_AcBalance.ClientID %>').innerHTML = strUndefined.split('~')[0];
                document.getElementById('<%=B_AcBalance.ClientID %>').style.color = strUndefined.split('~')[1];
                ctxtTAmount.SetText(strUndefined.split('~')[0]);
                 var Amount=strUndefined.split('~')[0]
                if (Amount==0.00)
                {
                    alert('Can not Transfer 0 balance');
                }
            }
         }
          function CbpAcBalanceT_EndCallBack()
         {
            var strUndefinedT=new String(cCbpAcBalanceT.cpAcBalanceT);
            if(strUndefinedT != "undefined")
            {
                document.getElementById('<%=B_AcBalanceT.ClientID %>').innerHTML = strUndefinedT.split('~')[0];
                document.getElementById('<%=B_AcBalanceT.ClientID %>').style.color = strUndefinedT.split('~')[1];
            }
         }
         
         
        function keyVal(obj)
         {
            var spObj=obj.split('~');
            var WhichQuery=spObj[2];

            if(WhichQuery=='MAINAC')
            {
                    val=spObj[0];
                    val1=spObj[0];
                    valLedgerType=spObj[1];                
         
                    if(valLedgerType.toUpperCase()=='NONE')
                    {
                        document.getElementById('hdn_MainAcc_Type').value='None';
                        document.getElementById('hdn_Brch_NonBrch').value='NAB';
                       
                         if(document.getElementById('hdnMainACFlag').value=='SOURCE')
                        {
                             document.getElementById("txtMainAccount_hidden").value=val;
                             document.getElementById('tdSubAccount').value='';
                             document.getElementById('tdSubAccount').style.display='none';
                             document.getElementById('tdlblSubAccount').style.display='none';
                             document.getElementById('txtSubAccount_hidden').value='';
                             cCbpAcBalance.PerformCallback('AcBalance~'+val+'~');
                        }
                        else
                        {
                              document.getElementById("txtMainTAccount_hidden").value=val1;
                              document.getElementById('tdSubAccountT').value='';
                              document.getElementById('tdSubAccountT').style.display='none';
                              document.getElementById('tdlblSubAccountT').style.display='none';
                              document.getElementById('txtSubTAccount_hidden').value='';
                              cCbpAcBalanceT.PerformCallback('AcBalance~'+val1+'~');
                        }
                    }
                    else
                    {
                         if(document.getElementById('hdnMainACFlag').value=='SOURCE')
                        {
                        document.getElementById('tdSubAccount').style.display='inline';
                        document.getElementById('tdlblSubAccount').style.display='inline';
                        }
                        else
                        {
                        document.getElementById('tdSubAccountT').style.display='inline';
                        document.getElementById('tdlblSubAccountT').style.display='inline';
                        }
                        document.getElementById('hdn_MainAcc_Type').value='NotNone';
                    }
              
            }
            else 
            {
                    var Branch=spObj[1];
                    var SubAc=spObj[0];
                    document.getElementById('hdn_Brch_NonBrch').value=Branch;
                  if(document.getElementById('hdnSubACFlag').value=='SOURCE')
                    {
                   
                        cCbpAcBalance.PerformCallback('AcBalance~'+val+'~'+SubAc);
                    }
                 else
                    {
                    
                         cCbpAcBalanceT.PerformCallback('AcBalance~'+val+'~'+SubAc);
                    }
            }
                
         }
  function SubAccountCheck()
         {
         var Amt=ctxtTAmount.GetText();
         if (Amt=='0.00')
         {
            alert('Please enter the Transfered Amount');
         }
         else
         {
            var SMainAcc= document.getElementById("txtMainAccount_hidden").value;
            var STargetMainAcc= document.getElementById("txtMainTAccount_hidden").value;
            var SSubAcc= document.getElementById("txtSubAccount_hidden").value;
            var STargetSubAcc= document.getElementById("txtSubTAccount_hidden").value;
            var SubAccountBranch=document.getElementById('hdn_Brch_NonBrch').value;
             tdadd.style.display='none'
             tdnew.style.display='inline'
            
             if(SMainAcc==STargetMainAcc && SSubAcc==STargetSubAcc)
             {
               alert('Amount Can not be transfer Between Same Accounts'); 
             }
             else
             {
                             
                cDetailsGrid.PerformCallback('Add~'+SubAccountBranch);
             }
             height();
             document.getElementById('btnnew').focus();
           }
         }
function NewButtonClick()
         {
            tdadd.style.display='inline'
            tdnew.style.display='none'
            ctxtTAmount.SetText('0000000000.00');
            document.getElementById('txtSubTAccount').value='';
            document.getElementById('txtSubAccount').value='';
            document.getElementById('txtMainTAccount').value='';
            document.getElementById('txtMainAccount').value='';
            document.getElementById('txtMainAccount').focus();
            document.getElementById('CbpAcBalance').innerHTML = '';
            document.getElementById('CbpAcBalanceT').innerHTML = '';
          }
   function DetailsGrid_EndCallback()
         {
         strUndefined=new String(cDetailsGrid.cpSaveSuccessOrFail);
            if(strUndefined != "undefined")
            {
                strUndefined=new String(cDetailsGrid.cpSaveSuccessOrFail);
                if(strUndefined=="Problem")
                {
                    alert("There is Some Problem. Sry for InConvenience");
                    cDetailsGrid.cpSaveSuccessOrFail="undefined";
                }
                else if(strUndefined=="Success")
                {
                    NewButtonClick();
                    alert("Records Successfully Saved");
                   
                }
               
            } 
         
         }

    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="javascript:document.form1.tDate.focus();setInterval('blinkIt()',500)">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            </asp:ScriptManager>
            <table class="TableMain100" style="width: 99%">
                <tr>
                    <td>
                        <table class="TableMain100" width="100%">
                            <tr>
                                <td class="EHEADER" colspan="2" style="height: 20px; text-align: center">
                                    <strong><span id="SpanHeader" style="color: #000099">Inter Account Transfer(Other Account)</span></strong>&nbsp;
                                </td>
                            </tr>
                        </table>
                        <table>
                         
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="TableMain100" style="width: 100%; height: 72px;" border="1">
                            <tr>
                                <td style="width: 52px; height: 11px; background-color: #b7ceec" valign="top">
                                    TranDate</td>
                                <td style="width: 45px; height: 11px; background-color: #b7ceec" valign="top">
                                    Branch</td>
                                <td colspan="6" style="height: 11px; background-color: #b7ceec" valign="top">
                                    Main Narration</td>
                            </tr>
                            <tr>
                                <td style="width: 63px; height: 11px;" valign="top">
                                    <dxe:ASPxDateEdit ID="tDate" runat="server" EditFormat="Custom" ClientInstanceName="tDate"
                                        UseMaskBehavior="True" Font-Size="13px" Width="157px">
                                        <ClientSideEvents DateChanged="function(s,e){DateChange()}" />
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td style="width: 119px; height: 11px;" valign="top">
                                    <asp:DropDownList ID="ddlBranch" runat="server" DataSourceID="dsBranch"
                                        DataTextField="BANKBRANCH_NAME" DataValueField="BANKBRANCH_ID" Width="204px"
                                        Font-Size="13px">
                                    </asp:DropDownList></td>
                                <td colspan="6" valign="top">
                                    <asp:TextBox ID="txtNarration" Font-Names="Arial" runat="server" TextMode="MultiLine" 
                                     onkeyup="OnlyNarration(this,'Narration',event)" Width="347px"></asp:TextBox></td>
                                   
                            </tr>
                            <tr>
                                <td style="background-color: #b7ceec;" valign="top">
                                    Bill No</td>
                                <td valign="top">
                                    <asp:TextBox ID="txtBillNo" runat="server" Width="149px" Font-Size="13px"></asp:TextBox></td>
                              
                              <td  style="text-align: right; width: 40%;" valign="bottom" id="tdEntryButton">
                                    <dxe:ASPxButton ID="abtnEntry" runat="server" AccessKey="E" AutoPostBack="False" Text="[E]ntry" Width="76px">
                                        <ClientSideEvents Click="function(s, e) {EntryButtonClick();}" />
                                    </dxe:ASPxButton>
                              
                            </tr>
                        </table>
                        <table style="width: 100%;display:none" id="TblMainEntryForm" border="1">
                            <tr>
                                <td  colspan=3 style="font-weight: bold;text-align: Center; background-color: #b7ceec; color:#000099" >
                                    Source Account</td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold; text-align: left; text-decoration: underline; background-color: #b7ceec; width: 134px;" >
                                    Main Account</td>
                                <td id="tdlblSubAccount" style="font-weight: bold; text-align: left; text-decoration: underline; background-color: #b7ceec; width: 54px;" >
                                    SubAccount</td>
                               
                                     <td style="font-weight: bold; text-align: left; text-decoration: underline; background-color: #b7ceec;" >
                                    Account Balance</td>
                               
                            </tr>
                            
                            
                            <tr>
                                <td style="width: 134px" >
                                    <asp:TextBox ID="txtMainAccount" runat="server" Width="200px" onkeyup="CallMainAccount(this,'GenericAjaxList',event)" onFocus="this.select()" Font-Size="13px"></asp:TextBox></td>
                                <td id="tdSubAccount" style="width: 54px">
                                    <asp:TextBox ID="txtSubAccount" runat="server" Width="200px" onkeyup="CallSubAccount(this,'GenericAjaxListSP',event)" onFocus="this.select()" Font-Size="13px"></asp:TextBox></td>
                             <td id="tdAcBalanceValue" style="width: 13%">
                                    <dxcp:ASPxCallbackPanel ID="CbpAcBalance" runat="server" ClientInstanceName="cCbpAcBalance" OnCallback="CbpAcBalance_Callback" BackColor="White">
                                        <PanelCollection>
                                            <dxp:panelcontent runat="server">
                                                <div style="width:100%;text-align:right;" >
                                                    <img src="../images/rupee.png" alt="abc" height="15px" width="15px"/>
                                                    <b style="text-align:right" id="B_AcBalance" runat="server"></b>
                                                </div>
                                            </dxp:panelcontent>
                                        </PanelCollection>
                                        <ClientSideEvents EndCallback="function(s, e) {CbpAcBalance_EndCallBack(); }" />
                                    </dxcp:ASPxCallbackPanel>
                </td>
                         
                            </tr>
                          
                          
                              <tr>
                                <td  colspan=3 style="font-weight: bold;text-align: Center; background-color: #b7ceec;color:#000099" >
                                    Target Account</td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold; text-align: left; text-decoration: underline; background-color: #b7ceec; width: 134px;" >
                                    Main Account</td>
                                <td id="tdlblSubAccountT" style="font-weight: bold; text-align: left; text-decoration: underline; background-color: #b7ceec; width: 54px;" >
                                    SubAccount</td>
                                      <td style="font-weight: bold; text-align: left; text-decoration: underline; background-color: #b7ceec;" >
                                    Account Balance</td>
                                <td style="font-weight: bold; text-align: left; text-decoration: underline; background-color: #b7ceec;" >
                                    Transfered Amount</td>
                                
                          
                            </tr>
                          
                          
                          
                             <tr>
                                <td style="width: 134px" >
                                    <asp:TextBox ID="txtMainTAccount" runat="server" Width="200px" onkeyup="CallMainAccountTarget(this,'GenericAjaxList',event)" onFocus="this.select()" Font-Size="13px" onblur="AcBalance1(this.id)"></asp:TextBox></td>
                                <td id="tdSubAccountT" style="width: 54px">
                                    <asp:TextBox ID="txtSubTAccount" runat="server" Width="200px" onkeyup="CallSubAccountTarget(this,'GenericAjaxListSP',event)" onFocus="this.select()" onblur="AcBalance(this.id)" Font-Size="13px"></asp:TextBox></td>
                                     <td id="tdAcBalanceValueT" style="width: 13%">
                                    <dxcp:ASPxCallbackPanel ID="CbpAcBalanceT" runat="server" ClientInstanceName="cCbpAcBalanceT" OnCallback="CbpAcBalanceT_Callback" BackColor="White">
                                        <PanelCollection>
                                            <dxp:panelcontent runat="server">
                                                <div style="width:100%;text-align:right;" id="DIV2" onclick="return DIV2_onclick()" >
                                                    <img src="../images/rupee.png" alt="abc" height="15" width="15"/>
                                                    <b style="text-align:right" id="B_AcBalanceT" runat="server"></b>
                                                </div>
                                            </dxp:panelcontent>
                                        </PanelCollection>
                                        <ClientSideEvents EndCallback="function(s, e) {CbpAcBalanceT_EndCallBack(); }" />
                                    </dxcp:ASPxCallbackPanel>
                </td>
                                <td >
                                 
                                    <dxe:ASPxTextBox ID="txtTAmount" runat="server" Width="140px" ClientInstanceName="ctxtTAmount" HorizontalAlign="Right" Font-Size="13px">
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;"  IncludeLiterals="DecimalSymbol" />
                                      <%--  <ClientSideEvents KeyUp="function(s,e){focusval(s.GetValue());}" />--%>
                                    </dxe:ASPxTextBox>
                                </td>
                               
                            </tr>
                          
                          
                          
                            <tr>
                                <td colspan="4" valign="top">
                                    <table style="float:left;">
                                        <tr>
                                            <td id="tdadd" style="width: 100px">
                                                <dxe:ASPxButton ID="btnadd" ClientInstanceName="cbtnadd" runat="server" AccessKey="L" AutoPostBack="False"
                                                    Text="Add Entry To [L]ist" Width="150px">
                                                    <ClientSideEvents Click="function(s, e) {SubAccountCheck();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td id="tdnew" style="width: 100px; height: 16px; display: none">
                                                <dxe:ASPxButton ID="btnnew" ClientInstanceName="cbtnnew" runat="server" AutoPostBack="False" Text="[N]ew Entry"
                                                    Width="150px" AccessKey="N" Font-Bold="False" Font-Underline="False" BackColor="Tan">
                                                    <ClientSideEvents Click="function(s, e) {NewButtonClick();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 100px">
                                                <dxe:ASPxButton ID="btnCancelEntry" runat="server" AccessKey="C" AutoPostBack="False" Text="[C]ancel Entry" Width="150px">
                                                    <ClientSideEvents Click="function(s, e) {CancelButtonClick();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 100px;" id="tdSaveButton" runat="Server">
                                                <dxe:ASPxButton ID="btnSaveRecords" ClientInstanceName="cbtnSaveRecords" runat="server" AccessKey="S" AutoPostBack="False" Text="[S]ave Entered Records" Width="150px">
                                                    <ClientSideEvents Click="function(s, e) {SaveButtonClick();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 100px">
                                                <dxe:ASPxButton ID="btnDiscardEntry" runat="server" AccessKey="D" AllowFocus="False"
                                                    AutoPostBack="False" Text="[D]iscard Entered Records" Width="150px">
                                                    <ClientSideEvents Click="function(s, e) {DiscardButtonClick();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 100px">
                                                <dxe:ASPxButton ID="btnUnsaveData" runat="server" AccessKey="R" AutoPostBack="False" Text="[R]efresh" Width="150px">
                                                    <ClientSideEvents Click="function(s, e) {RefreshButtonClick();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            
                                        </tr>
                                    </table>
                                    <div class="EHEADER" style="float:left; vertical-align: top; height: 1px; text-align: right" width="70%">
                                                <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="True" BackColor="Navy"
                                                    ClientInstanceName="exp" Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                                    SelectedIndex="0" ValueType="System.Int32" Width="130px">
                                                    <items>
                                <dxe:ListEditItem Value="0" Text="Select"></dxe:ListEditItem>
                                <dxe:ListEditItem Value="1" Text="XLS"></dxe:ListEditItem>
                                <dxe:ListEditItem Value="2" Text="CSV"></dxe:ListEditItem>
</items>
                                                    <clientsideevents selectedindexchanged="OncmbExportSelectedIndexChanged" />
                                                    <buttonstyle backcolor="#C0C0FF" forecolor="Black"></buttonstyle>
                                                    <itemstyle backcolor="Navy" forecolor="White">
<HoverStyle BackColor="#8080FF" ForeColor="White"></HoverStyle>
</itemstyle>
                                                    <border bordercolor="White" />
                                                    <dropdownbutton text="Export"></dropdownbutton>
                                                </dxe:ASPxComboBox>
                                       </div>
                                    
                                    </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="height: 16px" valign="top">
   
   <dxwgv:ASPxGridView ID="DetailsGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="cDetailsGrid"
                            KeyFieldName="CashReportID" Width="100%" OnCustomCallback="DetailsGrid_CustomCallback" 
                            OnRowDeleting="DetailsGrid_RowDeleting" 
                             Font-Size="10px">
                            <ClientSideEvents EndCallback="function(s, e) {DetailsGrid_EndCallback();}"></ClientSideEvents>
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True"></SettingsBehavior>
                            <Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedRow HorizontalAlign="Left" VerticalAlign="Top" CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<Footer CssClass="gridfooter"></Footer>
</Styles>
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" Mode="ShowAllRecords">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
                            
 <Columns>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="SourceMainAccount" Caption="Source Main Account">
<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="SourceSubAccount" Caption="Source Sub Account">
<CellStyle  CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="TargetMainAccount" Caption="Target Main Account">
<CellStyle  CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="TargetSubAccount" Caption="Target Sub Account">
<CellStyle  CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="Debit" Caption="Debit">
<CellStyle Wrap="False" HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="Credit" Caption="Credit">
<CellStyle Wrap="False" HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" FieldName="CashReportID"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="6">
<DeleteButton Visible="True"></DeleteButton>
<CellStyle ForeColor="White">
<HoverStyle BackColor="#000040"></HoverStyle>
</CellStyle>
</dxwgv:GridViewCommandColumn>
</Columns>
 <SettingsEditing Mode="EditForm" />

 </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td id='Div1' style="height: 20px; display:none">
                        <div  style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                    top: 50%; background-color: white; layer-background-color: white; height: 80;
                                    width: 150;'>
                                    <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                    </td>
                </tr>
              
            </table>
     
            <asp:SqlDataSource ID="dsCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                ConflictDetection="CompareAllValues" SelectCommand="select cmp_internalId,cmp_Name from tbl_master_company where cmp_internalId in(select exch_compId from tbl_master_companyExchange)">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsBranch" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                ConflictDetection="CompareAllValues" SelectCommand="SELECT BRANCH_id AS BANKBRANCH_ID , RTRIM(BRANCH_DESCRIPTION)+' ['+ISNULL(RTRIM(BRANCH_CODE),'')+']' AS BANKBRANCH_NAME  FROM TBL_MASTER_BRANCH">
            </asp:SqlDataSource>
             <table>
    <tr>
    <td style="display:none;">
         <asp:HiddenField ID="hdnDefaultBranch" runat="server" />
        <asp:HiddenField ID="hdnType" runat="server" />
        <asp:HiddenField ID="hdnAccountType" runat="server" />
        <asp:HiddenField ID="txtMainAccount_hidden" runat="server" />
        <asp:HiddenField ID="txtSubAccount_hidden" runat="server" />
          <asp:HiddenField ID="txtMainTAccount_hidden" runat="server" />
        <asp:HiddenField ID="txtSubTAccount_hidden" runat="server" />
        <asp:HiddenField ID="hdn_Brch_NonBrch" runat="server" />
        <asp:HiddenField ID="hdn_SubLedgerType" runat="server" />
        <asp:HiddenField ID="hdn_MainAcc_Type" runat="server" />
        <asp:HiddenField ID="hdn_SubAccountIDE" runat="server" />
        <asp:HiddenField ID="txtBankAccounts_hidden" runat="server" />
        <asp:HiddenField ID="hdn_Mode" runat="server" Value="Entry" />
        <asp:HiddenField ID="hdn_PayeeIDOnUpdate" runat="server" />
        <asp:HiddenField ID="hdn_Brch_NonBrchE" runat="server" />
        <asp:HiddenField ID="hdn_CurrentSegment" runat="server" />
        <asp:HiddenField ID="hdn_CashBankType_InstTypeE" runat="server" />
        <asp:HiddenField ID="hdn_SegID_SegmentName" runat="server" />
        <asp:HiddenField ID="hdn_EditVoucher_SegmentID_Name" runat="server" />
        <asp:HiddenField ID="hdn_OriginalTDate" runat="server" />
         <asp:HiddenField ID="hdnSegmentid" runat="server" />
         <asp:HiddenField ID="hdnCompanyid" runat="server" />
         <asp:HiddenField ID="hdnSubACFlag" runat="server" />
         <asp:HiddenField ID="hdnMainACFlag" runat="server" />
         </td>
         </tr>
         </table>
            <div style="display: none">
                <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                </dxwgv:ASPxGridViewExporter>
            </div>
        </div>
    </form>
</body>
</html>
