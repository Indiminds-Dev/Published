<%@ page language="C#" autoeventwireup="true" inherits="management_Other_SalesVisitOutcome, App_Web_4andsqnv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
       <script type="text/javascript">
       
    //function is called on changing country
    function OnDescriptionChanged(cmbDescription) 
    {
        grid.GetEditor("Description").PerformCallback(cmbDescription.GetValue().toString());
    }
    function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    }  
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
</script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
<table class="TableMain100">
    <tr>
            <td class="EHEADER" style="text-align: center;" >
                <strong><span style="color: #000099">Sales Visit OutComes</span></strong></td>
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
  </table>
    <dxwgv:ASPxGridView ID="OutComeGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" DataSourceID="SalesVisitOutcomes" KeyFieldName="ID" Width="100%"   OnHtmlEditFormCreated="OutComeGrid_HtmlEditFormCreated" OnHtmlRowCreated="OutComeGrid_HtmlRowCreated" OnCustomCallback="OutComeGrid_CustomCallback">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="False" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="SalesVisitOutcome" FieldName="Outcome" VisibleIndex="0" Width="40%">
                <EditFormSettings Caption="SalesVisitOutcome" Visible="True" />
                <PropertiesTextEdit><ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                <RequiredField IsRequired="True" ErrorText="SalesVisitOutcomes Can Not Be Blank" />
                
                </ValidationSettings></PropertiesTextEdit>
                <CellStyle CssClass="gridcellleft">
                </CellStyle>
                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top">
                </EditFormCaptionStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Category" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False"/>
                
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="SalesVisitOutcomeCategory" FieldName="description"
                VisibleIndex="1" Width="40%">
                <EditFormSettings Caption="SalesVisitOutcomeCategory" Visible="False" />
                <CellStyle CssClass="gridcellleft">
                </CellStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="Category" Visible="False" VisibleIndex="1" Caption="SalesVisitOutcomeCategory">
                <PropertiesComboBox DataSourceID="CategorySelect" ValueField="Int_id" TextField="Description" EnableIncrementalFiltering="True" EnableSynchronization="False" ValueType="System.String">
                <ClientSideEvents SelectedIndexChanged="function(s,e){OnDescriptionChanged(s);}" />
                    <ValidationSettings SetFocusOnError="True" CausesValidation="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings Visible="True" Caption="SalesVisitOutcomeCategory" />
                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top">
                </EditFormCaptionStyle>
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="2">
                <EditButton Visible="True">
                </EditButton>
                <DeleteButton Visible="True">
                </DeleteButton>
                <HeaderStyle HorizontalAlign="Center" />
                <HeaderTemplate>
                    <a href="javascript:void(0);" onclick="grid.AddNewRow()">
                      <span style="color: #000099; text-decoration: underline">Add New</span>
                    </a>                   
                </HeaderTemplate>
            </dxwgv:GridViewCommandColumn>
        </Columns>
        <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" EditFormColumnCount="1" />
        <Styles  >
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
            <LoadingPanel ImageSpacing="10px">
            </LoadingPanel>
        </Styles>
        <SettingsText PopupEditFormCaption="Add/Modify SalesVisitOutcome" ConfirmDelete="Are You Want To Delete This Record ???" />
        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
            <FirstPageButton Visible="True">
            </FirstPageButton>
            <LastPageButton Visible="True">
            </LastPageButton>
        </SettingsPager>
        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
        <Templates>
                <EditForm>
                    <table style="width:100%">
                      <tr>
                        <td style="width:20%"></td>
                          <td style="width:60%">
                            <controls>
                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                            </controls>
                            <div style="text-align:right; padding:2px 2px 2px 2px">
                                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                            </div>
                         </td>
                         <td style="width:20%"></td>
                     </tr>
                   </table>
               </EditForm>
        </Templates>
     </dxwgv:ASPxGridView>
    <asp:SqlDataSource ID="CategorySelect" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
        SelectCommand="SELECT [Int_id], [Description] FROM [tbl_Master_SalesVisitOutcomeCategory] order by Description">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SalesVisitOutcomes" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
        SelectCommand="SELECT sv.slv_Id AS ID, sv.slv_SalesVisitOutcome AS Outcome, sv.slv_Category AS Category, s.Description AS description FROM tbl_master_SalesVisitOutCome AS sv INNER JOIN tbl_Master_SalesVisitOutcomeCategory AS s ON sv.slv_Category = s.Int_id" ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [tbl_master_SalesVisitOutCome] WHERE [slv_Id] = @original_ID" 
        InsertCommand="INSERT INTO [tbl_master_SalesVisitOutCome] ([slv_SalesVisitOutcome], [slv_Category], [CreateDate], [CreateUser]) VALUES (@Outcome, @Category, getdate(), @CreateUser)" OldValuesParameterFormatString="original_{0}" 
        UpdateCommand="UPDATE [tbl_master_SalesVisitOutCome] SET [slv_SalesVisitOutcome] = @Outcome, [slv_Category] = @Category, [CreateDate] = getdate(), [CreateUser] = @CreateUser WHERE [slv_Id] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Decimal" />
            
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Outcome" Type="String" />
            <asp:Parameter Name="Category" Type="Decimal" />
            <asp:Parameter Name="CreateDate" Type="String" />
            <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            <asp:Parameter Name="ID" Type="Decimal" />
            
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Outcome" Type="String" />
            <asp:Parameter Name="Category" Type="Decimal" />
            <asp:Parameter Name="CreateDate" Type="String" />
            <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            
        </InsertParameters>
    </asp:SqlDataSource>
    <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
    </dxwgv:ASPxGridViewExporter>
    </div>
    </form>
</body>
</html>
