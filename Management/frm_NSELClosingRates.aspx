<%@ page language="C#" autoeventwireup="true" inherits="management_frm_MCXClosingRates, App_Web_i8xxwgwk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>NSEL Closing Rates</title>
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
    </script>
<script type="text/javascript" src="../JSFUNCTION/init.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
    <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 22px;">
                        <strong><span id="SpanHeader" style="color: #000099">Imports NSEL Closing Rates</span></strong>
                    </td>
                    
                    </tr></table>
       
        <table>
            <tr>
                <td>
                    <span style="color: #3300ff; text-align: right"><strong>Select File Type </strong></span>
                </td>
                <td align="left">
                    <select id="cmbTrade" runat="server" style="width: 230px">
                        <option selected="selected">Select</option>
                        <option value="1">.CSV Files</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <span style="color: #3300ff; text-align: right"><strong>Select File </strong></span>
                </td>
                <td>
                    <asp:FileUpload ID="MarketStatsSelectFile" runat="server" Height="21px" Width="272px" />
                </td>
            </tr>
              <tr>
                                                        <td align="left" valign="top" colspan="2">
                                                            <asp:Button ID="BtnSave" runat="server" CssClass="btn" OnClick="BtnSave_Click" Text="Import File"
                                                                Width="84px" />
                                                        </td>
                                                    </tr>
 <tr id="trYesNo" runat="server">
                                        <td align="left">
                                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Width="258px"></asp:Label>
                                        </td>
                                        <td align="left" style="text-align: right">
                                            <asp:Button ID="btnYes" runat="server" CssClass="btn" OnClick="btnYes_Click" Text="Yes" />
                                            <asp:Button ID="btnNo" runat="server" CssClass="btn" OnClick="btnNo_Click" Text="No" />
                                        </td>
                                    </tr>

        </table>
           
            <asp:HiddenField ID="hdfname" runat="server" />
        
        </div>
    </form>
</body>
</html>
