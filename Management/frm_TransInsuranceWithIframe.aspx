<%@ page language="C#" autoeventwireup="true" inherits="management_frm_TransInsuranceWithIframe, App_Web_gflohp-r" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>

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
    <title>Insurance LI</title>
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
    function show_DetailForKey(obj1,obj2,obj3,obj4)
    {
       document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_cmbbusinessClass').style.display='inline';
    }
    
    function show_Detail(obj1,obj2,obj3,obj4)
    {
    
        document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_cmbbusinessClass').style.display='none';
//        document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_drpPolicyStatus').style.display='none';
//        document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_cmbDeliverMode').style.display='none';
        FieldName='ASPxPopupControl1_ASPxCallbackPanel1_txtProposer';
        VarCall='Bank';
        ajax_showOptions(obj1,obj2,obj3,'','Main');
    }
    function InsurerCompany(obj1,obj2,obj3,obj4)
    {
        VarCall='BrokCode';//use when this will call a function on return
        document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_cmbbusinessClass').style.display='none';
        ajax_showOptions(obj1,obj2,obj3,obj4,'Main');
    }
    function CallList(obj1,obj2,obj3)
    {
        ajax_showOptions(obj1,obj2,obj3);
    }
    function showEmployee(obj1,obj2,obj3)
    {
//      document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_drpPolicyStatus').style.display='none';
//      document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_cmbDeliverMode').style.display='none';
      ajax_showOptions(obj1,obj2,obj3,'k','Main');
    }
    function keyVal(obj)
    {//alert(VarCall);
    
        document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_cmbbusinessClass').style.display='inline';
        document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_drpPolicyStatus').style.display='inline';
        document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_cmbDeliverMode').style.display='inline';
        if(VarCall=='Bank')
        {
            if(obj!=null)
            {
                drpBranch.PerformCallback(obj);
                AppBank.PerformCallback(obj);
                cmbSubSequentBank.PerformCallback(obj);
            }
        }
        if(VarCall=='BrokCode')
        {
            cmbBrokingCode.PerformCallback(obj);
        }
    }
    function height()
    {
        if(document.body.scrollHeight<=700)
            window.frameElement.height = '750px';
        else
            window.frameElement.height = document.body.scrollHeight+100;
        window.frameElement.Width = document.body.scrollWidth;
    }
    function show_Scheme(obj1,obj2,obj3)
    {
    
        document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_cmbbusinessClass').style.display='none';    
        FieldName='txtTerms';
        var data=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtInsurerCompany_hidden").value;
        if(data!='')
        {
           // ajax_showOptions(obj1,obj2,obj3,data,'n','Main');
            ajax_showOptions(obj1,obj2,obj3,data,'Main');
        }
        else
        {
            alert('Please Select Insurer Company from Populated List First!');
            return false;
        }
    }
    function show_List(obj1,obj2,obj3)
    {
        FieldName='txtTerms';
        //alert(FieldName);
          document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_cmbbusinessClass').style.display='none';
        var applicant=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtApplicant_hidden").value;
        ajax_showOptions(obj1,obj2,obj3,applicant,'Main');
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
 
     function AddNewBankDetails()
    {
        var set_value=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtApplicant_hidden").value;
        if(set_value =='')
        {
            alert('Please Select Insured from Populated List First!');
            return false;
        }
        var url='Contact_BankDetails.aspx?id='+set_value;
        parent.OnMoreInfoClick(url,'Modify Transaction Details','900px','450px','Y'); 
    }
    
    
    
    function AddNewFamilyMember()
    {
        var set_value=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtApplicant_hidden").value;
        if(set_value =='')
        {
            alert('Please Select Insured from Populated List First!');
            return false;
        }
        var url='Contact_FamilyMembers.aspx?id='+set_value;
        parent.OnMoreInfoClick(url,'Modify Transaction Details','900px','450px','N'); 
    }
    function netAmount()
    {
        var GA=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtPremAmt");
        var TA=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTaxAmt");
        var NA=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNetAmount");
        NA.value=GA.value-TA.value;
    }
    FieldName='txtTerms';
    function btnCancel_Click()
    {
        popup.Hide();
    }
    function btnDetail_Click(obj)
    {
        var url='frm_TransInsuranceDetail.aspx?id='+obj;
        parent.OnMoreInfoClick(url,'Modify Transaction Details','900px','450px','N');
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
            var applicant=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtApplicant_hidden").value; 
            var scheme=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtScheme_hidden").value; 
           var company=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtInsurerCompany_hidden").value;
            if(applicant =='')
              {
                 alert('Please Select Insured Name.')
                 return false;
              }
              else if(company=='')
              {
               alert('Please Select Company.')
                 return false;
              }
              else if(scheme=='')
              {
               alert('Please Select Scheme.')
                 return false;
              }
              else
              {
                   var cmb=document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_drpPayMode');
                   if(cmb.value =='0')
                    {                   
                       var bnk=document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_drpAppBank_VI');
                       if(bnk.value =='')
                        {
                           alert("Bank Details is Required.");
                           return;
                        }
                       else
                        {
                        var obj='SaveNew';
                        popPanel.PerformCallback(obj);
                        }
                    }
                    else
                    {
                       var obj='SaveNew';
                        popPanel.PerformCallback(obj);
                    }
               }
             
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
                AppBank.SetValue(data[1]);
                cmbSubSequentBank.SetValue(data[2]);
                if(data[3]!='')
                    cmbBrokingCode.SetValue(data[3]);
                var polc=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_drpPolicyStatus");
                PolicyChange(polc.value);
                polc=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_drpPayMode");
                PayModeChange(polc.value);
                polc=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_drpSubSeqPayMode");
                SubModeChange(polc.value);
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
        var txt=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtProposer");
        txt.focus();
        txt.select();
    }
    function PolicyChange(obj)
    {
        HideDates();
//        if(obj=="0")
//        {
//            document.getElementById("TRFreeLookUp").style.display='inline';
//        }
        if(obj=="1" || obj=="2")
        {
            document.getElementById("TRClosingDate").style.display='inline';
        }
        if(obj=="4")
        {
            document.getElementById("TRIssueDate").style.display='inline';
            document.getElementById("TRFreeLookUp").style.display='inline';
        }
        if(obj=="5")
        {
            document.getElementById("TRLapseDate").style.display='inline';
        }
        if(obj=="6")
        {
            Ldate.SetDate(null);
            document.getElementById("TRLoginDate").style.display='inline';
        }
        
    }
    function HideDates()
    {
        document.getElementById("TRIssueDate").style.display='none';
        document.getElementById("TRFreeLookUp").style.display='none';
        document.getElementById("TRClosingDate").style.display='none';
        document.getElementById("TRLoginDate").style.display='none';
        document.getElementById("TRLapseDate").style.display='none';
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
    function PayModeChange(obj)
    {
        if(obj=='5')
        {
            document.getElementById("TRApplBank").style.display='none';
            document.getElementById("TRInsuNo").style.display='none';
            document.getElementById("TRInsuDate").style.display='none';
            document.getElementById("TRAllBank").style.display='none';
        }
        else
        {
            if(obj=='1')
            {
                document.getElementById("TRApplBank").style.display='none';
                document.getElementById("TRAllBank").style.display='inline';
            }
            else
            {
                document.getElementById("TRApplBank").style.display='inline';
                document.getElementById("TRAllBank").style.display='none';
            }
            document.getElementById("TRInsuNo").style.display='inline';
            document.getElementById("TRInsuDate").style.display='inline';
        }
    }
    function SubModeChange(obj)
    {
        if(obj=='5')
        {
            document.getElementById("TRSubBank").style.display='none';
            document.getElementById("TRCreditNo").style.display='none';
            document.getElementById("TRCreditExpireDate").style.display='none';
            document.getElementById("TRSubAllBank").style.display='none';
        }
        else
        {
            if(obj=='1')
            {
                document.getElementById("TRSubBank").style.display='none';
                document.getElementById("TRSubAllBank").style.display='inline';
            }
            else
            {
                document.getElementById("TRSubBank").style.display='inline';
                document.getElementById("TRSubAllBank").style.display='none';
            }
            document.getElementById("TRCreditNo").style.display='inline';
            document.getElementById("TRCreditExpireDate").style.display='inline';
        }
    }
    function callback()
        {
               var applicant=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtApplicant_hidden").value;
               AppBank.PerformCallback(applicant);
               cmbSubSequentBank.PerformCallback(applicant);
        } 
        
        
    function ShowHideFilter(obj)
    {
        var showrecord='Show~'+obj
        grid.PerformCallback(showrecord);
          height();
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
             <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Transaction LI</span></strong>
                    </td>
                </tr>
                         <tr>
                                <td id="Td1" align="left">
                                    <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a> || <a href="javascript:ShowHideFilter('All');"><span style="color: #000099;
                                            text-decoration: underline">All Records</span></a>
                                </td>
                               
                            </tr>
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
                                             <dxwgv:GridViewDataTextColumn VisibleIndex="12">
                                                <DataItemTemplate>
                                                    <a href="javascript:void(0);" onclick="OnAddEditClick(this,'Edit~'+'<%# Container.KeyValue %>')">
                                                        <u>Edit</u> </a><a href="javascript:void(0);" onclick="btnDetail_Click('<%# Container.KeyValue %>')">
                                                            <u>Detail</u> </a>
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
                                               <dxwgv:GridViewDataTextColumn VisibleIndex="13">
                                                <DataItemTemplate>
                                                    <a href="javascript:void(0);" onclick="OnDeleteClick(this,'Delete~'+'<%# Container.KeyValue %>')">
                                                        <u>Delete</u> </a>
                                                </DataItemTemplate>
                                                <EditFormSettings Visible="False" />
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            
                                        </Columns>
                                        <StylesEditors>
                                            <ProgressBar Height="25px">
                                            </ProgressBar>
                                        </StylesEditors>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSort="False" AllowMultiSelection="True" />
                                        <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True" PageSize="15">
                                            <FirstPageButton Visible="True">
                                            </FirstPageButton>
                                            <LastPageButton Visible="True">
                                            </LastPageButton>
                                        </SettingsPager>
                                        <SettingsText Title="Transaction LI" />
                                        <Settings ShowGroupedColumns="True" ShowGroupPanel="True" />
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="popup" runat="server"
                                        AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Transaction"
                                        EnableHotTrack="False" BackColor="#DDECFE" Width="100%"
                                        CloseAction="CloseButton">
                                        <ContentCollection>
                                            <dxpc:PopupControlContentControl runat="server">
                                                <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="popPanel"
                                                    OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
                                                    <PanelCollection>
                                                        <dxp:PanelContent runat="server">
                                                            <table class="TableMain100">
                                                                <tr style="display: none">
                                                                    <td class="gridcellleft">
                                                                        <asp:DropDownList ID="drpCompany" runat="server" Width="64px" CssClass="EcoheadCon">
                                                                        </asp:DropDownList>
                                                                        <asp:TextBox ID="txtApplicant_hidden" runat="server" Width="24px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtScheme_hidden" runat="server" Width="24px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtTeleCaller_hidden" runat="server" Width="24px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtFOS_hidden" runat="server" Width="14px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtReferal_hidden" runat="server" Width="12px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtSubBroaker_hidden" runat="server" Width="26px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtProposer_hidden" runat="server" Width="26px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtNominee_hidden" runat="server" Width="26px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtInsurerCompany_hidden" runat="server" Width="26px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtDeliveryBy_hidden" runat="server" Width="26px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtAllbank_hidden" runat="server" Width="26px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtSubAllbank_hidden" runat="server" Width="26px"></asp:TextBox>
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
                                                                                                <strong><span style="color: #000099">Insured:</span></strong></td>
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
                                                                                                <strong><span style="color: #000099">Proposer:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtProposer" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    TabIndex="4"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Nominee:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtNominee" runat="server" Width="175px" CssClass="EcoheadCon" TabIndex="5"></asp:TextBox>
                                                                                                <a id="AddFamily" onclick="AddNewFamilyMember()" style="cursor: pointer;"><span style="color: #000099;
                                                                                                    font-size: 8pt; text-decoration: underline;">Add Family</span></a>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Insurer Company:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtInsurerCompany" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    TabIndex="5"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Broking Code:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxComboBox ID="cmbBrokingCode" runat="server" EnableIncrementalFiltering="True"
                                                                                                    OnCallback="cmbBrokingCode_Callback" ClientInstanceName="cmbBrokingCode" TabIndex="6"
                                                                                                    ValueType="System.String" Width="179px" DataSourceID="BrokingCode" TextField="code"
                                                                                                    ValueField="value">
                                                                                                </dxe:ASPxComboBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Scheme:</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtScheme" runat="server" Width="175px" CssClass="EcoheadCon" TabIndex="7"></asp:TextBox>
                                                                                            </td>
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
                                                                                                <strong><span style="color: #000099">Application No.:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtAppNo" runat="server" Width="175px" CssClass="EcoheadCon" TabIndex="8"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Policy No.:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtPolicyNo" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    TabIndex="9"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Sum Assured Amt :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtSumAssured" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    TabIndex="10"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Trans Mode :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:DropDownList ID="drpTranMode" runat="server" Width="179px" CssClass="EcoheadCon"
                                                                                                    TabIndex="11">
                                                                                                    <asp:ListItem Value="0">Monthly</asp:ListItem>
                                                                                                    <asp:ListItem Value="1">Quartely</asp:ListItem>
                                                                                                    <asp:ListItem Value="2">Half Yr.</asp:ListItem>
                                                                                                    <asp:ListItem Value="3">Annual</asp:ListItem>
                                                                                                    <asp:ListItem Value="4">One Inst</asp:ListItem>
                                                                                                </asp:DropDownList></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Gross Prem Amt :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtPremAmt" runat="server" Width="175px" CssClass="EcoheadCon" TabIndex="12"></asp:TextBox></td>
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
                                                                                                    ReadOnly="True"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Prem Pay Term :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtTerms" runat="server" Width="175px" CssClass="EcoheadCon" TabIndex="15"></asp:TextBox>Yrs</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Policy Term :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtPolicyTerm" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    TabIndex="16"></asp:TextBox>Yrs</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Pay Mode:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:DropDownList ID="drpPayMode" runat="server" Width="179px" CssClass="EcoheadCon"
                                                                                                    TabIndex="17"  onchange="javascript:PayModeChange(this.value);">
                                                                                                    <asp:ListItem Value="0">Cheque</asp:ListItem>
                                                                                                    <asp:ListItem Value="1">Draft</asp:ListItem>
                                                                                                    <asp:ListItem Value="2">Credit Card</asp:ListItem>
                                                                                                    <asp:ListItem Value="3">ECS</asp:ListItem>
                                                                                                    <asp:ListItem Value="4">Direct Debit</asp:ListItem>
                                                                                                    <asp:ListItem Value="5">Cash</asp:ListItem>
                                                                                                </asp:DropDownList></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Amount :</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtChqAmt" runat="server" Width="175px" CssClass="EcoheadCon" TabIndex="18"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr id="TRApplBank">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Applicants Bank :</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxComboBox ID="drpAppBank" runat="server" Width="300px" DropDownWidth="550px"
                                                                                                    DataSourceID="dsgrdClientbank" ValueField="cbd_id" ValueType="System.String"
                                                                                                    TextFormatString="{2} -- {0}" EnableIncrementalFiltering="True" CallbackPageSize="30"
                                                                                                    ClientInstanceName="AppBank" OnCallback="drpAppBank_Callback" TabIndex="19" OnCustomJSProperties="drpAppBank_CustomJSProperties">
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
                                                                                                
                                                                                                  <a id="A1" onclick="AddNewBankDetails()" style="cursor: pointer;"><span style="color: #000099;
                                                                                                    font-size: 8pt; text-decoration: underline;">Add Bank</span></a>
                                                                                                
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="TRAllBank" style="display:none;">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Bank :</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtAllbank" runat="server" Width="294px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="TRInsuNo">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Inst No :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtChqNo" runat="server" Width="175px" CssClass="EcoheadCon" TabIndex="20"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr id="TRInsuDate">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Inst Dt :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="InstDt" runat="server" ClientInstanceName="IDdate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="21">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td class="gridcellleft" style="vertical-align: top; text-align: left">
                                                                                    <table style="border: solid 1px white">
                                                                                        <tr>
                                                                                            <td class="gridcellleft" style="height: 12px">
                                                                                                <strong><span style="color: #000099">SubSeq Pay Mode :</span></strong></td>
                                                                                            <td class="gridcellleft" style="height: 12px">
                                                                                                <asp:DropDownList ID="drpSubSeqPayMode" runat="server" Width="179px" CssClass="EcoheadCon"
                                                                                                    TabIndex="22" onchange="javascript:SubModeChange(this.value);">
                                                                                                    <asp:ListItem Value="0">Cheque</asp:ListItem>
                                                                                                    <asp:ListItem Value="1">Draft</asp:ListItem>
                                                                                                    <asp:ListItem Value="2">Credit Card</asp:ListItem>
                                                                                                    <asp:ListItem Value="3">ECS</asp:ListItem>
                                                                                                    <asp:ListItem Value="4">Direct Debit</asp:ListItem>
                                                                                                    <asp:ListItem Value="5">Cash</asp:ListItem>
                                                                                                </asp:DropDownList></td>
                                                                                        </tr>
                                                                                        <tr id="TRSubBank">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">SubSeq Bank :</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxComboBox ID="cmbSubSequentBank" runat="server" Width="300px" DropDownWidth="550px"
                                                                                                    DataSourceID="dsgrdClientbank" ValueField="cbd_id" ValueType="System.String"
                                                                                                    TextFormatString="{2} -- {0}" EnableIncrementalFiltering="True" CallbackPageSize="30"
                                                                                                    ClientInstanceName="cmbSubSequentBank" OnCallback="cmbSubSequentBank_Callback"
                                                                                                    TabIndex="23" OnCustomJSProperties="cmbSubSequentBank_CustomJSProperties">
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
                                                                                        <tr id="TRSubAllBank" style="display:none;">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Bank :</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtSubAllbank" runat="server" Width="294px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="TRCreditNo">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Credit Card Number :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtCreditCardNo" runat="server" CssClass="EcoheadCon" Width="175px"
                                                                                                    TabIndex="24"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr id="TRCreditExpireDate">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Credit Card Expiry :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="CreditExpiry" runat="server" ClientInstanceName="CCName" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="179px" Font-Size="10px" TabIndex="25">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                         <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Policy Status :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:DropDownList ID="drpPolicyStatus" runat="server" Width="179px" CssClass="EcoheadCon"
                                                                                                    TabIndex="30" onchange="javascript:PolicyChange(this.value);">
                                                                                                    <asp:ListItem Value="0">Business in Hand</asp:ListItem>
                                                                                                    <asp:ListItem Value="1">Cancelled</asp:ListItem>
                                                                                                    <asp:ListItem Value="2">Canclled from inception</asp:ListItem>
                                                                                                    <asp:ListItem Value="3">Cheque Bounced</asp:ListItem>
                                                                                                    <asp:ListItem Value="4">Issued</asp:ListItem>
                                                                                                    <asp:ListItem Value="5">Lapsed</asp:ListItem>
                                                                                                    <asp:ListItem Value="6">Login</asp:ListItem>
                                                                                                </asp:DropDownList></td>
                                                                                        </tr>
                                                                                        <tr id="TRIssueDate" style="display: none">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Issue Date :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="IssueDate" runat="server" ClientInstanceName="Idate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="31">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="TRFreeLookUp" style="display: none">
                                                                                            <td class="gridcellleft" style="height: 21px">
                                                                                                <strong><span style="color: #000099">Free Lookup Period:</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft" style="height: 21px">
                                                                                                <asp:TextBox ID="txtFreeLookupPeriod" runat="server" Text="10" TabIndex="32" CssClass="EcoheadCon"
                                                                                                    Width="101px"></asp:TextBox>Days
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="TRClosingDate" style="display: none">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Closing Date :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="ReceiveDate" runat="server" ClientInstanceName="Rdate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="33">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="TRLoginDate" style="display: none">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Login Date :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="LoginDate" runat="server" ClientInstanceName="Lodate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="34">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="TRLapseDate" style="display: none">
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Lapse Date:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="LapseDate" runat="server" ClientInstanceName="Ldate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="35">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Delivery Mode:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:DropDownList ID="cmbDeliverMode" runat="server" Width="179px" CssClass="EcoheadCon"
                                                                                                    TabIndex="36">
                                                                                                    <asp:ListItem Selected="True" Value="1">Hand Delivery</asp:ListItem>
                                                                                                    <asp:ListItem Value="2">By Courier</asp:ListItem>
                                                                                                </asp:DropDownList></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Delivered By:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtDeliveryBy" runat="server" Width="175px" CssClass="EcoheadCon"
                                                                                                    TabIndex="37"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Delivered On:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <dxe:ASPxDateEdit ID="DeliveryDate" runat="server" ClientInstanceName="Dedate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="180px" Font-Size="10px" TabIndex="38">
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
                                                                                                    MaxLength="50" TabIndex="39"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Tele Caller:</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtTeleCaller" runat="server" CssClass="EcoheadCon" Width="175px"
                                                                                                    TabIndex="26"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Sales Rep/Man :</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtFOS" runat="server" CssClass="EcoheadCon" Width="175px" TabIndex="27"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Associate :</span></strong>
                                                                                            </td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtReferal" runat="server" CssClass="EcoheadCon" Width="175px" TabIndex="28"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Sub Broker/Franchise :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtSubBroaker" runat="server" CssClass="EcoheadCon" Width="175px"
                                                                                                    TabIndex="29"></asp:TextBox></td>
                                                                                        </tr>
                                                                                       
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">Policy Remarks :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtLapsedReason" runat="server" TextMode="MultiLine" Width="300px"
                                                                                                    CssClass="EcoheadCon" Height="60px" ReadOnly="True"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="gridcellleft">
                                                                                                <strong><span style="color: #000099">User Notes/Remarks :</span></strong></td>
                                                                                            <td class="gridcellleft">
                                                                                                <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Height="60px" Width="300px"
                                                                                                    CssClass="EcoheadCon" TabIndex="40"></asp:TextBox></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellcenter" style="height: 41px">
                                                                        <input id="Button1" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                            style="width: 60px" tabindex="41" />
                                                                        <input id="Button2" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                                                            style="width: 60px" tabindex="42" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:HiddenField ID="hdBank" runat="server" />
                                                                        <asp:HiddenField ID="hdSubBroker" runat="server" />
                                                                        <asp:HiddenField ID="hdSubSeqBank" runat="server" />
                                                                        <input id="Hidden1" type="hidden" />
                                                                        <asp:HiddenField ID="childemployees" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </dxp:PanelContent>
                                                    </PanelCollection>
                                                    <ClientSideEvents EndCallback="function(s, e) {
	                                                    EndCallBack(s.cpLast);
                                                    }"  />
                                                </dxcp:ASPxCallbackPanel>
                                            </dxpc:PopupControlContentControl>
                                        </ContentCollection>
                                        <HeaderStyle HorizontalAlign="Left">
                                            <Paddings PaddingRight="6px" />
                                        </HeaderStyle>
                                        <SizeGripImage Height="16px" Width="16px" />
                                        <CloseButtonImage Height="12px" Width="13px" />
                                        <ClientSideEvents CloseButtonClick="function(s, e) {
	 popup.Hide();
}" />
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
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" SelectCommand="select InsBrokingCode_Code as code,InsBrokingCode_Code as value from Master_InsBrokingCode where InsBrokingCode_InsuranceCompanyID= @ProdCode and InsBrokingCode_CompanyID=@company ">
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
