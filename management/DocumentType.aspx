<%@ page language="C#" autoeventwireup="true" inherits="management_DocumentType, App_Web_d3reltht" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Document Type</title>
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
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center">
                    <strong><span style="color: #000099">Document Type</span></strong></td>
            </tr>
            <tr>
                <td>
                    <table width="100%">
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
                            <td>
                            </td>
                            <td class="gridcellright">
                                <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                    Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                    ValueType="System.Int32" Width="130px">
                                    <Items>
                                        <dxe:ListEditItem Text="Select" Value="0" />
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
                    <dxwgv:ASPxGridView ID="DocumentGrid" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False"
                        DataSourceID="DocumentType" KeyFieldName="dty_id" Width="100%"  OnHtmlEditFormCreated="DocumentGrid_HtmlEditFormCreated"
                        OnHtmlRowCreated="DocumentGrid_HtmlRowCreated" OnCustomCallback="DocumentGrid_CustomCallback">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="dty_id" ReadOnly="True" Visible="True" Caption="ID" CellStyle-Font-Bold="true" 
                                VisibleIndex="0" HeaderStyle-HorizontalAlign="Center" >
                               <%--
                                 <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                    <Paddings PaddingTop="15px" />
                                     
                                </EditCellStyle>--%>
                               <%-- <CellStyle Wrap="False">
                                </CellStyle>--%>
                                <EditFormSettings Visible="False" />
                                
                            </dxwgv:GridViewDataTextColumn>
                            
                            
                            <dxwgv:GridViewDataTextColumn Caption="Document Type" FieldName="dty_documentType"
                                VisibleIndex="0" Width="40%">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                    <Paddings PaddingTop="15px" />
                                </EditCellStyle>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <PropertiesTextEdit Width="300px">
                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                        <RequiredField ErrorText="Please Enter document Type" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Caption="Document Type" Visible="True" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="dty_applicableFor" Caption="Applicable For"
                                VisibleIndex="1" Width="40%">
                                <PropertiesComboBox ValueType="System.String" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                    Width="300px">
                                    <Items>
                                        <dxe:ListEditItem Text="Products MF" Value="Products MF">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Products Insurance" Value="Products Insurance">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Products IPOs" Value="Products IPOs">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Customer/Client" Value="Customer/Client">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Lead" Value="Lead">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Employee" Value="Employee">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Sub Brokers" Value="Sub Broker">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Franchisses" Value="Franchisee">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Data Vendors" Value="Data Vendor">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Relationship Partner" Value="Relationship Partner">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Business Partner" Value="Partner">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Recruitment Agents" Value="Recruitment Agent">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="AMCs" Value="AMCs">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Insurance Companies" Value="Insurance Companies">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="RTAs" Value="RTAs">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Branches" Value="Branches">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Companies" Value="Companies">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Buildzsing" Value="Buildzsing">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="ConsumerComp" Value="ConsumerComp">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="OutsourcingComp" Value="OutsourcingComp">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="HRrecruitmentagent" Value="HRrecruitmentagent">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="NSDL Clients" Value="NSDL Clients">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="CDSL Clients" Value="CDSL Clients">
                                        </dxe:ListEditItem>
                                         <dxe:ListEditItem Text="Candidate" Value="Candidate">
                                        </dxe:ListEditItem>
                                        
                                        <dxe:ListEditItem Text="Exchanges" Value="Exchanges">
                                        </dxe:ListEditItem>
                                        
                                        <dxe:ListEditItem Text="Account Heads" Value="Account Heads">
                                        </dxe:ListEditItem>
                                        
                                        <dxe:ListEditItem Text="OtherEntity" Value="OtherEntity">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" Caption="Applicable For"></EditFormSettings>
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                    <Paddings PaddingTop="15px" />
                                </EditCellStyle>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Mandatory1" Caption="Is mandatory ?" VisibleIndex="2">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataCheckColumn Caption="Is this a mandatory document ?" FieldName="Mandatory"
                                VisibleIndex="2" Visible="False">
                                <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                    <Style HorizontalAlign="Left"></Style>
                                </PropertiesCheckEdit>
                                <EditFormSettings Visible="True" />
                                <EditFormCaptionStyle Wrap="False" ForeColor="Red">
                                </EditFormCaptionStyle>
                                <CellStyle ForeColor="Red">
                                </CellStyle>
                            </dxwgv:GridViewDataCheckColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="3">
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <EditButton Visible="True">
                                </EditButton>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                      { %>
                                    <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                    <%} %>
                                </HeaderTemplate>
                            </dxwgv:GridViewCommandColumn>
                        </Columns>
                        <Styles >
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <Cell CssClass="gridcellleft">
                            </Cell>
                        </Styles>
                        <Settings ShowStatusBar="Visible" ShowGroupPanel="True" />
                        <SettingsText PopupEditFormCaption="Add/Modify Document" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="TopSides" PopupEditFormWidth="600px" />
                        <Templates>
                            <EditForm>
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 25%">
                                        </td>
                                        <td style="width: 50%">
                                            <controls></controls>
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="Editors" runat="server" ColumnID="" ReplacementType="EditFormEditors">
                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                            <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                    runat="server">
                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                    runat="server">
                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                            </div>
                                        </td>
                                        <td style="width: 25%">
                                        </td>
                                    </tr>
                                </table>
                            </EditForm>
                        </Templates>
                        
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="DocumentType" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_documentType] WHERE [dty_id] = @original_dty_id"
            InsertCommand="INSERT INTO [tbl_master_documentType] ([dty_documentType], [dty_applicableFor],[dty_SearchBy],[dty_mandatory], [CreateDate], [CreateUser]) VALUES (@dty_documentType, @dty_applicableFor,0,@Mandatory,getdate(),@CreateUser)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [dty_id],[dty_documentType],[dty_applicableFor],dty_mandatory as Mandatory,case dty_mandatory when '0' then 'No' else 'Yes' end as Mandatory1 FROM [tbl_master_documentType]"
            UpdateCommand="UPDATE [tbl_master_documentType] SET [dty_documentType] = @dty_documentType, [dty_applicableFor] = @dty_applicableFor,dty_mandatory=@Mandatory, [LastModifyDate] = getdate(), [LastModifyUser] = @CreateUser WHERE [dty_id] = @original_dty_id">
            <DeleteParameters>
                <asp:Parameter Name="original_dty_id" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="dty_documentType" Type="String" />
                <asp:Parameter Name="dty_applicableFor" Type="String" />
                <asp:Parameter Name="Mandatory" Type="int32" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="dty_documentType" Type="String" />
                <asp:Parameter Name="dty_applicableFor" Type="String" />
                <asp:Parameter Name="Mandatory" Type="int32" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
            </InsertParameters>
        </asp:SqlDataSource>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
        <br />
    </form>
</body>
</html>
