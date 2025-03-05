<%@ page language="C#" autoeventwireup="true" inherits="management_frm_insurancecommission_ReceivableSetup_AddEdit, App_Web_6yanuau_" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

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
    <title>Insurance Commission Receivable Setup Add/Edit</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:22222222;
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
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script type="text/javascript" language="javascript">
        function Pahe_Load()
        {
            RowID='';
            FieldName='btnsave';
        }
        function CallTdsAccount(objid,objfunc,objevant)
        {
            FieldName="btnsave";
            ajax_showOptions(objid,objfunc,objevant,'a');
        }
        function OnAddButtonClick(obj)
        {
            var txt=document.getElementById("GridAdd");
            //alert(txt.value);
            if(txt.value=="Add")
            {
                alert('Please Add First Entries!! ');
                return false;
            }
            else
            {
                Type='blank';
                popup.Show();
                popPanel.PerformCallback('blnkForm');
            }
        }
        function OnMoreInfoClick(obj)
        {//alert(obj);
            Type='blankEdit';
            popup.Show();
            RowID=obj;
            var dpar='Edit~' + obj;
            popPanel.PerformCallback(dpar);
        }
        function noNumbers(e)
        {
            var keynum
            var keychar
            var numcheck
            
            if(window.event)//IE
            {
                keynum = e.keyCode                        
                if(keynum>=48 && keynum<=57 || keynum==46)
                {
                    return true;
                }
                else
                {
                    alert("Please Insert Numeric Only");
                    return false;
                }
            } 
            else if(e.which) // Netscape/Firefox/Opera
            {
                keynum = e.which  
                if(keynum>=48 && keynum<=57 || keynum==46)
                {
                    return true;
                }
                else
                {
                    alert("Please Insert Numeric Only");
                    return false;
                }     
            }
        } 
        function btnSaveClick()
        {
            var txt=document.getElementById("GridAdd");
            //alert(txt.value);
            if(txt.value=="AddNew")
            {
                Type='E';
                var txtCom=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_TextBox1").value;
                var txtORC=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_TextBox2").value;
                popPanel.PerformCallback('AddNew~'+txtCom+'~'+txtORC);
            }
            else if(txt.value=="Edit")
            {
                //alert(Type);
                var txtCom=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_TextBox1").value;
                var txtORC=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_TextBox2").value;
                if(Type=="blank")
                {
                    Type='E';
                    popPanel.PerformCallback('AddNew~'+txtCom+'~'+txtORC);
                }
                else
                {
                    Type='E';
                    //make Type='blankEdit' then save will call update part of the pop up
                    popPanel.PerformCallback('UpdateOld~'+RowID+'~'+txtCom+'~'+txtORC);
                }
            }
        }
        function btnCancel_Click()
        {
            popup.Hide();
        }
        function show_Scheme(obj1,obj2,obj3)
        {
            FieldName="btnsave";
            var data=document.getElementById("InsurenceComp").value;
            data="'"+data+"'";
            ajax_showOptions(obj1,obj2,obj3,'Products~'+data,'Main');
        }
        function keyVal(obj)
        {
            cmbTrailCommissionClab.PerformCallback();
        }

        function ShowHideCommissionRate()
        {
            var txt=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCommissionRate");
            if(txt.value=='')
            {
                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_TextBox1").disabled=false;
                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_HyperLink1").disabled=false;
            }
            else
            {
                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_TextBox1").value='';
                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_TextBox1").disabled=true;
                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_HyperLink1").disabled=true;
            }
        }
        
        function ShowHideORCrate()
        {
            var txt=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtORCrate");
            if(txt.value=='')
            {
                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_TextBox2").disabled=false;
                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_HyperLink2").disabled=false;
            }
            else
            {
                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_TextBox2").value='';
                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_TextBox2").disabled=true;
                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_HyperLink2").disabled=true;
            }
        }
        function cmbEndCall(obj)
        {//alert(obj);
            if(obj=="T")
            {
                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTrailCommissionRate").disabled=true;
                cmbTrailCommissionClab.SetEnabled(false);
                cmbPremiumMode.SetValue('S');
                cmbPremiumMode.SetEnabled(false);
            }
            else
            {
                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTrailCommissionRate").disabled=false;
                cmbTrailCommissionClab.SetEnabled(true);
                cmbPremiumMode.SetEnabled(true);
            }
            
        }
        function CallBackPanelLastCall(obj)
        {//alert(obj);
            var data=obj.split('~');
            if(data[0]=='Y')
            {
                if(Type=='E')
                {
                    popup.Hide();
                    grid.PerformCallback();
                }
                else if(Type=='T')
                {
                    popup.Hide();
                }
                else if(Type =='')
                {
                    grid.PerformCallback();
                }
            }
            else if(data[0]=='N')
            {
                alert(data[1]);
            }
        }
        function ShowSlabs(obj)
        {
            var url='frm_insurancecommission_ReceivableSetup_AddEdit_Slabs.aspx?id='+obj+'&type=B';
            //alert(url);
            editwin=dhtmlmodal.open("Editbox", "iframe", url, "Commission Slab", "width=800px,height=400px,center=1,resize=0,scrolling=2,top=500", "recal")
            editwin.onclose=function()
            {
//                 window.location='../management/ProjectMainPage.aspx';
            }
        }
        function OnTrailClick(obj)
        {
            var url='frm_insurancecommission_ReceivableSetup_Trail.aspx?id='+obj;
            editwin=dhtmlmodal.open("Editbox", "iframe", url, "Commission Trail", "width=800px,height=400px,center=1,resize=0,scrolling=2,top=500", "recal")
            editwin.onclose=function()
            {
            }
//            popup.Show();
//            RowID=obj;
//            var dpar='TrailOpen~' + obj;
//            popPanel.PerformCallback(dpar);
        }
