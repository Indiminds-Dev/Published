<%@ page language="C#" autoeventwireup="true" inherits="management_frmcdslBodisplay, App_Web_e158i_8t" %>

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
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Indivuduals</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">

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
      function OnMoreInfoClick(keyValue )
       {
         var qrStr=window.location .search ;
         var spQrStr=qrStr.substring(1); 
         var srtArray=keyValue.split(","); 
         var url='CdslClient_general.aspx?&Id='+srtArray[0];
         parent.OnMoreInfoClick(url, srtArray[1]+'('+srtArray[0]+')' +"'s CDSL Details",'980px','480px',"Y");
       }
      function ShowHideFilter(obj)
       {
         grid.PerformCallback(obj);
       }
        </script>

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099" runat="server" id="s1">Depository Participants</span></strong></td>
            </tr>
            <tr>
                <td>
                    <table width="100%">
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
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="gridProduct" runat="server" ClientInstanceName="grid" OnCustomCallback="gridEquity_CustomCallback"
                        Width="100%" KeyFieldName="CdslClients_BOID" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles>
                            <Header SortingImageSpacing="5px" ImageSpacing="5px" BackColor="#8EB3E7">
                            </Header>
                            <FocusedGroupRow CssClass="gridselectrow">
                            </FocusedGroupRow>
                            <FocusedRow CssClass="gridselectrow">
                            </FocusedRow>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="CdslClients_BenAccountNumber" Caption="Account No."
                                VisibleIndex="0">
                                <Settings AutoFilterCondition="Contains"></Settings>
                                <CellStyle HorizontalAlign="Left" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CdslClients_FirstHolderName" Caption="Name"
                                VisibleIndex="1">
                                <CellStyle HorizontalAlign="Left" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CdslClients_FirstHolderPAN" Caption="Pan"
                                VisibleIndex="2">
                                <CellStyle HorizontalAlign="Left" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CdslClients_UniqueIdentification" Caption="UID"
                                VisibleIndex="3">
                                <CellStyle HorizontalAlign="Left" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CdslClients_TradingUCC" Caption="Trading UCC"
                                VisibleIndex="4">
                                <CellStyle HorizontalAlign="Left" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="branch" Caption="Branch" VisibleIndex="5">
                                <CellStyle HorizontalAlign="Left" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CdslClients_AccountOpeningDate" UnboundType="DateTime"
                                Caption="A/C Opening" VisibleIndex="6">
                                <PropertiesTextEdit DisplayFormatString="{0:dd MMM yyy}">
                                </PropertiesTextEdit>
                                <Settings SortMode="Value"></Settings>
                                <CellStyle HorizontalAlign="Left" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CdslClients_AccountClosSuspDate" UnboundType="DateTime"
                                Caption="A/C Closing" VisibleIndex="7">
                                <PropertiesTextEdit DisplayFormatString="{0:dd MMM yyy}">
                                </PropertiesTextEdit>
                                <Settings SortMode="Value"></Settings>
                                <CellStyle HorizontalAlign="Left" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CdslClients_AccountStatus" Caption="Status"
                                VisibleIndex="8">
                                <CellStyle HorizontalAlign="Left" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="9">
                                <EditFormSettings Visible="False"></EditFormSettings>
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue+","+    Eval("CdslClients_FirstHolderName") %>')">
                                        Show</a>
                                </DataItemTemplate>
                                <CellStyle HorizontalAlign="Left" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowStatusBar="Visible" ShowGroupPanel="True" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                        SelectCommand="SP_CdslClientsDisplay" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="All" Name="type" QueryStringField="type" 
                                Type="String" />
                            <asp:SessionParameter Name="branch" SessionField="userbranchHierarchy" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
