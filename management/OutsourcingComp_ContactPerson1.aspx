<%@ page language="C#" autoeventwireup="true" inherits="management_OutsourcingComp_ContactPerson1, App_Web_kqhq1k1d" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet"  />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table class="TableMain100">
        <tr>
            <td>
                <br />
                <dxwgv:ASPxGridView ID="GridContactPerson" ClientInstanceName="GridContactPerson" KeyFieldName="ContactId" runat="server" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css"
                                                    CssPostfix="Office2003_Blue" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%"  OnHtmlDataCellPrepared="GridContactPerson_HtmlDataCellPrepared">
                                                    <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                        <ExpandedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png"
                                                            Width="11px" />
                                                        <CollapsedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"
                                                            Width="11px" />
                                                        <DetailCollapsedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"
                                                            Width="11px" />
                                                        <DetailExpandedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png"
                                                            Width="11px" />
                                                        <FilterRowButton Height="13px" Width="13px" />
                                                    </Images>
                                                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue">
                                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                        </Header>
                                                        <LoadingPanel ImageSpacing="10px">
                                                        </LoadingPanel>
                                                    </Styles>
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn FieldName="name" VisibleIndex="0">
                                                            <EditCellStyle HorizontalAlign="Right">
                                                            </EditCellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="phone"  VisibleIndex="1">
                                                            <EditCellStyle HorizontalAlign="Right">
                                                            </EditCellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="email"  VisibleIndex="2">
                                                            <PropertiesTextEdit>
                                                                <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                                                    <RegularExpression ErrorText="Invali E-mail ID!" ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$" />
                                                                </ValidationSettings>
                                                            </PropertiesTextEdit>
                                                            <EditCellStyle HorizontalAlign="Right">
                                                            </EditCellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="status" VisibleIndex="3" Width="10%">
                                                            <EditFormSettings Visible="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataComboBoxColumn FieldName="cp_status" Visible="False" VisibleIndex="4" 
                                                            Width="10%">
                                                            <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True" >
                                                                <Items>
                                                                    <dxe:ListEditItem Text="Active" Value="Y">
                                                                    </dxe:ListEditItem>
                                                                    <dxe:ListEditItem Text="Suspended" Value="N">
                                                                    </dxe:ListEditItem>
                                                                </Items>
                                                            </PropertiesComboBox>
                                                            <EditFormSettings Visible="True" Caption="Status" />
                                                            <EditCellStyle HorizontalAlign="Right">
                                                            </EditCellStyle>
                                                        </dxwgv:GridViewDataComboBoxColumn>
                                                        <dxwgv:GridViewCommandColumn VisibleIndex="4" Width="10%">
                                                            <ClearFilterButton Visible="True">
                                                            </ClearFilterButton>
                                                            <DeleteButton Visible="True">
                                                            </DeleteButton>
                                                            <EditButton Visible="True">
                                                            </EditButton>
                                                            <HeaderCaptionTemplate >
                                                            
                                                                <dxe:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Add New" ClientSideEvents-Click="function(s, e) {GridContactPerson.AddNewRow();}" Font-Size="10px" Font-Underline="true">
                                                                </dxe:ASPxHyperLink>
                                                            </HeaderCaptionTemplate>
                                                            <HeaderStyle Font-Underline="True" HorizontalAlign="Center" />
                                                        </dxwgv:GridViewCommandColumn>
                                                    </Columns>
                                                    <SettingsBehavior ConfirmDelete="True" />
                                                    <SettingsPager ShowSeparators="True">
                                                    </SettingsPager>
                                                </dxwgv:ASPxGridView>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                    SelectCommand=""
                                                    InsertCommand="ContactPersonInsert" InsertCommandType="StoredProcedure"
                                                    DeleteCommand="ContactPersonDelete" DeleteCommandType="StoredProcedure" 
                                                    UpdateCommand="ContactPersonUpdate" UpdateCommandType="StoredProcedure"
                                                    >
                                                        
                                                        <InsertParameters>
                                                            <asp:Parameter Name="name" Type="String" />
                                                            <asp:Parameter Name="phone" Type="String" />
                                                            <asp:Parameter Name="email" Type="String" />
                                                            <asp:Parameter Name="cp_status" Type="String" />
                                                            <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                                                            <asp:SessionParameter Name="agentid" SessionField="KeyVal_InternalID" Type="String" />
                                                        </InsertParameters>
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="ContactId" Type="String" />
                                                        </DeleteParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="name" Type="String" />
                                                            <asp:Parameter Name="phone" Type="String" />
                                                            <asp:Parameter Name="email" Type="String" />
                                                            <asp:Parameter Name="cp_status" Type="String" />
                                                            <asp:Parameter Name="ContactId" Type="String" />
                                                            <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                                                        </UpdateParameters>
                                                </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
