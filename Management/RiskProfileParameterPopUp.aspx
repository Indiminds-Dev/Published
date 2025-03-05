<%@ page language="C#" autoeventwireup="true" validaterequest="false" enableeventvalidation="false" inherits="management_RiskProfileParameterPopUp, App_Web_fxnvzv_8" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Risk Profile Parameter</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

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
        document.onkeydown=function(e)
        {
	        if(event.keyCode == 17) isCtrl=true;
	        if(event.keyCode == 83 && isCtrl == true) 
	        {
		        //run code for CTRL+S -- ie, save!
		        document.getElementById('btnSave').click();    
		        return false;
	        }
        } 
        function VisibleProperty()
        {
           var id = document.getElementById("ddlProfileType").value;
           if(id=="1")
           {
                document.getElementById("TrRisk").style.display="inline";
                document.getElementById("TrDelivery").style.display="none";
                document.getElementById("TrFund").style.display="none";
                document.getElementById("spnRisk").style.display="inline";
                document.getElementById("spnDelivery").style.display="none";
                document.getElementById("spnFund").style.display="none";
                document.getElementById("hd1").value="1";
           }
           else if(id=="2")
           {
                document.getElementById("TrRisk").style.display="none";
                document.getElementById("TrDelivery").style.display="inline";
                document.getElementById("TrFund").style.display="none";
                document.getElementById("spnRisk").style.display="none";
                document.getElementById("spnDelivery").style.display="inline";
                document.getElementById("spnFund").style.display="none";
                document.getElementById("hd1").value="2";
           }
           else
           {
                document.getElementById("TrRisk").style.display="none";
                document.getElementById("TrDelivery").style.display="none";
                document.getElementById("TrFund").style.display="inline";
                document.getElementById("spnRisk").style.display="none";
                document.getElementById("spnDelivery").style.display="none";
                document.getElementById("spnFund").style.display="inline";
                document.getElementById("hd1").value="3";
           }
        }        
        function HairCut()
        {
            var id = document.getElementById("ddlHaircutRates").value;
            if(id=="2")
            {
                document.getElementById("tdFlat1").style.display="inline";
                document.getElementById("tdFlat2").style.display="inline";
                document.getElementById("TdVar1").style.display="none";
                document.getElementById("TdVar2").style.display="none";
            }
            else if(id=="1")
            {
                document.getElementById("tdFlat1").style.display="none";
                document.getElementById("tdFlat2").style.display="none";
                document.getElementById("TdVar1").style.display="inline";
                document.getElementById("TdVar2").style.display="inline";
            }
            else    
            {
                document.getElementById("tdFlat1").style.display="none";
                document.getElementById("tdFlat2").style.display="none";
                document.getElementById("TdVar1").style.display="none";
                document.getElementById("TdVar2").style.display="none";
            }
        }
        function Checkchange()
        {    
            var obj = document.getElementById("chkHoldbackStock").checked; 
            if(obj==false)
            {
                document.getElementById("tdHold1").style.display="none";
                document.getElementById("tdHold2").style.display="none";
            }
            else
            {
                document.getElementById("tdHold1").style.display="inline";
                document.getElementById("tdHold2").style.display="inline";
            }
        }
        function Designated()
        {
            var id = document.getElementById("ddlOutgoing").value;
            if(id=="4" || id=="3")
            {
                document.getElementById("Tr_DesignatedAc").style.display="inline";
                document.getElementById("Td_HoldBackentire").style.display="none";
                document.getElementById("Td_HldbkNoPartial").style.display="none";
                document.getElementById("Tr_HlbkRul").style.display="none";
                document.getElementById("Td_MarkUpDebit").style.display="none";
                document.getElementById("btnDesigneted").click();
            }
            else    
            {
                document.getElementById("Tr_DesignatedAc").style.display="none";
                document.getElementById("Td_HoldBackentire").style.display="inline";
                document.getElementById("Td_HldbkNoPartial").style.display="inline";
                document.getElementById("Tr_HlbkRul").style.display="inline";
                document.getElementById("Td_MarkUpDebit").style.display="inline";
            }
        }

       function btnCancel_Click()
       {
            var answer = confirm ("Are you Want To Close This Window?");
            if (answer)
               parent.editwin.close();
       }
       function fn_ChangeMarkupValueCheck()
       {
        document.getElementById("td_ChangeMarkupValue").style.display="inline";
       } 
       function fn_ChangeMarkupValueUnCheck()
       {
         document.getElementById("td_ChangeMarkupValue").style.display="none";
         AspxMarkUp.SetValue('0.00');
       
       }
       function FnHoldBackentire(obj)
       {
          if(obj.checked==true)
            {
                document.getElementById("Td_HldbkNoPartial").style.display="none";
            }
            else
            {
                document.getElementById("Td_HldbkNoPartial").style.display="inline";
            }
       }       
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="4" style="text-align: center">
                        <span id="spnRisk" style="size: 15px; font-weight: bold">Risk Profile Settings</span>
                        <span id="spnDelivery" style="size: 15px; font-weight: bold">Delivery Profile Settings</span>
                        <span id="spnFund" style="size: 15px; font-weight: bold">Fund Profile Settings</span>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; size: 10px">
                        Profile Type :
                    </td>
                    <td style="text-align: left;">
                        <asp:DropDownList ID="ddlProfileType" Font-Size="10px" runat="server" Width="204px"
                            AutoPostBack="True" OnSelectedIndexChanged="ddlProfileType_SelectedIndexChanged">
                            <asp:ListItem Value="1">Risk & Exposure</asp:ListItem>
                            <asp:ListItem Value="2">Delivery</asp:ListItem>
                            <asp:ListItem Value="3">Funds</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: left; size: 10px">
                        Profile Name :
                    </td>
                    <td style="text-align: left;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlProfileCode" Font-Size="10px" runat="server" Width="200px">
                                </asp:DropDownList>
                                <asp:HiddenField ID="hd1" runat="server"></asp:HiddenField>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlProfileType" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; size: 10px">
                        Company Name :
                    </td>
                    <td style="text-align: left;">
                        <asp:DropDownList ID="ddlCompany" Font-Size="10px" runat="server" Width="204px" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: left; size: 10px">
                        Segment :
                    </td>
                    <td style="text-align: left;">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlSegment" Font-Size="10px" runat="server" Width="200px">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlCompany" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; size: 10px">
                        Date From :
                    </td>
                    <td style="text-align: left;">
                        <dxe:ASPxDateEdit ID="FromDate" runat="server" Font-Size="10px" Width="204px" EditFormat="Custom"
                            EditFormatString="dd-MM-yyyy" UseMaskBehavior="True">
                            <ButtonStyle Width="13px">
                            </ButtonStyle>
                        </dxe:ASPxDateEdit>
                    </td>
                    <td colspan="2">
                    </td>
                </tr>
                <tr id="TrRisk">
                    <td colspan="4">
                        <asp:Panel ID="Panel1" runat="server" Width="100%" BorderColor="white" BorderWidth="1px">
                            <table width="100%">
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Haircut for Pending Sales
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtPHairCut" runat="server" Width="105px" Font-Size="10px" HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Mark-Up for pending purchases
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtPPurchase" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Daily exposure(Day-End)Limit
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtDailyExpLimit" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Daily Peak exposure Limit
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtPeakLimit" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Daily Obligation Limit
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtDailyObgLimit" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px" colspan="2">
                                        <asp:CheckBox ID="chkHoldbackStock" runat="server" Text="" />
                                        Consider Holdback stocks for Exposure Upload
                                        <asp:CheckBox ID="chkHoldingPOAMrgin" runat="server" Text="" />
                                        Consider Holding in POA A/c as Margin
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px" id="TdHold1">
                                        Haircut for holdback stocks
                                    </td>
                                    <td id="TdHold2" style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtHoldbackHaircut" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Applicable Haircut Rates
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:DropDownList ID="ddlHaircutRates" Width="105px" Font-Size="10px" runat="server">
                                            <asp:ListItem Value="1">Var Margin Rates</asp:ListItem>
                                            <asp:ListItem Value="2">Flat Rate</asp:ListItem>
                                            <asp:ListItem Value="3">Group Wise</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px" id="tdFlat1">
                                        Flat Haircut Rate
                                    </td>
                                    <td id="tdFlat2" style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtFlatHaircut" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px" id="TdVar1">
                                        Markup on Var based haircut rates
                                    </td>
                                    <td id="TdVar2" style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtVarMarkup" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Haircut for Un-approved stocks
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtUnapprovedHaircut" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Haircut for FDRs
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtFDRHaircut" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px" colspan="2">
                                        <asp:CheckBox ID="chkForClearBalance" runat="server" Text="" />
                                        Consider Only Clear Balance for exposure upload
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Minimum Cash Margin Deposit
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtminCashDepost" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Minimum Liquid Cash Component
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtMinCashComponent" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Min balnc. requ. for front end upload
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtMinBalanceUpload" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Markup on Exchange Calculated Margin amount
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtMarginMarkup" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Exposure Margn. rate
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtMarginRate" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Permissible Margin Shortage
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtMarginShortage" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Penalty for Margin shortage
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtMarginShortagePenalty" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Penalty for Violating Exposure limits
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtLimitViolation" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Interest Rate on Margin shortage beyond permissible limit
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtInterestMargnShortg" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..99g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Default Minimum expouser upload
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtDefltMinUpload" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Top up amount for exposure upload
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtTopUpuploadAmount" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Top up amount only if available capital is less than
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtTopupUploadCriterion" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Maximum Permissible Value Of Colleterals
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtMaxCollVal" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Maximum Exposure Upload Amount
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtMaxUploadVal" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Do not upload If Running debit balance in excess of [Amount]
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtRunnDebitAmunt" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        For more than [Days]
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtRunningDay" runat="server" Width="105px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..99g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px" colspan="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Available Capital Calculation Formula<a href="#" onmouseover="this.T_WIDTH=200;this.T_FONTCOLOR='#003399';return escape('Where L is the liquid component that includes Trading A/c Balance, Cash Margin Deposit , and FDRs ; While C is the value of colleterals after applying haircut')"><span
                                            style="color: Maroon"><b> ?</b></span></a>
                                    </td>
                                    <td style="text-align: left" colspan="3">
                                        <dxe:ASPxTextBox ID="txtUploadFormula" Font-Size="11px" runat="server" Width="430px">
                                            <MaskSettings Mask="\A\C \= \I\I\F\(\LC\C, (\L<+|->\C)\*<0..99>.<0..999>, \(<*C|L>\)\*<0..99>.<0..999>)"
                                                ShowHints="True" PromptChar="?" />
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Applicable Margin in FO Segments<a href="#" onmouseover="this.T_WIDTH=200;this.T_FONTCOLOR='#003399';return escape('Where, IM=Initial Margin ; S=Span Margin ; P=Net Buy Premium ; E = Exposure Margin')">
                                            <span style="color: Maroon"><b>?</b></span></a>
                                    </td>
                                    <td style="text-align: left" colspan="3">
                                        <dxe:ASPxTextBox ID="txtApplmrgnFOSegment" Font-Size="11px" runat="server" Width="430px">
                                            <MaskSettings Mask="\A\M \= \I\I\F\(\I\MC\E\L\M, (\S\*<0..99>.<0..999> <+|-> \P\*<0..99>.<0..999> <+|-> \E\*<0..99>.<0..999>), (\S\*<0..99>.<0..999> <+|-> \P\*<0..99>.<0..999> <+|-> \E\*<0..99>.<0..999>))"
                                                ShowHints="True" PromptChar="?" />
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr id="TrDelivery">
                    <td colspan="4">
                        <asp:Panel ID="Panel2" runat="server" Width="100%" BorderColor="white" BorderWidth="1px">
                            <table>
                                <tr>
                                    <td colspan="2" class="gridcellleft" bgcolor="#B7CEEC">
                                        <asp:CheckBox ID="ChkConsolidateBalnAcrossSegments" runat="server" />
                                       Consolidate Balance Across CM Segments
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" style="width:64%;">
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 699px" >
                                                    <table width="100%" style="border: solid 1px Blue" border="10" cellpadding="1" cellspacing="1">
                                                        <tr>
                                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                <b>Normal Payout Rules :</b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        Outgoing Deliveries
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="ddlOutgoing" Font-Size="10px" runat="server" Width="200px">
                                                                                            <asp:ListItem Value="1">Deliver Only If Clear Ledger Balance</asp:ListItem>
                                                                                            <asp:ListItem Value="2">Always Deliver To Client</asp:ListItem>
                                                                                            <asp:ListItem Value="3">Always Transfer To Margin A/c</asp:ListItem>
                                                                                            <asp:ListItem Value="4">Always Transfer To Holdback A/c</asp:ListItem>
                                                                                            <asp:ListItem Value="6">Deliver If Credit Balance</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="Tr_DesignatedAc">
                                                                        <td>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        Designated Account
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                                            <ContentTemplate>
                                                                                                <asp:DropDownList ID="ddlDesignatedAccount" Font-Size="10px" runat="server">
                                                                                                </asp:DropDownList>
                                                                                            </ContentTemplate>
                                                                                            <Triggers>
                                                                                                <asp:AsyncPostBackTrigger ControlID="btnDesigneted" EventName="Click" />
                                                                                            </Triggers>
                                                                                        </asp:UpdatePanel>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <table>
                                                                                <tr>
                                                                                    <td id="Td_HoldBackentire">
                                                                                        <asp:CheckBox ID="chkHoldBackentire" runat="server" onclick="FnHoldBackentire(this)" />Holdback
                                                                                        Entire delivery
                                                                                    </td>
                                                                                    <td id="Td_HldbkNoPartial">
                                                                                        <asp:CheckBox ID="chkNoPartialHoldback" runat="server" />No Partial Holdback
                                                                                    </td>
                                                                                     <td id="Td_MarkUpDebit">
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                       <b>|</b> Markup On Debit Balance
                                                                                    </td>
                                                                                    <td style="text-align: left;">
                                                                                        <dxe:ASPxTextBox ID="txtMarkUpDebitBalance" runat="server" Width="85px" Font-Size="10px"
                                                                                            HorizontalAlign="Right">
                                                                                            <masksettings mask="&lt;0..999g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                                                                                            <validationsettings errordisplaymode="None">
                                                        </validationsettings>
                                                                                        </dxe:ASPxTextBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                   
                                                                    <tr id="Tr_HlbkRul">
                                                                        <td>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Apply Holdback Rule if Debit Balance is more Than</td>
                                                                                                <td>
                                                                                                    <dxe:ASPxTextBox ID="AspxDeliveryHoldback" runat="server" Width="50px" Font-Size="10px"
                                                                                                        HorizontalAlign="Right">
                                                                                                        <masksettings mask="&lt;0..99g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                                                                                                        <validationsettings errordisplaymode="None">
                                                                                </validationsettings>
                                                                                                    </dxe:ASPxTextBox>
                                                                                                </td>
                                                                                                <td>
                                                                                                    % of Delivery value</td><td>
                                                                                        Or Rs. </td> <td>
                                                                                            <dxe:ASPxTextBox ID="AspxDeliveryHoldbackMinAmnt" runat="server" Width="50px" Font-Size="10px"
                                                                                                HorizontalAlign="Right">
                                                                                                <masksettings mask="&lt;0..99999999999999g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                                                                                                <validationsettings errordisplaymode="None">
                                                        </validationsettings>
                                                                                            </dxe:ASPxTextBox></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                   <td><table><tr> 
                                                                                       
                                                                                   
                                                                                    <td>
                                                                                        Which Ever is Minimum</td></tr></table></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 699px" >
                                                    <table style="border: solid 1px Purple; width: 87%;" border="10" cellpadding="1"
                                                        cellspacing="1">
                                                        <tr>
                                                            <td class="gridcellleft" bgcolor="#B7CEEC" style="height: 18px; width: 663px;">
                                                                <b>Auction Rules :</b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 663px">
                                                                <table>
                                                                    <tr>
                                                                        <td style="text-align: left; size: 10px">
                                                                            Auction Debit Rule
                                                                        </td>
                                                                        <td style="text-align: left;">
                                                                            <asp:DropDownList ID="ddlAucDebitRule" Font-Size="10px" runat="server">
                                                                                <asp:ListItem Value="1">Debit Net Trade Value</asp:ListItem>
                                                                                <asp:ListItem Value="2">Debit Market Value</asp:ListItem>
                                                                                <asp:ListItem Value="3">Debit whichever is Higher</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 663px">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            Markup On Auction Debit :
                                                                        </td>
                                                                        <td style="text-align: left;">
                                                                            <dxe:ASPxTextBox ID="txtMarkupAuctionDebit" runat="server" Width="85px" Font-Size="10px"
                                                                                HorizontalAlign="Right">
                                                                                <masksettings mask="&lt;0..999g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                                                                                <validationsettings errordisplaymode="None">
                                            </validationsettings>
                                                                            </dxe:ASPxTextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 663px">
                                                                <table>
                                                                    <tr>
                                                                        <td style="text-align: left; size: 10px">
                                                                            Penalty For Short Deliveries
                                                                        </td>
                                                                        <td style="text-align: left;">
                                                                            <dxe:ASPxTextBox ID="txtShortDeliveryPenalty" runat="server" Width="85px" Font-Size="10px"
                                                                                HorizontalAlign="Right">
                                                                                <masksettings mask="&lt;0..99g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                                                                                <validationsettings errordisplaymode="None">
                                            </validationsettings>
                                                                            </dxe:ASPxTextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td valign="top" style="width:35%;">
                                        <table style="border: solid 1px Green; width: 88%;" border="10" cellpadding="1" cellspacing="1">
                                            <tr>
                                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                                    <b>Margin/HoldBack Stock Release Rules :</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="gridcellleft">
                                                    <asp:CheckBox ID="ChkExcludeAutoHldbk" runat="server" />
                                                    Exclude From Auto HoldBack Release
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="gridcellleft">
                                                    <asp:CheckBox ID="ChkConsiderCashmarginDep" runat="server" />
                                                    Consider Cash Margin Deposit Balance
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="gridcellleft">
                                                    <asp:CheckBox ID="ChkDeductedUnclearReceipts" runat="server" />
                                                    Deduct Uncleared Receipts Of Tradings A/c
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="gridcellleft">
                                                    <asp:CheckBox ID="ChkDeductedUnclearReceiptsmrgnDep" runat="server" />
                                                    Deduct Uncleared Receipts Of Margin Dep. A/c
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="gridcellleft">
                                                    <asp:CheckBox ID="ChkBenifitPendingPurchase" runat="server" />
                                                    Give Benefit Of Pending Purchases (After Haircut)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="gridcellleft">
                                                    <asp:CheckBox ID="ChkAddBackPendingSales" runat="server" />
                                                    Add Back Pending Sales (After Haircut)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="gridcellleft">
                                                    <asp:CheckBox ID="ChkGiveBenefitMrgnStocks" runat="server" />
                                                    Give Benefit Of Margin Stocks (After Haircut)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td valign="top">
                                                                &nbsp;<asp:CheckBox ID="ChkCosiderAppMargn" runat="server" onclick="if(this.checked){fn_ChangeMarkupValueCheck()}else{fn_ChangeMarkupValueUnCheck()}" />
                                                                Consider Applicable Margin
                                                            </td>
                                                            <td id="td_ChangeMarkupValue" valign="top">
                                                                <table style="border: solid 1px White">
                                                                    <tr>
                                                                        <td>
                                                                            MarkUp :</td>
                                                                        <td>
                                                                            <dxe:ASPxTextBox ID="AspxMarkUp" runat="server" Width="50px" Font-Size="10px" HorizontalAlign="Right">
                                                                                <masksettings mask="&lt;0..99g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                                                                                <validationsettings errordisplaymode="None">
                                                        </validationsettings>
                                                                            </dxe:ASPxTextBox></td>
                                                                    <td>
                                                                                %</td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="gridcellleft">
                                                    <asp:CheckBox ID="ChkConsiderFdrBalance" runat="server" />
                                                    Consider FDR A/c Balance
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="gridcellleft">
                                                    <asp:CheckBox ID="ChkPartialHoldback" runat="server" />
                                                    No Partial Release
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 111px">
                                                    <table style="width: 371px" border="1px">
                                                        <tr>
                                                           <td colspan="1" valign="top">
                                                                <table style="border: solid 1px White" border="1">
                                                                    <tr>
                                                                        <td colspan="2" valign="top">
                                                                        <asp:CheckBox ID="ChkPettyAmt" runat="server" />do not deliver if Net Debit is more than</td>
                                                                        <td valign="top">
                                                                            <dxe:ASPxTextBox ID="txtPettyRate" runat="server" Width="50px" Font-Size="10px"
                                                                                                        HorizontalAlign="Right">
                                                                                <masksettings mask="&lt;0..99g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                                                                                <Validationsettings errordisplaymode="None"/>
                                                                            </dxe:ASPxTextBox>
                                                                            </td>
                                                                        <td>%</td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 364px; height: 59px;" valign="top" colspan="2">
                                                                <table border="1" style="width: 397px">
                                                                    <tr>
                                                                        <td valign="top">
                                                                of Deliverable Value or rs</td>
                                                                        <td valign="top"><img src="../images/rupee.png" alt="abc" height="15px" width="15px"/>
                                                                            </td>
                                                                       <td style="width: 105px">
                                                                            <dxe:ASPxTextBox ID="txtPettyAmt" runat="server" Width="100px" Font-Size="10px" HorizontalAlign="Right">
                                                                                <masksettings mask="&lt;0..9999999999999g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                                                                                <validationsettings errordisplaymode="None" />
                                                                            </dxe:ASPxTextBox>
                                                                        </td>
                                                                        <td valign="top">
                                                                which ever is minimum</td>
                                                                         
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr id="TrFund">
                    <td colspan="4">
                        <asp:Panel ID="Panel3" runat="server" Width="100%" BorderColor="white" BorderWidth="1px">
                            <table width="100%">
                                <tr>
                                    <td style="text-align: left; size: 10px" colspan="2">
                                        <asp:CheckBox ID="chkTrirdPartyReceipt" runat="server" Text="" />May Receive funds
                                        from third party
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Fund Payout Rule
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:DropDownList ID="ddlPayoutRule" Font-Size="10px" runat="server">
                                            <asp:ListItem Value="1">Auto-Payout - Gross</asp:ListItem>
                                            <asp:ListItem Value="2">Auto-Payout - Net</asp:ListItem>
                                            <asp:ListItem Value="3">Payout on request</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Payout Mode
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:DropDownList ID="ddlPayoutMode" Font-Size="10px" runat="server">
                                            <asp:ListItem Value="1">By Cheque</asp:ListItem>
                                            <asp:ListItem Value="2">By Electronic Transfer</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Minimum Required Credit balance
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtMinCreditBalance" runat="server" Width="85px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Maximum Permissible Debit Balance
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtmaxDebitBalance" runat="server" Width="85px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999999999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Interest on Debit Balance chargeable beyond
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtInterestCharge" runat="server" Width="85px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; size: 10px">
                                        Rate of Interest on Delayed Payments
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtDelayedPaymentInterest" runat="server" Width="85px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..99g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="text-align: left; size: 10px">
                                        Penalty for dishounoured cheques
                                    </td>
                                    <td style="text-align: left;">
                                        <dxe:ASPxTextBox ID="txtChequeDishonourPenalty" runat="server" Width="85px" Font-Size="10px"
                                            HorizontalAlign="Right">
                                            <MaskSettings Mask="&lt;0..9999g&gt;" IncludeLiterals="DecimalSymbol" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="text-align: right">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click"
                            Width="105px" />
                        <input id="btnCancel" type="button" value="Cancel" class="btnUpdate" style="width: 70px"
                            onclick="btnCancel_Click()" />
                    </td>
                </tr>
                <tr >
                    <td style="display:none">
                        <asp:Button ID="btnDesigneted" runat="server" Text="Button" OnClick="btnDesigneted_Click"  />
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <script language="javascript" type="text/javascript" src="../JSFUNCTION/wz_tooltip.js">        
    </script>

</body>
</html>
