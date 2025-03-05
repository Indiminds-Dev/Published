<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlCalendar_Show, App_Web_n3rnr3dz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
       <script language="javascript" type="text/javascript">
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
  function ShowHideFilter(obj)
   {
      grid.PerformCallback(obj);
    }
    </script>
      <table class="TableMain100" style="text-align:center;">
     <tr>
            <td class="EHEADER" >
                <strong><span style="color: #000099">Settlement Details</span></strong></td>
        </tr>
    <tr>
        <td>
            
            <table width="100%">
              <tr>
                 <td style="text-align:left; vertical-align:top">
                        <table>
                            <tr>
                                <td id="ShowFilter">
                                    <a  href="javascript:ShowHideFilter('s');" ><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a>
                                </td>
                               <td id="Td1">
                                    <a  href="javascript:ShowHideFilter('All');" ><span style="color: #000099; text-decoration: underline">
                                        All Records</span></a>
                                </td>
                            </tr>
                        </table>
                  </td>
                  <td>
                  </td>
                  
            </tr>
            </table>
        </td>
    </tr>
        <tr >
            <td>
                <dxwgv:ASPxGridView ID="gridProduct" runat="server" ClientInstanceName="grid" OnCustomCallback="gridEquity_CustomCallback" Width="100%" KeyFieldName="NsdlCalendar_ID" AutoGenerateColumns="False" 
                     DataSourceID="SqlDataSource1" >
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
                    <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
                    <Columns>
<dxwgv:GridViewDataTextColumn FieldName="NsdlCalendar_CCID" Caption="CC Id" VisibleIndex="0">
<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NsdlCalendar_MarketType" Caption="Market Type" VisibleIndex="1">
<Settings FilterMode="DisplayText"></Settings>

<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NsdlCalendar_SettlementNumber" Caption="Settlement Number" VisibleIndex="2">
<Settings FilterMode="DisplayText"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NsdlCalendar_SettlementFrom" Caption="Settlement From Date" VisibleIndex="3">
<Settings FilterMode="DisplayText"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NsdlCalendar_SettlementTo" Caption="Settlement To Date" VisibleIndex="4">
<Settings FilterMode="DisplayText"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NsdlCalendar_DeadlineDate" Caption="Deadline Date" VisibleIndex="5">
<Settings FilterMode="DisplayText"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NsdlCalendar_DeadlineTime" Caption="Deadline Time" VisibleIndex="6">
<Settings FilterMode="DisplayText"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NsdlCalendar_PayinDate" Caption="Payin Date" VisibleIndex="7">
<Settings FilterMode="DisplayText"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NsdlCalendar_PayoutDate" Caption="Payout Date" VisibleIndex="8">
<Settings FilterMode="DisplayText"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
</Columns>
                    <Settings ShowStatusBar="Visible" />
                    <StylesEditors>
<ProgressBar Height="25px"></ProgressBar>
</StylesEditors>
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                    SelectCommand="sp_ShowNsdlCalendar" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
