<%@ page language="C#" autoeventwireup="true" inherits="management_mfScheme, App_Web_gywepxwc" %>

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
       <script type="text/javascript">
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
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
 
<table class="TableMain100">
    <tr>
            <td class="EHEADER" align="center">
                <strong><span style="color: #000099">MF Scheme Categories</span></strong></td>
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
<dxwgv:aspxgridview id="mfSchemeGrid" ClientInstanceName="grid" runat="server" autogeneratecolumns="False"
        datasourceid="mfScheme" keyfieldname="mfcat_id" Width="100%"  OnHtmlEditFormCreated="mfSchemeGrid_HtmlEditFormCreated" OnHtmlRowCreated="mfSchemeGrid_HtmlRowCreated" OnCustomCallback="mfSchemeGrid_CustomCallback"><Columns>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="mfcat_id">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="mfcat_Category" Width="80%" Caption="MF Scheme Categories">
<PropertiesTextEdit Width="300px">
<ValidationSettings SetFocusOnError="True" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
<RequiredField IsRequired="True" ErrorText="Please Give Scheme Category"></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormSettings Visible="True"></EditFormSettings>
    <EditCellStyle HorizontalAlign="Left" Wrap="False">
        <Paddings PaddingTop="15px" />
    </EditCellStyle>
    <CellStyle Wrap="False">
    </CellStyle>
    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
    </EditFormCaptionStyle>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewCommandColumn VisibleIndex="1">

<DeleteButton Visible="True"></DeleteButton>

<EditButton Visible="True"></EditButton>
<HeaderStyle HorizontalAlign="Center" />
<HeaderTemplate>
       <a href="javascript:void(0);" onclick="grid.AddNewRow()">
      <span style="color: #000099; text-decoration: underline">Add New</span>
    </a>
   </HeaderTemplate>
</dxwgv:GridViewCommandColumn>
</Columns>

<Settings ShowStatusBar="Visible"></Settings>
        <Styles >
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
            <Cell CssClass="gridcellleft">
            </Cell>
            <LoadingPanel ImageSpacing="10px">
            </LoadingPanel>
        </Styles>
        <SettingsText PopupEditFormCaption="Add/Modify MF scheme" />
        <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
            <FirstPageButton Visible="True">
            </FirstPageButton>
            <LastPageButton Visible="True">
            </LastPageButton>
        </SettingsPager>
        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHeight="200px"
            PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter"
            PopupEditFormWidth="600px" />
            <Templates>
                 <EditForm>
                    <table style="width:100%">
                      <tr>
                          <td style="width:100%">
                            <controls>
                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                            </controls>
                            <div style="text-align:right; padding:2px 2px 2px 2px">
                                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                            </div>
                         </td>
                     </tr>
                   </table>
                </EditForm>
               
            </Templates>
  
  </dxwgv:aspxgridview>
        </td>
    </tr>
  </table>
    <asp:SqlDataSource ID="mfScheme" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" 
        DeleteCommand="DELETE FROM [tbl_master_mfSchemeCategory] WHERE [mfcat_id] = @original_mfcat_id"
        InsertCommand="INSERT INTO [tbl_master_mfSchemeCategory] ([mfcat_Category],[CreateDate],[CreateUser]) VALUES (@mfcat_Category,getdate(),@CreateUser)"
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [mfcat_id],[mfcat_Category] FROM [tbl_master_mfSchemeCategory]"
        UpdateCommand="UPDATE [tbl_master_mfSchemeCategory] SET [mfcat_Category] = @mfcat_Category,[LastModifyDate]=getdate(),[LastModifyUser]=@CreateUser WHERE [mfcat_id] = @original_mfcat_id">
        <DeleteParameters>
            <asp:Parameter Name="original_mfcat_id" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="mfcat_Category" Type="String" />
            <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />        
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="mfcat_Category" Type="String" />
            <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />        
        </InsertParameters>
    </asp:SqlDataSource>
    <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
    </dxwgv:ASPxGridViewExporter>
    </div>
    </form>
</body>
</html>
