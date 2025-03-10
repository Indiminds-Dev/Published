<%@ page language="C#" autoeventwireup="true" inherits="management_frm_MyTeam, App_Web_v5pngf_u" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList.Export" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
     function LastCall(obj)
        {
            height();
        }
    function height()
    {
        if(document.body.scrollHeight>300)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '300px';
        window.frameElement.widht = document.body.scrollWidht;
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="gridcellcenter">
                    <table>
                        <tr>
                            <td>
                                <dxe:ASPxButton ID="btnExpandAll" runat="server" Text="Expand All" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {
                                                                                 List.ExpandAll();
                                                                             }" />
                                </dxe:ASPxButton>
                            </td>
                            <td>
                                <dxe:ASPxButton ID="btnCollapsAll" runat="server" Text="Collaps All" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {
                                                                                 List.CollapseAll();
                                                                             }" />
                                </dxe:ASPxButton>
                            </td>
                            <td>
                                <dxe:ASPxComboBox ID="cmbExport" runat="server" ValueType="System.String" SelectedIndex="0"
                                    AutoPostBack="true" Width="103px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged">
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
                        <tr>
                            <td>
                                <dxwtl:ASPxTreeListExporter ID="ASPxTreeListExporter1" runat="server" TreeListID="TVorgHir">
                                </dxwtl:ASPxTreeListExporter>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="gridcellcenter">
                    <dxwtl:ASPxTreeList ID="TVorgHir" runat="server" ClientInstanceName="List" AutoGenerateColumns="False"
                        ParentFieldName="ParentID" KeyFieldName="ID">
                        <Settings SuppressOuterGridLines="True" GridLines="Both"></Settings>
                        <Columns>
                            <dxwtl:TreeListTextColumn Caption="Name[Company Name: Branch: Designation:Mobile No:Email Id]"
                                FieldName="Name" VisibleIndex="0">
                                <CellStyle HorizontalAlign="Left">
                                </CellStyle>
                            </dxwtl:TreeListTextColumn>
                        </Columns>
                        <ClientSideEvents EndCallback="function(s, e) {
	LastCall(s.cpHeight);
}" />
                        <Border BorderColor="Navy" BorderStyle="Solid" BorderWidth="1px" />
                        <Styles>
                            <Header CssClass="EHEADER">
                            </Header>
                        </Styles>
                    </dxwtl:ASPxTreeList>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
