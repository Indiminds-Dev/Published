<%@ page language="C#" autoeventwireup="true" inherits="management_newtest, App_Web_sjbhlkdr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<link href="../CSS/style.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>

    <script language="javascript" type="text/javascript">
function OnchkSelectChange(chkSelect,a) 
 {
  //alert('Send KeyValue'a);
  alert('Keyvalue ' + document.getElementById("hddnSelectKeyValue").value);
  
  alert('Type ' + chkSelect.GetValue().toString());
   if(chkSelect.GetValue().toString()=="Default")
   {
       if(document.getElementById("hddnSelectStatus").value=="")
       {
       document.getElementById("hddnSelectStatus").value="1";
       document.getElementById("hddnSelectKeyValue").value=a;
       alert('Keyvalue ' + document.getElementById("hddnSelectKeyValue").value);
       }
       else
       {
        alert("Please choose one account only");
        chkSelect.SetValue("Secondary");
       
       }
      
   }
   else
   {
    document.getElementById("hddnSelectStatus").value="";
    document.getElementById("hddnSelectKeyValue").value="";
   }

}
    
    </script>

    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hddnSelectKeyValue" runat="server" />
            <asp:HiddenField ID="hddnSelectStatus" runat="server" />
            <%--    <dxwgv:ASPxGridView ID="grdClientbank" runat="server" AutoGenerateColumns="False"
                KeyFieldName="cbd_id" ClientInstanceName="grdClientbankCI" ForeColor="White"
                CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue"
                DataSourceID="dsgrdClientbank" Width="100%" OnHtmlEditFormCreated="grdClientbank_HtmlEditFormCreated"
                OnHtmlRowCreated="grdClientbank_HtmlRowCreated" OnHtmlFooterCellPrepared="grdClientbank_HtmlFooterCellPrepared">
                <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue">
                </Styles>
                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                </SettingsPager>
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
                <SettingsEditing EditFormColumnCount="4" />
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="Key Value" FieldName="cbd_id" VisibleIndex="0"
                        Width="30%">
                        <EditFormCaptionStyle Wrap="False">
                        </EditFormCaptionStyle>
                        <CellStyle CssClass="gridcellleft">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Bank Name" FieldName="bnk_bankName" VisibleIndex="1"
                        Width="30%">
                        <EditFormCaptionStyle Wrap="False">
                        </EditFormCaptionStyle>
                        <CellStyle CssClass="gridcellleft">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Bank Account Name" FieldName="cbd_accountName"
                        VisibleIndex="2" Width="30%">
                        <EditFormCaptionStyle Wrap="False">
                        </EditFormCaptionStyle>
                        <CellStyle CssClass="gridcellleft" Wrap="False">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Account Number" FieldName="cbd_accountNumber"
                        VisibleIndex="3" Width="15%">
                        <EditFormCaptionStyle Wrap="False">
                        </EditFormCaptionStyle>
                        <CellStyle CssClass="gridcellleft" Wrap="False">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="MICR No" FieldName="bnk_micrno" VisibleIndex="4"
                        Width="15%">
                        <EditFormCaptionStyle Wrap="False">
                        </EditFormCaptionStyle>
                        <CellStyle CssClass="gridcellleft" Wrap="False">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Account Type" FieldName="AccountType" VisibleIndex="5"
                        Width="10%">
                        <EditFormCaptionStyle Wrap="False">
                        </EditFormCaptionStyle>
                        <CellStyle CssClass="gridcellleft" Wrap="False">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataCheckColumn Caption="Selection" VisibleIndex="6"
                        FieldName="cbd_Accountcategory">
                        <PropertiesCheckEdit ValueType="System.String" ValueChecked="Default" ValueUnchecked="Secendary">
                        </PropertiesCheckEdit>
                        <DataItemTemplate>
                            <dxe:ASPxCheckBox ID="chkSelect" runat="server" Value='<%#Bind("cbd_Accountcategory") %>'
                                ValueType="System.String" ValueChecked="Default" ValueUnchecked="Secondary">
                                <%-- <ClientSideEvents ValueChanged="function(s, e) { OnchkSelectChange(s); }" />--%>
            <%--  
            </dxe:ASPxCheckBox> </DataItemTemplate> </dxwgv:GridViewDataCheckColumn> </Columns>
            <settingsbehavior allowmultiselection="True" />
            <settingstext emptydatarow="No Data Found" />
            </dxwgv:ASPxGridView>--%>
            <dxe:ASPxComboBox ID="CmbClientBank" runat="server" Width="250px" DropDownWidth="550"
                DropDownStyle="DropDownList" DataSourceID="dsgrdClientbank" ValueField="cbd_id"
                ValueType="System.String" TextFormatString="{0} -- {2}" EnableCallbackMode="true"
                EnableIncrementalFiltering="True" CallbackPageSize="30" SelectedIndex="0">
                <Columns>
                    <dxe:ListBoxColumn FieldName="bnk_bankName" Width="130px" />
                    <dxe:ListBoxColumn FieldName="cbd_accountName" Width="100%" />
                    <dxe:ListBoxColumn FieldName="cbd_accountNumber" Width="60px" />
                    <dxe:ListBoxColumn FieldName="bnk_micrno" Width="100px" />
                </Columns>
            </dxe:ASPxComboBox>
            <asp:SqlDataSource ID="dsgrdClientbank" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" InsertCommand="insert into table1 (temp123) values('11')"
                SelectCommand="select A.* , MB.bnk_id,MB.bnk_bankName,MB.bnk_BranchName,MB.bnk_micrno from (Select TCBD.cbd_id,TCBD.cbd_cntId,TCBD.cbd_bankCode, TCBD.cbd_Accountcategory,TCBD.cbd_Accountcategory as AccountType,TCBD.cbd_accountNumber,TCBD.cbd_accountType,cbd_accountName from tbl_trans_contactBankDetails as  TCBD where TCBD.cbd_cntId=@SubAccountCode) as A inner  join tbl_master_Bank as MB on MB.bnk_id=a.cbd_id">
                <SelectParameters>
                    <asp:Parameter Name="SubAccountCode" Type="string" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
