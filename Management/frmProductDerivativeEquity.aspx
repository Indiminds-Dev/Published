<%@ page language="C#" autoeventwireup="true" inherits="management_frmProductDerivativeEquity, App_Web_psdiigfa" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
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
    function OnMoreInfoClick(keyValue) 
    {
         var url='DetailsProductEquity.aspx?id='+keyValue;
         parent.OnMoreInfoClick(url,"Show Rates",'940px','450px',"Y");
    }
        function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Product Derivatives On Equity</span></strong></td>
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
                                <td class="gridcellright">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                        Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                        ValueType="System.Int32" Width="130px">
                                        <Items>
                                            <dxe:ListEditItem Text="Select" Value="0" />
                                            <dxe:ListEditItem Text="PDF" Value="1" />
                                            <dxe:ListEditItem Text="XLS" Value="2" />
                                            <dxe:ListEditItem Text="RTF" Value="3" />
                                            <dxe:ListEditItem Text="CSV" Value="4" />
                                        </Items>
                                        <ButtonStyle BackColor="#C0C0FF" ForeColor="Black">
                                        </ButtonStyle>
                                        <ItemStyle BackColor="Navy" ForeColor="White">
                                            <HoverStyle BackColor="#8080FF" ForeColor="White">
                                            </HoverStyle>
                                        </ItemStyle>
                                        <Border BorderColor="White" />
                                        <DropDownButton Text="Export">
                                        </DropDownButton>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="gridEquity" runat="server" Width="100%" KeyFieldName="ITEMCD"
                            AutoGenerateColumns="False" DataSourceID="sqlEquity" ClientInstanceName="grid"
                            OnCustomCallback="gridEquity_CustomCallback">
                            <Styles>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                            </Styles>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="DESCR" VisibleIndex="0">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="NSE Symbol" FieldName="NSE_ITEMCD" VisibleIndex="1">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Series" FieldName="NSE_SERIES" VisibleIndex="2">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="BSE Code" FieldName="BSE_ITNUM" VisibleIndex="3">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Instrument Type" FieldName="INSTR_TYPE" VisibleIndex="4">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Expiry" FieldName="EXP_DATE" ReadOnly="True"
                                    VisibleIndex="5">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Strike Price" FieldName="CONT_RATE" ReadOnly="True"
                                    VisibleIndex="6">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="7">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                            Show Rates</a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                            <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <StylesPager>
                                <Summary Width="100%">
                                </Summary>
                            </StylesPager>
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="sqlEquity" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="select ITEMCD,DESCR,NSE_ITEMCD,NSE_SERIES,BSE_ITNUM,INSTR_TYPE,case EXP_DATE when '1/1/1900 12:00:00 AM' then null else convert(varchar(11),EXP_DATE,113) end as EXP_DATE,case CONT_RATE when '0.00' then null else CONT_RATE end as CONT_RATE from master_ITCtemp where EXP_DATE<>'1/1/1900 12:00:00 AM'">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
        </div>
    </form>
</body>
</html>
