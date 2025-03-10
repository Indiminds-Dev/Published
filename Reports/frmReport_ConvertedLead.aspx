<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_ConvertedLead, App_Web_a2csyl5x" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList.Export" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script language="javascript" type="text/javascript">
 function SignOff()
    {
    window.parent.SignOff()
    }
   function height()
        {
           
            if(document.body.scrollHeight>=350)
        {
            window.frameElement.height = document.body.scrollHeight;
        }
        else
        {
            window.frameElement.height = '350px';
        }
        window.frameElement.widht = document.body.scrollWidht;
           
           
//            window.frameElement.height = document.body.scrollHeight;
//            window.frameElement.widht = document.body.scrollWidht;
        }
//  function ShowGridFilter(obj)
//    {
//        var date1 = TxtToDate.GetDate();
//        var date2 = TxtFromDate.GetDate();
//           
//        if (date1== null && date2== null )
//                {
//            alert(" Please select Date.");
//                }
//        else
//                {
//                GridConvertedLead.PerformCallback(obj);
//                }
//  } 
//  function callback()
//        {
//            GridConvertedLead.PerformCallback();
//        } 
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="4" style="text-align: center;">
                        <strong><span style="color: #000099">Converted Leads</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="PnlDate" runat="server" BorderWidth="1px" BorderColor="white">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td class="gridcellleft" style="">
                                                                            <dxe:ASPxDateEdit ID="TxtFromDate" ClientInstanceName="TxtFromDate" UseMaskBehavior="True"
                                                                                runat="server" EditFormat="Custom" EditFormatString="dd MMMM yyyy">
                                                                                <ButtonStyle Width="13px">
                                                                                </ButtonStyle>
                                                                                <DropDownButton Text="From Date">
                                                                                </DropDownButton>
                                                                            </dxe:ASPxDateEdit>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtFromDate"
                                                                                Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                        <td class="gridcellleft" style="">
                                                                            <dxe:ASPxDateEdit ID="TxtToDate" ClientInstanceName="TxtToDate" UseMaskBehavior="True"
                                                                                runat="server" EditFormat="Custom" EditFormatString="dd MMMM yyyy">
                                                                                <ButtonStyle Width="13px">
                                                                                </ButtonStyle>
                                                                                <DropDownButton ImagePosition="Top" Text="To Date">
                                                                                </DropDownButton>
                                                                            </dxe:ASPxDateEdit>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtToDate"
                                                                                Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                        <td class="gridcellright">
                                                                            <span style="color: #000099">Report Type:</span></td>
                                                                        <td class="gridcellleft">
                                                                            <dxe:ASPxRadioButtonList ID="RBReportType" runat="server" RepeatDirection="Horizontal"
                                                                                Height="2px" SelectedIndex="0" TextSpacing="3px" CssPostfix="BlackGlass">
                                                                                <Items>
                                                                                    <dxe:ListEditItem Text="Screen" Value="Screen" />
                                                                                    <dxe:ListEditItem Text="Print" Value="Print" />
                                                                                </Items>
                                                                                <ValidationSettings ErrorText="Error has occurred">
                                                                                    <ErrorImage Height="14px" Width="14px" />
                                                                                </ValidationSettings>
                                                                            </dxe:ASPxRadioButtonList>
                                                                        </td>
                                                                        <td class="gridcellleft">
                                                                            <dxe:ASPxButton ID="btnShowReport" runat="server" Text="Show" Height="5px" Width="82px"
                                                                                OnClick="btnShowReport_Click" ValidationGroup="a">
                                                                                <Border BorderColor="White" />
                                                                                <%--<ClientSideEvents Click="function(s,e) { ShowGridFilter('All');}" />--%>
                                                                            </dxe:ASPxButton>
                                                                        </td>
                                                                        <td class="gridcellleft">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td aalign="right">
                                                                <table>
                                                                    <tr>
                                                                        <td style="text-align: right; vertical-align: bottom;" id="TdExport" runat="server">
                                                                            <table id="Table1" runat="server" style="">
                                                                                <tr style="vertical-align: bottom;">
                                                                                    <td style="vertical-align: middle">
                                                                                        <dxe:ASPxComboBox ID="cmbExport" runat="server" ValueType="System.String" Height="17px"
                                                                                            OnSelectedIndexChanged="cmbExport_SelectedIndexChanged" SelectedIndex="0" AutoPostBack="true"
                                                                                            Font-Overline="False" Font-Size="10px" Width="136px">
                                                                                            <ButtonStyle Width="13px">
                                                                                            </ButtonStyle>
                                                                                            <Items>
                                                                                                <dxe:ListEditItem Text="Select" Value="" />
                                                                                                <dxe:ListEditItem Text="Pdf" Value="Pdf" />
                                                                                                <dxe:ListEditItem Text="Xls" Value="Xls" />
                                                                                                <dxe:ListEditItem Text="Rtf" Value="Rtf" />
                                                                                            </Items>
                                                                                            <DropDownButton Text="Export" ToolTip="Export File">
                                                                                            </DropDownButton>
                                                                                        </dxe:ASPxComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top">
                        <table width="100%">
                            <%--  <tr>
                    <td style="vertical-align: top">
                    
                     <table style="width: 100%">
                                                            <tr>
                                                                <td style="text-align: left; vertical-align: top">
                                                                    <table>
                                                                        <tr>
                                                                            <td id="Td1">
                                                                                <a href="javascript:ShowGridFilter('All');"><span style="color: #000099; text-decoration: underline">
                                                                                    Show</span></a>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                    
                    </td>
                </tr>--%>
                            <tr>
                                <td style="vertical-align: top">
                                    <dxwgv:ASPxGridView ID="GridConvertedLead" runat="server" Width="100%">
                                        <Styles>
                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                            </Header>
                                            <LoadingPanel ImageSpacing="10px">
                                            </LoadingPanel>
                                        </Styles>
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="name" VisibleIndex="0">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Id" FieldName="cnt_internalid" VisibleIndex="1"
                                                Visible="False">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Total Leads" FieldName="Counmt" VisibleIndex="1">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Used" FieldName="Used" VisibleIndex="3">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Converted" FieldName="Converted" VisibleIndex="4">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Non Usable" FieldName="NonUsable" VisibleIndex="2">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager ShowSeparators="True">
                                            <FirstPageButton Visible="True">
                                            </FirstPageButton>
                                            <LastPageButton Visible="True">
                                            </LastPageButton>
                                        </SettingsPager>
                                    </dxwgv:ASPxGridView>
                                    <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                                    </dxwgv:ASPxGridViewExporter>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
