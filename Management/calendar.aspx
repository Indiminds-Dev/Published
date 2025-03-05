<%@ page language="C#" autoeventwireup="true" inherits="management_calendar, App_Web_njtlujlb" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    
    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
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
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>
    <style type="text/css">
       a:hover {background:#ffffff; text-decoration:none;} /*BG color is a must for IE6*/
       a.tooltip span {display:none; padding:2px 3px; font-size:smaller; margin-left:1px; width:100px;}
       a.tooltip:hover span{display:inline; position:horizontal; background:#ffffff; border:1px solid #cccccc; color:#6c6c6c; width:100px}
    
    </style>

    <script language="javascript" type="text/javascript">
// <!CDATA[
//function is called on changing country

  function SignOff()
    {
        window.parent.SignOff();
    }
    function PageLoad()
    {
//        DevExpress_FinYear_LockEntry_Validation()
        DevE_SetDate();
    } 
     
   function noNumbers(e)
    {
        var keynum
        var keychar
        var numcheck
        
        if(window.event)//IE
        {
            keynum = e.keyCode                        
            if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
                 else
                {
                 alert("Please Insert Numeric Only");
                 return false;
                }
         } 
         
          else if(e.which) // Netscape/Firefox/Opera
       {
           keynum = e.which  
           
           if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
                 else
                 {
                 alert("Please Insert Numeric Only");
                 return false;
                 }     
        }
  } 
function OnCompanyChanged(ddlcmpname) {
    CallServer('Segment' + '~' + ddlcmpname.GetValue().toString(), ""); 
    ddlsegment.PerformCallback(ddlcmpname.GetValue().toString());
}
function OnAccountChanged(ddlrmainacc)
{
   CallServer('AccRel' + '~' + ddlrmainacc.GetValue().toString(), ""); 
   ddlrsubacc.PerformCallback(ddlrmainacc.GetValue().toString());
}
function OnAccountUnChanged(ddlunracc)
{
  CallServer('AccUnRel' + '~' + ddlunracc.GetValue().toString(), ""); 
  ddlunrsubacc.PerformCallback(ddlunracc.GetValue().toString());
}

function ReceiveServerData(rValue)
    {   
   
        var DATA=rValue.split('~');  
        if(DATA[0]=="AccRel")
        {
         if(DATA[1]!="N")
            { 
             document.getElementById("tdrsubacc").style.display = "inline";
            }
            
            else
            {
            document.getElementById("tdrsubacc").style.display = "none";
            }
        }
        
         if(DATA[0]=="AccUnRel")
        {
         if(DATA[1]!="N")
            { 
             document.getElementById("tdunsubacc").style.display = "inline";
            }
            
            else
            {
            document.getElementById("tdunsubacc").style.display = "none";
            }
            
        }
        
          if(DATA[0]=="Segment")
        {
      
         if(DATA[1]!="N")
            { 
            
             document.getElementById("tdlevelsegment").style.display = "inline";
             document.getElementById("tdsegment").style.display = "inline";
            }
            
            else
            {
          
            document.getElementById("tdlevelsegment").style.display = "none";
            document.getElementById("tdsegment").style.display = "none";
            }
            
        }
    }
    function display()
{
  document.getElementById("tdlevelsegment").style.display = "inline";
  document.getElementById("tdsegment").style.display = "inline";
}

function displaysubclient()
{
  document.getElementById("tdrsubacc").style.display = "inline";
}
function displaysubclientnot()
{
 document.getElementById("tdrsubacc").style.display = "none";
}
function displaytax()
{
  document.getElementById("tdunsubacc").style.display = "inline";
}
function displaytaxnot()
{
 document.getElementById("tdunsubacc").style.display = "none";
}
    function CallAjax(obj1,obj2,obj3)
    {
        //FieldName='ctl00_ContentPlaceHolder1_Headermain1_cmbSegment';
        ajax_showOptions(obj1,obj2,obj3);
    }
     FieldName='btnSave';
//-->
function ValidatePage()
{
    var SNum=cSettlementNumber.GetText().length;
    if(SNum==7) 
    {
        document.getElementById("Hdn_IsValidate").value="True";
        btnSave_Click.click();
    }
    else
    {
        document.getElementById("Hdn_IsValidate").value="False";
        alert("Settlement Number Must Be Length Of Seven.")
        cSettlementNumber.Focus();
        return;
    }
}
function DateChange(DateObj)
{
    //var Lck ='<%=Session["LCKBNK"] %>';
    var FYS ='<%=Session["FinYearStart"]%>';
    var FYE ='<%=Session["FinYearEnd"]%>'; 
    var LFY ='<%=Session["LastFinYear"]%>';
    //DevE_CheckForLockDate(DateObj,Lck);
    DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
    DevE_CompareDateAndAddDay(DateObj,cDatepayinedit,2)
    DevE_CompareDateAndAddDay(DateObj,cDatepayoutedit,2)
    DevE_CompareDateAndAddDay(DateObj,cDatedelpayinedit,2)
    DevE_CompareDateAndAddDay(DateObj,cDatedelpayoutedit,2)
    DevE_CompareDateAndAddDay(DateObj,cDateconfedit,2)
    DevE_CompareDateAndAddDay(DateObj,cDateendedit,0)
}
function DateCompare(DateobjFrm,DateobjTo)
{
    var Msg="End Date Can Not Be Less Than Start Date!!!";
    DevE_CompareDateForMin(DateobjFrm,DateobjTo,Msg);
}
function DateCompareAndAddDay(DateobjFrm,DateobjTo,NoOfDay)
{
    var Msg="This Date Can Not Be Less Than Start Date!!!";
    DevE_CompareDateForMin_AddDay(DateobjFrm,DateobjTo,NoOfDay,Msg);
}
</script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form2" runat="server" autocomplete="off">
        <div>
            <table class="TableMain100" style="width: 700px">
                <tr>
                     <td class="EHEADER" align="center">
                                    <strong><span id="SpanHeader" style="color: #000099">Open Settlement</span></strong></td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr id="trSelect" runat="server">
                                <td>
                                    <table  border="1">
                                        <tr>
                                                <td style="text-align: left; vertical-align: top; height: 11px; background-color: #b7ceec;">
                                                    &nbsp;Financial Year:
                                                                    </td>
                                                                    <td style="text-align: left; width: 175px;" valign="top">
                                                                        <asp:DropDownList ID="cmbFinYear" runat="server" CssClass="EcoheadCon" Width="126px">
                                                                        </asp:DropDownList>
                                                                    </td>
                                            <td>
                                                <asp:Button ID="btnSub" Text="Save" CssClass="btnUpdate" OnClick="btnSub_Click"   runat="server" Width="100px" />
                                            </td>
                                        </tr>
                                    </table>
                    </td>
                    </tr>
                    <tr id="TrAll" runat="server">
                        <td align="left">
                            <table  border="1" width="100%">
                                <tr>
                                    <td style="vertical-align: top;background-color: #b7ceec; text-align: left" valign="top">
                                        &nbsp;Settlement No</td>
                                    <td valign="top" >
                                        <asp:TextBox ID="txtnumber" runat="server" MaxLength="7" onkeypress="return noNumbers(event)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnumber"
                                            ErrorMessage="Sett. No Required" Width="8px" Font-Bold="True">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="ValSLength" runat="server"
                                           ControlToValidate="txtnumber"
                                           ErrorMessage="Minimum Settlement length is 7"
                                           ValidationExpression=".{7}.*" Height="4px" Width="4px" >*</asp:RegularExpressionValidator>
                                        </td>
                                    <td  style="vertical-align: top;  background-color: #b7ceec; text-align: left" valign="top">
                                        &nbsp;Settlement Type</td>
                                    <td class=" " valign="top">
                                        <dxe:ASPxComboBox Width="150px" runat="server" DropDownStyle="DropDown" EnableSynchronization="False"
                                            EnableIncrementalFiltering="True" ID="ddltype">
                                            <Items>
                                                <dxe:ListEditItem Text="Normal Rolling - T+1 [M]" Value="Normal Rolling - T+1 [M]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Trade For Trade - T+1 [Z]" Value="Trade For Trade - T+1 [Z]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Normal Rolling - T+0 [5]" Value="Normal Rolling - T+0 [5]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Normal Auction[A]" Value="Normal Auction[A]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="TFT Auctionl[X]" Value="TFT Auctionl[X]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Futures[F]" Value="Futures[F]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Futures Auction[D]" Value="Retail Debt Market[D]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="SLBS - First Leg[L]" Value="SLBS - First Leg[L]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="SLBS - Reverse Leg[P]" Value="SLBS - Reverse Leg[P]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="SLBS - Auction[Q]" Value="SLBS - Auction[Q]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="OFS[H]" Value="OFS[H]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="OFS2[T]" Value="OFS2[T]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Normal Rolling[N]" Value="Normal Rolling[N]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Trade For Trade - Rolling[W]" Value="Trade For Trade - Rolling[W]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Limited Physical[O]" Value="Limited Physical[O]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Mutual Fund Services[U]" Value="Mutual Fund Services[U]"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Company Objection[B]" Value="Company Objection[B]"></dxe:ListEditItem>
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                        &nbsp;Start Date</td>
                                    <td class=" ">
                                        <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" Width="150px"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" ID="Dateedit" ClientInstanceName="cDateedit">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                             <clientsideevents datechanged="function(s,e){DateChange(cDateedit);}"></clientsideevents>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                        &nbsp;End Date</td>
                                    <td class=" ">
                                        <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" Width="150px"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" ID="Dateendedit" ClientInstanceName="cDateendedit">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                            <clientsideevents datechanged="function(s,e){DateCompare(cDateedit,cDateendedit);}"></clientsideevents>
                                            
                                        </dxe:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                        &nbsp;Fund PayIN</td>
                                    <td class=" ">
                                        <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" Width="150px"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" ID="Datepayinedit" ClientInstanceName="cDatepayinedit">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                            <clientsideevents datechanged="function(s,e){DateCompareAndAddDay(cDateedit,cDatepayinedit,2);}"></clientsideevents>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                        &nbsp;Fun PayOut</td>
                                    <td class=" ">
                                        <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" Width="150px"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" ID="Datepayoutedit" ClientInstanceName="cDatepayoutedit">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                            <clientsideevents datechanged="function(s,e){DateCompareAndAddDay(cDateedit,cDatepayoutedit,2);}"></clientsideevents>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                        &nbsp;Delievery PayIn</td>
                                    <td class=" ">
                                        <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" Width="150px"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" ID="Datedelpayinedit" ClientInstanceName="cDatedelpayinedit">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                            <clientsideevents datechanged="function(s,e){DateCompareAndAddDay(cDateedit,cDatedelpayinedit,2);}"></clientsideevents>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                        &nbsp;Delievery PayOut</td>
                                    <td class=" ">
                                        <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" Width="150px"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" ID="Datedelpayoutedit"  ClientInstanceName="cDatedelpayoutedit">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                            <clientsideevents datechanged="function(s,e){DateCompareAndAddDay(cDateedit,cDatedelpayoutedit,2);}"></clientsideevents>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                        &nbsp;Confirm Dater</td>
                                    <td class=" ">
                                        <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" Width="150px"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" ID="Dateconfedit" ClientInstanceName="cDateconfedit">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                            <clientsideevents datechanged="function(s,e){DateCompareAndAddDay(cDateedit,cDateconfedit,2);}"></clientsideevents>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                        &nbsp;Is Locked</td>
                                    <td class=" " style="text-align: left">
                                        <asp:CheckBox ID="chklock" runat="server" Width="98px" /></td>
                                </tr>
                                <tr>
                                    <td class="Ecoheadtxt" colspan="3">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" />
                                        
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" Width="100px" OnClick="btnSave_Click">
                                        </asp:Button>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    </table> </td>
                </tr>
            </table>
        </div>
        <asp:HiddenField ID="Hdn_IsValidate" runat="server" />
    </form>
</body>
</html>
