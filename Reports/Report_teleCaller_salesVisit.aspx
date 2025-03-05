<%@ page language="C#" autoeventwireup="true" inherits="Reports_Report_teleCaller_salesVisit, App_Web_nguyhzf5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList.Export" TagPrefix="dxwtl" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
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
        {
            window.frameElement.height = document.body.scrollHeight;
        }
        else
        {
            window.frameElement.height = '350px';
        }
        window.frameElement.widht = document.body.scrollWidht;
     }
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
       <table class="TableMain100">
        <tr>
            <td class="EHEADER" colspan="4" style="text-align:center;">
                <strong><span style="color: #000099">Sales Visit Report</span></strong>
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top; text-align:left;">
            <asp:Panel ID="pnl" BorderColor="blue" BorderWidth="0px" runat="server" Width="100%">
                <table class="TableMain100">
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" BorderColor="white" BorderWidth="1px" runat="server" Width="100%">
                            <table>
                                <tr>
                                    <td class="gridcellleft" >
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate"
                                            Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!"></asp:RequiredFieldValidator></td>
                                    <td class="gridcellleft">
                                    </td>
                                    <td class="gridcellright">
                                    </td>
                                    <td class="gridcellleft">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="gridcellleft" valign="middle">
                                        <dxe:ASPxDateEdit ID="txtFromDate" runat="server" EditFormat="Custom" EditFormatString="dd MMMM yyyy" UseMaskBehavior="True">
                                                        <ButtonStyle Width="13px">
                                                        </ButtonStyle>
                                            <DropDownButton Text="From Date">
                                            </DropDownButton>
                                        </dxe:ASPxDateEdit>
                                       </td>
                                    <td class="gridcellleft" valign="middle">
                                        <dxe:ASPxDateEdit ID="txtToDate" runat="server" EditFormat="Custom" EditFormatString="dd MMMM yyyy" UseMaskBehavior="True">
                                                        <ButtonStyle Width="13px">
                                                        </ButtonStyle>
                                            <DropDownButton Text="To Date">
                                            </DropDownButton>
                                        </dxe:ASPxDateEdit>
                                        
                                    </td>
                                    <td class="gridcellright">
                                        <span style="color: #000099">Report Type:</span></td>
                                    <td class="gridcellleft">
                                        <dxe:ASPxRadioButtonList ID="RBReportType" runat="server" CssPostfix="BlackGlass" RepeatDirection="Horizontal" Height="2px" SelectedIndex="0" TextSpacing="3px">
                                            <Items>
                                                    <dxe:ListEditItem Text="Screen" Value="Screen" />
                                                    <dxe:ListEditItem Text="Print" Value="Print" />
                                            </Items>
                                            <ValidationSettings ErrorText="Error has occurred">
                                                <ErrorImage Height="14px" Width="14px" />
                                            </ValidationSettings>
                                            </dxe:ASPxRadioButtonList>
                                        </td>
                                        <td style="height: 25px">
                                            <dxe:ASPxButton ID="btnShowReport" runat="server" Text="Show" Height="5px" Width="82px" OnClick="btnShowReport_Click">
                                            </dxe:ASPxButton>
                                        </td>
                                </tr>
                               
                            </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align:bottom">
                            <table id="tblExport" runat="server">
                                            <tr>
                                                <td style="text-align: right; vertical-align:bottom">
                                                    <dxe:ASPxButton ID="btnExpandAll" runat="server" Text="Expand All" Height="20px" AutoPostBack="false" Font-Size="10px">
                                                        <ClientSideEvents Click="function(s, e) {
                                                                                 List.ExpandAll();
                                                                             }" />

                                                    </dxe:ASPxButton>
                                                </td>
                                                <td style="text-align: center vertical-align:bottom">
                                                    <dxe:ASPxButton ID="btnCollapsAll" runat="server" Text="Collaps All" Height="11px" AutoPostBack="false" Font-Size="10px">
                                                    <ClientSideEvents Click="function(s, e) {
                                                                                 List.CollapseAll();
                                                                             }" />
                                                    </dxe:ASPxButton>
                                                </td>
                                                <td style=" vertical-align:bottom">
                                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" ValueType="System.String" Height="17px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged" SelectedIndex="0" AutoPostBack="true" Font-Overline="False" Font-Size="10px">
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
                    <tr>
                        <td>
                            <dxwtl:ASPxTreeList ID="TLTeleSalesvisit" ClientInstanceName="List" runat="server" KeyFieldName="User_ID" ParentFieldName="User_ParentId" Width="100%" AutoGenerateColumns="False">
                                <Columns>
                                    <dxwtl:TreeListTextColumn Caption="User" FieldName="User" VisibleIndex="0">
                                    </dxwtl:TreeListTextColumn>
                                    <dxwtl:TreeListTextColumn Caption="total Lead/ Name" FieldName="LeadName" VisibleIndex="1">
                                    </dxwtl:TreeListTextColumn>
                                    <dxwtl:TreeListTextColumn Caption="Visit Date" FieldName="VisitDate" VisibleIndex="2">
                                    </dxwtl:TreeListTextColumn>
                                    <dxwtl:TreeListTextColumn Caption="Visit Place" FieldName="VisitPlace" VisibleIndex="3">
                                        <CellStyle Wrap="True">
                                        </CellStyle>
                                    </dxwtl:TreeListTextColumn>
                                    <dxwtl:TreeListTextColumn Caption="Status" FieldName="Status" VisibleIndex="4">
                                        <CellStyle Wrap="True">
                                        </CellStyle>
                                    </dxwtl:TreeListTextColumn>
                                </Columns>
                                <Settings GridLines="Both" SuppressOuterGridLines="True" ShowGroupFooter="True" />
                                <Images>
                                    <ExpandedButton Height="11px"
                                        Width="11px" />
                                    <CustomizationWindowClose Height="12px" Width="13px" />
                                    <CollapsedButton Height="11px"
                                        Width="11px" />
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
                        <td>
                            <dxwtl:ASPxTreeListExporter ID="ASPxTreeListExporter1" runat="server">
                            </dxwtl:ASPxTreeListExporter>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
