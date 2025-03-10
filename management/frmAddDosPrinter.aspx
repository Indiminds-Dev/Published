<%@ page language="C#" autoeventwireup="true" inherits="management_frmAddDosPrinter, App_Web_udicbieo" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxUploadControl"
    TagPrefix="dxuc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <script type="text/javascript" language="javascript">
       
    function OnUpdateClick() 
        {
//            uploader.UploadFile(); 
            grid.UpdateEdit();           
        }
        
    function ShowHideFilter(obj)
     {
       grid.PerformCallback(obj);
     }
     function height()
        {
            clearPreloadPage();
            
            if(document.body.scrollHeight>=300)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '300px';
                window.frameElement.Width = document.body.scrollWidth;
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="height()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="text-align: left; vertical-align: top;">
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
                                <td>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="DosPrinterGrid" runat="server" AutoGenerateColumns="False"
                            DataSourceID="Printerdata" KeyFieldName="DosPrinter_ID" ClientInstanceName="grid"
                            OnRowInserting="DosPrinterGrid_RowInserting" OnCustomCallback="DosPrinterGrid_CustomCallback"
                            OnRowUpdating="DosPrinterGrid_RowUpdating"
                            Width="100%" Font-Size="10px" OnRowValidating="DosPrinterGrid_RowValidating">
                            <Templates><EditForm>
                                    <table style="width: 100%; background-color: #ffdead" id="main" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="width: 40%; text-align: left">
                                                    <span style="color: black; text-align: left" class="Ecoheadtxt">Name :</span>
                                                </td>
                                                <td style="width: 611px; text-align: left">
                                                    <asp:TextBox ID="txtPrinterName" runat="server" Width="279px" Text='<%# Eval("DosPrinter_Name") %>' Height="17px" CssClass="EcoheadCon"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 40%; text-align: left">
                                                    <span style="color: black; text-align: left" class="Ecoheadtxt">Location :</span>
                                                </td>
                                                <td style="width: 611px; text-align: left">
                                                    <%--<dxuc:ASPxUploadControl ID="selectLocationPrinter" ClientInstanceName="uploader" OnFileUploadComplete="selectLocationPrinter_upload" runat="server">
                                                  <ClientSideEvents FileUploadComplete="function(s, e) { if (e.isValid) { DosPrinterGrid.UpdateEdit(); }}" />
                                                  </dxuc:ASPxUploadControl>--%>
                                                    <asp:TextBox ID="txtLocation" runat="server" Width="279px" Text='<%# Eval("DosPrinter_Location") %>'  Height="17px" CssClass="EcoheadCon"></asp:TextBox>&nbsp;
                                                    <asp:Label ID="lblCaption" runat="server" Width="600px" Height="17px" CssClass="EcoheadCon"
                                                        Text="Format Of Path Given: //Name Of Machine Where Printer Is Installed/The Name of Folder Which Is Shared/"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center" colspan="2">
                                                    <div style="padding-right: 2px; padding-left: 2px; padding-bottom: 2px; padding-top: 2px;
                                                        text-align: right">
                                                        <a onclick="OnUpdateClick()" href="#">Update</a>
                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" runat="server" ReplacementType="EditFormCancelButton">
                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                
                                    </EditForm>
                                    <TitlePanel>
                                    <table style="width: 100%">
                                        <tr>
                                            <td align="right">
                                                <table width="200">
                                                    <tr>
                                                        <td>
                                                            <%-- <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data" Height="18px" Width="88px"   Font-Size="10px" AutoPostBack="False">
                                                           <clientsideevents click="function(s, e) {gridDp.AddNewRow();}" />
                                                        </dxe:ASPxButton>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                
</TitlePanel>
</Templates>
                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                            <Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedRow CssClass="gridselectrowblue"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>
</Styles>
                            <SettingsPager NumericButtonCount="20" PageSize="20"></SettingsPager>
                            <Columns>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="DosPrinter_ID" Caption="Dosprinter ID">
<PropertiesTextEdit>
<ValidationSettings ErrorText=""></ValidationSettings>
</PropertiesTextEdit>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn UnboundType="String" VisibleIndex="0" FieldName="DosPrinter_Name" Caption="Dosprinter Name">
<PropertiesTextEdit>
<ValidationSettings SetFocusOnError="True" CausesValidation="True" ErrorDisplayMode="Text" ErrorText="Please Enter Printer Name">
<RequiredField IsRequired="True"></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn UnboundType="String" VisibleIndex="1" FieldName="DosPrinter_Location" Caption="Dosprinter Location">
<PropertiesTextEdit>
<ValidationSettings SetFocusOnError="True" CausesValidation="True" ErrorDisplayMode="Text" ErrorText="Please Enter Location Path">
<RequiredField IsRequired="True"></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="2">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<DeleteButton Visible="True"></DeleteButton>
<HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                            text-decoration: underline">Add new</span> </a>
                                    
</HeaderTemplate>

<EditButton Visible="True"></EditButton>
</dxwgv:GridViewCommandColumn>
</Columns>
                            <SettingsEditing PopupEditFormHeight="300px" PopupEditFormHorizontalAlign="Center"
                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px" />
                            <SettingsText PopupEditFormCaption="Add/Modify DP Details" ConfirmDelete="Are You Want To Delete This Record ???" />
                            <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="Printerdata" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="select * from config_dosprinter where DosPrinter_User=@DosPrinter_User" InsertCommand="INSERT INTO config_dosprinter(DosPrinter_Name,DosPrinter_Location,DosPrinter_User) VALUES(@DosPrinter_Name,@DosPrinter_Location,@DosPrinter_User)"
                            UpdateCommand="Update config_dosprinter Set DosPrinter_Name=@DosPrinter_Name,DosPrinter_Location=@DosPrinter_Location,DosPrinter_User=@DosPrinter_User where DosPrinter_ID=@DosPrinter_ID"
                            DeleteCommand="Delete from config_dosprinter where DosPrinter_ID=@DosPrinter_ID">
                            <SelectParameters>                                
                                <asp:SessionParameter SessionField="userid" Name="DosPrinter_User" Type="Int32" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="DosPrinter_Name" Type="string" />
                                <asp:Parameter Name="DosPrinter_Location" Type="string" />
                                <asp:Parameter Name="DosPrinter_User" Type="int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="DosPrinter_Name" Type="string" />
                                <asp:Parameter Name="DosPrinter_Location" Type="string" />
                                <asp:Parameter Name="DosPrinter_User" Type="int32" />
                                <asp:Parameter Name="DosPrinter_ID" Type="int32" />
                            </UpdateParameters>
                            <DeleteParameters>
                             <asp:Parameter Name="DosPrinter_ID" Type="int32" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
