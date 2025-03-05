<%@ page language="C#" autoeventwireup="true" inherits="management_frm_insurancecommission_PayableSetup, App_Web_psdiigfa" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Insurance Commission Payable Setup</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

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
		z-index:32767;
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
		z-index:3000;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script type="text/javascript" language="javascript">
        function PageLoad()
        {
            height();
            FieldName="btnShow";
        }
        function ShowInsurerCompany(obj1,obj2,obj3,obj4)
        {
            FieldName="btnShow";
            ajax_showOptions(obj1,obj2,obj3,obj4);
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
        function check()
        {
            var txt=document.getElementById("txtInsuranceCompany_hidden");
            if(txt.value !='No Record Found' && txt.value!='')
                callBack();
            else
            {
                alert('Please Select Company From Populated List only!');
                var txt1=document.getElementById("txtInsuranceCompany");
                txt1.focus();
                txt1.select();
            }
            return false;
        }
        function callBack()
        {
            grid.PerformCallback();
        }
        function callback()
        {
            grid.PerformCallback();
        }
        function OnAddButtonClick()
        {
            var txtI=document.getElementById("txtInsuranceCompany_hidden");
            //alert(txtI.value);
            if(txtI.value =='' || txtI.value ==null || txtI.value =='No Record Found')
            {
                alert('First Select Company From populated List!');
            }
            else
            {
                var txtN=document.getElementById("txtInsuranceCompany");
                var url='frm_insurancecommission_PayableSetup_AddEdit.aspx?id='+'ADD~'+txtI.value+'~'+txtN.value;
                parent.OnMoreInfoClick(url,'Add Insurance Commission Receivable','950px','450px','Y');
            }
        }
        function OnMoreInfoClick(obj)
        {
            var txtI=document.getElementById("txtInsuranceCompany_hidden");
            var txtN=document.getElementById("txtInsuranceCompany");
            var url='frm_insurancecommission_PayableSetup_AddEdit.aspx?id='+'EDIT~'+txtI.value+'~'+txtN.value+'~'+obj;
            parent.OnMoreInfoClick(url,'Add Insurance Commission Receivable','950px','450px','Y');
        }
        function gridEndCall(obj)
        {
            height();
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="Off">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <span style="color: Blue"><strong>Insurance Commission Payable Setup</strong></span>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0px">
                        <tr>
                            <td class="gridcellleft">
                                <asp:TextBox ID="txtCompany" runat="server" Width="275px" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;<span class="Ecoheadtxt" style="color: Blue"><strong>Select Group:</strong></span>
                            </td>
                            <td class="gridcellleft">
                                <asp:TextBox ID="txtInsuranceCompany" runat="server" Width="275px"></asp:TextBox>
                            </td>
                            <td class="gridcellleft">
                                <asp:Button ID="btnShow" runat="server" Text="Show" CssClass="btnUpdate" Height="21px"
                                    OnClientClick="javascript:return check();" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="display: none">
                <td>
                    <asp:TextBox ID="txtInsuranceCompany_hidden" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="gridcellcenter">
                    <dxwgv:ASPxGridView ID="grdInsRecSetup" runat="server" AutoGenerateColumns="False"
                        KeyFieldName="PayableCommission_ID" Width="100%" ClientInstanceName="grid" OnCustomCallback="grdInsRecSetup_CustomCallback"
                        OnCustomJSProperties="grdInsRecSetup_CustomJSProperties" DataSourceID="DgrdInsRecSetup">
                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                        <Styles>
                            <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                <BackgroundImage ImageUrl="~/images/EHeaderBack.gif" VerticalPosition="bottom" />
                                <Border BorderColor="#0000C0" />
                            </Header>
                            <FocusedGroupRow CssClass="gridselectrow">
                            </FocusedGroupRow>
                            <FocusedRow CssClass="gridselectrow">
                            </FocusedRow>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                            PageSize="16">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
                        <SettingsText PopupEditFormCaption="Add/ Modify" />
                        <Columns>
                            <dxwgv:GridViewDataDateColumn Caption="From Date" FieldName="PayableCommissionDetail_FromDate"
                                VisibleIndex="1">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                                <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                    UseMaskBehavior="True">
                                </PropertiesDateEdit>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="To Date" FieldName="PayableCommission_ToDate"
                                VisibleIndex="2">
                                <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                    UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Insurer Company" FieldName="GroupName"
                                VisibleIndex="0">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="3" Width="1%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                        More Info...</a>
                                </DataItemTemplate>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <HeaderTemplate>
                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                      { %>
                                    <a href="javascript:void(0);" onclick="OnAddButtonClick( )"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                    <%} %>
                                </HeaderTemplate>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewCommandColumn Caption="Delete" VisibleIndex="4" Width="1%" Visible="false">
                                <DeleteButton Visible="True">
                                </DeleteButton>
                            </dxwgv:GridViewCommandColumn>
                        </Columns>
                        <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                        <ClientSideEvents EndCallback="function(s, e) {
	                                                gridEndCall(s.cpHeight);;
                                                }" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="DgrdInsRecSetup" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                          SelectCommand="SELECT [PayableCommission_ID],(select gpm_Description +'['+gpm_code +']' from tbl_master_groupmaster  where gpm_id=[PayableCommission_GroupID]) as GroupName,[PayableCommission_FromDate],[PayableCommission_ToDate] from [Config_CommPayableMain] where [PayableCommission_CompanyID]=@PayableCommission_CompanyID and PayableCommission_GroupID=@PayableCommission_GroupID">
                    <SelectParameters>
                        <asp:SessionParameter Name="PayableCommission_CompanyID" SessionField="LastCompany" Type="string" />
                        <asp:Parameter Name="PayableCommission_GroupID" Type="string" />
                    </SelectParameters>
                    </asp:SqlDataSource>
                    
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
