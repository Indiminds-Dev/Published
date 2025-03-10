<%@ page language="C#" autoeventwireup="true" inherits="management_frm_TransInsuranceGI, App_Web_fbvamflg" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Insurance GI</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" language="javascript">
    function Page_Load()
    {
        FieldName='drpAppBank';
        height();
        VarCall='n';
        
    }
    function show_Detail(obj1,obj2,obj3,obj4)
    {
        FieldName='ASPxPopupControl1_ASPxCallbackPanel1_drpBranch';
        var set_value;
        //set_value=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_drpBranch").value;
        VarCall='Bank';
        //alert(set_value);
        ajax_showOptions(obj1,obj2,obj3,'','Main');
    }
    function InsurerCompany(obj1,obj2,obj3,obj4)
    {
        VarCall='BrokCode';//use when this will call a function on return
        ajax_showOptions(obj1,obj2,obj3,obj4,'Main');
    }
    
    function keyVal(obj)
    {//alert(VarCall);
        if(VarCall=='Bank')
        {
            if(obj!=null)
            {
                drpBranch.PerformCallback(obj);
                AppBank.PerformCallback(obj);
            }
        }
        if(VarCall=='BrokCode')
        {
            cmbBrokingCode.PerformCallback(obj);
        }
    }
    function height()
    {
        if(document.body.scrollHeight<=500)
            window.frameElement.height = '650px';
        else
            window.frameElement.height = document.body.scrollHeight;
        window.frameElement.Width = document.body.scrollWidth;
    }
    function show_Scheme(obj1,obj2,obj3)
    {
        FieldName='txtTerms';
        var data=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtInsurerCompany_hidden").value;
        if(data!='')
        {
            ajax_showOptions(obj1,obj2,obj3,data,'N');
        }
        else
        {
            alert('Please Select Insurer Company from Populated List First!');
            return false;
        }
    }
    function show_Bank(obj1,obj2,obj3)
    {
        ajax_showOptions(obj1,obj2,obj3,'','N');
    }
    function show_List(obj1,obj2,obj3)
    {
        FieldName='txtTerms';
        ajax_showOptions(obj1,obj2,obj3);
    }
    function show_Family(obj1,obj2,obj3)
    {
        FieldName='txtTerms';
        var set_value=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtApplicant_hidden").value;
        if(set_value !='')
        {
            ajax_showOptions(obj1,obj2,obj3,set_value);
        }
        else
        {
            alert('Please Select Applicant from Populated List First!');
            return false;
        }
    }
    function AddNewFamilyMember()
    {
        var set_value=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtApplicant_hidden").value;
        if(set_value =='')
        {
            alert('Please Select Applicant from Populated List First!');
            return false;
        }
        var url='Contact_FamilyMembers.aspx?id='+set_value;
        parent.OnMoreInfoClick(url,'Modify Transaction Details','900px','450px','N'); 
    }
    function netAmount()
    {
        var GA=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtGrossPremium");
        var TA=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTaxAmt");
        var NA=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNetAmount");
        NA.value=GA.value-TA.value;
    }
    FieldName='txtTerms';
    function btnCancel_Click()
    {
        popup.Hide();
    }
    function OnAddEditClick(e,obj)
    {
        FieldName='ASPxPopupControl1_ASPxCallbackPanel1_drpBranch';
        Filter='N';
        RowID='';
        var data=obj.split('~');
        if(data.length>1)
            RowID=data[1];
        popup.Show();
        popPanel.PerformCallback(obj);
    }
    function OnDeleteClick(e,obj)
    {
        if(confirm('Are You Sure you want to Delete This Transaction?')==true)
        {
            grid.PerformCallback(obj);
        }
    }
    function btnSave_Click()
    {
        Filter='Y';
        if(RowID=='')
        {
            var obj='SaveNew';
            popPanel.PerformCallback(obj);
        }
        else
        {
            var obj='SaveOld~'+RowID;
            popPanel.PerformCallback(obj);
        }
        //alert('tt');
    }
    function EndCallBack(obj)
    {
        if(obj !='')
        {
            var data=obj.split('~');
            if(data[0]=='Edit')
            {   
                AppBank.PerformCallback(data[5]);
                cmbBrokingCode.PerformCallback(data[6]);
                drpBranch.PerformCallback(data[5]);
                var polc=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_drpPolicyStatus");
                PolicyChange(polc.value);
                polc=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_drpPayMode");
                PayModeChange(polc.value);
            }
            if(data[0]=='Open')
            {
                var polc=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_drpPolicyStatus");
                PolicyChange(polc.value);
                polc=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_drpPayMode");
                PayModeChange(polc.value);
            }
        }
        if(Filter=='Y')
        {
            popup.Hide();
            grid.PerformCallback();
        }
    }
    function BankFill(obj)
    {
        var txt=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbTransactionType");
        txt.focus();
    }
    function PolicyChange(obj)
    {
        HideDates();
        if(obj=="2")
        {
            document.getElementById("TrLoginDate").style.display='inline';
        }
        if(obj=="3")
        {
            document.getElementById("TRIssueDate").style.display='inline';
            document.getElementById("TrExpiryDate").style.display='inline';
        }
        if(obj=="4" || obj=="5")
        {
            document.getElementById("TRCancelReason").style.display='inline';
            document.getElementById("TrCancelDate").style.display='inline';
        }
        
    }
    function PayModeChange(obj)
    {
        HidePayModeOptions();
        if(obj=="2")
        {
            document.getElementById("DraftIssuingBank").style.display='inline';
            document.getElementById("InstNo").style.display='inline';
            document.getElementById("Instdate").style.display='inline';
        }
        if(obj=="1")
        {
            document.getElementById("InstNo").style.display='inline';
            document.getElementById("Instdate").style.display='inline';
            document.getElementById("ContactBank").style.display='inline';
        }
        if(obj=="4" || obj=="5")
        {
            document.getElementById("ContactBank").style.display='inline';
//            document.getElementById("InstNo").style.display='inline';
//            document.getElementById("Instdate").style.display='inline';
        }
        if(obj=="3")
        {
            document.getElementById("ContactBank").style.display='inline';
            document.getElementById("CreditcardNo").style.display='inline';
            document.getElementById("CreditCardExpireDate").style.display='inline';
        }
    }
    function HideDates()
    {
        document.getElementById("TRCancelReason").style.display='none';
        document.getElementById("TRIssueDate").style.display='none';
        document.getElementById("TrExpiryDate").style.display='none';
        document.getElementById("TrLoginDate").style.display='none';
        document.getElementById("TrCancelDate").style.display='none';
    }
    function HidePayModeOptions()
    {
        document.getElementById("ContactBank").style.display='none';
        document.getElementById("DraftIssuingBank").style.display='none';
        document.getElementById("InstNo").style.display='none';
        document.getElementById("Instdate").style.display='none';
        document.getElementById("CreditcardNo").style.display='none';
        document.getElementById("CreditCardExpireDate").style.display='none';
    }
    function showEmployee(obj1,obj2,obj3)
    {
        ajax_showOptions(obj1,obj2,obj3,'k');
    }
    function showDeliveryBy(obj1,obj2,obj3)
    {
        var cmb=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbDeliverMode");
        //alert(cmb.value);
        if(cmb.value=="1")
            showEmployee(obj1,'SearchByEmployees',obj3);
        else if(cmb.value=="2")
            showEmployee(obj1,'VenderAgent',obj3);
        else
            alert('Please select Delivery Mode!');
    }
    </script>

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
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and 

