<%@ page language="C#" autoeventwireup="true" inherits="management_frmShowForm, App_Web_g1t3n0jz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

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

    function OnAddButtonClick() 
    {
    var flg=document.getElementById("TextBox1").value;
     var url='frmAddForms.aspx?id=' + flg;
     parent.OnMoreInfoClick(url,"Add New File",'700px','370px',"Y");
    
    }
    function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    } 
    function callback()
        {
            grid.PerformCallback();
        } 
    function callheight(obj)
    {
        height();
        parent.CallMessage();
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Forms & Notices <asp:Label ID="lblP" runat="server"
                            Text="Label"></asp:Label></span></strong>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; vertical-align: top">
                        <table>
                            <tr>
                                <td id="ShowFilter">
                                    <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a>
                                </td>
                                <td id="Td1">
                                    <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                        All Records</span></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="grdDocuments" runat="server" AutoGenerateColumns="False"
                             KeyFieldName="formID" Width="100%" OnRowDeleting="grdDocuments_RowDeleting" ClientInstanceName="grid" OnCustomCallback="grdDocuments_CustomCallback">
                            <Settings ShowGroupPanel="True" />
                              <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="formID" ReadOnly="True" VisibleIndex="0" Visible="false">
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="FormName" ReadOnly="True" VisibleIndex="0">
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="FilePath" VisibleIndex="1" Visible="false">
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                 <dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="1">
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="ADD/Modify " FieldName="formID" ReadOnly="True"
                                    VisibleIndex="5">
                                     <DataItemTemplate>
                                                            <a href='ViewFile.aspx?id=<%#Eval("FilePath") %>' target="_blank">View</a>
                                                        </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        View
                                    </HeaderTemplate>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewCommandColumn VisibleIndex="6">
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddButtonClick();"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                </dxwgv:GridViewCommandColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                            <Styles>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <FocusedGroupRow CssClass="gridselectrow">
                                </FocusedGroupRow>
                                <FocusedRow CssClass="gridselectrow">
                                </FocusedRow>
                            </Styles>
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                              <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormHeight="600px"
                        PopupEditFormVerticalAlign="TopSides" PopupEditFormWidth="900px" />
                    <SettingsText PopupEditFormCaption="Add/Modify Cash/Bank" ConfirmDelete="Are you sure to Delete this Record!" />
                            <ClientSideEvents EndCallback="function(s, e) {
	callheight(s.cpHeight);
}" />
                        </dxwgv:ASPxGridView>
                       <%--   <asp:SqlDataSource ID="grddoc" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="" DeleteCommand="DELETE FROM [tbl_master_forms] WHERE [frm_id] = @formID">
                            <DeleteParameters>
                                <asp:Parameter Name="formID" Type="int32" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="userlist" SessionField="userchildHierarchy" Type="string" />
                            </SelectParameters>
                        </asp:SqlDataSource>--%></td>
                </tr>
                <tr><td style="display:none;"> <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td></tr>
            </table>
        </div>
    </form>
</body>
</html>
