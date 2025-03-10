<%@ page language="C#" autoeventwireup="true" inherits="management_SalesDocument, App_Web_n2fxndvz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sales Document</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function Show() {
        var url = "frmAddDocuments.aspx?id=SalesDocument.aspx&id1=Lead";
        popup.SetContentUrl(url);

        popup.Show();

    }
    </script>

</head>
<body class="TableMain100">
    <form id="form1" runat="server">
        <div class="TableMain100">
            <dxwgv:ASPxGridView ID="EmployeeDocumentGrid" runat="server" AutoGenerateColumns="False"
                ClientInstanceName="gridDocument" KeyFieldName="Id" Width="100%" Font-Size="10px"
                OnRowDeleting="EmployeeDocumentGrid_RowDeleting">
                <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                <Styles>
                    <LoadingPanel ImageSpacing="10px">
                    </LoadingPanel>
                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                    </Header>
                </Styles>
                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                </SettingsPager>
                <Columns>
                    <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Type" VisibleIndex="0" Caption="DocumentType"
                        Width="25%">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="FileName" VisibleIndex="1" Caption="DocumentName"
                        Width="25%">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Src" VisibleIndex="2" Visible="False">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="FilePath" ReadOnly="True" VisibleIndex="2"
                        Caption="Document Physical Location" Width="25%">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataHyperLinkColumn Caption="View" FieldName="Src" VisibleIndex="3"
                        Width="15%">
                        <DataItemTemplate>
                            <a href='viewImage.aspx?id=<%#Eval("Src") %>' target="_blank">View</a>
                        </DataItemTemplate>
                    </dxwgv:GridViewDataHyperLinkColumn>
                    <dxwgv:GridViewCommandColumn VisibleIndex="4">
                        <HeaderTemplate>
                            <a href="javascript:void(0);" onclick="Show();"><span style="color: #000099; text-decoration: underline">
                                Add New</span> </a>
                        </HeaderTemplate>
                        <DeleteButton Visible="True">
                        </DeleteButton>
                    </dxwgv:GridViewCommandColumn>
                </Columns>
                
                <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center"
                    PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px"
                    EditFormColumnCount="1" />
                <SettingsText PopupEditFormCaption="Add/Modify Family Relationship" ConfirmDelete="Are You Want To Delete This Record ???" />
                <Settings ShowGroupPanel="True" ShowFooter="True" ShowStatusBar="Hidden" ShowTitlePanel="True" />
            </dxwgv:ASPxGridView>
            <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="frmAddDocuments.aspx"
                CloseAction="CloseButton" Top="100" Left="400" ClientInstanceName="popup" Height="500px"
                Width="430px" HeaderText="Add Document">
                <ContentCollection>
                    <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    </dxpc:PopupControlContentControl>
                </ContentCollection>
            </dxpc:ASPxPopupControl>
            
        </div>
    </form>
</body>
</html>
