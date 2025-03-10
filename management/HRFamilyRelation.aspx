<%@ page language="C#" autoeventwireup="true" inherits="management_HRFamilyRelation, App_Web_cvaj-tqf" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Family</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript">
        function ShowHideFilter(obj)
        {
            grid.PerformCallback(obj);
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
    
<table class="TableMain100">
    <tr>
            <td class="EHEADER" style="text-align:center">
                <strong><span style="color: #000099">Family RelationShip</span></strong></td>
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
    <dxwgv:ASPxGridView ID="FamilyGrid" runat="server" AutoGenerateColumns="False" DataSourceID="FamilySource" ClientInstanceName="grid" KeyFieldName="fam_id"  Width="100%" OnHtmlEditFormCreated="FamilyGrid_HtmlEditFormCreated" OnHtmlRowCreated="FamilyGrid_HtmlRowCreated" OnCustomCallback="FamilyGrid_CustomCallback">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="fam_id" ReadOnly="True" VisibleIndex="0" Visible="False">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="fam_familyRelationship" VisibleIndex="0" Caption="Family RelationShip" Width="80%">
                <EditFormSettings Visible="True" />
                <CellStyle CssClass="gridcellleft">
                </CellStyle>
                <EditFormCaptionStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="False">
                </EditFormCaptionStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="CreateDate" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="CreateUser" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="LastModifyDate" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="LastModifyUser" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="1">
                <DeleteButton Visible="True">
                </DeleteButton>
                <EditButton Visible="True">
                </EditButton>
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
        <Settings ShowGroupPanel="True" ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
            PopupEditFormModal="True" PopupEditFormVerticalAlign="TopSides" PopupEditFormWidth="600px" EditFormColumnCount="1" />
        <Styles >
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
            <LoadingPanel ImageSpacing="10px">
            </LoadingPanel>
        </Styles>
        <SettingsText PopupEditFormCaption="Add/Modify Family Relationship" ConfirmDelete="Are You Want To Delete This Record ???" />
        <SettingsPager NumericButtonCount="20" PageSize="20">
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
    <asp:SqlDataSource ID="FamilySource" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" 
        DeleteCommand="DELETE FROM [tbl_master_familyRelationship] WHERE [fam_id] = @original_fam_id"
        InsertCommand="INSERT INTO [tbl_master_familyRelationship] ([fam_familyRelationship], [CreateDate], [CreateUser]) VALUES (@fam_familyRelationship, getdate(), @CreateUser)"
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [tbl_master_familyRelationship]"
        UpdateCommand="UPDATE [tbl_master_familyRelationship] SET [fam_familyRelationship] = @fam_familyRelationship, [LastModifyDate] = getdate(), [LastModifyUser] = @CreateUser WHERE [fam_id] = @original_fam_id">
        <DeleteParameters>
            <asp:Parameter Name="original_fam_id" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="fam_familyRelationship" Type="String" />
            <asp:Parameter Name="LastModifyDate" Type="String" />
            <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            <asp:Parameter Name="original_fam_id" Type="Decimal" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="fam_familyRelationship" Type="String" />
            <asp:Parameter Name="CreateDate" Type="String" />
            <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>
    <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
    </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
