<%@ page language="C#" autoeventwireup="true" inherits="management_RiskProfile, App_Web_e158i_8t" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Risk Profile</title>
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
    function EndCall()
        {
            if(gridRiskProfile.cpDelmsg!=null)
                alert(gridRiskProfile.cpDelmsg);
        
        }
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <table class="TableMain100">
     <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Risk Profiles</span></strong>
                    </td>
                </tr>
                </table>
    <dxwgv:ASPxGridView ID="gridRiskProfile" runat="server" ClientInstanceName="gridRiskProfile" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlRiskProfile" KeyFieldName="TradingProfile_ID" OnRowInserting="gridRiskProfile_RowInserting" OnRowValidating="gridRiskProfile_RowValidating" OnStartRowEditing="gridRiskProfile_StartRowEditing" OnRowUpdating="gridRiskProfile_RowUpdating" OnRowDeleting="gridRiskProfile_RowDeleting">
         <ClientSideEvents EndCallback="function(s, e) {
	  EndCall();
}" />
        <Styles>
            <Header ImageSpacing="5px" SortingImageSpacing="5px" BackColor="#95C9FD">
            </Header>
            <LoadingPanel ImageSpacing="10px">
            </LoadingPanel>
            <FocusedRow CssClass="gridselectrow">
            </FocusedRow>
            <FocusedGroupRow CssClass="gridselectrow">
            </FocusedGroupRow>
        </Styles>
        <StylesEditors>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="TradingProfile_ID" ReadOnly="True" VisibleIndex="0" Visible="False">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Profile Type" FieldName="TradingProfile_Type"
                VisibleIndex="0">
                <PropertiesComboBox ValueType="System.String">
                    <Items>
                        <dxe:ListEditItem Text="Risk &amp; Exposure" Value="1" />
                        <dxe:ListEditItem Text="Delivery" Value="2" />
                        <dxe:ListEditItem Text="Funds" Value="3" />
                    </Items>
                </PropertiesComboBox>
                <CellStyle CssClass="gridcellleft">
                </CellStyle>
                <EditFormSettings Caption="Profile Type" Visible="True" VisibleIndex="0" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn FieldName="TradingProfile_Code" VisibleIndex="1" Caption="Profile Code">
                <EditFormSettings Caption="Profile Code" Visible="True" VisibleIndex="1" />
                <CellStyle CssClass="gridcellleft">
                </CellStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="TradingProfile_Name" VisibleIndex="2" Caption="Profile Name">
                <EditFormSettings Caption="Profile Name" Visible="True" VisibleIndex="2" />
                <CellStyle CssClass="gridcellleft">
                </CellStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="3">
                <DeleteButton Visible="True">
                </DeleteButton>
                <EditButton Visible="True">
                </EditButton>
                <HeaderTemplate>
                     <a href="javascript:void(0);" onclick="gridRiskProfile.AddNewRow()">
                     <span style="color: #000099; text-decoration: underline">Add New</span></a>
                </HeaderTemplate>
            </dxwgv:GridViewCommandColumn>
        </Columns>
        <Templates>
            <EditForm>
                <table>
                    <tr>
                        <td style="width:30%"></td>
                        <td  class="Ecoheadtxt" style="text-align:left; width:10%">
                            Profile Type
                        </td>
                        <td style="text-align:left">
                            <dxe:ASPxComboBox ID="comboProfile" runat="server" EnableIncrementalFiltering="true" Value='<%# Bind("TradingProfile_Type") %>' EnableSynchronization="False"  ValueType="System.String">
                                  <Items>
                                      <dxe:ListEditItem Text="Risk & Exposure" Value="1" />
                                      <dxe:ListEditItem Text="Delivery" Value="2" />
                                      <dxe:ListEditItem Text="Funds" Value="3" />
                                  </Items>
                                  <ButtonStyle Width="13px">
                                  </ButtonStyle>
                            </dxe:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:30%"></td>
                        <td  class="Ecoheadtxt" style="text-align:left; width:10%">
                            Profile Code
                        </td>
                        <td style="text-align:left">
                            <dxe:ASPxTextBox ID="txtCode" runat="server" Value='<%# Bind("TradingProfile_Code") %>' Width="170px">
                            </dxe:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:30%"></td>
                        <td  class="Ecoheadtxt" style="text-align:left; width:10%">
                            Profile Name
                        </td>
                        <td style="text-align:left">
                            <dxe:ASPxTextBox ID="txtName" runat="server" Value='<%# Bind("TradingProfile_Name") %>' Width="170px">
                            </dxe:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:30%"></td>
                        <td style="text-align:right;">
                            <dxe:ASPxButton ID="btnUpdate" runat="server" Text="Update" ToolTip="Update data"   Height="18px" Width="88px" AutoPostBack="False">
                                     <clientsideevents click="function(s, e) {gridRiskProfile.UpdateEdit();}" />
                            </dxe:ASPxButton>
                                                                                
                        </td>
                        <td style="text-align:left;" colspan="2">
                            <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel data"   Height="18px" Width="88px" AutoPostBack="False">
                                     <clientsideevents click="function(s, e) {gridRiskProfile.CancelEdit();}" />
                            </dxe:ASPxButton>
                       </td>
                    </tr>  
                </table>
            </EditForm>
        </Templates>
        <SettingsText ConfirmDelete="Are You Want To Delete This Record ???" />
        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                 <FirstPageButton Visible="True">
                 </FirstPageButton>
                 <LastPageButton Visible="True">
                 </LastPageButton>
        </SettingsPager>
        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" AllowFocusedRow="True" />
    </dxwgv:ASPxGridView>
    <asp:SqlDataSource ID="SqlRiskProfile" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
        DeleteCommand="DELETE FROM [Master_TradingProfile] WHERE [TradingProfile_ID] = @TradingProfile_ID"
        InsertCommand="INSERT INTO [Master_TradingProfile] ([TradingProfile_Type], [TradingProfile_Code], [TradingProfile_Name], [TradingProfile_CreateUser], [TradingProfile_CreateDateTime]) VALUES (@TradingProfile_Type, @TradingProfile_Code, @TradingProfile_Name, @TradingProfile_CreateUser, getdate())"
        SelectCommand="SELECT * FROM [Master_TradingProfile]" 
        UpdateCommand="UPDATE [Master_TradingProfile] SET  [TradingProfile_Name] = @TradingProfile_Name, [TradingProfile_ModifyUser] = @TradingProfile_ModifyUser, [TradingProfile_ModifyDateTime] = getdate() WHERE [TradingProfile_ID] = @TradingProfile_ID">
        <DeleteParameters>
            <asp:Parameter Name="TradingProfile_ID" Type="Int64" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TradingProfile_Name" Type="String" />
            <asp:SessionParameter Name="TradingProfile_ModifyUser" SessionField="userid" Type="Int32" />
            <asp:Parameter Name="TradingProfile_ID" Type="Int64" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="TradingProfile_Type" Type="Byte" />
            <asp:Parameter Name="TradingProfile_Code" Type="String" />
            <asp:Parameter Name="TradingProfile_Name" Type="String" />
            <asp:SessionParameter Name="TradingProfile_CreateUser" SessionField="userid" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
