<%@ page language="C#" autoeventwireup="true" inherits="management_Contact_general, App_Web_1jeyysc_" %>

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
    <title>Contact_General</title>
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
    function ContactStatus()
    {
        var comboid=document.getElementById('ASPxPageControl1_cmbContactStatus');
        var comboval=comboid.value;
        if(comboval=='1')
        {
            document.getElementById("TrContact").style.display = 'none';
        }
        else
        {
            document.getElementById("TrContact").style.display = 'inline';
        }
    }
    function disp_prompt(name)
    {
         if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Contact_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Contact_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="Contact_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="Contact_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="Contact_Document.aspx"; 
        }
        else if ( name == "tab12")
        {
        //alert(name);
        document.location.href="Contact_FamilyMembers.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Contact_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Contact_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="Contact_Deposit.aspx"; 
        }
        else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="Contact_Remarks.aspx"; 
        }
         else if ( name == "tab10")
        {
        //alert(name);
        document.location.href="Contact_Education.aspx"; 
        }
        else if ( name == "tab11")
        {
        //alert(name);
        document.location.href="contact_brokerage.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
            document.location.href="contact_other.aspx"; 
        }
        else if(name=="tab13")
        {
             document.location.href="contact_Subscription.aspx";
        }
        //New Work 30-12-2021
        else if(name=="tab14")
        {
             document.location.href="Contact_Nominee.aspx";
        }
        //End of New Work 30-12-2021
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
        
        function legalStatus()
        {
        
         var SID1=document.getElementById("ASPxPageControl1_cmbLegalStatus");
         
            if(SID1.value=='21')
            {
           
            document.getElementById("td_red").style.display ='inline';
                document.getElementById("td_green").style.display ='none';
                document.getElementById("td_one").style.display ='inline';
                document.getElementById("td_two").style.display ='none';
                document.getElementById("td_only").style.display ='none';
                
            
            }
            else if(SID1.value=='2' || SID1.value=='3' || SID1.value=='17' || SID1.value=='18' || SID1.value=='28' || SID1.value=='47' || SID1.value=='48') 
            {
           
             document.getElementById("td_red").style.display ='inline';
                document.getElementById("td_green").style.display ='none';
                document.getElementById("td_one").style.display ='none';
                document.getElementById("td_two").style.display ='inline';
                document.getElementById("td_only").style.display ='none';
            }
            else    
            {
            document.getElementById("td_red").style.display ='none';
                document.getElementById("td_green").style.display ='inline';
                document.getElementById("td_one").style.display ='none';
                document.getElementById("td_two").style.display ='none';
                document.getElementById("td_only").style.display ='inline';
            
            
            
            
            }
            if (SID1.value=='1' || SID1.value=='30' || SID1.value=='31' || SID1.value=='32' || SID1.value=='52' || SID1.value=='29' || SID1.value=='33' || SID1.value=='34' || SID1.value=='54')
            {
              
               
                 document.getElementById("Trincorporation").style.display ='none';
            }
            else
            {
          
                document.getElementById("Trincorporation").style.display ='inline';
             }
        
        
        
        
        }
        function SourceStatus()
        {
            var sourceID=document.getElementById("ASPxPageControl1_cmbSource");
            if(sourceID.value=='21' || sourceID.value=='3' || sourceID.value=='4' || sourceID.value=='8' || sourceID.value=='10' || sourceID.value=='19' || sourceID.value=='20' || sourceID.value=='14' || sourceID.value=='24' || sourceID.value=='25' || sourceID.value=='18')
            {
                document.getElementById("TdRfferedBy").style.display = 'inline';
                document.getElementById("TdRfferedBy1").style.display = 'inline';
            }
            else
            {
                document.getElementById("TdRfferedBy").style.display = 'none';
                document.getElementById("TdRfferedBy1").style.display = 'none';
            }
        }
        function showcountry()
         {
            var countryID=document.getElementById("ASPxPageControl1_ddlnational");
            if (countryID.value=='1')
                document.getElementById("td_country").style.display = 'none';
            else
                document.getElementById("td_country").style.display = 'inline';
         }
          function ProfessionStatus()
         {
            var professionID=document.getElementById("ASPxPageControl1_cmbProfession");
            if (professionID.value=='20')
                document.getElementById("Trprofessionother").style.display = 'inline';
            else
                document.getElementById("Trprofessionother").style.display = 'none';
         }
        function PageLoad()
        {
            var PID=document.getElementById("ASPxPageControl1_cmbProfession");
            if (PID.value=='20')
                document.getElementById("Trprofessionother").style.display = 'inline';
            else
                document.getElementById("Trprofessionother").style.display = 'none';
            var countryID=document.getElementById("ASPxPageControl1_ddlnational");
            if (countryID.value=='1')
                document.getElementById("td_country").style.display = 'none';
            else
                document.getElementById("td_country").style.display = 'inline';
            var ID=document.getElementById("ASPxPageControl1_cmbSource");
            if(ID.value=='21' || ID.value=='3' || ID.value=='4' || ID.value=='8' || ID.value=='10' || ID.value=='19' || ID.value=='20' ||ID.value=='14' ||ID.value=='18')
            {
            
                document.getElementById("TdRfferedBy").style.display = 'inline';
                document.getElementById("TdRfferedBy1").style.display = 'inline';
                
            }
            else
            {
           
                document.getElementById("TdRfferedBy").style.display = 'none';
                document.getElementById("TdRfferedBy1").style.display = 'none';
                
                
                
            }
            var ID1=document.getElementById("ASPxPageControl1_cmbLegalStatus");
            if(ID1.value=='21')
            {
            
            document.getElementById("td_red").style.display ='inline';
                document.getElementById("td_green").style.display ='none';
                document.getElementById("td_one").style.display ='inline';
                document.getElementById("td_two").style.display ='none';
                document.getElementById("td_only").style.display ='none';
                
            
            }
            else if(ID1.value=='2' || ID1.value=='3'  || ID1.value=='17' || ID1.value=='18' || ID1.value=='28' || ID1.value=='47' || ID1.value=='48') 
            {
        
             document.getElementById("td_red").style.display ='inline';
                document.getElementById("td_green").style.display ='none';
                document.getElementById("td_one").style.display ='none';
                document.getElementById("td_two").style.display ='inline';
                document.getElementById("td_only").style.display ='none';
            }
            else    
            {
            document.getElementById("td_red").style.display ='none';
                document.getElementById("td_green").style.display ='inline';
                document.getElementById("td_one").style.display ='none';
                document.getElementById("td_two").style.display ='none';
                document.getElementById("td_only").style.display ='inline';
            
            
            
            
            }
//            if(ID1.value!='1' ||ID1.value!='30' ||ID1.value!='31' ||ID1.value!='32' ||ID1.value!='52' ||ID1.value!='29' ||ID1.value!='33' ||ID1.value!='34' ||ID1.value!='54')
//            {
//            
//                document.getElementById("Trincorporation").style.display ='none';
//            }
//            else
//            {
//          
//                document.getElementById("Trincorporation").style.display ='inline';
//             }
            if (ID1.value=='1' || ID1.value=='30' || ID1.value=='31' || ID1.value=='32' || ID1.value=='52' || ID1.value=='29' || ID1.value=='33' || ID1.value=='34' || ID1.value=='54')
            {
              
               
                 document.getElementById("Trincorporation").style.display ='none';
            }
            else
            {
          
                document.getElementById("Trincorporation").style.display ='inline';
             }
            var comboid=document.getElementById('ASPxPageControl1_cmbContactStatus');
            var comboval=comboid.value;
            if(comboval=='1')
            {
            
                document.getElementById("TrContact").style.display = 'none';
                
            }
            else
            {
            
                document.getElementById("TrContact").style.display = 'inline';
                
            }
            
            
        }
        function FillValues(chk)
        {
           var sel = document.getElementById('ASPxPageControl1_LitSpokenLanguage');
           sel.value=chk;
        }
        function FillValues1(chk)
        {
           var sel = document.getElementById('ASPxPageControl1_LitWrittenLanguage');
           sel.value=chk;
        } 
        function keyVal(obj)
        {
            var objPhEmail=obj.split('~');
            document.getElementById('ASPxPageControl1_txtRPartner_hidden').value=objPhEmail[0];
            document.getElementById('ASPxPageControl1_TxtEmail').value=objPhEmail[1];
            document.getElementById('ASPxPageControl1_TxtPhone').value=objPhEmail[2];
        }
        function popup()
        {
                 alert("Please type prefix of UCC");
                 return false;
        
        }
        function fn_btnValidate()
        {                 
         var txtbox=document.getElementById('<%=txtincorporation.ClientID %>');
         if(document.getElementById('Trincorporation').style.display=='inline')
            {           
             if(txtbox.value=='')
               {
                alert("Please Insert Incorporation Value."); 
                document.getElementById('<%=txtincorporation.ClientID %>').Focus();
               }
            }
        }   
    
    function OnContactInfoClick(keyValue,CompName)
    {
    
        var keyValue=('<%=Session["KeyVal_InternalID"] %>'); 
        var CompName=('<%=Session["name"] %>'); 
        //alert (CompName);
        var url='insurance_contactPerson.aspx?id='+keyValue;
        editwin=dhtmlmodal.open("Editbox", "iframe", url,"Contact Name : "+CompName+"","width=940px,height=450px,center=1,resize=1,top=500", "recal");
       
    }
    
    
              
      function FillUCCCode(chk)
        {
          var sel = document.getElementById('ASPxPageControl1_txtClentUcc_I');
          sel.value=chk;
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
                            <dxtc:TabPage Name="General">
                                <TabTemplate>
                                    <span style="font-size: x-small">General</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                        <table class="TableMain100">
                                            <tr>
                                                <td style="width: 961px">
                                                    <asp:Panel ID="Panel1" runat="server" BorderColor="White" BorderWidth="2px" Width="100%">
                                                        <table class="TableMain100">
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Salutation" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbSalutation" runat="server" TabIndex="1" Width="160px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 70px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="First Name" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; font-size: medium; color: Red; width: 8px;">
                                                                    *
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                    <dxe:ASPxTextBox ID="txtFirstNmae" runat="server" TabIndex="2" Width="160px">
                                                                        <ValidationSettings ValidationGroup="a">
                                                                        </ValidationSettings>
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="width: 68px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Middle Name" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                    <dxe:ASPxTextBox ID="txtMiddleName" runat="server" Width="160px" TabIndex="3">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="width: 61px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Last Name" Font-Size="10px" ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left">
                                                                    <dxe:ASPxTextBox ID="txtLastName" runat="server" TabIndex="4" Width="160px">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="5" style="text-align: right;">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstNmae"
                                                                        Display="Dynamic" ErrorMessage="Must Fill First Name" SetFocusOnError="True"
                                                                        ValidationGroup="a"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td colspan="4" style="text-align: right;">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Short Name (Alias)" Font-Size="10px"
                                                                        Width="61px" ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtAliasName" runat="server" TabIndex="5" Width="160px">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="width: 76px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel12" runat="server" Text="Client Id (UCC)" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; font-size: medium; color: Red; width: 8px;" id="td_star"
                                                                    runat="server">
                                                                    *
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                                    </asp:ScriptManager>
                                                                    <%-- <asp:UpdatePanel ID="UpdatePanel154" runat="server">
                                                                    <ContentTemplate>--%>
                                                                    <dxe:ASPxTextBox ID="txtClentUcc" runat="server" TabIndex="6" Width="160px">
                                                                    </dxe:ASPxTextBox>
                                                                    <%--<a id="A1" href="javascript:void(0);" onclick="popup()">
                                                                                        <span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Check Availability</span></a>
                                                                                        --%>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Style="color: #cc3300;
                                                                        text-decoration: underline; font-size: 8pt;">Make System Generate UCC</asp:LinkButton>
                                                                    <asp:Label ID="lblErr" Text="" runat="server"></asp:Label>
                                                                    <%-- </ContentTemplate>
                                                                    </asp:UpdatePanel>--%>
                                                                    <%--<dxe:ASPxTextBox ID="txtClentUcc" runat="server" TabIndex="6" Width="160px">
                                                                        </dxe:ASPxTextBox>
                                                                         <a id="A1" href="javascript:void(0);" onclick="popup()">
                                                                                        <span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Check Availability</span></a>--%>
                                                                </td>
                                                                <td style="width: 68px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel13" runat="server" Text="Source" Font-Size="10px" ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                    <asp:DropDownList ID="cmbSource" runat="server" TabIndex="7" Width="160px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td id="TdRfferedBy" style="width: 61px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel17" runat="server" Text="Refered By" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td id="TdRfferedBy1" style="text-align: left;">
                                                                    <asp:TextBox ID="txtReferedBy" runat="server" TabIndex="8" Width="160px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel14" runat="server" Text="Gender" Font-Size="10px" ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbGender" runat="server" TabIndex="9" Width="160px">
                                                                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                                                                        <asp:ListItem Value="0">Male</asp:ListItem>
                                                                        <asp:ListItem Value="1">Female</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 76px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel18" runat="server" Text="D.O.B." Font-Size="10px" ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; font-size: medium; color: Green; width: 8px;">
                                                                    *
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                    <dxe:ASPxDateEdit ID="txtDOB" runat="server" Width="156px" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                                                        UseMaskBehavior="True" TabIndex="10">
                                                                        <ButtonStyle Width="13px">
                                                                        </ButtonStyle>
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                                <td style="width: 68px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel16" runat="server" Text="Marital Status" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                    <asp:DropDownList ID="cmbMaritalStatus" runat="server" TabIndex="11" Width="160px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 61px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel21" runat="server" Text="Anniversary Date" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxDateEdit ID="txtAnniversary" runat="server" Width="156px" EditFormat="Custom"
                                                                        EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" TabIndex="12">
                                                                        <ButtonStyle Width="13px">
                                                                        </ButtonStyle>
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="Profession" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbProfession" runat="server" TabIndex="13" Width="160px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 76px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel9" runat="server" Text="Designation" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; font-size: medium; color: Red; width: 8px;">
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                    <asp:DropDownList ID="cmbDesignation" runat="server" TabIndex="14" Width="160px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 68px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel8" runat="server" Text="Job Responsibility" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                    <asp:DropDownList ID="cmbJobResponsibility" runat="server" TabIndex="15" Width="160px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 61px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel7" runat="server" Text="Organization" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left">
                                                                    <dxe:ASPxTextBox ID="txtOrganization" runat="server" TabIndex="16" Width="160px">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr id="Trprofessionother">
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel31" runat="server" Text="Other Detail" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="width: 76px">
                                                                    <asp:TextBox ID="txtotheroccu" runat="server" Width="160px"></asp:TextBox>
                                                                </td>
                                                                <td style="text-align: left; font-size: medium; color: Green; width: 4px;">
                                                                    *
                                                                </td>
                                                                <td style="text-align: left; font-size: medium; color: Red; width: 8px;">
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                </td>
                                                                <td style="width: 68px">
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                </td>
                                                                <td style="width: 61px">
                                                                </td>
                                                                <td style="text-align: left">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel22" runat="server" Text="Education" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbEducation" runat="server" TabIndex="17" Width="160px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 76px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel11" runat="server" Text="Industry/Sector" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; font-size: medium; color: Red; width: 8px;">
                                                                </td>
                                                                <td style="width: 164px">
                                                                    <asp:DropDownList ID="cmbIndustry" runat="server" TabIndex="18" Width="160px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 68px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel23" runat="server" Text="Date Of Regn/Intr" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                    <dxe:ASPxDateEdit ID="txtDateRegis" runat="server" Width="156px" EditFormat="Custom"
                                                                        EditFormatString="dd MM yyyy" UseMaskBehavior="True" TabIndex="19">
                                                                        <ButtonStyle Width="13px">
                                                                        </ButtonStyle>
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                                <td style="width: 61px" valign="top">
                                                                    <dxe:ASPxLabel ID="ASPxLabel28" runat="server" Text="Blood Group" Font-Size="10px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="cmbBloodgroup" runat="server" Width="85px" TabIndex="20">
                                                                        <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                                                        <asp:ListItem Value="A+">A+</asp:ListItem>
                                                                        <asp:ListItem Value="A-">A-</asp:ListItem>
                                                                        <asp:ListItem Value="B+">B+</asp:ListItem>
                                                                        <asp:ListItem Value="B-">B-</asp:ListItem>
                                                                        <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                                                        <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                                                        <asp:ListItem Value="O+">O+</asp:ListItem>
                                                                        <asp:ListItem Value="O-">O-</asp:ListItem>
                                                                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                                                    </asp:DropDownList><br />
                                                                    <asp:Label ID="l1" runat="server" Text="Allow web logIn" ForeColor="Blue"></asp:Label>
                                                                    <asp:CheckBox ID="chkAllow" runat="server" TabIndex="21" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 961px">
                                                    <table class="TableMain100">
                                                        <tr>
                                                            <td style="width: 64px">
                                                                <dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="Branch" Width="59px" Font-Size="10px"
                                                                    ForeColor="Blue">
                                                                </dxe:ASPxLabel>
                                                            </td>
                                                            <td style="width: 250px">
                                                                <asp:DropDownList ID="cmbBranch" runat="server" Width="250px" TabIndex="22" Font-Size="10px">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="width: 76px">
                                                                <dxe:ASPxLabel ID="ASPxLabel24" runat="server" Text="SPOC" Font-Size="10px" ForeColor="Blue">
                                                                </dxe:ASPxLabel>
                                                            </td>
                                                            <td style="text-align: left; font-size: medium; color: Red; width: 4px;">
                                                            </td>
                                                            <td style="width: 164px">
                                                                <asp:TextBox ID="txtRPartner" runat="server" TabIndex="23" Width="160px"></asp:TextBox>
                                                            </td>
                                                            <td style="width: 68px">
                                                                <dxe:ASPxLabel ID="ASPxLabel25" runat="server" Text="SPOC Email" Font-Size="10px"
                                                                    ForeColor="Blue">
                                                                </dxe:ASPxLabel>
                                                            </td>
                                                            <td style="text-align: left; font-size: medium; color: Red; width: 8px;">
                                                            </td>
                                                            <td style="width: 166px">
                                                                <asp:TextBox ID="TxtEmail" runat="server" Width="130px" TabIndex="24"></asp:TextBox></td>
                                                            <td style="width: 61px">
                                                                <dxe:ASPxLabel ID="ASPxLabel26" runat="server" Text="SPOC Phone" Font-Size="10px"
                                                                    ForeColor="Blue">
                                                                </dxe:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="TxtPhone" runat="server" Width="130px" TabIndex="25"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 64px">
                                                                <dxe:ASPxLabel ID="ASPxLabel15" runat="server" Text="Rating" Font-Size="10px" ForeColor="Blue">
                                                                </dxe:ASPxLabel>
                                                            </td>
                                                            <td style="width: 163px">
                                                                <asp:DropDownList ID="cmbRating" runat="server" Width="160px" TabIndex="26">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="width: 76px">
                                                                <dxe:ASPxLabel ID="ASPxLabel19" runat="server" Text="Contact Status" Font-Size="10px"
                                                                    ForeColor="Blue">
                                                                </dxe:ASPxLabel>
                                                            </td>
                                                            <td style="text-align: left; font-size: medium; color: Red; width: 4px;">
                                                                *
                                                            </td>
                                                            <td style="width: 164px">
                                                                <asp:DropDownList ID="cmbContactStatus" runat="server" Width="160px" TabIndex="27">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="width: 76px">
                                                                <dxe:ASPxLabel ID="ASPxLabel20" runat="server" Text="Legal Status/Category" Font-Size="10px"
                                                                    ForeColor="Blue">
                                                                </dxe:ASPxLabel>
                                                            </td>
                                                            <td style="text-align: left; font-size: medium; color: Red; width: 4px;">
                                                                *
                                                            </td>
                                                            <td colspan="4">
                                                                <asp:DropDownList ID="cmbLegalStatus" runat="server" Width="220px" TabIndex="28">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr id="TrContact">
                                                            <td>
                                                                <dxe:ASPxLabel ID="ASPxLabel27" runat="server" Text="Reason" Font-Size="10px" ForeColor="Blue">
                                                                </dxe:ASPxLabel>
                                                            </td>
                                                            <td style="text-align: left;" colspan="3">
                                                                <asp:TextBox ID="TxtContactStatus" runat="server" TextMode="MultiLine" Width="404px"
                                                                    TabIndex="29"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr style="height: 10px;">
                                                        </tr>
                                                        <tr id="tr_contactperson">
                                                            <td colspan="6">
                                                            </td>
                                                            <td id="td_green" style="text-align: left; font-size: medium; color: Green; width: 8px;">
                                                                *
                                                            </td>
                                                            <td id="td_red" style="text-align: left; font-size: medium; color: Red; width: 8px;">
                                                                *
                                                            </td>
                                                            <td id="td_only">
                                                                <a href="javascript:void(0);" style="color: Blue; text-decoration: underline; font-size: small"
                                                                    onclick="OnContactInfoClick('<%#Eval("InternalId") %>')">Add Contact Person</a>
                                                            </td>
                                                            <td id="td_one">
                                                                <a href="javascript:void(0);" style="color: Blue; text-decoration: underline; font-size: small"
                                                                    onclick="OnContactInfoClick('<%#Eval("InternalId") %>')">Add 1 Contact Person</a>
                                                            </td>
                                                            <td id="td_two">
                                                                <a href="javascript:void(0);" style="color: Blue; text-decoration: underline; font-size: small"
                                                                    onclick="OnContactInfoClick('<%#Eval("InternalId") %>')">Add 3 Contact Persons</a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tr id="Trincorporation">
                                                            <td>
                                                                <dxe:ASPxLabel ID="ASPxLabel29" runat="server" Text="Place Of Incorporation" Font-Size="10px"
                                                                    ForeColor="Blue">
                                                                </dxe:ASPxLabel>
                                                            </td>
                                                            <td style="text-align: left; font-size: medium; color: Red; width: 8px;">
                                                                *
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox ID="txtincorporation" runat="server" Width="300px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <dxe:ASPxLabel ID="ASPxLabel30" runat="server" Text="Date of commencement of business"
                                                                    Font-Size="10px" ForeColor="Blue">
                                                                </dxe:ASPxLabel>
                                                            </td>
                                                            <td style="text-align: left; font-size: medium; color: Red; width: 8px;">
                                                                *
                                                            </td>
                                                            <%--<td style="text-align: left;" colspan="3">
                                                                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="404px"
                                                                    TabIndex="29"></asp:TextBox>
                                                            </td>--%>
                                                            <td style="text-align: left; width: 164px;">
                                                                <dxe:ASPxDateEdit ID="txtFromDate" EditFormatString="dd-MM-yyyy" runat="server" EditFormat="Custom" Width="105px"
                                                                    UseMaskBehavior="True" DateOnError="Today">
                                                                    <ButtonStyle Width="13px">
                                                                    </ButtonStyle>
                                                                    <%--<DropDownButton Text="From">
                                                                    </DropDownButton>--%>
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <dxe:ASPxLabel ID="ASPxLabel32" runat="server" Text="Nationality" Font-Size="10px"
                                                                    ForeColor="Blue">
                                                                </dxe:ASPxLabel>
                                                            </td>
                                                            <td>
                                                            &nbsp;&nbsp;
                                                                <asp:DropDownList ID="ddlnational" runat="server" Width="85px" >
                                                                    <asp:ListItem Value="1">Indian</asp:ListItem>
                                                                    <asp:ListItem Value="2">Others</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="text-align: left;" id="td_country">
                                                                <asp:TextBox ID="txtcountry" runat="server"  Width="300px"
                                                                    TabIndex="29"></asp:TextBox>
                                                                    
                                                            </td>
                                                            <%--New Work 09/10/2022--%>
                                                            <td style="width: 164px;">
                                                                <dxe:ASPxLabel ID="ASPxLabel34" runat="server" Text="  Running Account Settlement Modes" Font-Size="10px"
                                                                    ForeColor="Blue">
                                                                </dxe:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                &nbsp;&nbsp;
                                                                    <asp:DropDownList ID="ddlRunAcSettlementMode" runat="server" Width="85px" >
                                                                        <asp:ListItem Value="Q">Quarterly</asp:ListItem>
                                                                        <asp:ListItem Value="M">Monthly</asp:ListItem>
                                                                        <asp:ListItem Value="B">BillToBill</asp:ListItem>
                                                                    </asp:DropDownList>
                                                            </td>
                                                            <%--End of New Work 09/10/2022--%>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr id="TrLang" runat="server">
                                                <td id="Td1" runat="server" style="width: 961px">
                                                    <asp:Panel ID="Panel2" runat="server" Width="100%" BorderColor="White" BorderWidth="1px">
                                                        <table class="TableMain100">
                                                            <tr>
                                                                <td>
                                                                    <table class="TableMain100">
                                                                        <tr>
                                                                            <td colspan="2" style="text-align: left">
                                                                                <span style="color: blue; font-size: 10pt;">Language Proficiencies </span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 50%; vertical-align: top">
                                                                                <asp:Panel ID="PnlSpLAng" runat="server" Width="100%" BorderColor="White" BorderWidth="1px">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td style="text-align: left; color: Blue; font-size: small">
                                                                                                Can Speak
                                                                                            </td>
                                                                                            <td style="vertical-align: top" class="gridcellleft">
                                                                                                <asp:TextBox ID="LitSpokenLanguage" runat="server" ForeColor="Maroon" BackColor="Transparent"
                                                                                                    BorderStyle="None" Width="309px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: left; vertical-align: top; font-size: x-small; color: Red;">
                                                                                                <a href="frmLanguages.aspx?id=''&status=speak" onclick="window.open(this.href,'popupwindow','left=120,top=170,height=400,width=200,scrollbars=no,toolbar=no,location=center,menubar=no'); return false;"
                                                                                                    style="font-size: x-small; color: Red;">click to add</a>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </asp:Panel>
                                                                            </td>
                                                                            <td style="width: 50%; vertical-align: top">
                                                                                <asp:Panel ID="PnlWrLang" runat="server" Width="100%" BorderColor="White" BorderWidth="1px">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td style="text-align: left; color: Blue; font-size: small">
                                                                                                Can Write
                                                                                            </td>
                                                                                            <td style="vertical-align: top" class="gridcellleft">
                                                                                                <asp:TextBox ID="LitWrittenLanguage" runat="server" ForeColor="Maroon" BackColor="Transparent"
                                                                                                    BorderStyle="None" Width="313px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: left; vertical-align: top; font-size: x-small; color: Red;">
                                                                                                <a href="frmLanguages.aspx?id=''&status=write" onclick="window.open(this.href,'popupwindow','left=120,top=170,height=400,width=200,scrollbars=no,toolbar=no,location=center,menubar=no'); return false;"
                                                                                                    style="color: Red; font-size: x-small;">click to add</a>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </asp:Panel>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                    <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="display: none;">
                                                    <asp:TextBox ID="txtRPartner_hidden" runat="server" BackColor="White" BorderColor="White"
                                                        BorderStyle="None" ForeColor="White"></asp:TextBox>
                                                    <asp:TextBox ID="txtReferedBy_hidden" runat="server" BackColor="White" BorderColor="White"
                                                        BorderStyle="None" ForeColor="White"></asp:TextBox>
                                                        <asp:TextBox ID="txtcountry_hidden" runat="server" BackColor="#DDECFE" ></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="CorresPondence">
                                <TabTemplate>
                                    <span style="font-size: x-small">CorresPondence</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="BankDetails">
                                <TabTemplate>
                                    <span style="font-size: x-small">Bank</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="DPDetails">
                                <TabTemplate>
                                    <span style="font-size: x-small">DP</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Documents">
                                <TabTemplate>
                                    <span style="font-size: x-small">Documents</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Registration">
                                <TabTemplate>
                                    <span style="font-size: x-small">Registration</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Other">
                                <TabTemplate>
                                    <span style="font-size: x-small">Other</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="GroupMember" Text="Group">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Deposit" Text="Deposit">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Remarks" Text="Remarks">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Education" Text="Education">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Trad. Prof." Text="Trad.Prof">
                                <%--<TabTemplate ><span style="font-size:x-small">Trad.Prof</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>--%>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="FamilyMembers" Text="Family">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Subscription" Text="Subscription">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <%--New Work 30-12-2021--%>
                            <dxtc:TabPage Name="Nominee">
                                <TabTemplate>
                                    <span style="font-size: x-small;color:Blue;font-weight:bold">Nominee</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <%--End of New Work 30-12-2021--%>
                        </TabPages>
                        <%--New work Contact_Nominee(Tab14) added 30-12-2021--%>
                        <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            var Tab2 = page.GetTab(2);
	                                            var Tab3 = page.GetTab(3);
	                                            var Tab4 = page.GetTab(4);
	                                            var Tab5 = page.GetTab(5);
	                                            var Tab6 = page.GetTab(6);
	                                            var Tab7 = page.GetTab(7);
	                                            var Tab8 = page.GetTab(8);
	                                            var Tab9 = page.GetTab(9);
	                                            var Tab10 = page.GetTab(10);
	                                            var Tab11 = page.GetTab(11);
	                                            var Tab12 = page.GetTab(12);
	                                            var Tab13=page.GetTab(13);
	                                            var Tab14=page.GetTab(14);
	                                            
	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                            if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
	                                            }
	                                            else if(activeTab == Tab2)
	                                            {
	                                                disp_prompt('tab2');
	                                            }
	                                            else if(activeTab == Tab3)
	                                            {
	                                                disp_prompt('tab3');
	                                            }
	                                            else if(activeTab == Tab4)
	                                            {
	                                                disp_prompt('tab4');
	                                            }
	                                            else if(activeTab == Tab5)
	                                            {
	                                                disp_prompt('tab5');
	                                            }
	                                            else if(activeTab == Tab6)
	                                            {
	                                                disp_prompt('tab6');
	                                            }
	                                            else if(activeTab == Tab7)
	                                            {
	                                                disp_prompt('tab7');
	                                            }
	                                            else if(activeTab == Tab8)
	                                            {
	                                                disp_prompt('tab8');
	                                            }
	                                            else if(activeTab == Tab9)
	                                            {
	                                                disp_prompt('tab9');
	                                            }
	                                            else if(activeTab == Tab10)
	                                            {
	                                                disp_prompt('tab10');
	                                            }
	                                            else if(activeTab == Tab11)
	                                            {
	                                                disp_prompt('tab11');
	                                            }
	                                            else if(activeTab == Tab12)
	                                            {
	                                                disp_prompt('tab12');
	                                            }
	                                            else if(activeTab == Tab13)
	                                            {
	                                               disp_prompt('tab13');
	                                            }
	                                            else if(activeTab == Tab14)
	                                            {
	                                               disp_prompt('tab14');
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
                            <td style="text-align: left; font-size: small; color: Red;">
                                * Denotes Mandatory Field (As per NSE and BSE)
                            </td>
                            <%--<td align="center" style="text-align: ">
                                    <asp:HiddenField ID="hdReferenceBy" runat="server" />
                                    <table >
                                        <tr>
                                        
                                            <td style="padding-right:20px;">
                                                <dxe:ASPxButton ID="btnSave" runat="server" Text="Save" width="80px"  OnClick="btnSave_Click" ValidationGroup="a"
                                                    TabIndex="30">
                                                </dxe:ASPxButton>
                                            </td>
                                            
                                            <td >
                                                <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" width="80px" OnClick="btnCancel_Click" 
                                                    TabIndex="24">
                                                </dxe:ASPxButton>
                                            </td>
                                    
                                        </tr>
                                    </table>
                                   
                                </td>--%>
                        </tr>
                        <tr>
                            <td style="text-align: left; font-size: small; color: Green;">
                                * Denotes Optional Field (As per NSE and BSE)
                            </td>
                            <td>
                                <asp:HiddenField ID="hdReferenceBy" runat="server" />
                                <table>
                                    <tr>
                                        <td style="padding-right: 20px;">
                                            <dxe:ASPxButton ID="btnSave" runat="server" Text="Save" Width="80px" ClientInstanceName="cbtnSave" OnClick="btnSave_Click"
                                                ValidationGroup="a" TabIndex="30">
                                                 <ClientSideEvents Click="function (s, e) {fn_btnValidate();}" />
                                            </dxe:ASPxButton>
                                        </td>
                                        <td>
                                            <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" Width="80px" OnClick="btnCancel_Click"
                                                TabIndex="24">
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
