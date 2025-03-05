<%@ page language="C#" autoeventwireup="true" inherits="management_ArbGroupAdd, App_Web_e81qjzgk" %>


<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Arbitrage Group (Master)</title>
     <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
     <script language="javascript" type="text/javascript">

  
    function Page_Load()///Call Into Page Load
            {
            
                 if(window.location.search.substring(1)=='Mode=ADD')
                 {
                    FnIntCalOnCM('Exposure');
                 }
                 height();
            }
   function height()
        {
            if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '350px';
            }
            window.frameElement.width = document.body.scrollwidth;
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
    function InsertReordAlert(obj)
    {
        alert(obj);
        parent.editwin.close();
        height();
    }
    function FnIntCalOnCM(obj)
    {
        document.getElementById('DdlIntCalOnCM').value=obj;
        if(obj=='Exposure')
        {
            Show('Td_IntCalOnCMExposure');
            Hide('Td_IntCalOnCMObligation');
        }
        if(obj=='Obligation')
        {
            Hide('Td_IntCalOnCMExposure');
            Show('Td_IntCalOnCMObligation');
        }
    }
    
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">

    <form id="form1" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>

            <script language="javascript" type="text/javascript"> 
   var prm = Sys.WebForms.PageRequestManager.getInstance(); 
   prm.add_initializeRequest(InitializeRequest); 
   prm.add_endRequest(EndRequest); 
   var postBackElement; 
   function InitializeRequest(sender, args) 
   { 
      if (prm.get_isInAsyncPostBack()) 
         args.set_cancel(true); 
            postBackElement = args.get_postBackElement(); 
         $get('UpdateProgress1').style.display = 'block'; 
   } 
   function EndRequest(sender, args) 
   { 
          $get('UpdateProgress1').style.display = 'none'; 
 
   } 
            </script>
    <div>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Arbitrage Group (Master)</span></strong></td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr valign="top">
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Group Name :
                            </td>
                            <td>
                                <asp:TextBox ID="txtGroupName" runat="server" Font-Size="10px" Width="220px" 
                                    Font-Names="Verdana"></asp:TextBox></td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Group Code :
                            </td>
                            <td>
                                <asp:TextBox ID="txtGroupCode" runat="server" Font-Size="10px" Width="100px" 
                                    Font-Names="Verdana"></asp:TextBox></td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Exposure Limit :
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtExposureLimit" runat="server" HorizontalAlign="Right" Width="100px">
                                    <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr valign="top">
                            <td>
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Buy Exposure
                                            <br />
                                            Margin Rate [CM] :
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="Txt_CMBuyExpMarginRate" runat="server" HorizontalAlign="Right"
                                                Width="100px">
                                                <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                                <ValidationSettings ErrorDisplayMode="None">
                                                </ValidationSettings>
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Sell Exposure
                                            <br />
                                            Margin Rate [CM] :
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="Txt_CMSellExpMarginRate" runat="server" HorizontalAlign="Right"
                                                Width="100px">
                                                <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                                <ValidationSettings ErrorDisplayMode="None">
                                                </ValidationSettings>
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Exposure
                                            <br />
                                            Margin Rate [FO] :
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="Txt_FOExpMarginRate" runat="server" HorizontalAlign="Right"
                                                Width="100px">
                                                <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                                <ValidationSettings ErrorDisplayMode="None">
                                                </ValidationSettings>
                                            </dxe:ASPxTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td>
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr >
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Interest
                                            <br />
                                            Slab (CM Margin)
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_CMMArginIntSlab" runat="server" Font-Size="10px">
                                            </asp:DropDownList></td>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Interest
                                            <br />
                                            Slab (FO Margin)
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_FOMarginIntSlab" runat="server" Font-Size="10px">
                                            </asp:DropDownList></td>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Profit
                                            <br />
                                            Share Slab
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_ProfitSlab" runat="server" Font-Size="10px">
                                            </asp:DropDownList></td>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Loss
                                            <br />
                                            Share Slab
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_LossSlab" runat="server" Font-Size="10px">
                                            </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr valign="top">
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Int. Calculation On
                                            <br />
                                            [CM Segment] :</td>
                                        <td>
                                            <asp:DropDownList ID="DdlIntCalOnCM" runat="server" Width="100px" Font-Size="10px"  onchange="FnIntCalOnCM(this.value)">
                                                <asp:ListItem Value="Exposure">Exposure</asp:ListItem>
                                                <asp:ListItem Value="Obligation">Obligation</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td id="Td_IntCalOnCMExposure" >
                                            <table>
                                                <tr valign="top">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Interest Slab
                                                        <br />
                                                        (CM Buy Exposure)
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_CMBuyExpIntSlab" runat="server" Font-Size="10px">
                                                        </asp:DropDownList></td>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Interest Slab
                                                        <br />
                                                        (CM Sell Exposure)
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_CMSellExpIntSlab" runat="server" Font-Size="10px">
                                                        </asp:DropDownList></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td id="Td_IntCalOnCMObligation" >
                                            <table>
                                                <tr valign="top">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Interest Slab
                                                        <br />
                                                        (CM Obligation)
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_CMObligationIntSlab" runat="server" Font-Size="10px">
                                                        </asp:DropDownList></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Interest Slab
                                            <br />
                                            (Net Buy Premium Obligation)
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_FOObligationIntSlab" runat="server" Font-Size="10px">
                                            </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnAdd" runat="server" CssClass="btnUpdate" Height="20px" Text="Add/Update"
                                    Width="101px" OnClick="btnAdd_Click" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
    </div>
    
    </form>
</body>
</html>