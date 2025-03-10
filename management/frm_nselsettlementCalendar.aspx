<%@ page language="C#" autoeventwireup="true" inherits="frm_MCXTRADES, App_Web_nidspgif" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>NSEL SETTLEMENT CALENDER</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=300)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '300px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function selectfile()
    {
        var i=document.getElementById('cmbTrade').value;
        document.getElementById('txtType').value=i;
    }
 </script>
<script type="text/javascript" src="../JSFUNCTION/init.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panelmain" runat="server" HorizontalAlign="Center" Style="z-index: 100;
            left: 236px; position: absolute; top: 13px" Visible="true">
            <table id="tbl_main" cellpadding="0" cellspacing="0" class="login" style="height: 153px"
                width="410">
                <tbody>
                 <tr>
                    <td class="lt1" style="height: 22px">
                        <h5>
                            Imports NSEL Settlement Calender
                        </h5>
                    </td>
                </tr>
                
                    <tr>
                        <td class="lt">
                            <table cellpadding="0" cellspacing="12" class="width100per" style="width: 100%">
                                <tbody>
                                
                                    <tr>
                                        <td class="gridcellleft" style="width: 106px">
                                            <span style="color: #000099">
                                                <asp:Label ID="Label2" runat="server" Text="Settlement Type" Width="91px"></asp:Label></span></td>
                                        <td >
                                            <asp:DropDownList ID="cmbSettType" runat="server" AutoPostBack="True" Font-Bold="True"
                                                OnSelectedIndexChanged="cmbTrade_SelectedIndexChanged1" Width="218px">
                                                <asp:ListItem Value="0">Select </asp:ListItem>
                                                <asp:ListItem Value="1">E-Series</asp:ListItem>
                                                <asp:ListItem Value="2">Normal</asp:ListItem>
                                            </asp:DropDownList></td>
                                    </tr>
                                      <tr>
                                        <td class="gridcellleft" colspan="2">
                                            <span style="color: #000099">
                                            <asp:Label ID="lblMsg" runat="server" Visible="False" ForeColor="#404040"></asp:Label></span></td>
                                     
                                    </tr>
                                      <tr>
                                        <td class="gridcellleft" colspan="0" id="SettName" style="width: 106px">
                                            <span style="color: #000099">
                                                <asp:Label ID="lblSettCycle" runat="server" Text="Settlement Cycle" Width="91px"></asp:Label></span></td>
                                         <td class="gridcellleft" colspan="0" id="SettCmb"><asp:DropDownList Font-Bold="True" ID="cmbSettCycle" runat="server" Width="214px">
                                             <asp:ListItem>Select</asp:ListItem>
                                             <asp:ListItem Value="1">Auction Birla.csv</asp:ListItem>
                                             <asp:ListItem Value="2">Auction intra.csv</asp:ListItem>
                                             <asp:ListItem Value="3">Auction normal.csv</asp:ListItem>
                                             <asp:ListItem Value="4" >Auction sellout.csv</asp:ListItem>
                                             <asp:ListItem Value="5">T+0.csv</asp:ListItem>
                                             <asp:ListItem Value="6">T+1.csv</asp:ListItem>
                                             <asp:ListItem Value="7">T+2.csv</asp:ListItem>
                                             <asp:ListItem Value="8">T+3.csv</asp:ListItem>
                                             <asp:ListItem Value="9">T+4.csv</asp:ListItem>
                                             <asp:ListItem Value="10">T+5 STEEL.csv</asp:ListItem>
                                             <asp:ListItem Value="11" >T+5.csv</asp:ListItem>
                                             <asp:ListItem Value="12" >T+6.csv</asp:ListItem>
                                             <asp:ListItem Value="13">T+7.csv</asp:ListItem>
                                             <asp:ListItem Value="14">T+8.csv</asp:ListItem>
                                             <asp:ListItem Value="15">T+9.csv</asp:ListItem>
                                             <asp:ListItem Value="16">T+10 castor bhabharxlsx.csv</asp:ListItem>
                                             <asp:ListItem Value="17">T+10.csv</asp:ListItem>
                                             <asp:ListItem Value="18">T+12.csv</asp:ListItem>
                                             <asp:ListItem Value="19">T+15 Auction paddy.csv</asp:ListItem>
                                             <asp:ListItem Value="20">T+18.csv</asp:ListItem>
                                             <asp:ListItem Value="21">T+25.csv</asp:ListItem>
                                             <asp:ListItem Value="22">T+30.csv</asp:ListItem>
                                             <asp:ListItem Value="23">T+36.csv</asp:ListItem>
                                         </asp:DropDownList></td>   
                                            
                                       </tr>
                                    <tr>
                                        <td class="gridcellleft" style="width: 106px">
                                            <span style="color: #000099; text-align: right">
                                                <asp:Label ID="Label3" runat="server" Text="Settlement File" Width="91px"></asp:Label></span></td>
                                        <td>
                                            <asp:FileUpload ID="McxTradeSelectFile" runat="server" Height="21px" Width="272px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2" style="height: 20px" valign="middle">
                                            <table cellpadding="0" cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" style="height: 19px" valign="top">
                                                            <asp:Button ID="BtnSave" runat="server" CssClass="btn" OnClick="BtnSave_Click" Text="Import File"
                                                                Width="84px" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
      <asp:HiddenField ID="hdfname" runat="server" />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
