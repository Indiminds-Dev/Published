<%@ page language="C#" autoeventwireup="true" inherits="management_IframeTopics, App_Web_-k9nslwd" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Topics</title>
     <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function ShowInsert(obj)
        {
            var objFetch=obj.split('~');
            if(objFetch[0,1]=='1')
            {
                gridTopics.GetEditor("Topics_AccessCode").SetEnabled(false);
                gridTopics.GetEditor("Topics_Description").SetEnabled(false);
                gridTopics.GetEditor("ApplicableEntity").SetEnabled(false);
                gridTopics.GetEditor("Topics_NotificationMethod").SetEnabled(false);
                gridTopics.GetEditor("Topics_DeliveryMode").SetEnabled(false);
                gridTopics.GetEditor("Topics_DeliveryFrequency").SetEnabled(false);
            }
            else if(objFetch[0,1]=='2')
            {
                gridTopics.GetEditor("Topics_AccessCode").SetEnabled(false);
                gridTopics.GetEditor("Topics_Description").SetEnabled(false);
                gridTopics.GetEditor("ApplicableEntity").SetEnabled(false);
                gridTopics.GetEditor("Topics_NotificationMethod").SetEnabled(false);
                gridTopics.GetEditor("Topics_DeliveryMode").SetEnabled(false);
                gridTopics.GetEditor("Topics_DeliveryFrequency").SetEnabled(false);
                gridTopics.GetEditor("Topics_SubscriptionRequired").SetEnabled(false);
                gridTopics.GetEditor("Topics_SelfSubscription").SetEnabled(false);
                gridTopics.GetEditor("TStatus").SetEnabled(false);
                gridTopics.GetEditor("Topics_ActivationDateTime").SetEnabled(false);
                gridTopics.GetEditor("Topics_SuspensionDateTime").SetEnabled(false);
            }
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
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <table class="TableMain100">            
            <tr>
                <td style="height: 268px">
                    <dxwgv:ASPxGridView ID="gridTopics" runat="server" AutoGenerateColumns="False" Width="100%"
                        ClientInstanceName="gridTopics" DataSourceID="SqlTopics" KeyFieldName="Topics_Code"
                        OnCustomJSProperties="gridTopics_CustomJSProperties" OnStartRowEditing="gridTopics_StartRowEditing"
                        OnHtmlEditFormCreated="gridTopics_HtmlEditFormCreated">
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                        </Styles>
                        <Settings ShowTitlePanel="True" ShowFooter="True" ShowStatusBar="Visible" 
                            ShowGroupPanel="True" />
                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                        <SettingsText PopupEditFormCaption="Modify Topics" ConfirmDelete="Are You Want To Delete This Record ???" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="400px" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px"
                            EditFormColumnCount="1" />
                        <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                            PageSize="20">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="Topics_Code" Visible="False" ReadOnly="True"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Access Code" FieldName="Topics_AccessCode"
                                ReadOnly="True" VisibleIndex="0">
                                <EditFormSettings Visible="True" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Description" FieldName="Topics_Description"
                                VisibleIndex="1">
                                <EditFormSettings Visible="True" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Applicable Entities" FieldName="ApplicableEntity"
                                VisibleIndex="2">
                                <EditFormSettings Visible="True" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Requires Subscription" FieldName="Topics_SubscriptionRequired"
                                Visible="False" VisibleIndex="4">
                                <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True" EnableSynchronization="False">
                                    <Items>
                                        <dxe:ListEditItem Text="Yes" Value="Y">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="No" Value="N">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Available for Self-Subscription by entities"
                                FieldName="Topics_SelfSubscription" Visible="False" VisibleIndex="5">
                                <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True" EnableSynchronization="False">
                                    <Items>
                                        <dxe:ListEditItem Text="Yes" Value="Y">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="No" Value="N">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Notification Method" Visible="False" FieldName="Topics_NotificationMethod"
                                VisibleIndex="6">
                                <EditFormSettings Visible="True" />
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Delivery Mode" Visible="False" FieldName="Topics_DeliveryMode"
                                VisibleIndex="7">
                                <EditFormSettings Visible="True" />
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Delivery Frequency" Visible="False" FieldName="Topics_DeliveryFrequency"
                                VisibleIndex="8">
                                <EditFormSettings Visible="True" />
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Status" FieldName="TStatus" Visible="False"
                                VisibleIndex="9">
                                <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True" EnableSynchronization="False">
                                    <Items>
                                        <dxe:ListEditItem Text="Enabled" Value="E">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Suspended" Value="S">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Topic Activation DateTime" Visible="False"
                                FieldName="Topics_ActivationDateTime" VisibleIndex="10">
                                <PropertiesDateEdit EditFormatString="dd-MM-yyyy" DisplayFormatString="dd MMM yyyy"
                                    UseMaskBehavior="true" EditFormat="Custom">
                                </PropertiesDateEdit>
                                <EditFormSettings Visible="True" />
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Topic Suspension DateTime" Visible="False"
                                FieldName="Topics_SuspensionDateTime" VisibleIndex="11">
                                <PropertiesDateEdit EditFormatString="dd-MM-yyyy" DisplayFormatString="dd MMM yyyy"
                                    UseMaskBehavior="true" EditFormat="Custom">
                                </PropertiesDateEdit>
                                <EditFormSettings Visible="True" />
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="3">
                                <EditButton Visible="True">
                                </EditButton>
                            </dxwgv:GridViewCommandColumn>
                        </Columns>
                        <Templates>
                            <EditForm>
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 100%">
                                            <controls>
                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                            </controls>
                                            <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                    runat="server">
                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                    runat="server">
                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </EditForm>
                        </Templates>
                        <ClientSideEvents EndCallback="function(s,e){ShowInsert(s.cpFetch);}" />
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="SqlTopics" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                        SelectCommand="select Topics_Code,Topics_AccessCode,Topics_Description,Topics_SubscriptionRequired,Topics_SelfSubscription,Topics_ActivationDateTime,Topics_SuspensionDateTime,case Topics_ApplicableEntity when 'C' then 'Customers' when 'M' then  'Management' when 'B' then 'Business Partners' when 'D' then 'DP Clients' when 'X' then 'Common' else 'Family Groups' end as ApplicableEntity,case Topics_Status when 'B' then 'Blocked' else Topics_Status end as TStatus,case when Topics_NotificationMethod='A' then 'Auto' when Topics_NotificationMethod='R' then 'Request' else 'Auto,Request' end as Topics_NotificationMethod,dbo.splitTopic(Topics_DeliveryMode,1) as Topics_DeliveryMode,dbo.splitTopic(Topics_DeliveryFrequency,2) as Topics_DeliveryFrequency,Topics_ModifyUser FROM [Master_Topics]"
                        UpdateCommand="UPDATE [Master_Topics] SET  [Topics_SubscriptionRequired] = @Topics_SubscriptionRequired, [Topics_SelfSubscription] = @Topics_SelfSubscription, [Topics_Status] = @TStatus, [Topics_ActivationDateTime] = @Topics_ActivationDateTime, [Topics_SuspensionDateTime] = @Topics_SuspensionDateTime, [Topics_ModifyUser] = @Topics_ModifyUser, [Topics_ModifyDateTime] = getdate() WHERE [Topics_Code] = @Topics_Code AND [Topics_AccessCode] = @Topics_AccessCode">
                        <UpdateParameters>
                            <asp:Parameter Name="Topics_SubscriptionRequired" Type="String" />
                            <asp:Parameter Name="Topics_SelfSubscription" Type="String" />
                            <asp:Parameter Name="TStatus" Type="String" />
                            <asp:Parameter Name="Topics_ActivationDateTime" Type="DateTime" />
                            <asp:Parameter Name="Topics_SuspensionDateTime" Type="DateTime" />
                            <asp:SessionParameter Name="Topics_ModifyUser" SessionField="userid" Type="Int32" />
                            <asp:Parameter Name="Topics_Code" Type="String" />
                            <asp:Parameter Name="Topics_AccessCode" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