.optionDivSelected */
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
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr id="TrAll">
                    <td>
                        <table class="TableMain100">
                            <tr id="TrGrid">
                                <td>
                                    <dxwgv:ASPxGridView ID="grdInsurance" ClientInstanceName="grid" runat="server" KeyFieldName="Id"
                                        Width="100%" OnCustomCallback="grdInsurance_CustomCallback" OnHtmlDataCellPrepared="grdInsurance_HtmlDataCellPrepared">
                                        <Styles>
                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                            </Header>
                                            <LoadingPanel ImageSpacing="10px">
                                            </LoadingPanel>
                                            <FocusedRow BackColor="#FEC6AB">
                                            </FocusedRow>
                                        </Styles>
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn VisibleIndex="0">
                                                <DataItemTemplate>
                                                    <a href="javascript:void(0);" onclick="OnAddEditClick(this,'Edit~'+'<%# Container.KeyValue %>')">
                                                        <u>Edit</u> </a>&nbsp;|&nbsp;<a href="javascript:void(0);" onclick="OnDeleteClick(this,'Delete~'+'<%# Container.KeyValue %>')">
                                                            <u>Delete</u> </a>
                                                </DataItemTemplate>
                                                <EditFormSettings Visible="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                                <HeaderTemplate>
                                                    <a href="javascript:void(0);" onclick="OnAddEditClick(this,'AddNew')"><u>Add New</u>
                                                    </a>
                                                </HeaderTemplate>
                                                <HeaderStyle Wrap="False" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Id" Visible="False" VisibleIndex="0">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Branch" VisibleIndex="2">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataDateColumn Caption="Trans. Date" FieldName="TransDate" VisibleIndex="3">
                                                <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormat="Custom" UseMaskBehavior="True"
                                                    EditFormatString="dd-MM-yyyy">
                                                </PropertiesDateEdit>
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                                <EditFormSettings Caption="Cheque Date" Visible="True" />
                                                <EditFormCaptionStyle Wrap="False" CssClass="gridcellleft">
                                                </EditFormCaptionStyle>
                                            </dxwgv:GridViewDataDateColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="InsuredAmt" VisibleIndex="4">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="PremiumAmt" VisibleIndex="5">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="AppNo" VisibleIndex="6">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="PolicyNo" VisibleIndex="7">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Products" VisibleIndex="8">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataDateColumn Caption="Issue Date" FieldName="IssueDate" VisibleIndex="9">
                                                <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormat="Custom" UseMaskBehavior="True"
                                                    EditFormatString="dd-MM-yyyy">
                                                </PropertiesDateEdit>
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                                <EditFormSettings Caption="Cheque Date" Visible="True" />
                                                <EditFormCaptionStyle Wrap="False" CssClass="gridcellleft">
                                                </EditFormCaptionStyle>
                                            </dxwgv:GridViewDataDateColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Status" VisibleIndex="10">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Mode" VisibleIndex="11">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <StylesEditors>
                                            <ProgressBar Height="25px">
                                            </ProgressBar>
                                        </StylesEditors>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSort="False" AllowMultiSelection="True" />
                                        <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True">
                                            <FirstPageButton Visible="True">
                                            </FirstPageButton>
                                            <LastPageButton Visible="True">
                                            </LastPageButton>
                                        </SettingsPager>
                                        <SettingsText Title="Transaction GI" />
                                        <Settings ShowTitlePanel="True" />
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="popup" runat="server"
                                        AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Transaction GI"
                                        EnableHotTrack="False" BackColor="#DDECFE" Width="100%" DisappearAfter="500"
                                        CloseAction="None">
                                        <ContentCollection>
                                            <dxpc:PopupControlContentControl runat="server">
                                                <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="popPanel"
                                                    OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
                                                    <PanelCollection>
                                                        <dxp:PanelContent runat="server">
                                                            <table class="TableMain100">
                                                                <tr style="display: none">
                                                                    <td class="gridcellleft">
                                                                        <asp:TextBox ID="txtApplicant_hidden" runat="server" Width="24px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtScheme_hidden" runat="server" Width="24px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtProposer_hidden" runat="server" Width="26px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtInsurerCompany_hidden" runat="server" Width="26px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtDraftIssuingbank_hidden" runat="server"></asp:TextBox>
                                                                        <asp:TextBox ID="txtTeleCaller_hidden" runat="server" Width="24px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtFOS_hidden" runat="server" Width="14px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtReferal_hidden" runat="server" Width="12px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtSubBroaker_hidden" runat="server" Width="26px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtDeliveryBy_hidden" runat="server" Width="26px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table class="TableMain100">
                                                                            <tr>
                                                                                <td class="gridcellleft" style="vertical-align: top; text-align: right">
                                                                                    <table style="border: solid 1px white">
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Transaction Date :</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="TranDate" runat="server" ClientInstanceName="Tdate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="1">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Applicants:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtApplicant" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    TabIndex="2"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Branch :</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxComboBox ID="drpBranch" ClientInstanceName="drpBranch" EnableIncrementalFiltering="True"
                                                                                                    runat="server" TabIndex="3" DataSourceID="Branch" OnCallback="drpBranch_Callback"
                                                                                                    ValueType="System.String" TextField="branch_description" ValueField="branch_id"
                                                                                                    Width="178px">
                                                                                                </dxe:ASPxComboBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Transaction Type:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:DropDownList ID="cmbTransactionType" runat="server" Width="179px" CssClass="EcoheadCon"
                                                                                                    TabIndex="4">
                                                                                                    <asp:ListItem Selected="True" Value="1">Fresh</asp:ListItem>
                                                                                                    <asp:ListItem Value="2">Renewal</asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Application No.:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtAppNo" runat="server" Width="175px" CssClass="EcoheadCon" TabIndex="5"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Policy No.:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtPolicyNo" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    TabIndex="6"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Business Class :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:DropDownList ID="cmbbusinessClass" runat="server" Width="179px" CssClass="EcoheadCon"
                                                                                                    TabIndex="7">
                                                                                                    <asp:ListItem Selected="True" Value="I">Individual-Resident</asp:ListItem>
                                                                                                    <asp:ListItem Value="C">Corporate</asp:ListItem>
                                                                                                    <asp:ListItem Value="T">Trust</asp:ListItem>
                                                                                                    <asp:ListItem Value="N">Individual-Non Resident</asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Insurer Company:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtInsurerCompany" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    TabIndex="8"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Broking Code:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxComboBox ID="cmbBrokingCode" runat="server" EnableIncrementalFiltering="True"
                                                                                                    OnCallback="cmbBrokingCode_Callback" ClientInstanceName="cmbBrokingCode" TabIndex="9"
                                                                                                    ValueType="System.String" Width="179px" DataSourceID="BrokingCode" TextField="code"
                                                                                                    ValueField="value">
                                                                                                </dxe:ASPxComboBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Scheme:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtScheme" runat="server" Width="175px" CssClass="EcoheadCon" TabIndex="10"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Sum Insured:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtSumInsured" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    TabIndex="11"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Gross Premium:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtGrossPremium" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    TabIndex="12" Text="0"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Tax Amt :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtTaxAmt" runat="server" Width="175px" CssClass="EcoheadCon" TabIndex="13"
                                                                                                    Text="0"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Net Amt :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtNetAmount" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    ReadOnly="True" TabIndex="14">0</asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Pay Mode:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:DropDownList ID="drpPayMode" runat="server" Width="179px" CssClass="EcoheadCon"
                                                                                                    TabIndex="15" onchange="javascript:PayModeChange(this.value);">
                                                                                                    <asp:ListItem Value="1">Cheque</asp:ListItem>
                                                                                                    <asp:ListItem Value="2">Draft</asp:ListItem>
                                                                                                    <asp:ListItem Value="3">Credit Card</asp:ListItem>
                                                                                                    <asp:ListItem Value="4">ECS</asp:ListItem>
                                                                                                    <asp:ListItem Value="5">Direct Debit</asp:ListItem>
                                                                                                </asp:DropDownList></td>
                                                                                        </tr>
                                                                                        <tr id="ContactBank">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Contact Bank ID :</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxComboBox ID="drpAppBank" runat="server" Width="300px" DropDownWidth="550px"
                                                                                                    DataSourceID="dsgrdClientbank" ValueField="cbd_id" ValueType="System.String"
                                                                                                    TextFormatString="{2} -- {0}" EnableIncrementalFiltering="True" CallbackPageSize="30"
                                                                                                    ClientInstanceName="AppBank" OnCallback="drpAppBank_Callback" TabIndex="16" OnCustomJSProperties="drpAppBank_CustomJSProperties">
                                                                                                    <Columns>
                                                                                                        <dxe:ListBoxColumn FieldName="bnk_bankName" Caption="Bank Name" Width="150px" ToolTip="Bank Name" />
                                                                                                        <dxe:ListBoxColumn FieldName="cbd_accountName" Caption="Account Holder Name" Width="200px"
                                                                                                            ToolTip="Account Holder Name" />
                                                                                                        <dxe:ListBoxColumn FieldName="cbd_accountNumber" Caption="Account Number" Width="120px"
                                                                                                            ToolTip="Account Number" />
                                                                                                        <dxe:ListBoxColumn FieldName="bnk_micrno" Caption="MICR Number" Width="80px" ToolTip="MICR Number" />
                                                                                                        <dxe:ListBoxColumn FieldName="cbd_Accountcategory" Caption="Account Type" Width="80px"
                                                                                                            ToolTip="MICR Number" />
                                                                                                    </Columns>
                                                                                                    <ClientSideEvents EndCallback="function(s, e) {
	                                                                                                            BankFill(s.cpBank);
                                                                                                            }" />
                                                                                                </dxe:ASPxComboBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="DraftIssuingBank">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Draft Issuing Bank:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtDraftIssuingbank" runat="server" Width="295px" TabIndex="17"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="InstNo">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Inst No :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtChqNo" runat="server" Width="175px" CssClass="EcoheadCon" TabIndex="18"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr id="Instdate">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Inst Dt :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="InstDt" runat="server" ClientInstanceName="IDdate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="19">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="CreditcardNo">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Credit Card Number :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtCreditCardNo" runat="server" CssClass="EcoheadCon" Width="175px"
                                                                                                    TabIndex="20"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr id="CreditCardExpireDate">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Credit Card Expiry :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="CreditExpiry" runat="server" ClientInstanceName="CCName" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="179px" Font-Size="10px" TabIndex="21">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td class="gridcellleft" style="vertical-align: top; text-align: left">
                                                                                    <table style="border: solid 1px white">
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Tele Caller:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtTeleCaller" runat="server" CssClass="EcoheadCon" Width="175px"
                                                                                                    TabIndex="22"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Sales Rep/Man :</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtFOS" runat="server" CssClass="EcoheadCon" Width="175px" TabIndex="23"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Associate :</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtReferal" runat="server" CssClass="EcoheadCon" Width="175px" TabIndex="24"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Sub Broker/Franchise :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtSubBroaker" runat="server" CssClass="EcoheadCon" Width="175px"
                                                                                                    TabIndex="25"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Policy Status :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:DropDownList ID="drpPolicyStatus" runat="server" Width="179px" CssClass="EcoheadCon"
                                                                                                    TabIndex="26" onchange="javascript:PolicyChange(this.value);">
                                                                                                    <asp:ListItem Value="1">Business in Hand</asp:ListItem>
                                                                                                    <asp:ListItem Value="2">Login</asp:ListItem>
                                                                                                    <asp:ListItem Value="3">Issued</asp:ListItem>
                                                                                                    <asp:ListItem Value="4">Canclled by Insurer</asp:ListItem>
                                                                                                    <asp:ListItem Value="5">Cancelled by Insured</asp:ListItem>
                                                                                                    <asp:ListItem Value="6">Cheque Bounced</asp:ListItem>
                                                                                                </asp:DropDownList></td>
                                                                                        </tr>
                                                                                        <tr id="TRCancelReason">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Cancel Reason :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtCancelReason" runat="server" CssClass="EcoheadCon" Height="60px"
                                                                                                    TabIndex="27" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="TRIssueDate">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Issue Date :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="IssueDate" runat="server" ClientInstanceName="Idate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="28">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="TrExpiryDate">
                                                                                            <td class="gridcellleft">
                                                                                                <span style="color: #000099"><strong>Expiry Date :</strong></span></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="ExpiryDate" runat="server" ClientInstanceName="Rdate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="29">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="TrLoginDate">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Login Date :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="LoginDate" runat="server" ClientInstanceName="Lodate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="30">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="TrCancelDate">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Cancel Date:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="CancelDate" runat="server" ClientInstanceName="Ldate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="31">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">User Notes/Remarks:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Height="60px" Width="300px"
                                                                                                    CssClass="EcoheadCon" TabIndex="32"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Delivery Mode:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:DropDownList ID="cmbDeliverMode" runat="server" Width="179px" CssClass="EcoheadCon"
                                                                                                    TabIndex="33">
                                                                                                    <asp:ListItem Selected="True" Value="1">Hand Delivery</asp:ListItem>
                                                                                                    <asp:ListItem Value="2">By Courier</asp:ListItem>
                                                                                                </asp:DropDownList></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Delivered By:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtDeliveryBy" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    TabIndex="34"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Delivered On:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="DeliveryDate" runat="server" ClientInstanceName="Ldate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="35">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Delivery Reference:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtDeliveryreference" runat="server" Width="300px" CssClass="EcoheadCon"
                                                                                                    MaxLength="50" TabIndex="36"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Remarks:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtPolicyRemarks" runat="server" CssClass="EcoheadCon" Height="60px"
                                                                                                    TabIndex="37" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellcenter" style="height: 34px">
                                                                        <input id="Button3" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                            style="width: 60px" tabindex="38" />
                                                                        <input id="Button4" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                                                            style="width: 60px" tabindex="39" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:HiddenField ID="hdBank" runat="server" />
                                                                        <asp:HiddenField ID="hdSubBroker" runat="server" />
                                                                        <asp:HiddenField ID="hdSubSeqBank" runat="server" />
                                                                        <input id="Hidden2" type="hidden" />
                                                                        <asp:HiddenField ID="childemployees" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </dxp:PanelContent>
                                                    </PanelCollection>
                                                    <ClientSideEvents EndCallback="function(s, e) {
	                                                    EndCallBack(s.cpLast);
                                                    }" />
                                                </dxcp:ASPxCallbackPanel>
                                            </dxpc:PopupControlContentControl>
                                        </ContentCollection>
                                        <HeaderStyle HorizontalAlign="Center">
                                            <Paddings PaddingRight="6px" />
                                        </HeaderStyle>
                                        <SizeGripImage Height="16px" Width="16px" />
                                        <CloseButtonImage Height="12px" Width="13px" />
                                    </dxpc:ASPxPopupControl>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="dsgrdClientbank" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" InsertCommand="insert into table1 (temp123) values('11')"
            SelectCommand="select A.* , MB.bnk_id,MB.bnk_bankName,MB.bnk_BranchName,MB.bnk_micrno from (Select TCBD.cbd_id,TCBD.cbd_cntId,TCBD.cbd_bankCode, TCBD.cbd_Accountcategory,TCBD.cbd_Accountcategory as AccountType,RTRIM(TCBD.cbd_accountNumber) as cbd_accountNumber,TCBD.cbd_accountType,cbd_accountName from tbl_trans_contactBankDetails as  TCBD where TCBD.cbd_cntId=@SubAccountCode) as A inner  join tbl_master_Bank as MB on MB.bnk_id=a.cbd_bankCode">
            <SelectParameters>
                <asp:Parameter Name="SubAccountCode" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="BrokingCode" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" SelectCommand="select InsBrokingCode_Code as code,InsBrokingCode_Code as value from Master_InsBrokingCode where InsBrokingCode_InsuranceCompanyID in(@ProdCode) and InsBrokingCode_CompanyID=@company ">
            <SelectParameters>
                <asp:Parameter Name="ProdCode" Type="string" />
                <asp:SessionParameter Name="company" SessionField="LastCompany" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Branch" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" SelectCommand="select RTRIM(cast(branch_id as varchar)) as branch_id,RTRIM(branch_description) as branch_description from tbl_master_branch where branch_id in (select cnt_branchid from tbl_master_contact where cnt_internalID=@CustomerCode)">
            <SelectParameters>
                <asp:Parameter Name="CustomerCode" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
