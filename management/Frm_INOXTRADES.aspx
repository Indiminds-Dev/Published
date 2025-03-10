<%@ page language="C#" autoeventwireup="true" inherits="management_Frm_INOXTRADES, App_Web_1jeyysc_" %>

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
<head id="Head1" runat="server">
<link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <link type="text/css" href="../CSS/GenericCss.css" rel="Stylesheet" />
    
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>
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
       VisibleInVisible("DvImportSummary_Lable","H");
       VisibleInVisible("DvImportSummary_Content","H");
       VisibleInVisible("DvMissingProduct_Lable","H");
       VisibleInVisible("DvMissingProduct_Content","H");
       VisibleInVisible("DvMissingClient_Lable","H");
       VisibleInVisible("DvMissingClient_Content","H");
       
       //File Format to Import By Default
        Span_FileFormat.innerText="File Name : YYYYMMDD_trdcsv.csv";
    }
    function HideShowGrid(WhichGrid)
    {
        if(WhichGrid=="0")
        {
            VisibleInVisible("DvImportSummary_Lable","S");
            VisibleInVisible("DvImportSummary_Content","S");
        }
        if(WhichGrid=="1")
        {
            VisibleInVisible("DvMissingProduct_Lable","S");
            VisibleInVisible("DvMissingProduct_Content","S");
        }
        if(WhichGrid=="2")
        {
            VisibleInVisible("DvMissingClient_Lable","S");
            VisibleInVisible("DvMissingClient_Content","S");
        }
         
      height();
      
    }
    function OnComboChooseFileIndexChange()
    {
        var SelectedValue=cComboChooseFile.GetValue();
        if(SelectedValue==0)
            Span_FileFormat.innerText="File Name : YYYYMMDD_trdcsv.csv";
        else
            Span_FileFormat.innerText="File Name : YYYYMMDD_poscsv.csv";
        //Reset ComboReImpOrDel & BtnSave
        cComboReImpOrDel.SetSelectedIndex(0);
        SetValue("BtnSave","Import File");
    }
    function OnComboReImpOrDelIndexChange()
    {
        var SelectedValue=cComboReImpOrDel.GetValue();
        var ComboChooseFile_SelectedValue=cComboChooseFile.GetValue();
        if(SelectedValue=="0")
        {
            SetValue("BtnSave","Import File");
        }
        else if(SelectedValue=="1")
        {
                SetValue("BtnSave","ReImport File");
        }
        else
        {
                SetValue("BtnSave","Delete From File");
        }
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
                                    Imports Orinet Futures's YYYYMMDD_trdcsv. csv Trade Files
                                </h5>
                            </td>
                        </tr>
                        <tr>
                            <td class="lt brdr">
                                <table style="width: 466px" border="1">
                                    <tr>
                                        <td style="width: 100px">
                                            <dxe:ASPxComboBox ID="ComboChooseFile" runat="server" ClientInstanceName="cComboChooseFile"
                                                Font-Size="10px" SelectedIndex="0" ValueType="System.String" Width="250px" EnableIncrementalFiltering="True">
                                                <Items>
                                                    <dxe:ListEditItem Value="0" Text="Daily Trades"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Value="1" Text="Algo Trade CSV Files"></dxe:ListEditItem>
                                                </Items>
                                                <ClientSideEvents SelectedIndexChanged="OnComboChooseFileIndexChange" />
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top;">
                                            <asp:FileUpload ID="OFDSelectFile" runat="server" Width="362px" />
                                            <span id="Span_FileFormat" style="font-size: 15px; font-style: italic"></span>
                                        </td>
                                        <td style="vertical-align: top;">
                                            <dxe:ASPxComboBox ID="ComboReImpOrDel" runat="server" ClientInstanceName="cComboReImpOrDel"
                                                Font-Size="10px" SelectedIndex="0" ValueType="System.String" Width="100%" EnableIncrementalFiltering="True">
                                                <Items>
                                                    <dxe:ListEditItem Value="0" Text="Import"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Value="1" Text="ReImport"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Value="2" Text="Delete"></dxe:ListEditItem>
                                                </Items>
                                                <ClientSideEvents SelectedIndexChanged="OnComboReImpOrDelIndexChange" />
                                            </dxe:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: right">
                                            <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click"
                                                Width="25%" /></td>
                                    </tr>
                                </table>
                                <div id="DvImportSummary_Lable" class="Lable">Import Summary</div>
                                <div id="DvImportSummary_Content" class="Content">
                                    <dxwgv:ASPxGridView ID="GvImportSummary" runat="server"  ClientInstanceName="cGvImportSummary"
                                        Width="99%" AccessibilityCompliant="True">
                                        <%--<ClientSideEvents EndCallback="function(s, e) {GvImportDetail_EndCallBack();}" />--%>
                                        <SettingsLoadingPanel ImagePosition="Right" Text="Please Wait...&amp;hellip;" />
                                    </dxwgv:ASPxGridView>
                                </div>
                                <div id="DvMissingProduct_Lable" class="Lable">Following Clients/Terminal Ids Are Missing.Please Register And ReImport.</div>
                                <div id="DvMissingProduct_Content" class="Content">
                                    <dxwgv:ASPxGridView ID="GvMissingProducts" runat="server"  ClientInstanceName="cGvMissingProducts"
                                        Width="99%" AccessibilityCompliant="True">
                                        <%--<ClientSideEvents EndCallback="function(s, e) {GvImportDetail_EndCallBack();}" />--%>
                                        <SettingsLoadingPanel ImagePosition="Right" Text="Please Wait...&amp;hellip;" />
                                    </dxwgv:ASPxGridView>
                                </div>
                                <div id="DvMissingClient_Lable" class="Lable">Following Assets Are Missing.Please Map And ReImport.</div>
                                <div id="DvMissingClient_Content" class="Content">
                                    <dxwgv:ASPxGridView ID="GvMissingClients" runat="server"  ClientInstanceName="cGvMissingClients"
                                        Width="99%" AccessibilityCompliant="True">
                                        <%--<ClientSideEvents EndCallback="function(s, e) {GvImportDetail_EndCallBack();}" />--%>
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
