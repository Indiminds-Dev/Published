<%@ page language="C#" autoeventwireup="true" inherits="frmReport_courtesyCall, App_Web_eozuxu2i" %>

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
    <title>Courtesy call report</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    
        function SignOff()
        {
        window.parent.SignOff()
        }
        function height()
        {
            if(document.body.scrollHeight>=350)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '350px';
            window.frameElement.Width = document.body.scrollWidth;
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100" >
                <tr>
                    <td class="EHEADER" colspan="4" style="text-align:center;">
                        <strong><span style="color: #000099">Courtesy Call Report</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                         <asp:Panel ID="pnl" BorderColor="white" BorderWidth="1px" runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td align="left">
                                   
                                        <table>
                                            <tr>
                                                <td class="gridcellleft">
                                                    <dxe:ASPxDateEdit ID="txtFromDate" runat="server" UseMaskBehavior="True" EditFormat="Custom"
                                                        EditFormatString="dd MMMM yyyy">
                                                        <ButtonStyle Width="13px">
                                                        </ButtonStyle>
                                                        <DropDownButton Text="From Date">
                                                        </DropDownButton>
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td class="gridcellleft">
                                                    <dxe:ASPxDateEdit ID="txtToDate" runat="server" UseMaskBehavior="True" EditFormat="Custom"
                                                        EditFormatString="dd MMMM yyyy">
                                                        <ButtonStyle Width="13px">
                                                        </ButtonStyle>
                                                        <DropDownButton Text="To Date">
                                                        </DropDownButton>
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td class="gridcellleft">
                                                    <asp:Button ID="btnGetReport" runat="server" Text="Get Report" CssClass="btnUpdate"
                                                        Height="19px" Font-Size="10px" OnClick="btnGetReport_Click" /></td>
                                                <td align="right" class="gridcellleft">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate"
                                                        Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!"></asp:RequiredFieldValidator></td>
                                                <td class="gridcellright" align="left">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtToDate"
                                                        Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!"></asp:RequiredFieldValidator></td>
                                                <td class="gridcellright">
                                                </td>
                                                <td class="gridcellright">
                                                </td>
                                            </tr>
                                        </table>
                                  
                                    </td>
                                    <td align="right">
                                        <table>
                                            <tr>
                                                <td colspan="4">
                                                    <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ASPxComboBox1_SelectedIndexChanged"
                                                        ValueType="System.String" SelectedIndex="0" Font-Size="10px">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Select" Value="" />
                                                            <dxe:ListEditItem Text="Pdf" Value="Pdf" />
                                                            <dxe:ListEditItem Text="Xls" Value="Xls" />
                                                            <dxe:ListEditItem Text="Rtf" Value="Rtf" />
                                                        </Items>
                                                        <DropDownButton Text="Export">
                                                        </DropDownButton>
                                                        <ButtonStyle Width="13px">
                                                        </ButtonStyle>
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
                        <table id="ReportTable" runat="server" width="100%">
                            <tr>
                                <td style="text-align: right">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="text-align: left; vertical-align: top">
                                    <dxwtl:ASPxTreeList ID="TLCourtesy" runat="server" AutoGenerateColumns="False" KeyFieldName="User_ID"
                                        ParentFieldName="User_ParentId" Font-Size="10px" Width="100%">
                                        <Styles>
                                            <FooterCell HorizontalAlign="Center">
                                            </FooterCell>
                                            <GroupFooterCell HorizontalAlign="Center">
                                            </GroupFooterCell>
                                        </Styles>
                                        <Settings SuppressOuterGridLines="True" GridLines="Both" />
                                        <Columns>
                                            <dxwtl:TreeListTextColumn Caption="User" FieldName="User" VisibleIndex="0">
                                            </dxwtl:TreeListTextColumn>
                                            <dxwtl:TreeListTextColumn Caption="CrstyCall Date" FieldName="CrstyCallDate" VisibleIndex="1">
                                            </dxwtl:TreeListTextColumn>
                                            <dxwtl:TreeListTextColumn Caption="Tellecaller" FieldName="Tellecaller" VisibleIndex="2">
                                            </dxwtl:TreeListTextColumn>
                                            <dxwtl:TreeListTextColumn Caption="Lead Name" FieldName="LeadName" VisibleIndex="3">
                                            </dxwtl:TreeListTextColumn>
                                            <dxwtl:TreeListTextColumn Caption="Phone" FieldName="Phone" VisibleIndex="4">
                                            </dxwtl:TreeListTextColumn>
                                            <dxwtl:TreeListTextColumn Caption="Address" FieldName="Address" VisibleIndex="5">
                                            </dxwtl:TreeListTextColumn>
                                            <dxwtl:TreeListTextColumn Caption="Alloted User" FieldName="AllotedUser" VisibleIndex="6">
                                            </dxwtl:TreeListTextColumn>
                                            <dxwtl:TreeListTextColumn Caption="Visit Date" FieldName="VisitDate" VisibleIndex="7">
                                            </dxwtl:TreeListTextColumn>
                                            <dxwtl:TreeListTextColumn Caption="User Revert" FieldName="UserRevert" VisibleIndex="8">
                                            </dxwtl:TreeListTextColumn>
                                            <dxwtl:TreeListTextColumn Caption="CrtsyCall Feedback" FieldName="CrtsyCallFeedback"
                                                VisibleIndex="9">
                                            </dxwtl:TreeListTextColumn>
                                            <dxwtl:TreeListTextColumn Caption="History" FieldName="Convrtd" VisibleIndex="10">
                                                <DataCellTemplate>
                                                    <a href="javascript:loadNotes(<%# Eval("User_ID") %>)">History...</a>
                                                </DataCellTemplate>
                                            </dxwtl:TreeListTextColumn>
                                        </Columns>
                                    </dxwtl:ASPxTreeList>
                                </td>
                            </tr>
                        </table>
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
