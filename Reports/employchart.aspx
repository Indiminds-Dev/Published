<%@ page language="C#" autoeventwireup="true" inherits="Reports_employchart, App_Web_91unyima" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList.Export" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Organizational Hierarchy</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" language="javascript">
        function height()
        {
            if(document.body.scrollHeight>300)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '300px';
            window.frameElement.widht = document.body.scrollWidht;
        }
        function SignOff()
        {
            parent.window.SignOff();
        }
        function LastCall(obj)
        {
            height();
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100" cellpadding="opx" cellspacing="0px">
            <tr>
                <td class="EHEADER" style="text-align: center">
                    <strong><span style="color: #000099">organizational hierarchy</span></strong>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr style="display:none;">
                <td style="vertical-align: top; text-align: left;">
                    <asp:Panel ID="pnl" BorderColor="blue" BorderWidth="1px" runat="server" Visible="false">
                        <table>
                            <tr>
                                <td class="gridcellleft" style="width: 83px">
                                    <asp:TreeView ID="TVOrgHirchy" runat="server" ExpandDepth="0" ShowLines="True" ForeColor="Blue" OnSelectedNodeChanged="TVOrgHirchy_SelectedNodeChanged">
                                        <ParentNodeStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="Blue" />
                                        <LevelStyles>
                                            <asp:TreeNodeStyle Font-Underline="False" ForeColor="Blue" />
                                        </LevelStyles>
                                        <HoverNodeStyle ForeColor="Black" BackColor="WhiteSmoke" Font-Bold="True" />
                                        <SelectedNodeStyle ChildNodesPadding="1px" ForeColor="Blue" />
                                        <RootNodeStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="HotTrack" />
                                        <LeafNodeStyle ForeColor="Blue" />
                                        <NodeStyle ForeColor="Blue" />
                                    </asp:TreeView>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="TableMain100"  cellpadding="0px" cellspacing="0px">
                        <tr>
                            <td style="vertical-align: top;" class="gridcellcenter">
                                <table width="100%" cellpadding="0px" cellspacing="0px">
                                    <tr>
                                        <td class="gridcellleft" align="left">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxComboBox ID="cmbCompany" runat="server" ClientInstanceName="cmbCompany"
                                                            EnableIncrementalFiltering="True" Font-Bold="False" Font-Size="10px" ValueType="System.String" >
                                                            <ButtonStyle Width="13px">
                                                            </ButtonStyle>
                                                            <DropDownButton Text="Company">
                                                            </DropDownButton>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxComboBox ID="cmbBranch" runat="server" ClientInstanceName="cmbBranch" EnableIncrementalFiltering="True"
                                                            EnableTheming="False" Font-Overline="False" Font-Size="10px"  ValueType="System.String"
                                                            Width="130px">
                                                            <ButtonStyle Width="13px">
                                                            </ButtonStyle>
                                                            <DropDownButton Text="Branch" Width="40px">
                                                            </DropDownButton>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxButton ID="btnSubmit" runat="server" AutoPostBack="False" Text="Show" EnableClientSideAPI="true">
                                                            <ClientSideEvents Click="function(s, e) {
	                                                            List.PerformCallback('');
                                                            }" />
                                                        </dxe:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td class="gridcellright" align="right">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxButton ID="btnExpandAll" runat="server" Text="Expand All" 
                                                            AutoPostBack="false">
                                                            <ClientSideEvents Click="function(s, e) {
                                                                                 List.ExpandAll();
                                                                             }" />
                                                        </dxe:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxButton ID="btnCollapsAll" runat="server" Text="Collaps All" 
                                                            AutoPostBack="false">
                                                            <ClientSideEvents Click="function(s, e) {
                                                                                 List.CollapseAll();
                                                                             }" />
                                                        </dxe:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxComboBox ID="cmbExport" runat="server" ValueType="System.String" 
                                                            OnSelectedIndexChanged="cmbExport_SelectedIndexChanged" SelectedIndex="0" AutoPostBack="true" Width="103px" >
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
                        <tr>
                            <td class="gridcellcenter">
                                <dxwtl:ASPxTreeList ID="TVorgHir" ClientInstanceName="List" runat="server" KeyFieldName="ID"
                                    ParentFieldName="ParentID" OnCustomCallback="TVorgHir_CustomCallback" OnHtmlDataCellPrepared="TVorgHir_HtmlDataCellPrepared" AutoGenerateColumns="False" OnCustomJSProperties="TVorgHir_CustomJSProperties">
                                    <Settings SuppressOuterGridLines="True" GridLines="Both"></Settings>
                                    <Columns>
                                        <dxwtl:TreeListTextColumn Caption="Name[Company Name: Branch: Designation]" FieldName="Name"
                                            VisibleIndex="0">
                                            <CellStyle HorizontalAlign="Left">
                                            </CellStyle>
                                        </dxwtl:TreeListTextColumn>
                                    </Columns>
                                    <ClientSideEvents EndCallback="function(s, e) {
	LastCall(s.cpHeight);
}" />
                                    <Border BorderColor="Navy" BorderStyle="Solid" BorderWidth="1px" />
                                </dxwtl:ASPxTreeList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwtl:ASPxTreeListExporter ID="ASPxTreeListExporter1" runat="server" TreeListID="TVorgHir">
                    </dxwtl:ASPxTreeListExporter>
                </td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
