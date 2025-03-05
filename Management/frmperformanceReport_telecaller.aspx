<%@ page language="C#" autoeventwireup="true" inherits="management_frmperformanceReport_telecaller, App_Web_im-ehkhh" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList.Export" TagPrefix="dxwtl" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

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
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="4" style="text-align: center;">
                        <strong><span style="color: #000099">Performance Report Sales</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnl" BorderColor="white" BorderWidth="1px" runat="server">
                            <table>
                                <tr>
                                    <td class="gridcellleft">
                                        <dxe:ASPxDateEdit ID="txtFromDate" runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                            <DropDownButton Text="From Date">
                                            </DropDownButton>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td class="gridcellleft">
                                        <dxe:ASPxDateEdit ID="txtToDate" runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                            <DropDownButton Text="To Date">
                                            </DropDownButton>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:Button ID="btnGetReport" runat="server" Text="Get Report" CssClass="btnUpdate"
                                            Height="19px" Font-Size="10px" OnClick="btnGetReport_Click" /></td>
                                    <td class="gridcellleft">
                                        <table id="tblExportV" runat="server">
                                            <tr>
                                                <td colspan="4" class="gridcellright">
                                                    <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ASPxComboBox1_SelectedIndexChanged"
                                                        ValueType="System.String">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Select" Value="" />
                                                            <dxe:ListEditItem Text="Pdf" Value="Pdf" />
                                                            <dxe:ListEditItem Text="Xls" Value="Xls" />
                                                            <dxe:ListEditItem Text="Rtf" Value="Rtf" />
                                                        </Items>
                                                        <DropDownButton Text="Export">
                                                        </DropDownButton>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="gridcellleft">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate"
                                            Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!"></asp:RequiredFieldValidator></td>
                                    <td class="gridcellleft">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtToDate"
                                            Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!"></asp:RequiredFieldValidator></td>
                                    <td class="gridcellleft">
                                    </td>
                                    <td class="gridcellleft">
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <dxwtl:ASPxTreeList ID="TLLead" runat="server" AutoGenerateColumns="False" KeyFieldName="User_ID"
                            ParentFieldName="User_ParentId" OnHtmlRowPrepared="TLLead_HtmlRowPrepared" Width="100%">
                            <Columns>
                                <dxwtl:TreeListTextColumn Caption="Caller" FieldName="Caller" VisibleIndex="0">
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Total Calls" FieldName="TotalCalls" VisibleIndex="1">
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Call Back" FieldName="CallBack" VisibleIndex="2">
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Sales Visit" FieldName="SalesVisit" VisibleIndex="3">
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Confirm Sales" FieldName="ConfirmSales" VisibleIndex="4">
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Not Interested" FieldName="NotInterested" VisibleIndex="5">
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Non Contactable" FieldName="NonContactable" VisibleIndex="6">
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Non Usabled" FieldName="NonUsabled" VisibleIndex="7">
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Contactiblity(%)" FieldName="Contactiblity" VisibleIndex="8">
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Effectiveness" FieldName="Effectiveness" VisibleIndex="9">
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Avg. Times(min)" FieldName="Avg" VisibleIndex="10">
                                </dxwtl:TreeListTextColumn>
                            </Columns>
                            <Summary>
                                <dxwtl:TreeListSummaryItem FieldName="TotalCalls" ShowInColumn="TotalCalls" SummaryType="Sum"
                                    DisplayFormat="{0:n0}" />
                                <dxwtl:TreeListSummaryItem FieldName="CallBack" ShowInColumn="CallBack" SummaryType="Sum"
                                    DisplayFormat="{0:n0}" />
                                <dxwtl:TreeListSummaryItem FieldName="SalesVisit" ShowInColumn="SalesVisit" SummaryType="Sum"
                                    DisplayFormat="{0:n0}" />
                                <dxwtl:TreeListSummaryItem FieldName="ConfirmSales" ShowInColumn="ConfirmSales" SummaryType="Sum"
                                    DisplayFormat="{0:n0}" />
                                <dxwtl:TreeListSummaryItem FieldName="NotInterested" ShowInColumn="NotInterested"
                                    SummaryType="Sum" DisplayFormat="{0:n0}" />
                                <dxwtl:TreeListSummaryItem FieldName="NonContactable" ShowInColumn="NonContactable"
                                    SummaryType="Sum" DisplayFormat="{0:n0}" />
                                <dxwtl:TreeListSummaryItem FieldName="NonUsabled" ShowInColumn="NonUsabled" SummaryType="Sum"
                                    DisplayFormat="{0:n0}" />
                            </Summary>
                            <Styles>
                                <GroupFooterCell HorizontalAlign="Center" VerticalAlign="Middle">
                                </GroupFooterCell>
                                <FooterCell HorizontalAlign="Center">
                                </FooterCell>
                            </Styles>
                            <Settings GridLines="Both" ShowGroupFooter="True" />
                            <Images>
                                <ExpandedButton Height="11px" Width="11px" />
                                <CustomizationWindowClose Height="12px" Width="13px" />
                                <CollapsedButton Height="11px" Width="11px" />
                            </Images>
                            <SettingsPager ShowSeparators="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                        </dxwtl:ASPxTreeList>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <dxwtl:ASPxTreeListExporter ID="ASPxTreeListExporter1" runat="server" TreeListID="TLLead">
                        </dxwtl:ASPxTreeListExporter>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
