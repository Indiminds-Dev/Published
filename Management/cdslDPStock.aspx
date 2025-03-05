<%@ page language="C#" autoeventwireup="true" inherits="management_cdslDPStock, App_Web_fxnvzv_8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
   <script language="javascript" type="text/javascript">
        function EndCall(obj)
        {
            height();
        }
        function callback()
        {
          grid.PerformCallback();
        }
       function SignOff()
        {
          window.parent.SignOff();
        }
        function height()
        {
            if(document.body.scrollHeight>=500)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '500px';
            window.frameElement.Width = document.body.scrollWidth;
        }
        function PageLoad()
        {
          QStrDpType = window.location.search;
        }
    
        function openPopup()
        {
        var url='frm_SlipBookStock.aspx'+QStrDpType;
        parent.OnMoreInfoClick(url,"Add DP Slips Stock",'940px','450px',"Y");
        }
        function RefreshGrid()
        {
          grid.PerformCallback();
        }
        function ShowHideFilter(obj)
        {
          grid.PerformCallback(obj);
        }
        
        </script>
 <table class="TableMain100">
        <tr>
            <td class="EHEADER" style="text-align:center ; vertical-align: top">
                            <span style="color: #3300cc"><strong>DP Slips Stock</strong></span>
                        </td>
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
<dxwgv:ASPxGridView ID="gridStcok" runat="server" ClientInstanceName="grid" KeyFieldName="DPSlipsStock_ID"  Width="100%"  AutoGenerateColumns="False" 
                     DataSourceID="SqlDataSource1" OnCustomCallback="gridStcok_CustomCallback" OnCustomJSProperties="gridStcok_CustomJSProperties" >
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles  >
<Header SortingImageSpacing="5px" ImageSpacing="5px" BackColor="#8EB3E7"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<Footer CssClass="gridfooter"></Footer>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
                    <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
                    <Columns>
<dxwgv:GridViewDataTextColumn FieldName="DPSlipsStock_DPID" Caption="DP ID" VisibleIndex="0">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="DPSlipsStock_SlipType" Caption="Slip Type" VisibleIndex="1">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="DPSlipsStock_Prefix" Caption="Slip Prefix" VisibleIndex="2">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="DPSlipsStock_BookFrom" Caption="Book From" VisibleIndex="3">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="DPSlipsStock_BookTo" Caption="Book To" VisibleIndex="4">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="DPSlipsStock_SlipFrom" Caption="Slip From" VisibleIndex="5">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="DPSlipsStock_SlipTo" Caption="Slip To" VisibleIndex="6">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>

</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="DPSlipsStock_Remarks" Caption="Remarks" VisibleIndex="7">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
<HeaderTemplate>
                                <center><a href="javascript:void(0);" onclick="openPopup()"><span  style="text-align: center;color: #000099;
                                    text-decoration: underline">    Add New</span></a></center>Remarks
                            
</HeaderTemplate>
</dxwgv:GridViewDataTextColumn>

</Columns>
                    <Settings ShowStatusBar="Visible" showfooter="True" />
                      <StylesEditors>
<ProgressBar Height="25px"></ProgressBar>
</StylesEditors>
                </dxwgv:ASPxGridView>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                    SelectCommand="cdslDpStockFetch" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="" Name="Dp" QueryStringField="type" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                  </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
