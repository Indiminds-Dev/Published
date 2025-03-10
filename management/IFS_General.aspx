<%@ page language="C#" autoeventwireup="true" inherits="management_IFS_General, App_Web_n2fxndvz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>IFS_General</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js">
   
    </script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <script language="javascript" type="text/javascript">
    
     function SignOff()
    {
    window.parent.SignOff()
    }
    function ul()
    {
    window.opener.document.getElementById('iFrmInformation').setAttribute('src','CallUserInformation.aspx')  
    }
    function disp_prompt(name)
    {
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="IFS_TradingEntities.aspx"; 
        }
        if ( name == "tab2")
        {
        //alert(name);
        document.location.href="IFS_FundManagers.aspx"; 
        }
//        else if ( name == "tab3")
//        {
//        //alert(name);
//        document.location.href="Contact_DPDetails.aspx"; 
//        }
//        else if ( name == "tab4")
//        {
//        //alert(name);
//        document.location.href="Contact_Document.aspx"; 
//        }
//        else if ( name == "tab12")
//        {
//        //alert(name);
//        document.location.href="Contact_FamilyMembers.aspx"; 
//        }
//        else if ( name == "tab5")
//        {
//        //alert(name);
//        document.location.href="Contact_Registration.aspx"; 
//        }
//        else if ( name == "tab7")
//        {
//        //alert(name);
//        document.location.href="Contact_GroupMember.aspx"; 
//        }
//        else if ( name == "tab8")
//        {
//        //alert(name);
//        document.location.href="Contact_Deposit.aspx"; 
//        }
//        else if ( name == "tab9")
//        {
//        //alert(name);
//        document.location.href="Contact_Remarks.aspx"; 
//        }
//         else if ( name == "tab10")
//        {
//        //alert(name);
//        document.location.href="Contact_Education.aspx"; 
//        }
//        else if ( name == "tab11")
//        {
//        //alert(name);
//        document.location.href="contact_brokerage.aspx"; 
//        }
//        else if ( name == "tab6")
//        {
//        //alert(name);
//            document.location.href="contact_other.aspx"; 
//        }
//        else if(name=="tab13")
//        {
//             document.location.href="contact_Subscription.aspx";
//        }
//        else if(name=="tab14")
//        {
//             document.location.href="Contact_Nominee.aspx";
//        }
    }
        function CallList(obj1,obj2,obj3)
        {
            var sourceID=document.getElementById("ASPxPageControl1_cmbSource");
            if(sourceID.value=='21' || sourceID.value=='3' || sourceID.value=='4' || sourceID.value=='8' || sourceID.value=='10' || sourceID.value=='19' || sourceID.value=='20' || sourceID.value=='14' || sourceID.value=='24' || sourceID.value=='25')// || sourceID.value=='18')
            {
            //alert(sourceID.value);
            var obj4=document.getElementById("ASPxPageControl1_cmbSource");
            var obj5=obj4.value;
            //alert(obj5);
            ajax_showOptions(obj1,obj2,obj3,obj5,'Sub');
            }
        }
        

        function PageLoad()
        {
            
        }
        function keyVal(obj)
        {
            var objPhEmail=obj.split('~');
//            document.getElementById('ASPxPageControl1_txtRPartner_hidden').value=objPhEmail[0];
//            document.getElementById('ASPxPageControl1_TxtEmail').value=objPhEmail[1];
//            document.getElementById('ASPxPageControl1_TxtPhone').value=objPhEmail[2];
        }
        function popup()
        {
                 alert("Please type prefix of UCC");
                 return false;
        
        }
    
    function OnContactInfoClick(keyValue,CompName)
    {
    
        var keyValue=('<%=Session["KeyVal_InternalID"] %>'); 
        var CompName=('<%=Session["name"] %>'); 
        //alert (CompName);
        var url='insurance_contactPerson.aspx?id='+keyValue;
        editwin=dhtmlmodal.open("Editbox", "iframe", url,"Contact Name : "+CompName+"","width=940px,height=450px,center=1,resize=1,top=500", "recal");
       
    }

    function isNumberKey(e)      
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
        FieldName = 'ASPxPageControl1_cmbLegalStatus';
    </script>
    
    

    <!--___________________________________________________________________________-->
    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <!--___________________________________________________________________________-->
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
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page"
                        Font-Size="10px" OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged">
                        <TabPages>
                            <dxtc:TabPage Name="IFS">
                                <TabTemplate>
                                    <span style="font-size: x-small">IFS</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                        <table class="TableMain100">
                                            <tr>
                                                <td style="width: 961px">
                                                    <asp:Panel ID="Panel1" runat="server" BorderColor="White" BorderWidth="2px" Width="100%">
                                                        <table class="TableMain100">
                                                            <tr>
                                                                <td style="width: 70px">
                                                                    <span style="font-size: x-small;color:Blue">Name</span>&nbsp;<span style="color: Red;">*</span>
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                    <dxe:ASPxTextBox ID="txtName" runat="server" TabIndex="1" Width="200px">
                                                                        <ValidationSettings ValidationGroup="a">
                                                                        </ValidationSettings>
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                
                                                                <td style="width: 70px">
                                                                    <span style="font-size: x-small;color:Blue">Code</span>&nbsp;<span style="color: Red;">*</span>
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                    <dxe:ASPxTextBox ID="txtCode" runat="server" TabIndex="2" Width="200px">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                
                                                                <td style="width: 70px">
                                                                    <span style="font-size: x-small;color:Blue">Currency</span>
                                                                </td>
                                                                <td style="width: 164px" colspan="2">
                                                                    <asp:TextBox ID="txtCurrency" runat="server" TabIndex="3" Width="160px"></asp:TextBox>
                                                                    <asp:HiddenField ID="txtCurrency_hidden" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: right;">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                                                        Display="Dynamic" ErrorMessage="Name can not be blank." SetFocusOnError="True"
                                                                        ValidationGroup="a"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td colspan="2" style="text-align: right;">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCode"
                                                                        Display="Dynamic" ErrorMessage="Code can not be blank." SetFocusOnError="True"
                                                                        ValidationGroup="a"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 76px;">
                                                                    <span style="font-size: x-small;color:Blue">Description</span>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="250px" Height="200px"
                                                                        TabIndex="4"></asp:TextBox>
                                                                </td>
                                                                
                                                                <td style="width: 50px">
                                                                    <span style="font-size: x-small;color:Blue">Face Value</span>
                                                                </td>
                                                                <td style="height: 22px">
                                                                    <dxe:ASPxTextBox ID="txtFaceValue" ClientInstanceName="txtFaceValue" runat="server" TabIndex="5"
                                                                        Width="150px">
                                                                        <MaskSettings Mask="<0..999999999999999g>.<00..9999>" ErrorText="None" IncludeLiterals="DecimalSymbol" />
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                
                                                                <td style="width: 100px">
                                                                    <span style="font-size: x-small;color:Blue">Date Of Incorporation</span>
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                    <dxe:ASPxDateEdit ID="txtDOInc" runat="server" Width="156px" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                                                        UseMaskBehavior="True" TabIndex="6">
                                                                        <ButtonStyle Width="13px">
                                                                        </ButtonStyle>
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                            </tr>
                                                           <tr>
                                                                <td style="width: 76px">
                                                                    <span style="font-size: x-small;color:Blue">IFS Group</span>
                                                                </td>
                                                                <td style="width: 164px">
                                                                    <asp:TextBox ID="txtIFSGroup" runat="server" TabIndex="7" Width="160px"></asp:TextBox>
                                                                    <asp:HiddenField ID="txtIFSGroup_hidden" runat="server" />
                                                                </td>
                                                                
                                                                <td>
                                                                    <span style="font-size: x-small;color:Blue">Units Issued</span>
                                                                </td>
                                                                <td style="height: 22px">                                                                   
                                                                    <dxe:ASPxTextBox ID="txtUnitsIssued" ClientInstanceName="txtUnitsIssued" runat="server" TabIndex="8" Text="Units Issued"
                                                                        Width="150px">
                                                                        <MaskSettings Mask="<0..9999999999999999999999999g>.<00..9999>" ErrorText="None" IncludeLiterals="DecimalSymbol" />
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                
                                                                <td style="width:70px">
                                                                    <span style="font-size: x-small;color:Blue">Fund Invested</span>
                                                                </td>
                                                                <td style="height: 22px">                                                                    
                                                                    <dxe:ASPxTextBox ID="txtFundInvested" ClientInstanceName="txtFundInvested" runat="server" TabIndex="9"
                                                                        Width="150px">
                                                                        <MaskSettings Mask="<0..99999999999999999999g>.<00..99>" ErrorText="None" IncludeLiterals="DecimalSymbol" />
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <span style="font-size: x-small;color:Blue">Fund Value</span>
                                                                </td>
                                                                <td style="height: 22px">                                                                   
                                                                     <dxe:ASPxTextBox ID="txtFundValue" ClientInstanceName="txtFundValue" runat="server" TabIndex="10"
                                                                        Width="150px">
                                                                        <MaskSettings Mask="<0..99999999999999999999g>.<00..99>" ErrorText="None" IncludeLiterals="DecimalSymbol" />
                                                                     </dxe:ASPxTextBox>
                                                                </td>
                                                                
                                                                <td>
                                                                    <span style="font-size: x-small;color:Blue">Current NAV</span>
                                                                </td>
                                                                <td style="height: 22px">                                                                    
                                                                    <dxe:ASPxTextBox ID="txtCurrentNAV" ClientInstanceName="txtCurrentNAV" runat="server" TabIndex="11"
                                                                        Width="150px">
                                                                        <MaskSettings Mask="<0..999999999999999g>.<00..9999>" ErrorText="None" IncludeLiterals="DecimalSymbol" />
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="TradingEntities">
                                <TabTemplate>
                                    <span style="font-size: x-small">Trading Entities</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="FundManagers">
                                <TabTemplate>
                                    <span style="font-size: x-small">Fund Managers</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                        </TabPages>
                         <ClientSideEvents ActiveTabChanged="function(s, e) {
                                        var activeTab   = page.GetActiveTab();
                                        var Tab1 = page.GetTab(1);
                                        var Tab2 = page.GetTab(2);
                                        
                                       
                                        if(activeTab == Tab1)
                                        {
                                            disp_prompt('tab1');
                                        }
                                        if(activeTab == Tab2)
                                        {
                                            disp_prompt('tab2');
                                        }
                                        }"></ClientSideEvents>
                        <ContentStyle>
                            <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                        </ContentStyle>
                        <LoadingPanelStyle ImageSpacing="6px">
                        </LoadingPanelStyle>
                    </dxtc:ASPxPageControl>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td style="padding-left: 400px;">
                                            <dxe:ASPxButton ID="btnSave" runat="server" Text="Save" Width="80px" ClientInstanceName="cbtnSave" OnClick="btnSave_Click"
                                                ValidationGroup="a" TabIndex="12">
                                            </dxe:ASPxButton>
                                        </td>
                                        <td>
                                            <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" Width="80px" OnClick="btnCancel_Click"
                                                TabIndex="13">
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
