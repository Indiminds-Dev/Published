<%@ page language="C#" autoeventwireup="true" inherits="management_frm_TdsTcsPopUp, App_Web_8qixh_8w" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tds/Tcs</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

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

    <script language="javascript" type="text/javascript">
	    function call_ajax(obj1,obj2,obj3)
	    {
	        ajax_showOptions(obj1,obj2,obj3,'a','Main');
	    }
	    function keyVal(obj)
	    {
	        var mainSubLedger=obj.split('~')
	        SubledgerType=mainSubLedger[0,2];
	        if(mainSubLedger[0,1].toUpperCase()!='NONE')
	        {
	            document.getElementById('tdSub').style.display='inline';
	            document.getElementById('tdSub1').style.display='inline';
	        }
	        else
	        {
	            document.getElementById('tdSub').style.display='none';
	            document.getElementById('tdSub1').style.display='none';
	        }
	    }
	    function Page_Load()	    
	    {
	        document.getElementById('tdSub').style.display='none';
	        document.getElementById('tdSub1').style.display='none';
	    }
	    function call_ajax1(obj1,obj2,obj3)
	    {
	        ajax_showOptions(obj1,obj2,obj3,SubledgerType,'Sub');
	    }
	    function ShowInsert(obj)
	    {
	        var objInser=obj.split('~')
	        if(objInser[0,0]=='Insert')
	        {
	            alert('Insert Successfully');
	            document.getElementById('hddnVal').value=objInser[0,1];
	        }
	        else if(objInser[0,0]=='Error')
	            alert('This Code Already Exists');
	        else if(objInser[0,0]=='Update')
	            alert('Update Successfully');
	    }
	    function btnSave_Click()
	    {
	        comboInsert.PerformCallback();
	    }
	    function ForEdit()
	    {
	        document.getElementById('tdSub').style.display='inline';
	        document.getElementById('tdSub1').style.display='inline';	        
	    }
	    function OnAddButtonClick()
	    {
	        var Hddata=document.getElementById('hddnVal').value;
	        if(Hddata!='')
	            gridTdsTcs.AddNewRow();
	        else
	            alert('First Add TDSTCS');
	    }
	    function ShowDateEn(obj)
	    {
	        var objShow=obj.split('~');
	        if(objShow[0,1]=='1')
	            gridTdsTcs.GetEditor("TDSTCSRates_DateFrom").SetEnabled(false);
	        else if(objShow[0,1]=='2')
	        {
	            var date = new Date();
	            var newDate;
	            newDate = new Date(date.getYear(), date.getMonth(), date.getDate()+1, 10, 0, 0);
	            gridTdsTcs.GetEditor("TDSTCSRates_DateFrom").SetDate(newDate);
	        }
	    }
	    FieldName='btnCancel';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td style="width: 690px">
                        <table class="TableMain100">
                            <tr>
                                <td class="EcoheadCon_" style="width: 60px">
                                    Type :
                                </td>
                                <td class="EcoheadCon_">
                                    <asp:DropDownList ID="ddlType" runat="server" Width="141px" Font-Size="10px">
                                        <asp:ListItem>TDS</asp:ListItem>
                                        <asp:ListItem>TCS</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="EcoheadCon_">
                                    Code :
                                </td>
                                <td class="EcoheadCon_">
                                    <asp:TextBox ID="txtCode" runat="server" Font-Size="10px"></asp:TextBox>
                                </td>
                                <td class="EcoheadCon_">
                                    MainAccount :
                                </td>
                                <td class="EcoheadCon_">
                                    <asp:TextBox ID="txtMainAccount" runat="server" Font-Size="10px" Width="210px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table class="TableMain100">
                            <tr>
                                <td class="EcoheadCon_" id="tdSub">
                                    SubAccount :
                                </td>
                                <td class="EcoheadCon_" id="tdSub1">
                                    <asp:TextBox ID="txtSubAccount" runat="server" Font-Size="10px" Width="168px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 690px">
                        <table class="TableMain100">
                            <tr>
                                <td class="EcoheadCon_" style="width: 60px; height: 31px">
                                    Description :
                                </td>
                                <td colspan="7" style="height: 31px">
                                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" Width="604px"
                                        Font-Size="12px" Height="62px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; width: 690px;">
                        <input id="btnSave" type="button" value="Save" onclick="btnSave_Click()" class="btnUpdate"
                            style="width: 54px; height: 26px;" />
                        <input id="btnCancel" type="button" value="Cancel" class="btnUpdate" style="width: 54px;
                            height: 26px;" />
                    </td>
                    <td style="display: none">
                    </td>
                </tr>
                <tr>
                    <td class="EHEADER" colspan="2" style="text-align:center">
                        <strong><span style="color: #000099">Add/Modify Rates</span></strong></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dxwgv:ASPxGridView ID="gridTdsTcs" runat="server" AutoGenerateColumns="False" Width="100%"
                            ClientInstanceName="gridTdsTcs" DataSourceID="SqlTscTcsRate" KeyFieldName="TDSTCSRates_ID"
                            OnRowInserting="gridTdsTcs_RowInserting" OnCustomJSProperties="gridTdsTcs_CustomJSProperties"
                            OnStartRowEditing="gridTdsTcs_StartRowEditing" OnInitNewRow="gridTdsTcs_InitNewRow">
                            <Styles>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                            </Styles>
                            <Settings ShowTitlePanel="True" ShowFooter="True" ShowStatusBar="Visible" ShowGroupPanel="True" />
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                            <SettingsText PopupEditFormCaption="Add/Modify Rates" ConfirmDelete="Are You Want To Delete This Record ???" />
                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" />
                            <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="8"
                                PageSize="20">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="TDSTCSRates_ID" Visible="False" ReadOnly="True"
                                    VisibleIndex="0">
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Code" FieldName="TDSTCSRates_Code" VisibleIndex="0">
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataDateColumn Caption="From" FieldName="TDSTCSRates_DateFrom" VisibleIndex="1">
                                    <EditFormSettings Visible="True" />
                                    <PropertiesDateEdit EditFormatString="dd-MM-yyyy" DisplayFormatString="dd MMM yyyy"
                                        UseMaskBehavior="true" EditFormat="Custom">
                                    </PropertiesDateEdit>
                                </dxwgv:GridViewDataDateColumn>
                                <dxwgv:GridViewDataDateColumn Caption="To" FieldName="TDSTCSRates_DateTo" PropertiesDateEdit-DisplayFormatString="dd MMM yyyy"
                                    VisibleIndex="2">
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataDateColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Rate" FieldName="TDSTCSRates_Rate" VisibleIndex="3">
                                    <EditFormSettings Visible="True" />
                                    <PropertiesTextEdit MaskSettings-Mask="&lt;0..99g&gt;.&lt;00..99&gt;" MaskSettings-IncludeLiterals="DecimalSymbol"
                                        ValidationSettings-ErrorDisplayMode="None">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Surcharge" Visible="true" FieldName="TDSTCSRates_Surcharge"
                                    VisibleIndex="4">
                                    <EditFormSettings Visible="True" />
                                    <PropertiesTextEdit MaskSettings-Mask="&lt;0..99g&gt;.&lt;00..99&gt;" MaskSettings-IncludeLiterals="DecimalSymbol"
                                        ValidationSettings-ErrorDisplayMode="None">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="EduCess" Visible="true" FieldName="TDSTCSRates_EduCess"
                                    VisibleIndex="5">
                                    <EditFormSettings Visible="True" />
                                    <PropertiesTextEdit MaskSettings-Mask="&lt;0..99g&gt;.&lt;00..99&gt;" MaskSettings-IncludeLiterals="DecimalSymbol"
                                        ValidationSettings-ErrorDisplayMode="None">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="HgrEduCess" Visible="true" FieldName="TDSTCSRates_HgrEduCess"
                                    VisibleIndex="6">
                                    <EditFormSettings Visible="True" />
                                    <PropertiesTextEdit MaskSettings-Mask="&lt;0..99g&gt;.&lt;00..99&gt;" MaskSettings-IncludeLiterals="DecimalSymbol"
                                        ValidationSettings-ErrorDisplayMode="None">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="ApplicableAmount" Visible="true" FieldName="TDSTCSRates_ApplicableAmount"
                                    VisibleIndex="7">
                                    <EditFormSettings Visible="True" />
                                    <PropertiesTextEdit MaskSettings-Mask="&lt;0..99999999999g&gt;.&lt;00..99&gt;" MaskSettings-IncludeLiterals="DecimalSymbol"
                                        ValidationSettings-ErrorDisplayMode="None">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewCommandColumn VisibleIndex="8">
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                    <EditButton Visible="True">
                                    </EditButton>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                          { %>
                                        <a href="javascript:void(0);" onclick="OnAddButtonClick()"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                        <%} %>
                                    </HeaderTemplate>
                                </dxwgv:GridViewCommandColumn>
                            </Columns>
                            <ClientSideEvents EndCallback="function(s,e){ShowDateEn(s.cpInsertEna);}" />
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="SqlTscTcsRate" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="SELECT * FROM [Config_TDSTCSRates] where TDSTCSRates_Code=@TDSTCSRates_Code"
                            DeleteCommand="DELETE FROM [Config_TDSTCSRates] WHERE [TDSTCSRates_ID] = @TDSTCSRates_ID"
                            InsertCommand="TdsTcsRate_Insert" InsertCommandType="StoredProcedure" UpdateCommand="UPDATE [Config_TDSTCSRates] SET  [TDSTCSRates_DateFrom] = @TDSTCSRates_DateFrom, [TDSTCSRates_Rate] = @TDSTCSRates_Rate, [TDSTCSRates_Surcharge] = @TDSTCSRates_Surcharge, [TDSTCSRates_EduCess] = @TDSTCSRates_EduCess, [TDSTCSRates_HgrEduCess] = @TDSTCSRates_HgrEduCess, [TDSTCSRates_ModifyUser] = @TDSTCSRates_ModifyUser, [TDSTCSRates_ModifyDateTime] = getdate(), [TDSTCSRates_ApplicableAmount] = @TDSTCSRates_ApplicableAmount WHERE [TDSTCSRates_ID] = @TDSTCSRates_ID">
                            <SelectParameters>
                                <asp:SessionParameter Name="TDSTCSRates_Code" SessionField="KeyVal" Type="string" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="TDSTCSRates_ID" Type="Int64" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="TDSTCSRates_DateFrom" Type="DateTime" />
                                <asp:Parameter Name="TDSTCSRates_Rate" Type="Decimal" />
                                <asp:Parameter Name="TDSTCSRates_Surcharge" Type="Decimal" />
                                <asp:Parameter Name="TDSTCSRates_EduCess" Type="Decimal" />
                                <asp:Parameter Name="TDSTCSRates_HgrEduCess" Type="Decimal" />
                                <asp:SessionParameter Name="TDSTCSRates_ModifyUser" SessionField="userid" Type="Int32" />
                                <asp:Parameter Name="TDSTCSRates_ApplicableAmount" Type="Decimal" />
                                <asp:Parameter Name="TDSTCSRates_ID" Type="Int64" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="TDSTCSRates_Code" Type="String" />
                                <asp:Parameter Name="TDSTCSRates_DateFrom" Type="DateTime" />
                                <asp:Parameter Name="TDSTCSRates_Rate" Type="Decimal" />
                                <asp:Parameter Name="TDSTCSRates_Surcharge" Type="Decimal" />
                                <asp:Parameter Name="TDSTCSRates_EduCess" Type="Decimal" />
                                <asp:Parameter Name="TDSTCSRates_HgrEduCess" Type="Decimal" />
                                <asp:Parameter Name="TDSTCSRates_ApplicableAmount" Type="Decimal" />
                                <asp:SessionParameter Name="TDSTCSRates_CreateUser" SessionField="userid" Type="Int32" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr style="display: none">
                    <td style="height: 102px">
                        <asp:HiddenField ID="txtMainAccount_hidden" runat="server" />
                        <asp:HiddenField ID="txtSubAccount_hidden" runat="server" />
                        <dxe:ASPxComboBox ID="comboInsert" runat="server" ClientInstanceName="comboInsert"
                            ValueType="System.String" OnCallback="ASPxComboBox1_Callback" OnCustomJSProperties="ASPxComboBox1_CustomJSProperties">
                            <ClientSideEvents EndCallback="function(s,e) {ShowInsert(comboInsert.cpInsert);}" />
                        </dxe:ASPxComboBox>
                        <asp:HiddenField ID="hddnVal" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
