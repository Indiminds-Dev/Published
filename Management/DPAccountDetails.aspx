<%@ page language="C#" autoeventwireup="true" inherits="management_DPAccountDetails, App_Web_vvdfezxa" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <script language="javascript" type="text/javascript">
    function callback()
    {
       DPAccount_grid.PerformCallback();
       height();
    }
    function OnMoreInfoClick(keyValue) 
    {
         var url='DPAccount_general.aspx?id='+keyValue;
         parent.OnMoreInfoClick(url,"Modify DP Account Details",'940px','450px',"Y");
    }
    function wclose()
    {
       editwin.close(); 
       document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='visible';
       DPAccount_grid.PerformCallback();
    }
    function OnAddButtonClick() 
    {
         var url='DPAccount_general.aspx?id=' + 'ADD';
         parent.OnMoreInfoClick(url,"Add DP Account Details",'940px','450px',"Y");
    }
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=700)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '700px';
        window.frameElement.Width = document.body.scrollWidth +200;
    }
    function ShowHideFilter(obj)
    {
        DPAccount_grid.PerformCallback(obj);
    } 
   </script>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align:center;">
                    <strong><span style="color: #000099">DP Account Details</span></strong></td>
            </tr>
            <tr>
               <td style="text-align: left; vertical-align: top">
                                    <table>
                                        <tr>
                                            <td id="ShowFilter">
                                                <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                    Show Filter</span></a>
                                            </td>
                                            <td id="Td1">
                                                <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                                    All Records</span></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="DPAccount_grid" ClientInstanceName="DPAccount_grid" runat="server"
                        AutoGenerateColumns="False" Width="100%" KeyFieldName="DPAccounts_ID" DataSourceID="DPAccountDataSource" OnCustomCallback="DPAccount_grid_CustomCallback">
                        <Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px" HorizontalAlign="Left" Wrap="False" CssClass="gridheader"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<Cell HorizontalAlign="Left" Wrap="False"></Cell>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
                        <SettingsPager PageSize="20">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
                        <Columns>
<dxwgv:GridViewDataTextColumn FieldName="DPAccounts_ShortName" Caption="Account Short Name" VisibleIndex="0"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="DPAccounts_AccountType" Caption="Account Type" VisibleIndex="1"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="ExchangeSegment" Caption="Exchange Segment" VisibleIndex="2"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="DPName" Caption="DP Name" VisibleIndex="3"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="DPAccounts_ClientID" Caption="Client ID" VisibleIndex="4"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Width="5%" Caption="Details" VisibleIndex="5">
<EditFormSettings Visible="False"></EditFormSettings>
<DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                        More Info...</a>
                                
</DataItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="javascript:OnAddButtonClick();"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                
</HeaderTemplate>
</dxwgv:GridViewDataTextColumn>
</Columns>
                        <settings showgrouppanel="True"></settings>
                        <StylesEditors>
<ProgressBar Height="25px"></ProgressBar>
</StylesEditors>
                        <SettingsBehavior AllowFocusedRow="True" />
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="DPAccountDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
