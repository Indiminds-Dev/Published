<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_SalesVisit_OverDue, App_Web_arnfzykg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

            <script language="javascript" type="text/javascript">
    FieldName='ctl00_ContentPlaceHolder3_TxtStartDate';
            </script>

            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;" colspan="4">
                        <strong><span style="color: #000099">Overdue Report</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel2" BorderColor="white" BorderWidth="1px" runat="server" Width="100%">
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <table class="TableMain100">
                                                        <tr>
                                                            <td class="gridcellright" valign="top" style="width: 66px; height: 25px;">
                                                                <span style="color: #000099">Report Type:</span></td>
                                                            <td class="gridcellleft" style="width: 125px; height: 25px;" valign="top">
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
                                                            <td style="height: 25px; text-align: left;" valign="top">
                                                                <dxe:ASPxButton ID="btnShowReport" runat="server" Text="Show" Height="5px" Width="82px"
                                                                    OnClick="btnShowReport_Click">
                                                                </dxe:ASPxButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right">
                                                    <table id="Table1" runat="server">
                                                        <tr>
                                                            <td style="text-align: right; vertical-align: bottom">
                                                                <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="Expand All" Height="20px" AutoPostBack="false"
                                                                    Font-Size="10px">
                                                                    <ClientSideEvents Click="function(s, e) {
                                                                                      List.ExpandAll();
                                                                                      }" />
                                                                </dxe:ASPxButton>
                                                            </td>
                                                            <td style="text-align: center vertical-align:bottom">
                                                                <dxe:ASPxButton ID="ASPxButton2" runat="server" Text="Collaps All" Height="11px"
                                                                    AutoPostBack="false" Font-Size="10px">
                                                                    <ClientSideEvents Click="function(s, e) {
                                                                                      List.CollapseAll();
                                                                                      }" />
                                                                </dxe:ASPxButton>
                                                            </td>
                                                            <td style="vertical-align: bottom">
                                                                <dxe:ASPxComboBox ID="cmbExport" runat="server" ValueType="System.String" Height="17px"
                                                                    OnSelectedIndexChanged="cmbExport_SelectedIndexChanged" SelectedIndex="0" AutoPostBack="true"
                                                                    Font-Overline="False" Font-Size="10px">
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
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel1" runat="server" Width="100%">
                                        <dxwtl:ASPxTreeList ID="TvoOverDue" runat="server" ClientInstanceName="List" Width="100%"
                                            KeyFieldName="ID" ParentFieldName="ParentID" AutoGenerateColumns="False">
                                            <Styles>
                                            </Styles>
                                            <Settings SuppressOuterGridLines="True" GridLines="Both" />
                                            <Images>
                                                <ExpandedButton Height="11px" Width="11px" />
                                                <CustomizationWindowClose Height="12px" Width="13px" />
                                                <CollapsedButton Height="11px" Width="11px" />
                                            </Images>
                                            <Columns>
                                                <dxwtl:TreeListTextColumn Caption="Name" FieldName="Name1" VisibleIndex="0">
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                </dxwtl:TreeListTextColumn>
                                                <dxwtl:TreeListTextColumn Caption="Visit DateTime" FieldName="Visit DateTime" VisibleIndex="1">
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                </dxwtl:TreeListTextColumn>
                                                <dxwtl:TreeListTextColumn Caption="ActivityType" FieldName="ActivityType" VisibleIndex="2">
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                </dxwtl:TreeListTextColumn>
                                                <dxwtl:TreeListTextColumn Caption="Address" FieldName="Address" VisibleIndex="3"
                                                    Width="30%">
                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                    </CellStyle>
                                                </dxwtl:TreeListTextColumn>
                                                <dxwtl:TreeListTextColumn Caption="PhoneNo" FieldName="PhoneNo" VisibleIndex="4">
                                                    <CellStyle CssClass="gridcellleft" Wrap="True">
                                                    </CellStyle>
                                                </dxwtl:TreeListTextColumn>
                                                <dxwtl:TreeListTextColumn Caption="LastOutCome" FieldName="LastOutCome" VisibleIndex="5">
                                                    <CellStyle CssClass="gridcellleft" Wrap="True">
                                                    </CellStyle>
                                                </dxwtl:TreeListTextColumn>
                                                <dxwtl:TreeListTextColumn Caption="Last Visit" FieldName="Last Visit" VisibleIndex="6">
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                </dxwtl:TreeListTextColumn>
                                            </Columns>
                                        </dxwtl:ASPxTreeList>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwtl:ASPxTreeListExporter ID="ASPxTreeListExporter1" runat="server">
                        </dxwtl:ASPxTreeListExporter>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
