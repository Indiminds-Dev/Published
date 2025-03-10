<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_CommissionReceivableReport, App_Web_xpx38is4" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Commission Receivable Report</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" language="javascript">
        function OnDetailsClick(CompID,CompName)
        {
            var Fdate=(dtFromDate.GetDate().getMonth()+1)+'/'+dtFromDate.GetDate().getDate()+'/'+dtFromDate.GetDate().getYear();
            var Tdate=(dtToDate.GetDate().getMonth()+1)+'/'+dtToDate.GetDate().getDate()+'/'+dtToDate.GetDate().getYear();
            
            var url = "frmReport_CommissionReceivableReport_internal.aspx?CompID="+CompID+"&CompName="+CompName+"&Fdate="+Fdate+"&Tdate="+Tdate+"&Type=Prod";
            popup.SetContentUrl(url);
            popup.Show();
        }
        function height()
        {
            if(document.body.scrollHeight<=500)
                window.frameElement.height = '650px';
            else
                window.frameElement.height = document.body.scrollHeight;
            window.frameElement.Width = document.body.scrollWidth;
        }
        function FireHeight(obj)
        {
            height();
        }
        function btnShow_Click()
        {
            grid.PerformCallback();
        }
        function OpenPrintPage()
        {
            if(dtFromDate.GetDate() == null)
                alert('Please Select from date!');
            else
            {
                if(dtToDate.GetDate() == null)
                    alert('Please Select To date!');
                else
                {
                    var Fdate=(dtFromDate.GetDate().getMonth()+1)+'/'+dtFromDate.GetDate().getDate()+'/'+dtFromDate.GetDate().getYear();
                    var Tdate=(dtToDate.GetDate().getMonth()+1)+'/'+dtToDate.GetDate().getDate()+'/'+dtToDate.GetDate().getYear();
                    
                    var url = "frmReport_CommissionReceivableReport_print.aspx?Fdate="+Fdate+"&Tdate="+Tdate;
                    popup.SetContentUrl(url);
                    popup.Show();
                }
             }
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <table class="TableMain100">
            <tr>
                <td class="gridcellleft">
                    <table class="TableMain100">
                        <tr>
                            <td>
                                <table cellspacing="0px">
                                    <tr>
                                        <td class="gridcellleft">
                                            <dxe:ASPxDateEdit ID="dtFromDate" ClientInstanceName="dtFromDate" runat="server"
                                                EditFormat="Custom" UseMaskBehavior="True" TabIndex="1" Width="135px">
                                                <DropDownButton Text="From ">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td class="gridcellleft">
                                            <dxe:ASPxDateEdit ID="dtToDate" ClientInstanceName="dtToDate" runat="server" EditFormat="Custom"
                                                UseMaskBehavior="True" TabIndex="2" Width="135px">
                                                <DropDownButton Text="To">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td class="gridcellright">
                                            <input id="btnShow" type="button" value="Show" onclick="btnShow_Click()" class="btnUpdate" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <a id="Print" href="javascript:OpenPrintPage()"><span style="color: #3300cc; text-decoration: underline;
                                    cursor: pointer;">Print Preview</span></a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="gridcellcenter">
                    <dxwgv:ASPxGridView ID="grdInsuranceCommission" ClientInstanceName="grid" runat="server"
                        KeyFieldName="companiID" AutoGenerateColumns="False" OnCustomCallback="grdInsuranceCommission_CustomCallback"
                        OnCustomJSProperties="grdInsuranceCommission_CustomJSProperties">
                        <Styles>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <FocusedRow BackColor="#FEC6AB">
                            </FocusedRow>
                        </Styles>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Company" FieldName="company" VisibleIndex="0">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Total Premium" FieldName="PayedAmt" VisibleIndex="1">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Base Commission" FieldName="BaseCommission"
                                VisibleIndex="2">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="ORC Commission" FieldName="ORCCommission"
                                VisibleIndex="3">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="TopUp Commission" FieldName="TopUpCommission"
                                VisibleIndex="3">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Trail Commission" FieldName="TrailCommission"
                                VisibleIndex="3">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Received Commission" FieldName="RecCommission"
                                VisibleIndex="9">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="10">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnDetailsClick('<%# Container.KeyValue %>','<%#Eval("company") %>')">
                                        <u>Details</u> </a>
                                </DataItemTemplate>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <SettingsBehavior AllowFocusedRow="True" AllowSort="False" AllowMultiSelection="True" />
                        <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsText Title="Commission Receivable" />
                        <Settings ShowTitlePanel="True" />
                        <ClientSideEvents EndCallback="function(s, e) {
	FireHeight(grid.cpHeight);
}" />
                    </dxwgv:ASPxGridView>
                    <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="" CloseAction="CloseButton"
                        Left="10" ClientInstanceName="popup" Height="400px" Width="950px" HeaderText="Commission Details"
                        AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" EnableViewState="False"
                        RenderIFrameForPopupElements="True">
                        <ContentCollection>
                            <dxpc:PopupControlContentControl runat="server">
                            </dxpc:PopupControlContentControl>
                        </ContentCollection>
                    </dxpc:ASPxPopupControl>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
