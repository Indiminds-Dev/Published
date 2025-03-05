<%@ page language="C#" autoeventwireup="true" inherits="management_frm_Subledger, App_Web_leuczwkw" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sub Account Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" /> 
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />
    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />
    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>
    <script type="text/javascript" src="../modalfiles/modal.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
	<script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:100;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:5;
	}
	
	form{
		display:inline;
	}
	
	</style>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script language="javascript" type="text/javascript">
    
     function ShowHideFilter(obj)
    {
    
       grid.PerformCallback(obj);
    }
     function ShowHideFilterWC(obj)
    {
  
       grid1.PerformCallback(obj);
    }

      function ShowCustom(Keyvalue,MainAcID) {
        //alert(Keyvalue);
        //alert(MainAcID);
           
        var url = "frm_OpeningBalanceSubAc.aspx?id="+Keyvalue+"&MainAcId="+MainAcID+"";
        //alert(url);
        popup.SetContentUrl(url);

        popup.Show();

    }
       function ShowWCustomType(Keyvalue,MainAcID) {
        //alert(Keyvalue);
        //alert(MainAcID);
        var url = "frm_OpeningBalanceSubAcWC.aspx?id="+Keyvalue+"&MainAcID="+MainAcID+"";
        //alert(url);
        popup.SetContentUrl(url);

        popup.Show();

    }
    function ShowError(obj)
    {
       if(obj=="b")
       {
            alert('Transaction Exists for this Code. Deletion Not Allowed !!');
            return false;
       }
       if(obj=="z")
       {
       txtAccountNo.SetEnabled(false);
        VisibleForCustom();
       }
       else
       {
       //alert ('1');
      // txtAccountNo.SetEnabled(false);
       VisibleForCustom();
       }
    }
    function ShowErrorWithoutCustom(obj)
    {
        VisibleForWithoutCustom();
    }
    function ShowAssetCustom(keyvalue,keycode)
    {
              
         var url= "AssetDetail.aspx?kval="+keyvalue+"&kcode="+keycode;
           //alert(url);    
//        editwin=dhtmlmodal.open("Editbox", "iframe", url, "Add/Modify AssetDetail", "width=900px,height=500px,center=1,resize=1,scrolling=2,top=500", "recal")
          editwin=dhtmlmodal.open("Editbox", "iframe", url,"Add/Modify AssetDetail of "+keyvalue+"" , "width=850px,height=450px,center=1,resize=1,scrolling=2,top=500", "recal")
         document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='hidden';
         editwin.onclose=function()
         {
         //alert("sds");
         document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='visible';
         }
         return false;
    }
    function showhistory(obj)
    {
    
        var URL='Contact_Document.aspx?idbldng='+obj;
       
        //parent.OnMoreInfoClick(URL,"Modify Contact Details",'10px','10px',"Y");
        editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Document", "width=950px,height=400px,center=0,resize=1,top=-1", "recal");                 
        editwin.onclose=function()
             {
                 grid.PerformCallback();
             }

    }
    function Page_Load()
    {
        val='No';
    }
    function Page_Load1()
    {
        val='Yes';
    }
    function VisibleForCustom()
    {
        if(val=='No')
        {
            var obj = document.getElementById('TrDepreciation')
            if(obj!=null)
                obj.style.display='none';            
        }
        else if(val='Yes')
        {
            var obj1 = document.getElementById('TrTdsAppl')
            if(obj1!=null)
                obj1.style.display='none';
            var obj2 = document.getElementById('TrFbtAppl')
            if(obj2!=null)
                obj2.style.display='none';
            var obj3 = document.getElementById('TrRateOInt')
            if(obj3!=null)
                obj3.style.display='none';
        }
    }
    function VisibleForWithoutCustom()
    {
        if(val=='No')
        {
            var obj = document.getElementById('TrDepreciation1')
            if(obj!=null)
                obj.style.display='none';            
        }
        else if(val='Yes')
        {
            var obj1 = document.getElementById('TrTdsAppl1')
            if(obj1!=null)
                obj1.style.display='none';
            var obj2 = document.getElementById('TrFbtAppl1')
            if(obj2!=null)
                obj2.style.display='none';
            var obj3 = document.getElementById('TrRateOInt1')
            if(obj3!=null)
                obj3.style.display='none';
        }
    }
    function CallTdsAccount(objid,objfunc,objevant)
    {
        ajax_showOptions(objid,objfunc,objevant);
    }
    FieldName='ctl00_ContentPlaceHolder1_Headermain1_cmbSegment';
   // FieldName='txtAccountNo';
    </script>

    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER">
                        <strong><span style="color: #000099; padding-left: 8px;">
                            <%ShowList();%>
                            <%=accountname%>
                        </span></strong>
                    </td>
                </tr>
                <tr id="trCustom" runat="server">
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
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="trWithoutCustom" runat="server">
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="text-align: left; vertical-align: top">
                                    <table>
                                        <tr>
                                            <td id="Td2">
                                                <a href="javascript:ShowHideFilterWC('s');"><span style="color: #000099; text-decoration: underline">
                                                    Show Filter</span></a>
                                            </td>
                                            <td id="Td3">
                                                <a href="javascript:ShowHideFilterWC('All');"><span style="color: #000099; text-decoration: underline">
                                                    All Records</span></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%">
                        <dxwgv:ASPxGridView ID="SubAccountGrid" runat="server" AutoGenerateColumns="False"
                            KeyFieldName="SubAccount_ReferenceID" ClientInstanceName="grid" 
                             DataSourceID="SubAccount" Width="100%" OnRowValidating="SubAccountGrid_OnRowValidating"
                            OnHtmlEditFormCreated="SubAccountGrid_HtmlEditFormCreated" OnRowUpdating="SubAccountGrid_OnRowUpdating"
                            OnRowInserting="SubAccountGrid_RowInserting" OnStartRowEditing="SubAccountGrid_OnStartRowEditing"
                            OnCustomCallback="SubAccountGrid_CustomCallback" OnHtmlDataCellPrepared="SubAccountGrid_HtmlDataCellPrepared"
                            OnRowDeleting="SubAccountGrid_RowDeleting" OnCustomJSProperties="SubAccountGrid_CustomJSProperties" OnHtmlRowCreated="SubAccountGrid_HtmlRowCreated">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Sub Account Code" FieldName="SubAccount_Code"
                                    VisibleIndex="0">
                                    <EditFormSettings Visible="False" VisibleIndex="5" />
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="SubAccount_Name" VisibleIndex="1">
                                    <PropertiesTextEdit>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField ErrorText="Required" IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" VisibleIndex="13" />
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="SubAccount_IsTDS" Visible="False" VisibleIndex="3">
                                    <EditFormSettings Visible="False" VisibleIndex="6" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="TDS Rate" FieldName="SubAccount_TDSRate" Visible="False"
                                    VisibleIndex="4">
                                    <PropertiesTextEdit>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField ErrorText="Required" IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" VisibleIndex="10" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataCheckColumn FieldName="SubAccount_IsFBT" Visible="False" VisibleIndex="5">
                                    <EditFormSettings Visible="False" VisibleIndex="8" />
                                </dxwgv:GridViewDataCheckColumn>
                                <dxwgv:GridViewDataTextColumn Caption="FBT Rate" FieldName="SubAccount_FBTRate" Visible="False"
                                    VisibleIndex="6">
                                    <PropertiesTextEdit>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField ErrorText="Required" IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" VisibleIndex="12" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Rate Of Interest (P/a)" FieldName="SubAccount_RateOfInterest"
                                    Visible="False" VisibleIndex="15">
                                    <EditFormSettings Visible="False" VisibleIndex="15" />
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Depreciation" FieldName="SubAccount_Depreciation"
                                    Visible="False" VisibleIndex="15">
                                    <EditFormSettings Visible="False" VisibleIndex="15" />
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewCommandColumn Caption="Edit" VisibleIndex="2">
                                    <EditButton Visible="True">
                                    </EditButton>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <%if (strname == "Custom")
                                          { %>
                                        <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                        <%} %>
                                    </HeaderTemplate>
                                    <DeleteButton Visible="True" Text="Remove">
                                    </DeleteButton>
                                </dxwgv:GridViewCommandColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Opening DR/CR" VisibleIndex="3" FieldName="Custom">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" id="aaa" style="color: #000099;" runat="server">Add/Edit
                                        </a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Asset Details" VisibleIndex="4" FieldName="AssetCustom">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" id="aaa1" style="color: #000099;" runat="server">Asset
                                            Details </a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Documents" VisibleIndex="5" FieldName="AssetCustom1">
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                
                            </Columns>
                            <Styles  >
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                            </Styles>
                            <ClientSideEvents EndCallback="function(s,e) { ShowError(s.cpInsertError);
                                        }" />
                            <Settings ShowGroupedColumns="True" ShowGroupPanel="True" />
                            <SettingsText PopupEditFormCaption="Add/Modify Sub Account" ConfirmDelete="Are you sure to Delete this Record!" />
                            <SettingsPager NumericButtonCount="20" ShowSeparators="True">
                            </SettingsPager>
                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                            <SettingsEditing PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px" />
                          
                            <Templates>
                                <EditForm>
                                    <table style="width: 100%; background-color: #ffdead;" border="0" id="main">
                                        <tr>
                                            <td style="text-align: right;">
                                                Sub Account Name :</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtAccountCode" runat="server" Text='<%#Bind("SubAccount_Name") %>'
                                                    Width="203px" MaxLength="100">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="trAccountName">
                                            <td style="text-align: right;">
                                                Code:</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtAccountNo" ClientInstanceName="txtAccountNo" runat="server" Text='<%#Bind("SubAccount_Code") %>'
                                                    Width="203px" MaxLength="10">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="TrTdsAppl">
                                            <td style="text-align: right;">
                                                TDS Applicable:</td>
                                            <td style="text-align: left;">
                                                <table border="0" cellpadding="0" cellspacing="0">
                                                     <tr>
                                                        <td colspan="2">
                                                            <asp:TextBox ID="txtTdsType" runat="server" Width="300px" Font-Size="10px" Text='<%#Bind("SubAccount_IsTDS") %>'
                                                                onkeyup="CallTdsAccount(this,'SearchTdsTcsCode',event)"></asp:TextBox>
                                                            <asp:HiddenField ID="txtTdsType_hidden" runat="server" Value='<%#Bind("SubAccount_TDSRate") %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="TrFbtAppl">
                                            <td style="text-align: right;">
                                                FBT Applicable:</td>
                                            <td style="text-align: left;">
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <dxe:ASPxCheckBox ID="SubAccount_IsFBT" runat="server" Width="50px" Checked='<%# Container.Grid.IsNewRowEditing ? false : Container.Grid.GetRowValues(Container.VisibleIndex, "SubAccount_IsFBT") %>'
                                                                ValueType="System.Boolean" />
                                                        </td>
                                                        <td id="fbtrate">
                                                            FBT Rate:</td>
                                                        <td id="fbtrate1">
                                                            <dxe:ASPxTextBox ID="txtFBTRate" runat="server" Text='<%#Bind("SubAccount_FBTRate") %>'
                                                                MaskSettings-Mask="<0..9999g>.<00..99>" ValidationSettings-ErrorDisplayMode="None"
                                                                MaskSettings-IncludeLiterals="DecimalSymbol" Width="100px">
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="TrRateOInt">
                                            <td style="text-align: right;">
                                                Rate Of Interest (P/a):</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtRateofIntrest" runat="server" Text='<%#Bind("SubAccount_RateOfInterest") %>'
                                                    MaskSettings-Mask="<0..9999g>.<00..99>" ValidationSettings-ErrorDisplayMode="None"
                                                    MaskSettings-IncludeLiterals="DecimalSymbol" Width="203px">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="TrDepreciation">
                                            <td style="text-align: right;">
                                                Depreciation:
                                            </td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtDepreciation" runat="server" Text='<%#Bind("SubAccount_Depreciation") %>'
                                                    MaskSettings-Mask="<0..9999g>.<00..99>" ValidationSettings-ErrorDisplayMode="None"
                                                    MaskSettings-IncludeLiterals="DecimalSymbol" Width="150px">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <controls>
                        <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="ASPxGridViewTemplateReplacement1">
                         </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                      </controls>
                                                <div style="text-align: center; padding: 2px 2px 2px 2px; font-weight: bold;">
                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement2" ReplacementType="EditFormUpdateButton"
                                                        runat="server">
                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement3" ReplacementType="EditFormCancelButton"
                                                        runat="server">
                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td>
                                                <controls>
                        <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                         </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                      </controls>
                                                <div style="text-align: center; padding: 2px 2px 2px 2px">
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
                        </dxwgv:ASPxGridView>
                        &nbsp;
                        <dxwgv:ASPxGridView ID="SubAccountWithoutCustom" runat="server" AutoGenerateColumns="False"
                            KeyFieldName="Contact_ID" ClientInstanceName="grid1" 
                             DataSourceID="WithoutCustom" Width="100%" OnCustomCallback="SubAccountWithoutCustom_CustomCallback"
                            OnHtmlEditFormCreated="SubAccountWithoutCustom_OnHtmlEditFormCreated" OnRowUpdating="SubAccountWithoutCustom_OnRowUpdating"
                            OnRowValidating="SubAccountWithoutCustom_OnRowValidating" OnStartRowEditing="SubAccountWithoutCustom_OnStartRowEditing"
                            OnRowInserting="SubAccountWithoutCustom_OnRowInserting" OnInitNewRow="SubAccountWithoutCustom_InitNewRow"
                            OnHtmlDataCellPrepared="SubAccountWithoutCustom_HtmlDataCellPrepared" OnCustomJSProperties="SubAccountWithoutCustom_CustomJSProperties" OnHtmlRowCreated="SubAccountWithoutCustom_HtmlRowCreated">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="Contact_ID" VisibleIndex="0">
                                    <EditFormSettings Visible="False" VisibleIndex="1" />
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Code" FieldName="Contact_Code" VisibleIndex="1">
                                    <EditFormSettings Visible="False" VisibleIndex="2" />
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="Contact_Name" VisibleIndex="2">
                                    <EditFormSettings Visible="False" VisibleIndex="3" />
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="SubAccount Code" FieldName="SubAccount_Code"
                                    Visible="False" VisibleIndex="6">
                                    <PropertiesTextEdit>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField ErrorText="Required" IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" VisibleIndex="12" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="SubAccount Name" FieldName="SubAccount_Name"
                                    Visible="False" VisibleIndex="6">
                                    <PropertiesTextEdit>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField ErrorText="Required" IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" VisibleIndex="12" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="SubAccount Reference ID" FieldName="Subaccount_ReferenceID"
                                    Visible="False" VisibleIndex="6">
                                    <EditFormSettings Visible="False" VisibleIndex="12" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="SubAccount_IsTDS" Visible="False" VisibleIndex="3">
                                    <EditFormSettings Visible="False" VisibleIndex="6" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="TDS Rate" FieldName="SubAccount_TDSRate" Visible="False"
                                    VisibleIndex="4">
                                    <EditFormSettings Visible="False" VisibleIndex="10" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataCheckColumn FieldName="SubAccount_IsFBT" Visible="False" VisibleIndex="5">
                                    <EditFormSettings Visible="False" VisibleIndex="8" />
                                </dxwgv:GridViewDataCheckColumn>
                                <dxwgv:GridViewDataTextColumn Caption="FBT Rate" FieldName="SubAccount_FBTRate" Visible="False"
                                    VisibleIndex="6">
                                    <EditFormSettings Visible="False" VisibleIndex="12" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Rate Of Interest (P/a)" FieldName="SubAccount_RateOfInterest"
                                    Visible="False" VisibleIndex="15">
                                    <EditFormSettings Visible="False" VisibleIndex="15" />
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Depreciation" FieldName="SubAccount_Depreciation"
                                    Visible="False" VisibleIndex="15">
                                    <EditFormSettings Visible="False" VisibleIndex="15" />
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewCommandColumn Name="Edit" VisibleIndex="3">
                                    <EditButton Visible="True">
                                    </EditButton>
                                </dxwgv:GridViewCommandColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Opening DR/CR" VisibleIndex="4" FieldName="ShowWCustom">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" id="aaa" style="color: #000099;" runat="server">Add /
                                            Edit</a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Asset Details" VisibleIndex="5" FieldName="AssetShowWCustom">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" id="aaa1" style="color: #000099;" runat="server">Asset
                                            Details </a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Documents" VisibleIndex="5" FieldName="AssetCustom1">
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <Styles  >
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                            </Styles>
                            <ClientSideEvents EndCallback="function(s,e) { ShowErrorWithoutCustom(s.cpInsertErrorWithoutCustom);
                                        }" />
                            <Settings ShowGroupedColumns="True" ShowGroupPanel="True" />
                            <SettingsText PopupEditFormCaption="Add/Modify Sub Account" ConfirmDelete="Are you sure to Delete this Record!" />
                            <SettingsPager NumericButtonCount="20" ShowSeparators="True">
                            </SettingsPager>
                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                            <SettingsEditing PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px" />
                            
                            <Templates>
                                <EditForm>
                                    <table style="width: 100%; background-color: #ffdead;" border="0" id="main">
                                        <tr>
                                            <td style="text-align: right;">
                                                Sub Account Name :</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtAccountCodeWC" runat="server" Width="203px" ReadOnly="true"
                                                    ReadOnlyStyle-ForeColor="DarkGray" Text='<%#Bind("Contact_Name") %>'>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right;">
                                                Code:</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtAccountNoWC" runat="server" Width="203px" ReadOnly="true"
                                                    ReadOnlyStyle-ForeColor="DarkGray" Text='<%#Bind("Contact_ID") %>'>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <asp:HiddenField ID="hddnContactID" runat="server" />
                                        <tr id="TrTdsAppl1">
                                            <td style="text-align: right;">
                                                TDS Applicable:</td>
                                            <td style="text-align: left;">
                                                <table border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:TextBox ID="txtTdsType" runat="server" Width="300px" Font-Size="10px" Text='<%#Bind("SubAccount_IsTDS") %>'
                                                                onkeyup="CallTdsAccount(this,'SearchTdsTcsCode',event)"></asp:TextBox>
                                                            <asp:HiddenField ID="txtTdsType_hidden" runat="server" Value='<%#Bind("SubAccount_TDSRate") %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="TrFbtAppl1">
                                            <td style="text-align: right;">
                                                FBT Applicable:</td>
                                            <td style="text-align: left;">
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <dxe:ASPxCheckBox ID="SubAccount_IsFBT" runat="server" Width="50px" ValueType="System.Boolean"
                                                                Checked='<%# Container.Grid.IsNewRowEditing ? false : Container.Grid.GetRowValues(Container.VisibleIndex, "SubAccount_IsFBT") %>' />
                                                        </td>
                                                        <td id="fbtrate">
                                                            FBT Rate:</td>
                                                        <td id="fbtrate1">
                                                            <dxe:ASPxTextBox ID="txtFBTRate" runat="server" Width="100px" Text='<%#Bind("SubAccount_FBTRate") %>'
                                                                MaskSettings-Mask="<0..9999g>.<00..99>" ValidationSettings-ErrorDisplayMode="None"
                                                                MaskSettings-IncludeLiterals="DecimalSymbol">
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="TrRateOInt1">
                                            <td style="text-align: right;">
                                                Rate Of Interest (P/a):</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtRateofIntrest" runat="server" Width="203px" Text='<%#Bind("SubAccount_RateOfInterest") %>'
                                                    MaskSettings-Mask="<0..9999g>.<00..99>" ValidationSettings-ErrorDisplayMode="None"
                                                    MaskSettings-IncludeLiterals="DecimalSymbol">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="TrDepreciation1">
                                            <td style="text-align: right;">
                                                Depreciation:</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtDepreciation" runat="server" Text='<%#Bind("SubAccount_Depreciation") %>'
                                                    MaskSettings-Mask="<0..9999g>.<00..99>" ValidationSettings-ErrorDisplayMode="None"
                                                    MaskSettings-IncludeLiterals="DecimalSymbol" Width="150px">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <controls>
                        <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="ASPxGridViewTemplateReplacement1">
                         </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                      </controls>
                                                <div style="text-align: center; padding: 2px 2px 2px 2px; font-weight: bold;">
                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement2" ReplacementType="EditFormUpdateButton"
                                                        runat="server">
                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement3" ReplacementType="EditFormCancelButton"
                                                        runat="server">
                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td>
                                                <controls>
                        <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                         </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                      </controls>
                                                <div style="text-align: center; padding: 2px 2px 2px 2px">
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
                        </dxwgv:ASPxGridView>
                        &nbsp;
                        <dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ContentUrl="frm_OpeningBalance.aspx"
                            CloseAction="CloseButton" Top="100" Left="250" ClientInstanceName="popup" Height="350px"
                            Width="430px" HeaderText="Add Opening Balance">
                        </dxpc:ASPxPopupControl>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SubAccount" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
                SelectCommand="" InsertCommand="insert into table1 (temp123) values('0010')"
                 UpdateCommand="update table1 set temp123='123'">
                             
                   
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="WithoutCustom" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
                SelectCommand="" InsertCommand="insert into table1 (temp123) values('0010')"
                UpdateCommand="update table1 set temp123='123'" DeleteCommand=""></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
