<%@ page language="C#" autoeventwireup="true" inherits="management_crmInsuranceLife, App_Web_im-ehkhh" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">

    <title></title>
       <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script language="javascript"  type="text/javascript">
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
        window.frameElement.widht = document.body.scrollWidht;
    }
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
        <table class="TableMain100">
        <tr>
            <td>
                <dxwgv:ASPxGridView ID="ProductMF" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False" KeyFieldName="id" DataSourceID="SqlProductMF" Width="100%" OnHtmlEditFormCreated="ProductMF_HtmlEditFormCreated" OnHtmlRowCreated="ProductMF_HtmlRowCreated">
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
                                    <TitlePanel>
                                        <table style="width:100%">
                                          <tr>
                                            <td align="center" style="width:50%">
                                                <span>Add/Modify Insurance Life.</span>
                                            </td>
                                           <%-- <td align="right">
                                              <table >
                                                <tr>                                                 
                                                  <td>
                                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd"){ %>
                                                    <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"   Height="18px" Width="88px" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue" AutoPostBack="False" Font-Size="10px">
                                                       <clientsideevents click="function(s, e) {grid.AddNewRow();}" />
                                                    </dxe:ASPxButton>
                                                    <%} %>
                                                  </td>                                                                                
                                                </tr>
                                             </table>
                                          </td>   --%>
                                        </tr>
                                      </table>
                                  </TitlePanel>
                                 </Templates>
                     <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                     <Styles>
                     <LoadingPanel ImageSpacing="10px">
                     </LoadingPanel>
                     <Header ImageSpacing="5px" SortingImageSpacing="5px">
                     </Header>
                     </Styles>
                     <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                         <FirstPageButton Visible="True">
                         </FirstPageButton>
                         <LastPageButton Visible="True">
                         </LastPageButton>
                     </SettingsPager>
                    <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="150px" PopupEditFormHorizontalAlign="Center"
                               PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="800px" EditFormColumnCount="1" />
                     <SettingsText PopupEditFormCaption="Add/Modify Insurance Life" ConfirmDelete="Are You Want To Delete This Record ???" />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="description" Caption="Product Name" VisibleIndex="0" Width="80%">
                            <EditFormSettings Caption="Product Name" Visible="True" VisibleIndex="0" />
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle Wrap="False">
                            </EditFormCaptionStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataComboBoxColumn FieldName="ProductType" Visible="False" VisibleIndex="1">
                            <PropertiesComboBox DataSourceID="SqlPType" TextField="pty_productType" ValueField="pty_prefix" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String">
                            </PropertiesComboBox>
                            <EditFormSettings Visible="True" Caption="Product Type" VisibleIndex="1" />
                            <EditFormCaptionStyle Wrap="False">
                            </EditFormCaptionStyle>
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewCommandColumn VisibleIndex="1">
                            <EditButton Visible="True">
                            </EditButton>
                            <DeleteButton Visible="True">
                            </DeleteButton>
                            <HeaderTemplate>
                    <a href="javascript:void(0);" onclick="grid.AddNewRow();"><span style="color: #000099;
                   text-decoration: underline">Add New</span> </a>
                   
</HeaderTemplate>
                        </dxwgv:GridViewCommandColumn>
                    </Columns>
                    <Settings ShowStatusBar="Visible" ShowTitlePanel="True" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="SqlProductMF" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                    SelectCommand="select p.prds_id as id,p.prds_description as description,p.prds_productType as ProductType from tbl_master_products p,tbl_master_producttype pt where p.prds_producttype=pt.pty_prefix and p.prds_producttype='IN'"
                    InsertCommand="CRMInsuLifeInsert" InsertCommandType="StoredProcedure"
                    UpdateCommand="update tbl_master_products set prds_description=@description,prds_productType=@ProductType,LastModifyDate=getdate(),LastModifyUser=@CreateUser where prds_id=@id"
                    DeleteCommand="delete from tbl_master_products where prds_id=@id">
                    <InsertParameters>
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="ProductType" Type="String" />
                        <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="ProductType" Type="String" />
                        <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="String" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlPType" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" 
                    SelectCommand="SELECT [pty_productType], [pty_prefix] FROM [tbl_master_producttype]">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