//        function btnTrailSaveClick()
//        {
//            var txtCom=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTrailSlab").value;
//            var dpar='TrailSave~' + RowID+'~'+txtCom;
//            popPanel.PerformCallback(dpar);
//        }
//        function ShowHideTrailrate()
//        {
//            var txt=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtRate");
//            if(txt.value=='')
//            {
//                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTrailSlab").disabled=false;
//                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_HyperLink3").disabled=false;
//            }
//            else
//            {
//                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTrailSlab").value='';
//                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTrailSlab").disabled=true;
//                document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_HyperLink3").disabled=true;
//            }
//        }
        function OnDeleteClick(obj)
        {   
            if(confirm('Are you sure to Delete this record?'))
            {
                Type='';
                popPanel.PerformCallback('Delete~'+obj);
            }
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="Off">
        <table class="TableMain100">
            <tr>
                <td class="gridcellleft">
                    <table class="TableMain100">
                        <tr style="display: none;">
                            <td  colspan="4">
                                <asp:TextBox ID="txtApplicableTDS_hidden" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtORCcompany_hidden" runat="server"></asp:TextBox>
                                <asp:HiddenField ID="GridAdd" runat="server" />
                                <asp:HiddenField ID="mainEntryID" runat="server" />
                                <asp:HiddenField ID="InsurenceComp" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td  colspan="4">
                                <table cellspacing="0px">
                                    <tr>
                                        <td style="background-color: #FFF3DF; display: none">
                                            <asp:Label ID="lblCompany" runat="server" Text="" CssClass="Ecoheadtxt"></asp:Label>
                                        </td>
                                        <td class="gridcellleft" style="background-color: #FFF3DF;">
                                            &nbsp;<span class="Ecoheadtxt" style="color: Blue"><strong>Commission for:</strong></span>
                                        </td>
                                        <td style="background-color: #FFF3DF;">
                                            <asp:Label ID="lblInsurerComp" runat="server" Text="" CssClass="Ecoheadtxt"></asp:Label>
                                        </td>
        
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                        
                        <td>
                        <table>
                        
                        <tr>
                                                        <td class="gridcellleft">
                                            <span class="Ecoheadtxt" style="color: Blue"><strong>Applicable TDS:</strong></span>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtApplicableTDS" runat="server" Width="275px"></asp:TextBox>
                                        </td>
                                        <td>
                                         <span class="Ecoheadtxt" style="color: Blue"><strong>Service Tax:</strong></span>
                                        </td>
                                         <td>
                                       
                                            
                                             <asp:DropDownList ID="DropDownTax" runat="server" Width="120px">
                                                 <asp:ListItem Value="Y">Inclusive</asp:ListItem>
                                                 <asp:ListItem Value="N">Exclusive</asp:ListItem>
                                             </asp:DropDownList>
                                        </td>
                                        </tr></table>
                        </td>
                        
                        </tr>
                        <tr>
                            <td colspan="4">
                                <table>
                                    <tr>
                                        <td style="text-align: left">
                                            <span class="Ecoheadtxt" style="color: Blue"><strong>ORC Company:</strong></span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txtORCcompany" runat="server" Width="275px"></asp:TextBox>
                                        </td>
                                        <td style="text-align: left">
                                            &nbsp;&nbsp;&nbsp;<span class="Ecoheadtxt" style="color: Blue"><strong>Effective:</strong></span>
                                        </td>
                                        <td class="gridcellleft">
                                            <dxe:ASPxDateEdit ID="Effectivefrom" runat="server" UseMaskBehavior="True" EditFormat="Custom"
                                                Width="150px">
                                                <ButtonStyle Width="13px">
                                                </ButtonStyle>
                                                <DropDownButton ImagePosition="Top" Text="from">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnsave" CssClass="btnUpdate" runat="server" Text="Save" OnClick="btnsave_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="BrokerageDetailGrid" runat="server" KeyFieldName="InsCommissionDetail_ID"
                                    AutoGenerateColumns="False" Width="100%" ClientInstanceName="grid" OnCustomCallback="BrokerageDetailGrid_CustomCallback">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn FieldName="product" Caption="Product" VisibleIndex="0">
                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="mode" Caption="Mode" VisibleIndex="1">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Type" FieldName="Type" VisibleIndex="2">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="InsCommissionDetail_UpfrontRate" Caption="Com. Rate"
                                            VisibleIndex="3">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Com. Slab" FieldName="InsCommissionDetail_UpfrontSlab"
                                            VisibleIndex="4">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="ORC Rate" FieldName="InsCommissionDetail_ORCRate"
                                            VisibleIndex="7" Visible="false">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="ORC Slab" FieldName="InsCommissionDetail_ORCSlab"
                                            VisibleIndex="8" Visible="false">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="9" Width="80px">
                                            <DataItemTemplate>
                                                <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                                    Edit</a>&nbsp;|&nbsp;<a href="javascript:void(0);" onclick="OnTrailClick('<%# Container.KeyValue %>')">
                                                        Trail</a>&nbsp;|&nbsp;<a href="javascript:void(0);" onclick="OnDeleteClick('<%# Container.KeyValue %>')">
                                                            Delete</a>
                                            </DataItemTemplate>
                                            <EditFormSettings Visible="False" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <HeaderTemplate>
                                                <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                  { %>
                                                <a href="javascript:void(0);" onclick="OnAddButtonClick('AddNew')"><span style="color: #000099;
                                                    text-decoration: underline">Add Detail</span> </a>
                                                <%} %>
                                            </HeaderTemplate>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <Styles>
                                        <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                        </Header>
                                        <FocusedGroupRow CssClass="gridselectrow">
                                        </FocusedGroupRow>
                                        <FocusedRow CssClass="gridselectrow">
                                        </FocusedRow>
                                        <LoadingPanel ImageSpacing="10px">
                                        </LoadingPanel>
                                    </Styles>
                                    <%--<Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="260" VerticalScrollBarStyle="Virtual" ShowHorizontalScrollBar="true" />--%>
                                    <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                        PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                    <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                                        PageSize="14">
                                        <FirstPageButton Visible="True">
                                        </FirstPageButton>
                                        <LastPageButton Visible="True">
                                        </LastPageButton>
                                    </SettingsPager>
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 401px">
                                <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="popup" runat="server"
                                    AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Details"
                                    EnableHotTrack="False" BackColor="#DDECFE" Width="100%" DisappearAfter="500"
                                    CloseAction="None">
                                    <ContentCollection>
                                        <dxpc:PopupControlContentControl runat="server">
                                            <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="popPanel"
                                                OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
                                                <PanelCollection>
                                                    <dxp:PanelContent runat="server">
                                                        <table width="100%">
                                                            <tr id="Commission" runat="server">
                                                                <td style="width: 885px" runat="server">
                                                                    <table>
                                                                        <tr style="display: none;">
                                                                            <td>
                                                                                <asp:TextBox ID="txtproduct_hidden" runat="server"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="Ecoheadtxt" style="text-align: left; width: 164px;">
                                                                                Product :</td>
                                                                            <td colspan="5" class="gridcellleft">
                                                                                <asp:TextBox ID="txtproduct" runat="server" Width="418px" TabIndex="1"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="Ecoheadtxt" style="text-align: left; width: 164px;">
                                                                                Premium Mode:
                                                                            </td>
                                                                            <td class="gridcellleft">
                                                                                <dxe:ASPxComboBox runat="server" ID="cmbPremiumMode" ClientInstanceName="cmbPremiumMode"
                                                                                    Width="150px" DropDownStyle="DropDown" EnableIncrementalFiltering="True" TabIndex="2"
                                                                                    ValueType="System.String">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="Monthly" Value="M"></dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Quarterly" Value="Q"></dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Half-Yearly" Value="H"></dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Yearly" Value="Y"></dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Any" Value="A"></dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Single" Value="S"></dxe:ListEditItem>
                                                                                    </Items>
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                            <td class="Ecoheadtxt" style="text-align: left; width: 167px;">
                                                                                Business Type:
                                                                            </td>
                                                                            <td class="gridcellleft" style="width: 158px;">
                                                                                <dxe:ASPxComboBox runat="server" Width="150px" ID="cmbBusinessType" DropDownStyle="DropDown"
                                                                                    EnableSynchronization="False" EnableIncrementalFiltering="True" TabIndex="3"
                                                                                    ValueType="System.String">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="Individual-Resident" Value="I"></dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Corporate" Value="C"></dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Trust" Value="T"></dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Individual-Non Resident" Value="N"></dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Any" Value="A"></dxe:ListEditItem>
                                                                                    </Items>
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                            <td class="Ecoheadtxt" style="text-align: left; width: 217px;">
                                                                                Commission Rate(%):
                                                                            </td>
                                                                            <td class="gridcellleft">
                                                                                <asp:TextBox ID="txtCommissionRate" runat="server" onkeypress="return noNumbers(event)"
                                                                                    Width="66px" onkeyup="ShowHideCommissionRate()" TabIndex="4"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="Ecoheadtxt" style="text-align: left; width: 164px;">
                                                                                Commission Slab:
                                                                            </td>
                                                                            <td class="gridcellleft">
                                                                                <asp:TextBox ID="TextBox1" runat="server" onkeyup="ShowSlabs('C')" TabIndex="5" Width="55px"
                                                                                    ReadOnly="True"></asp:TextBox>
                                                                                <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="True" NavigateUrl="javascript:ShowSlabs('C');">Get Code</asp:HyperLink>
                                                                            </td>
                                                                            <td class="Ecoheadtxt" style="text-align: left; width: 164px;">
                                                                                Stax on commission(%)(Shared Component):
                                                                            </td>
                                                                            <td class="gridcellleft">
                                                                                <asp:TextBox ID="txtStaxCommission" runat="server" onkeypress="return noNumbers(event)"
                                                                                    Width="55px" TabIndex="6"></asp:TextBox>
                                                                            </td>
                                                                            <td class="Ecoheadtxt" style="text-align: left; width: 164px;">
                                                                                Top up Commission Rate(%):
                                                                            </td>
                                                                            <td class="gridcellleft">
                                                                                <asp:TextBox ID="txtTopUpCommRate" runat="server" onkeypress="return noNumbers(event)"
                                                                                    Width="66px" TabIndex="7"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr id="tr3" runat="server">
                                                                            <td class="Ecoheadtxt" style="text-align: left; width: 164px; display: none">
                                                                                ORC Rate(%):
                                                                            </td>
                                                                            <td class="gridcellleft" style="display: none;">
                                                                                <asp:TextBox ID="txtORCrate" runat="server" onkeypress="return noNumbers(event)"
                                                                                    Width="55px" onkeyup="ShowHideORCrate()" TabIndex="8"></asp:TextBox>
                                                                            </td>
                                                                            <td class="Ecoheadtxt" style="text-align: left; width: 167px; display:none">
                                                                                ORC Slab:
                                                                            </td>
                                                                            <td class="gridcellleft" style="width: 158px; display:none">
                                                                                <asp:TextBox ID="TextBox2" runat="server" onkeyup="ShowSlabs('O')" ReadOnly="True"
                                                                                    TabIndex="9" Width="55px"></asp:TextBox>
                                                                                <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="True" NavigateUrl="javascript:ShowSlabs('O');">Get Code</asp:HyperLink>
                                                                            </td>
                                                                            <td class="Ecoheadtxt" style="text-align: left; width: 217px;">
                                                                                Stax on ORC(%)(Shared Component):
                                                                            </td>
                                                                            <td class="gridcellleft" runat="server">
                                                                                <asp:TextBox ID="txtServieceTax" runat="server" onkeypress="return noNumbers(event)"
                                                                                    Width="150px" TabIndex="10"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="Ecoheadtxt" style="text-align: left; width: 164px;">
                                                                                Special Collection Drive From:
                                                                            </td>
                                                                            <td class="gridcellleft">
                                                                                <dxe:ASPxDateEdit ID="deivefrom" ClientInstanceName="deivefrom" runat="server" UseMaskBehavior="True"
                                                                                    EditFormat="Custom" Width="150px" TabIndex="11">
                                                                                    <ButtonStyle Width="13px">
                                                                                    </ButtonStyle>
                                                                                    <DropDownButton ImagePosition="Top" Text="from">
                                                                                    </DropDownButton>
                                                                                </dxe:ASPxDateEdit>
                                                                            </td>
                                                                            <td class="Ecoheadtxt" style="text-align: left; width: 167px;">
                                                                                Special Collection Drive To:
                                                                            </td>
                                                                            <td class="gridcellleft" style="width: 158px">
                                                                                <dxe:ASPxDateEdit ID="deriveto" ClientInstanceName="deriveto" runat="server" UseMaskBehavior="True"
                                                                                    EditFormat="Custom" Width="151px" TabIndex="12">
                                                                                    <ButtonStyle Width="13px">
                                                                                    </ButtonStyle>
                                                                                    <DropDownButton ImagePosition="Top" Text="To">
                                                                                    </DropDownButton>
                                                                                </dxe:ASPxDateEdit>
                                                                            </td>
                                                                            <td class="gridcellright">
                                                                                <input id="Button1" type="button" value="Save" class="btnUpdate" onclick="btnSaveClick()"
                                                                                    style="width: 60px" tabindex="13" />
                                                                            </td>
                                                                            <td class="gridcellleft">
                                                                                <input id="Button2" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                                                                    style="width: 60px" tabindex="14" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </dxp:PanelContent>
                                                </PanelCollection>
                                                <ClientSideEvents EndCallback="function(s, e) {
	                                                    CallBackPanelLastCall(s.cpLast);
                                                    }" />
                                            </dxcp:ASPxCallbackPanel>
                                        </dxpc:PopupControlContentControl>
                                    </ContentCollection>
                                    <HeaderStyle HorizontalAlign="Left">
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
    </form>
</body>
</html>
