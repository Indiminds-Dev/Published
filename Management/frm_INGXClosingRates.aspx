<%@ page language="C#" autoeventwireup="true" inherits="management_frm_INGXClosingRates, App_Web_amufh4kc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
    
    
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
     <link type="text/css" href="../CSS/GenericCss.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>
    
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script language="javascript" type="text/javascript">
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
    function PageLoad()
    {
       VisibleInVisible("DvMissingProduct_Lable","H");
       VisibleInVisible("DvMissingProduct_Content","H");
    }
    function HideShowGrid(WhichGrid)
    {
        if(WhichGrid=="1")
        {
            VisibleInVisible("DvMissingProduct_Lable","S");
            VisibleInVisible("DvMissingProduct_Content","S");
        }
      height();
    }
    
    </script>
    
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
      <div align="center">
           <asp:Panel ID="Panelmain" runat="server" Visible="true">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
                    <tbody>
                        <tr>
                            <td class="lt1" style="height: 22px">
                                <h5>
                                    Imports Closing Rates From Positions Files</h5>
                            </td>
                        </tr>
                        <tr>
                            <td class="lt brdr">
                               <table style="width: 466px" border="1">
                                    <tr>
                                        <td style="vertical-align: top;">
                                                                            <asp:FileUpload ID="OFDSelectFile" runat="server" Width="362px" /></td>
                                        <td style="width: 100px">
                                            &nbsp;<asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click"
                                                                                Width="84px" /></td>
                                    </tr>
                                </table>
                                <div id="DvMissingProduct_Lable" class="Lable">Following Assets Are Missing.Please Map And ReImport.</div>
                                <div id="DvMissingProduct_content" class="Content">
                                    <dxwgv:ASPxGridView ID="GvMissingProducts" runat="server"  ClientInstanceName="cGvMissingProducts"
                                        Width="99%" AccessibilityCompliant="True">
                                        <SettingsLoadingPanel ImagePosition="Right" Text="Please Wait...&amp;hellip;" />
                                    </dxwgv:ASPxGridView>
                                </div>
                              
                               
                            </td>
                        </tr>
                    </tbody>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
