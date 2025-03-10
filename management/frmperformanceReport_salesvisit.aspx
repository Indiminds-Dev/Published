<%@ page language="C#" autoeventwireup="true" inherits="management_frmperformanceReport_salesvisit, App_Web_6bj03ldo" %>

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
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
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
            <td class="EHEADER" colspan="4" style="text-align:center;">
                <strong><span style="color: #000099">Performance Report Sales</span></strong>
            </td>
        </tr>
        <tr>
            <td>
            <asp:Panel ID="pnl" BorderColor="white" BorderWidth="1px" runat="server">
                <table>
                    <tr>
                        <td class="gridcellleft">
                            <dxe:ASPxDateEdit ID="txtFromDate" runat="server" UseMaskBehavior="True" EditFormat="Custom">
                                                        <ButtonStyle Width="13px">
                                                        </ButtonStyle>
                                <DropDownButton Text="From Date" Position="Left">
                                </DropDownButton>
                                                    </dxe:ASPxDateEdit>
                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate"
                                Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!"></asp:RequiredFieldValidator>
                        </td>
                        <td class="gridcellleft">
                            <dxe:ASPxDateEdit ID="txtToDate" runat="server" UseMaskBehavior="True" EditFormat="Custom">
                                                        <ButtonStyle Width="13px">
                                                        </ButtonStyle>
                                <DropDownButton Text="To Date" Position="Left">
                                </DropDownButton>
                                                    </dxe:ASPxDateEdit>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtToDate"
                                Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!"></asp:RequiredFieldValidator></td>
                        <td class="gridcellleft">
                            <asp:Button ID="btnGetReport" runat="server" Text="Get Report"  CssClass="btnUpdate" Height="19px" Font-Size="10px" OnClick="btnGetReport_Click"/></td>
                        <td class="gridcellleft">
                <table>
                    <tr>
                        <td colspan="4" class="gridcellright">
                            <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ASPxComboBox1_SelectedIndexChanged" ValueType="System.String">
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
                </table>
            </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <dxwtl:ASPxTreeList ID="TLLead" runat="server" AutoGenerateColumns="False" KeyFieldName="User_ID" ParentFieldName="User_ParentId"
                    Font-Size="10px" Width="100%">
                    <Columns>
                        <dxwtl:TreeListTextColumn Caption="User" FieldName="User" VisibleIndex="0">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Alotd. (New)" FieldName="Alotd" VisibleIndex="1">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Contctd" FieldName="Contctd" VisibleIndex="2">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Visits(T)" FieldName="VisitsT" VisibleIndex="3">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Visits(U)" FieldName="VisitsU" VisibleIndex="4">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Calls(T)" FieldName="CallsT" VisibleIndex="5">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Calls(U)" FieldName="CallsU" VisibleIndex="6">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Pending" FieldName="Pending" VisibleIndex="7">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Refix" FieldName="Refix" VisibleIndex="8">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Call Back" FieldName="CallBack" VisibleIndex="9">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Convrtd" FieldName="Convrtd" VisibleIndex="10">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Lost" FieldName="Lost" VisibleIndex="11">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Non Contctble" FieldName="NonContactble" VisibleIndex="12">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Non -usable / Fake" FieldName="Nonusable/Fake" VisibleIndex="13">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Contblty. (%)" FieldName="Contblty" VisibleIndex="14">
                        </dxwtl:TreeListTextColumn>
                        <dxwtl:TreeListTextColumn Caption="Conv. (%)" FieldName="Conv" VisibleIndex="15">
                        </dxwtl:TreeListTextColumn>
                    </Columns>
                    <Summary>
                        <dxwtl:TreeListSummaryItem FieldName="Alotd" ShowInColumn="Alotd" SummaryType="Sum" DisplayFormat="{0:n0}" />
                        <dxwtl:TreeListSummaryItem FieldName="Contctd" ShowInColumn="Contctd" SummaryType="Sum" DisplayFormat="{0:n0}" />
                        <dxwtl:TreeListSummaryItem FieldName="VisitsT" ShowInColumn="VisitsT" SummaryType="Sum" DisplayFormat="{0:n0}" />
                        <dxwtl:TreeListSummaryItem FieldName="VisitsU" ShowInColumn="VisitsU" SummaryType="Sum" DisplayFormat="{0:n0}" />
                        <dxwtl:TreeListSummaryItem FieldName="CallsT" ShowInColumn="CallsT" SummaryType="Sum" DisplayFormat="{0:n0}" />
                        <dxwtl:TreeListSummaryItem FieldName="CallsU" ShowInColumn="CallsU" SummaryType="Sum" DisplayFormat="{0:n0}" />
                        <dxwtl:TreeListSummaryItem FieldName="Pending" ShowInColumn="Pending" SummaryType="Sum" DisplayFormat="{0:n0}" />
                        <dxwtl:TreeListSummaryItem FieldName="Refix" ShowInColumn="Refix" SummaryType="Sum" DisplayFormat="{0:n0}" />
                        <dxwtl:TreeListSummaryItem FieldName="CallBack" ShowInColumn="CallBack" SummaryType="Sum" DisplayFormat="{0:n0}" />
                        <dxwtl:TreeListSummaryItem FieldName="Convrtd" ShowInColumn="Convrtd" SummaryType="Sum" DisplayFormat="{0:n0}" />
                        <dxwtl:TreeListSummaryItem FieldName="Lost" ShowInColumn="Lost" SummaryType="Sum" DisplayFormat="{0:n0}" />
                        <dxwtl:TreeListSummaryItem FieldName="NonContactble" ShowInColumn="NonContactble" SummaryType="Sum" DisplayFormat="{0:n0}" />
                        <dxwtl:TreeListSummaryItem FieldName="Nonusable/Fake" ShowInColumn="Nonusable/Fake" SummaryType="Sum" DisplayFormat="{0:n0}" />
                    </Summary>
                    <Styles>
                        <FooterCell HorizontalAlign="Center">
                        </FooterCell>
                        <GroupFooterCell HorizontalAlign="Center"></GroupFooterCell>
                    </Styles>
                    <Settings SuppressOuterGridLines="True" GridLines="Both" ShowGroupFooter="True" />
                    <Images>
                        <ExpandedButton Height="11px"
                            Width="11px" />
                        <CustomizationWindowClose Height="12px" Width="13px" />
                        <CollapsedButton Height="11px" Width="11px" />
                    </Images>
                    <SettingsPager>
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                    </SettingsPager>
                </dxwtl:ASPxTreeList>
                
            </td>
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
