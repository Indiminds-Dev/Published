<%@ page language="C#" autoeventwireup="true" inherits="management_frm_HoliDay_INT, App_Web_alid8jfz" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Holiday</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" language="javascript">
    function btnWorkingAddmodify_Click()
    {
      var str = "frm_Holiday_INT_popup.aspx?status=work&id="+schedule;
      frmOpenNewWindow1(str,400,200)
    }
    function btnExchangeAddmodify_Click()
    {
        var str = "frm_Holiday_INT_popup.aspx?status=exch&id="+schedule;
        frmOpenNewWindow1(str,400,500)
    }
    function frmOpenNewWindow1(location,v_height,v_weight)
    {
        var y=(screen.availHeight-v_height)/2;
        var x=(screen.availWidth-v_weight)/2;
        window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=yes,resizable=no,dependent=no");       
    }
    function PopulateGrid(obj1)
    {
        grid.PerformCallback();
        var item=obj1.split('~');
        schedule=obj1;
        if(item[3]=="work")
        {
            gridWorking.PerformCallback(obj1);
            
        }
        else
        {
            gridExchange.PerformCallback(obj1);
            
        }
        //height();
    }
    function btnAddNewHoliday(obj)
    {
        schedule=obj;
        //alert(obj);
        var items=obj.split('~');
         document.getElementById('TRGrid').style.display='inline';
         var send=items[0]+'~'+items[1];
         gridExchange.PerformCallback(obj);
         send=items[0]+'~'+items[2];
         gridWorking.PerformCallback(obj);
         height();
    }
    function ShowGridsForUpdate()
    {
        document.getElementById('TRGrid').style.display='inline';
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
        function LastCall(obj)
        {
            height();
        }
    </script>

    <script type="text/ecmascript">
    function ReceiveServerData(rValue)
    {   
        //alert(rValue);
        var DATA=rValue.split('~');  
        if(DATA[0]=="Edit")
        {
            
        }
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100" cellpadding="0px">
            <tr>
                <td class="EHEADER" style="text-align: center">
                    <span style="color: Blue"><strong>Holiday Master For Overseas Markets</strong></span>
                </td>
            </tr>
            <tr>
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
            <tr>
                <td  class="gridcellcenter">
                    <dxwgv:ASPxGridView ID="GridHoliday" ClientInstanceName="grid" runat="server" Width="100%"
                        AutoGenerateColumns="False" KeyFieldName="hol_id" DataSourceID="SqlDataSource1"
                        OnRowInserting="GridHoliday_RowInserting" OnRowUpdating="GridHoliday_RowUpdating"
                        OnInitNewRow="GridHoliday_InitNewRow" OnCustomCallback="GridHoliday_CustomCallback"
                        OnRowValidating="GridHoliday_RowValidating" OnHtmlEditFormCreated="GridHoliday_HtmlEditFormCreated"
                        OnHtmlRowCreated="GridHoliday_HtmlRowCreated" OnCustomJSProperties="GridHoliday_CustomJSProperties">
                        <Styles>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Holiday Name" FieldName="hol_Description"
                                Width="70%" VisibleIndex="0">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Caption="Holiday Name" Visible="True" />
                                <EditCellStyle Wrap="False" HorizontalAlign="Left">
                                </EditCellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataDateColumn Caption="Date" FieldName="hol_DateOfHoliday" VisibleIndex="1"
                                Width="20%" >
                                <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd MM yyyy">
                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesDateEdit>
                                <EditFormSettings Caption="Date" Visible="True" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditCellStyle Wrap="False" HorizontalAlign="Left">
                                </EditCellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Is Bank Holiday" FieldName="hol_IsBankHoliday1"
                                VisibleIndex="2" Width="10%">
                                <EditFormSettings Caption="Is Bank Holiday" Visible="False" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditCellStyle Wrap="False" HorizontalAlign="Left">
                                </EditCellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataCheckColumn Caption="Is Bank Holiday" FieldName="hol_IsBankHoliday"
                                Visible="False" VisibleIndex="2" Width="10%">
                                <EditFormSettings Visible="True" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditCellStyle HorizontalAlign="Left">
                                </EditCellStyle>
                            </dxwgv:GridViewDataCheckColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="3">
                                <EditButton Visible="True">
                                </EditButton>
                                <ClearFilterButton Visible="True">
                                </ClearFilterButton>
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <HeaderTemplate>
                                    <a id="btnAddModify" href="javascript:void(0);" onclick="grid.AddNewRow()"><span
                                        style="color: #000099; text-decoration: underline">Add New</span></a>
                                </HeaderTemplate>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Schedule" VisibleIndex="4" Width="5%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <DataItemTemplate>
                                    <a id="A1" href="javascript:void(0);" onclick="btnAddNewHoliday('<%# Container.KeyValue %>'+'~'+'<%# Eval("hol_exchange") %>'+'~'+'<%# Eval("hol_WorkingSchedule") %>')">
                                        <span style="color: #000099; text-decoration: underline">Schedule</span></a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataCheckColumn Caption="Is Depository Holiday" FieldName="hol_IsDepositoryHoliday"
                                Visible="False" VisibleIndex="4">
                                <EditFormSettings Caption="Is Depository Holiday" Visible="True" />
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditCellStyle HorizontalAlign="Left">
                                </EditCellStyle>
                            </dxwgv:GridViewDataCheckColumn>
                            <dxwgv:GridViewDataCheckColumn Caption="Is This Holiday" FieldName="hol_IsHoliday"
                                Visible="False" VisibleIndex="4">
                                <EditFormSettings Caption="Is This Holiday" Visible="True" />
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditCellStyle HorizontalAlign="Left">
                                </EditCellStyle>
                                <PropertiesCheckEdit ValueChecked="Y" ValueType="System.Char" ValueUnchecked="N">
                                </PropertiesCheckEdit>
                            </dxwgv:GridViewDataCheckColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                        <SettingsText ConfirmDelete="Are You Sure to Delete This Holiday?" />
                        <Templates>
                            <EditForm>
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 25%">
                                        </td>
                                        <td style="width: 50%">
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
                                        <td style="width: 25%">
                                        </td>
                                    </tr>
                                </table>
                            </EditForm>
                        </Templates>
                        <ClientSideEvents EndCallback="function(s, e) {
	LastCall(s.cpHeight);
}" />
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" DeleteCommand="DELETE FROM [Master_Holiday] WHERE [hol_id] = @original_hol_id "
                        InsertCommand="INSERT INTO [Master_Holiday] ([hol_DateOfHoliday], [hol_IsHoliday], [hol_Description], [hol_IsBankHoliday], [hol_IsDepositoryHoliday],[Createdate],[CreateUser]) VALUES (@hol_DateOfHoliday, @hol_IsHoliday, @hol_Description, @hol_IsBankHoliday, @hol_IsDepositoryHoliday,getdate(),@createUser)"
                        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [hol_id], [hol_DateOfHoliday], convert(varchar(20),hol_DateOfHoliday,103) as hol_DateOfHoliday1,(case hol_IsHoliday when 'Y' then 'Yes' when 'N' then 'No' else '' end) as hol_IsHoliday1 ,(case hol_IsBankHoliday when 'Y' then 'Yes' when 'N' then 'No' else '' end) as hol_IsBankHoliday1, hol_exchange,hol_WorkingSchedule,
     [hol_IsHoliday],
    [hol_Description], 
    (case [hol_IsBankHoliday] when 'Y' then 'True' when 'N' then 'False' else '' end) as hol_IsBankHoliday,
    (case [hol_IsDepositoryHoliday] when 'Y' then 'True' when 'N' then 'False' else '' end) as hol_IsDepositoryHoliday  FROM [Master_Holiday]"
                        UpdateCommand="UPDATE [Master_Holiday] SET [hol_DateOfHoliday] = @hol_DateOfHoliday, [hol_IsHoliday] = @hol_IsHoliday, [hol_Description] = @hol_Description, [hol_IsBankHoliday] = @hol_IsBankHoliday, [hol_IsDepositoryHoliday] = @hol_IsDepositoryHoliday,[lastModifyDate]=getdate(),[lastModifyUser]=@modifyUser WHERE [hol_id] = @original_hol_id ">
                        <DeleteParameters>
                            <asp:Parameter Name="original_hol_id" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="hol_DateOfHoliday" Type="DateTime" />
                            <asp:Parameter Name="hol_IsHoliday" Type="String" />
                            <asp:Parameter Name="hol_Description" Type="String" />
                            <asp:Parameter Name="hol_IsBankHoliday" Type="String" />
                            <asp:Parameter Name="hol_IsDepositoryHoliday" Type="String" />
                            <asp:Parameter Name="original_hol_id" Type="Int32" />
                            <asp:Parameter Name="original_hol_DateOfHoliday" Type="DateTime" />
                            <asp:Parameter Name="original_hol_IsHoliday" Type="String" />
                            <asp:Parameter Name="original_hol_Description" Type="String" />
                            <asp:Parameter Name="original_hol_IsBankHoliday" Type="String" />
                            <asp:Parameter Name="original_hol_IsDepositoryHoliday" Type="String" />
                            <asp:SessionParameter Name="modifyUser" SessionField="userid" Type="string" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="hol_DateOfHoliday" Type="DateTime" />
                            <asp:Parameter Name="hol_IsHoliday" Type="String" />
                            <asp:Parameter Name="hol_Description" Type="String" />
                            <asp:Parameter Name="hol_IsBankHoliday" Type="String" />
                            <asp:Parameter Name="hol_IsDepositoryHoliday" Type="String" />
                            <asp:SessionParameter Name="createUser" SessionField="userid" Type="string" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                    </dxwgv:ASPxGridViewExporter>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top;">
                    <table class="TableMain100" cellpadding="0px" cellspacing="0px">
                        <tr id="TRGrid" style="display: none">
                            <td class="gridcellright" style="width: 93px">
                                <span class="Ecoheadtxt" style="color: Blue"><strong>Exchange:</strong></span>
                            </td>
                            <td class="gridcellleft" style="width: 329px">
                                <table class="TableMain100"  cellspacing="0px">
                                    <tr>
                                        <td style="vertical-align: top; text-align:left">
                                            <dxwgv:ASPxGridView ID="GridExchange" ClientInstanceName="gridExchange" runat="server"
                                                AutoGenerateColumns="False" Width="100%" KeyFieldName="Exchange_ID" OnCustomCallback="GridExchange_CustomCallback" OnCustomJSProperties="GridExchange_CustomJSProperties">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Exchange_Name" VisibleIndex="0">
                                                        <HeaderTemplate>
                                                            <a id="A2" href="javascript:void(0);" onclick="btnExchangeAddmodify_Click()"><span
                                                                style="color: #000099; text-decoration: underline">Add/Modify</span></a>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsPager Visible="False">
                                                </SettingsPager>
                                                <Styles>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                </Styles>
                                                <SettingsBehavior AllowSort="False" />
                                                <ClientSideEvents EndCallback="function(s, e) {
	LastCall(s.cpHeight);
}" />
                                            </dxwgv:ASPxGridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="gridcellright" style="width: 97px">
                                <span class="Ecoheadtxt" style="color: Blue"><strong>Working Schedule:</strong></span>
                            </td>
                            <td style="text-align: left; width: 251px; vertical-align:top;">
                                <table class="TableMain100" cellpadding="0px" cellspacing="0px">
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">
                                            <dxwgv:ASPxGridView ID="GridWorking" ClientInstanceName="gridWorking" runat="server"
                                                AutoGenerateColumns="False" Width="100%" KeyFieldName="wor_id" OnCustomCallback="GridWorking_CustomCallback">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="wor_scheduleName">
                                                        <HeaderTemplate>
                                                            <a id="A3" href="javascript:void(0);" onclick="btnWorkingAddmodify_Click()"><span
                                                                style="color: #000099; text-decoration: underline">Add/Modify</span></a>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsPager Visible="False">
                                                </SettingsPager>
                                                <Styles>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                </Styles>
                                                <SettingsBehavior AllowSort="False" />
                                            </dxwgv:ASPxGridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 122px" colspan="3">
                            </td>
                            <td class="gridcellleft" style="display: none">
                                <dxe:ASPxButton ID="btnModify" runat="server" Text="Modify">
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
