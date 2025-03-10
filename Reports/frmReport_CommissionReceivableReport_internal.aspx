<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_CommissionReceivableReport_internal, App_Web_cnvbs8pk" %>

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
            var Fdate=document.getElementById("hdFdate").value;
            var Tdate=document.getElementById("hdTdate").value;
            var CompIDL=document.getElementById("hdCompany").value;
            var url = "frmReport_CommissionReceivableReport_internal.aspx?ProdID="+CompID+"&CompID="+CompIDL+"&CompName="+CompName+"&Fdate="+Fdate+"&Tdate="+Tdate+"&Type=Client";
            //alert(url);
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
        function CloseWindow()
        {
            parent.popup.Hide();
        }
    </script>

</head>
<body onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain10">
            <tr>
                <td>
                    <table class="TableMain10">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCompany" runat="server" ForeColor="#0000C0"></asp:Label>
                                        </td>
                                        <td class="gridcellleft">
                                            From date:&nbsp;<asp:Label ID="lblFromDate" runat="server" ForeColor="#0000C0"></asp:Label>
                                        </td>
                                        <td class="gridcellleft">
                                            To date:&nbsp;<asp:Label ID="lblToDate" runat="server" ForeColor="#0000C0"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="text-align: right">
                                <table>
                                    <tr>
                                        <td>
                                            <a id="refresh" href="javascript:location.reload(true)"><span style="color: #3300cc; text-decoration: underline;
                                                cursor: pointer;">Refresh</span></a>&nbsp;|&nbsp;
                                        </td>
                                        <td>
                                            <a id="WinClose" onclick="CloseWindow();"><span style="color: #3300cc; text-decoration: underline;
                                                cursor: pointer;">Close Window</span></a>
                                        </td>
                                    </tr>
                                </table>
                                
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="grdInsuranceCommission" runat="server" ClientInstanceName="grid"
                        KeyFieldName="ID" AutoGenerateColumns="False" OnCustomCallback="grdInsuranceCommission_CustomCallback">
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
                                VisibleIndex="4">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Trail Commission" FieldName="TrailCommission"
                                VisibleIndex="5">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="Received Commission" FieldName="RecCommission"
                                VisibleIndex="6">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="7">
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
                        <Settings ShowTitlePanel="false" />
                    </dxwgv:ASPxGridView>
                    <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="" CloseAction="CloseButton"
                        Left="0" ClientInstanceName="popup" Height="300px" Width="800px" HeaderText="Commission Details"
                        AllowDragging="True" AllowResize="True" EnableViewState="False" DragElement="Window">
                        <ContentCollection>
                            <dxpc:PopupControlContentControl runat="server">
                            </dxpc:PopupControlContentControl>
                        </ContentCollection>
                    </dxpc:ASPxPopupControl>
                    <asp:HiddenField ID="hdFdate" runat="server" />
                    <asp:HiddenField ID="hdTdate" runat="server" />
                    <asp:HiddenField ID="hdCompany" runat="server" />
                    <asp:HiddenField ID="hdType" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
