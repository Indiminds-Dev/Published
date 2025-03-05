<%@ page language="C#" autoeventwireup="true" inherits="management_Area, App_Web_psdiigfa" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
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
                if(document.body.scrollHeight<=500)
                    window.frameElement.height = '500px';
                else
                    window.frameElement.height = document.body.scrollHeight;
                window.frameElement.Width = document.body.scrollWidth;
            }
   </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
   <script type="text/javascript">
//function is called on changing country
function OnCountryChanged(cmbCountry) {
    grid.GetEditor("cou_country").PerformCallback(cmbCountry.GetValue().toString());
}
function ShowHideFilter(obj)
{
   grid.PerformCallback(obj);
}
</script>
<table class="TableMain100">
    <tr>
            <td class="EHEADER"  style="text-align:center;" >
                <strong><span style="color: #000099">Area List</span></strong>
            </td>
        </tr>
    <tr>
        <td>
            
            <table width="100%">
              <tr>
                 <td style="text-align:left; vertical-align:top">
                        <table>
                            <tr>
                                <td id="ShowFilter">
                                    <a  href="javascript:ShowHideFilter('s');" ><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a>
                                </td>
                               <td id="Td1">
                                    <a  href="javascript:ShowHideFilter('All');" ><span style="color: #000099; text-decoration: underline">
                                        All Records</span></a>
                                </td>
                            </tr>
                        </table>
                  </td>
                  <td>
                  </td>
                  <td class="gridcellright">
                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy" Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"  ValueType="System.Int32" Width="130px">
                        <Items>
                            <dxe:ListEditItem Text="Select" Value="0"/>
                            <dxe:ListEditItem Text="PDF" Value="1" />
                            <dxe:ListEditItem Text="XLS" Value="2" />
                            <dxe:ListEditItem Text="RTF" Value="3" />
                            <dxe:ListEditItem Text="CSV" Value="4" />
                        </Items>
                        <ButtonStyle BackColor="#C0C0FF" ForeColor="Black">
                        </ButtonStyle>
                        <ItemStyle BackColor="Navy" ForeColor="White">
                            <HoverStyle BackColor="#8080FF" ForeColor="White">
                            </HoverStyle>
                        </ItemStyle>
                        <Border BorderColor="White" />
                        <DropDownButton Text="Export">
                        </DropDownButton>
                    </dxe:ASPxComboBox>
                </td>
            </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
    <dxwgv:ASPxGridView ID="AreaGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
        DataSourceID="insertupdate" KeyFieldName="areaid" Width="100%" OnHtmlEditFormCreated="AreaGrid_HtmlEditFormCreated" OnHtmlRowCreated="AreaGrid_HtmlRowCreated" OnCustomCallback="AreaGrid_CustomCallback">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="areaid" ReadOnly="True" Visible="False"
                VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Area Name" FieldName="name" VisibleIndex="0" Width="40%">
                <EditFormSettings Visible="True" Caption="Area Name" />
                <PropertiesTextEdit><ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                <RequiredField IsRequired="True" ErrorText="Area Name Can Not Be Blank" />
                
                </ValidationSettings></PropertiesTextEdit>
                <CellStyle CssClass="gridcellleft">
                </CellStyle>
                <EditFormCaptionStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="False">
                </EditFormCaptionStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="SId" Visible="False" VisibleIndex="1">
                <PropertiesComboBox DataSourceID="SelectState" ValueType="System.String" ValueField="city_id" TextField="city_name" EnableIncrementalFiltering="True" EnableSynchronization="False" >
                <ClientSideEvents SelectedIndexChanged="function(s,e){OnCountryChanged(s);}" />
                </PropertiesComboBox>
                <EditFormSettings Visible="True" Caption="City Name" />
                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                </EditFormCaptionStyle>
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn Caption="City Name" FieldName="city" VisibleIndex="1" Width="40%">
                <EditFormSettings Visible="False" Caption="City Name" />
                <EditFormCaptionStyle Wrap="False">
                </EditFormCaptionStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="2">
                <EditButton Visible="True">
                </EditButton>
                <DeleteButton Visible="True">
                </DeleteButton>
                <ClearFilterButton Visible="True"></ClearFilterButton>
                <HeaderStyle HorizontalAlign="Center" />
                <HeaderTemplate>
                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd"){ %>
                    <a href="javascript:void(0);" onclick="grid.AddNewRow()">
                      <span style="color: #000099; text-decoration: underline">Add New</span>
                    </a>
                     <%} %>
                </HeaderTemplate>
            </dxwgv:GridViewCommandColumn>

</Columns>
        <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" EditFormColumnCount="1" />
        <Styles>
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
            <LoadingPanel ImageSpacing="10px">
            </LoadingPanel>
        </Styles>
        <SettingsText PopupEditFormCaption="Add/Modify Area" ConfirmDelete="Are You Want To Delete This Record ???" />
        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
            <FirstPageButton Visible="True">
            </FirstPageButton>
            <LastPageButton Visible="True">
            </LastPageButton>
        </SettingsPager>
        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
            <Templates>
                 <EditForm>
                    <table style="width:100%">
                      <tr><td style="width:25%"></td>
                          <td style="width:50%">
                            <controls>
                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                            </controls>
                            <div style="text-align:right; padding:2px 2px 2px 2px">
                                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                            </div>
                         </td>
                         <td style="width:25%"></td>
                     </tr>
                   </table>
                </EditForm>
               
            </Templates>
       
</dxwgv:ASPxGridView>
        </td>
    </tr>
    </table>
    <asp:SqlDataSource ID="insertupdate" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_area] WHERE [area_id] = @original_areaid"
        InsertCommand="INSERT INTO [tbl_master_area] ([area_name], [city_id], [CreateDate], [CreateUser]) VALUES (@name, @SId, getdate(), @CreateUser)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT a.area_id AS areaid, a.area_name AS name, s.city_name AS city, s.city_id AS SId FROM tbl_master_area AS a INNER JOIN tbl_master_city AS s ON a.city_id = s.city_id"
        UpdateCommand="UPDATE [tbl_master_area] SET [area_name] = @name, [city_id] = @SId, [CreateDate] = getdate(), [CreateUser] = @CreateUser WHERE [area_id] = @areaid">
       
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="SId" Type="Int32" />
            <asp:Parameter Name="CreateDate" Type="String" />
             <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            <asp:Parameter Name="areaid" Type="Int32" />
            
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="area_name" Type="String" />
            <asp:Parameter Name="city_id" Type="Decimal" />
            <asp:Parameter Name="CreateDate" Type="String" />
            <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
        </InsertParameters>
         <DeleteParameters>
            <asp:Parameter Name="original_areaid" Type="Int32" />
            
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SelectArea" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
        SelectCommand="SELECT a.area_id AS areaid, a.area_name AS name, s.city_name AS city, s.city_id AS SId FROM tbl_master_area AS a INNER JOIN tbl_master_city AS s ON a.city_id = s.city_id">
        
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SelectState" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
        SelectCommand="SELECT [city_id], [city_name] FROM [tbl_master_city] order by city_name"></asp:SqlDataSource>
    <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
    </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
