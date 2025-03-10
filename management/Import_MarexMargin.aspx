<%@ page language="C#" autoeventwireup="true" inherits="Import_MarexMargin, App_Web_kqhq1k1d" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    function PageLoad()
    {
        alert('Load');
    }
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=200)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '200px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function ddlImportCompare_JSOnChange(obj)
    {
        if(obj=="M") 
        {
        
            document.getElementById("BtnSave").value="Import";
            document.getElementById("td_Consider").style.display="none";
            document.getElementById("td_Position").style.display="none";
        }
        else if(obj=="C") 
        {
            document.getElementById("BtnSave").value="Compare";
            document.getElementById("td_Consider").style.display="inline";
            document.getElementById("td_Position").style.display="inline";
        }
    }
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    
    <div align="center">
        <table border="1">
            <tr>
                <td class="EHEADER" colspan="2" align="center" >
                                    <strong><span id="SpanHeader" style="color: #000099">Import Margin/Compare Cash balances</span></strong></td>
            </tr>
            <tr>
                <td  style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                    Select Operation :</td>
                <td style="text-align: left" >
                    <asp:DropDownList ID="ddlImport_Compare" runat="server" onchange="ddlImportCompare_JSOnChange(this.value)">
                        <asp:ListItem Value="M">Import Margin</asp:ListItem>
                        <asp:ListItem Value="C">Compare Cash Balances</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td  style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                    Choose File :</td>
                <td style="width: 100px">
                                                        <asp:FileUpload ID="OFDSelectFile" runat="server"  Width="500px"/></td>
            </tr>
            <tr id="Tr_Consider">
                <td id="td_Consider" style="display:none;vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                                Consider :</td>
                <td id="td_Position" style="display:none;width: 100px">
                                                <table style="width: 430px" border="1">
                                                <tr>
                                                <td>
                                                <asp:RadioButton ID="rdball" runat="server" GroupName="z"/>
                                                </td>
                                                <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                All Positions
                                            </td>
                                                <td>
                                                <asp:RadioButton ID="rdbdiff" runat="server" GroupName="z" Checked="true" />
                                                </td>
                                                <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Only Un-reconciled Positions
                                            </td>
                                                </tr>
                                                </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                                        <asp:HiddenField ID="hdnPath" runat="server" />
                                        <asp:HiddenField ID="hdnFileName" runat="server" />
                </td>
                <td style="text-align: right;">
                                                                        <asp:Button ID="BtnSave" runat="server" Text="Import" CssClass="btn" OnClick="BtnSave_Click"
                                                                            Width="84px" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
