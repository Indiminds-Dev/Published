<%@ page language="C#" autoeventwireup="true" inherits="management_Contact_BankDetails, App_Web_kqhq1k1d" %>
     <script type="text/javascript" language="javascript">
         var v='0';
          function RefreshPage()
            {
              setTimeout(RefreshWork(),3000);
             //RefreshWork();
            }
            function RefreshWork()
            {            
              alert('Data Updated Successfully');
              document.location.href="Contact_BankDetails.aspx";
            }
            //New Work
            function RefreshPageEdit()
            {
              setTimeout(RefreshEditWork(),3000);
            }
            function RefreshEditWork()
            {
              var WhichRights = document.getElementById('hdnRights').value;
              if(WhichRights !="F")
              {
                alert("You have no Rights to Update data.");
              }
              else
              {
                alert('Data Updated Successfully');
              }
              document.location.href="Contact_BankDetails.aspx";
            }
             //End of New Work
            function OldState()
            {
              document.location.href="Contact_BankDetails.aspx";
            }
     </script>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Bank Details</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
      <script language="javascript" type="text/javascript">
        
      </script>
    <script language="javascript" type="text/javascript">
function SignOff()
    {
    window.parent.SignOff()
    }
    
  
  
    function UpdateEdits()
    {
     //  alert("xx");
       ExtraFields();
        gridBank.PerformCallback('updateExtra');
    }
       function callAjax(obj,obj1,obj2,obj3)
        {
            var o = document.getElementById("SearchCombo")
            ajax_showOptions(obj,obj1,obj2,o.value)
        } 
       function chkAct(str12,str)
        {
            var str = document.getElementById(str)
            str.value = str12;
        } 
        
    function validate(key)
    {
        //getting key code of pressed key
        var keycode = (key.which) ? key.which : key.keyCode;
        var phn = document.getElementById('txtPhn');
        //comparing pressed keycodes
        if (!(keycode==8 || keycode==46)&&(keycode < 48 || keycode > 57))
        {
        return false;
        }
        else
        {
        //Condition to check textbox contains ten numbers or not
        if (phn.value.length <10)
        {
        return true;
        }
        else
        {
        return false;
        }
        }
    }      
        
    function disp_prompt(name)
    {
        //var ID = document.getElementById(txtID);
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
        //document.location.href="Employee_BankDetails.aspx"; 
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
        var obj4='';
        //alert(valuse);
        if(valuse==0)
            obj4='bnk_bankName';
        if(valuse==1)
            obj4='bnk_Micrno';
        if(valuse==2)
            obj4='bnk_branchName';
        //alert(obj4);
        //ajax_showOptions(obj1,obj2,obj3,obj4);
        //New Work
        ajax_showOptions(obj1,obj2,obj3,obj4);
        //End of New Work
    }
    function setvaluetovariable(obj1)
    {
        valuse=obj1;
    }
    valuse='0';
    FieldName='ASPxPageControl1_txtequity';
    
    function DeleteRow(keyValue)
    {
    //New Work
      var WhichRights = document.getElementById('hdnRights').value;
      if(WhichRights !="F")
      {
        alert("You have no Rights to Delete.");
      }
      else
      {
      //End of New Work
         doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   gridBank.PerformCallback('Delete~'+keyValue);
                   height();
                }
            else{
                  
                }
      //New Work
        }
      //End of New Work  
    }
    function Emailcheck(obj,obj2)
     {
      // alert("a");
      //New Work
//      var WhichRights = document.getElementById('hdnRights').value;
//      if(WhichRights !="F")
//      {
//        alert("You have no Rights to Edit.");
//      }
//      else
//      {
      //End of New Work
        if(obj =='N')
        {
            if(obj !='B')
             {  
            alert("Transactions exists for this Bank Account... Deletion disallowed!!");   
            obj='B';     
            }
        }
        
         if(obj2 !='Y')
        {
       
               INR =confirm('Warning!!.\n\nThis Bank and Account Number already assigned to  '+ obj2 +'.\n\nClick OK to Accept,Otherwise Click Cancel');
                   if(INR)
                  {
              
                                    
                                     WAR2 =confirm('Warning!!.\n\nThis Bank and Account Number already assigned to  '+ obj2 +'.\n\nClick OK to Accept,Otherwise Click Cancel');
                                       if(WAR2)
                                      {
                                                                          
                                                                          
                                                                  WAR3 =confirm('Warning!!.\n\nThis Bank and Account Number already assigned to  '+ obj2 +'.\n\nClick OK to Accept,Otherwise Click Cancel');
                                                                 if(WAR3)
                                                                  {
                                                                   alert('Your Bank and Account Number has been accepted.')
                                                                                    
                                                                   }
                                                                   else
                                                                   {
                                                                    obj='DeleteCurrentID';
                                                                    gridBank.PerformCallback(obj);
                                                                   }  
                                       }
                                       else
                                       {
                                        obj='DeleteCurrentID';
                                        gridBank.PerformCallback(obj);
                                       }
                                    
                                    
                   }
                   else
                   {
                    obj='DeleteCurrentID';
                    gridBank.PerformCallback(obj);
                   }
        }
     //New Work
//     }
     //End of New Work
     }
     
     
           function MaskMoney(evt) 
    {
    if (!(evt.keyCode == 46 || (evt.keyCode >= 48 && evt.keyCode <= 57))) return false;
    var parts = evt.srcElement.value.split('.');
    if (parts.length > 2) return false;
    if (evt.keyCode == 46) return (parts.length == 1);
    if (parts[0].length >= 14) return false;
    if (parts.length == 2 && parts[1].length >= 2) return false;
    }
    
    
     //----------Update Status 
     
     
     function btnSave_Click()
    {  
        //  alert("555");
           var obj='SaveOld~'+RowID;
           popPanel.PerformCallback(obj);
        
    }
    
    function OnAddEditClick(e,obj)
    {     
      var data=obj.split('~');
      //New Work
      var WhichRights = document.getElementById('hdnRights').value;
      if(WhichRights !="F")
      {
        alert("You have no Rights to Edit.");
      }
      else
      {
      //End of New Work
        if(data.length>1)
            RowID=data[1];
        popup.Show();
        popPanel.PerformCallback(obj);
      //New Work
      }
      //End of New Work
    }
   function EndCallBack(obj)
    {
       //alert("test");
        if(obj=='Y')
        {
         popup.Hide();        
         alert("Successfully Update!..");  
          gridBank.PerformCallback('GridBind'); 
                
        }

     
    }
     function btnCancel_Click()
    {
        popup.Hide();
    }
    function IsPOA()
    {
      try{
       
        document.getElementById("hdnIsPOA").value= document.getElementById("ASPxPageControl1_ASPxPageControl2_BankDetailsGrid_efnew_ddlPOA").value ;
        }
        catch(err) {
            // document.getElementById("hdnIsPOA").value= document.getElementById("ASPxPageControl1_ASPxPageControl2_BankDetailsGrid_ef0_ddlPOA").value ;
                 // alert(err.message+"yyy");
                 }
    }
    function ExtraFields()
    {
       //  alert("1a");
       
        try 
        {
         //alert("1");
        // alert(document.getElementById("ASPxPageControl1_ASPxPageControl2_BankDetailsGrid_efnew_txtPOA").value) ;
         // alert(document.getElementById("ASPxPageControl1_ASPxPageControl2_BankDetailsGrid_efnew_ddlPOA").value) ;
         
        // document.getElementById("hdnPOA").value=document.getElementById("ASPxPageControl1_ASPxPageControl2_BankDetailsGrid_efnew_txtPOA").value;
       
       }
      catch(err) {
                   document.getElementById("hdnPOA").value=document.getElementById("ASPxPageControl1_ASPxPageControl2_BankDetailsGrid_ef0_txtPOA").value;
                //  alert(err.message+"xxx");
                 }
                   IsPOA();
                // alert(document.getElementById("hdnPOA").value);
    }
//    function setInitialValues()
//    {
//        try 
//        {
//              document.getElementById("hdnPOA").value="";
//             document.getElementById("hdnIsPOA").value=""; 
//        }
//         catch(err) {
//                   alert(err.message);
//                 }
//    }
      function keyVal(obj)
        {
          //alert(obj);
        }
     
    </script>

    <!--___________________These files are for List Items__________________________-->
    <link href="../CSS/style.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* width of box */
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
    <%--<script language="javascript" src="../JSFUNCTION/ajax-dynamic-list.js" type="text/javascript"></script>--%>
    <form id="form1" runat="server" >
        <div>
            <asp:ScriptManager runat="server" ID="ScriptManager1">
            </asp:ScriptManager>
            <table width="100%">
                <tr>
                    <td class="EHEADER" style="text-align: center">
                        <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="TableMain100">
                <tr>
                    <td>
                      
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="2" ClientInstanceName="page">
                            <TabPages>
                                <dxtc:TabPage Name="General">
                                    <TabTemplate>
                                        <span style="font-size: x-small">General</span>&nbsp;<span style="color: Red;">*</span>
                                    </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
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
                                <dxtc:TabPage Name="Bank">
                                    <TabTemplate>
                                        <span style="font-size: x-small">Bank</span>&nbsp;<span style="color: Red;">*</span>
                                    </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <dxtc:ASPxPageControl runat="server" width="929px" ActiveTabIndex="0" ID="ASPxPageControl2"
                                                ClientInstanceName="page">
                                                <tabpages>
<dxtc:TabPage Name="Bank"><TabTemplate>
<span style="font-size:x-small">BankDetails</span>&nbsp;<span style="color:Red;">*</span> 
</TabTemplate>
<ContentCollection>
<dxw:ContentControl runat="server"><asp:Label runat="server" Font-Bold="True" ForeColor="Red" ID="lblmessage" __designer:wfdid="w39"></asp:Label>

 <dxwgv:ASPxGridView runat="server" ClientInstanceName="gridBank" KeyFieldName="Id" AutoGenerateColumns="False" DataSourceID="BankDetails" Width="95%" Font-Size="10px" ID="BankDetailsGrid" __designer:wfdid="w40" OnRowUpdated="BankDetailsGrid_RowUpdated1" OnRowDeleting="BankDetailsGrid_RowDeleting" OnCustomJSProperties="BankDetailsGrid_CustomJSProperties" OnCustomCallback="BankDetailsGrid_CustomCallback" OnHtmlEditFormCreated="BankDetailsGrid_HtmlEditFormCreated" OnRowInserting="BankDetailsGrid_RowInserting" OnRowValidating="BankDetailsGrid_RowValidating" OnRowUpdating="BankDetailsGrid_RowUpdating" OnRowDeleted="BankDetailsGrid_RowDeleted" OnRowInserted="BankDetailsGrid_RowInserted" OnPreRender="BankDetailsGrid_PreRender" OnUnload="BankDetailsGrid_Unload">
<ClientSideEvents EndCallback="function(s, e) {
Emailcheck(s.cpHeight,s.cpWidth);
}"></ClientSideEvents>
<Columns>
<dxwgv:GridViewDataTextColumn FieldName="Id" Caption="Type" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False" Caption="ID"></EditFormSettings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Category" Caption="Category" VisibleIndex="0">
<EditFormSettings Visible="False" Caption="Category"></EditFormSettings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="AccountType" Caption="AccountType" VisibleIndex="1">
<EditFormSettings Visible="False" Caption="AccountType"></EditFormSettings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BankName" Caption="BankName" VisibleIndex="2">
<EditFormSettings Visible="False" Caption="BankName"></EditFormSettings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Branch" Caption="Branch" VisibleIndex="3">
<EditFormSettings Visible="False" Caption="Branch"></EditFormSettings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="MICR" Caption="MICR" VisibleIndex="4">
<EditFormSettings Visible="False" Caption="MICR"></EditFormSettings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="IFSCcode" Caption="IFSC Code" VisibleIndex="5">
<EditFormSettings Visible="False" Caption="MICR"></EditFormSettings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="Category" Caption="Category" Visible="False" VisibleIndex="0">
<PropertiesComboBox ValueType="System.String"></PropertiesComboBox>

<EditFormSettings Visible="True"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="AccountType" Caption="Account Type" Visible="False" VisibleIndex="0">
<PropertiesComboBox ValueType="System.String"></PropertiesComboBox>

<EditFormSettings Visible="True"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataTextColumn FieldName="AccountNumber" Caption="AccountNumber" VisibleIndex="6">
<EditFormSettings Visible="True" Caption="AccountNumber"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="AccountName" Caption="AccountName" VisibleIndex="7">
<EditFormSettings Visible="True" Caption="AccountName"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="IsPOA" Caption="POA" VisibleIndex="8">
<EditFormSettings Visible="True" Caption="POA"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>


<%----------------------------------------------------------------------------------%>


<dxwgv:GridViewDataTextColumn FieldName="POADate" Caption="POADate" VisibleIndex="9">
<EditFormSettings Visible="True" Caption="POADate"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>


<%--------------------------------------------------------------------------------%>

<dxwgv:GridViewDataTextColumn FieldName="POAName" Caption="POA Name" VisibleIndex="10">
<EditFormSettings Visible="True" Caption="POA Name"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BankName" Caption="BankName" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="True" Caption="BankName"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="status" VisibleIndex="11">
<EditFormSettings Visible="False"></EditFormSettings>
<DataItemTemplate>
                                                        <a href="javascript:void(0);" onclick="OnAddEditClick(this,'Edit~'+'<%# Container.KeyValue %>')">                                                            
                                                            <dxe:ASPxLabel ID="ASPxTextBox2"   runat="server"   Text='<%# Eval("status")%>' Width="100%" ToolTip="Click to Change Status">
                                                </dxe:ASPxLabel>
                                                            
                                                            </a>
                                                    
</DataItemTemplate>

<HeaderStyle Wrap="False"></HeaderStyle>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
                                                      Status                                                         
                                                    
</HeaderTemplate>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="12">
<EditButton Visible="True"></EditButton>
<HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="gridBank.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                        
</HeaderTemplate>
</dxwgv:GridViewCommandColumn>
<dxwgv:GridViewDataTextColumn Width="60px" Caption="Details" VisibleIndex="13">
<EditFormSettings Visible="False"></EditFormSettings>
<DataItemTemplate>
    <a href="javascript:void(0);"  onclick="DeleteRow('<%# Container.KeyValue %>')">
                                                            Delete</a>                                                   
</DataItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
         <span style="color: #000099;text-decoration: underline">Delete</span>
                                                    
</HeaderTemplate>
</dxwgv:GridViewDataTextColumn>
</Columns>

<SettingsBehavior ConfirmDelete="True"></SettingsBehavior>

<SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>

<SettingsEditing PopupEditFormWidth="600px" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormModal="True" EditFormColumnCount="1"></SettingsEditing>

<Settings ShowTitlePanel="True" ShowStatusBar="Visible"></Settings>

<SettingsText ConfirmDelete="Are You Want To Delete This Record ???" PopupEditFormCaption="Add/Modify Bank Details"></SettingsText>

<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="EHEADER"></Header>

<AlternatingRow BackColor="AliceBlue" Font-Bold="True"></AlternatingRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>

<Templates><TitlePanel>
<span style="color :Maroon;font-size :12px"> Bank Details</span>
                                                       
                                                    
</TitlePanel>
<EditForm>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="text-align: center;">
                                                                    <table>
                                                                        <tr>
                                                                            <td class="lt">
                                                                                Category:</td>
                                                                            <td class="lt" colspan="2">
                                                                                <dxe:ASPxComboBox ID="drpCategory" runat="server" ValueType="System.String" width="203px"
                                                                                    Value='<%#Bind("Category") %>' SelectedIndex="0">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="Default" Value="Default" />
                                                                                        <dxe:ListEditItem Text="Secondary" Value="Secondary" />
                                                                                    </Items>
                                                                                    <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                                                                        <RequiredField IsRequired="True" ErrorText="Select category" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxComboBox>
                                                                                  <asp:Label ID="lblCategoryErrorMsg" runat="server"  Text="Default Category already exists" ForeColor="red" Visible="false" ></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="lt">
                                                                                Account Type:</td>
                                                                            <td class="lt" colspan="2">
                                                                                <dxe:ASPxComboBox ID="drpAccountType" runat="server" ValueType="System.String" Value='<%#Bind("AccountType") %>'
                                                                                    width="203px" SelectedIndex="0">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="Saving" Value="Saving"  />
                                                                                        <dxe:ListEditItem Text="Current" Value="Current" />
                                                                                        <dxe:ListEditItem Text="Joint" Value="Joint" />
                                                                                    </Items>
                                                                                    <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                                                                        <RequiredField IsRequired="True" ErrorText="Select Account Type" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxComboBox>
                                                                               <%--  <asp:Label ID="lblAcTypeErrorMsg" runat="server" ></asp:Label>--%>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="lt">
                                                                                Bank Names:</td>
                                                                            <td class="lt">
                                                                           
                                                                                <asp:TextBox ID="txtbankname" runat="server" width="200px" Text='<%#Bind("BankName1") %>'></asp:TextBox>
                                                                               <%-- <asp:TextBox ID="txtbankname_hidden" runat="server" Visible="false"></asp:TextBox>--%>
                                                                                <asp:HiddenField ID="txtbankname_hidden"  runat="server" />
                                                                             <%--   <asp:Label ID="lblBankErrorMsg" runat="server" ></asp:Label>--%>
                                                                            </td>
                                                                            <td class="lt">
                                                                                Search By:</td>
                                                                            <td>
                                                                                <dxe:ASPxComboBox ID="drpSearchBank" runat="server" ValueType="System.String" SelectedIndex="0"
                                                                                    ClientInstanceName="combo" width="100px">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="BankName" Value="bnk_bankName" />
                                                                                        <dxe:ListEditItem Text="MICR No" Value="bnk_Micrno" />
                                                                                        <%--<dxe:ListEditItem Text="Branch Name" Value="bnk_branchName" />--%>
                                                                                    </Items>
                                                                                    <ClientSideEvents ValueChanged="function(s,e){
                                                                                                    var indexr = s.GetSelectedIndex();
                                                                                                    setvaluetovariable(indexr)
                                                                                                    }" />
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="lt">
                                                                                Account Number:</td>
                                                                            <td style="text-align: left;" colspan="2">
                                                                                 <asp:Label ID="lblId" runat="server" Text='<%#Bind("Id") %>' Visible="false" ></asp:Label>
                                                                                <asp:TextBox ID="txtAccountNo" runat="server" Text='<%#Bind("AccountNumber") %>'
                                                                                    width="200px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="lt">
                                                                                Account Name:</td>
                                                                            <td class="lt" colspan="2">
                                                                                <asp:TextBox ID="txtAnccountName" runat="server" Text='<%#Bind("AccountName") %>'
                                                                                    width="200px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="lt">
                                                                                POA:
                                                                                </td>
                                                                                 <td class="lt" colspan="2">
                                                                                  <asp:DropDownList ID="ddlPOA"  runat="server"  Visible="false">
                                                                                    <asp:ListItem Value="1">YES</asp:ListItem>
                                                                                     <asp:ListItem Value="0" Selected="True">NO</asp:ListItem>
                                                                                  </asp:DropDownList> 
                                                                                  <dxe:ASPxComboBox ID="comboPOA" EnableIncrementalFiltering="True" EnableSynchronization="False"
                                                                        runat="server" AutoPostBack="true" ValueType="System.String" Width="200px" Value ='<%#Bind("IsPOA") %>' 
                                                                                         onselectedindexchanged="comboPOA_SelectedIndexChanged" >
                                                                        <Items>
                                                                            <dxe:ListEditItem Text="Yes" Value="1" />
                                                                            <dxe:ListEditItem Text="No" Value="0" />
                                                                        </Items>
                                                                       
                                                                        <ButtonStyle Width="13px">
                                                                        </ButtonStyle>
                                                                    </dxe:ASPxComboBox>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                        
                                                                        <%--------------------------------%>
                                                                        
                                                                         <tr >
                                                                            <td class="lt">
                                                                               
                                                                                <asp:Label ID="lblPOADate" runat="server" Visible="false" Text="POA Date:"></asp:Label>
                                                                                </td>
                                                                              <td class="lt" colspan="2">
                                                                                    <dxe:ASPxDateEdit ID="txtPOADate" Visible="false" runat="server" Width="200px" 
                                                                                      EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" TabIndex="10"  Value='<%# Bind("POADate") %>' >
                                                                                        <ButtonStyle Width="13px">
                                                                                        </ButtonStyle>
                                                                                    </dxe:ASPxDateEdit>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                        
                                                                        
                                                                       <%-- ------------------------------%>
                                                                        
                                                                        
                                                                        <tr >
                                                                            <td class="lt">
                                                                               
                                                                                <asp:Label ID="lblPOAName" Visible="false" runat="server" Text="POAName:"></asp:Label>
                                                                                </td>
                                                                              <td class="lt" colspan="2">
                                                                                <asp:TextBox ID="txtPOA" Visible="false" runat="server" Text='<%#Bind("POAName") %>'   
                                                                                    width="200px" ></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="lt" colspan="2">
                                                                                <dxe:ASPxButton ID="btnUpdate" runat="server" Text="Update" ToolTip="Update data"
                                                                                    Height="18px" width="88px" AutoPostBack="true" OnClick="btnUpdate_Click"  >
                                                                                   <ClientSideEvents Click="function(s, e) {gridBank.UpdateEdit();}" />
                                                                                  <%-- <ClientSideEvents Click="function(s, e) {UpdateEdit();}" />--%>
                                                                                </dxe:ASPxButton>
                                                                                 
                                                                            </td>
                                                                            <td class="lt" colspan="2">
                                                                                <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel data"
                                                                                    Height="18px" width="88px" AutoPostBack="False" OnClick="btnCancel_Click">
                                                                                    <ClientSideEvents Click="function(s, e) {gridBank.CancelEdit();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    
</EditForm>
</Templates>
</dxwgv:ASPxGridView>

 <dxpc:ASPxPopupControl runat="server" AllowDragging="True" ClientInstanceName="popup" CloseAction="CloseButton" EnableHotTrack="False" HeaderText="Set Account Status" PopupHorizontalAlign="WindowCenter" Width="400px" BackColor="#DDECFE" ID="ASPxPopupControl1" __designer:wfdid="w41">
<ClientSideEvents CloseButtonClick="function(s, e) {
	 popup.Hide();
}"></ClientSideEvents>

<CloseButtonImage Height="12px" Width="13px"></CloseButtonImage>

<SizeGripImage Height="16px" Width="16px"></SizeGripImage>

<HeaderStyle HorizontalAlign="Left">
<Paddings PaddingRight="6px"></Paddings>
</HeaderStyle>
<ContentCollection>
<dxpc:PopupControlContentControl runat="server"><dxcp:ASPxCallbackPanel runat="server" ClientInstanceName="popPanel" Width="400px" ID="ASPxCallbackPanel1" __designer:wfdid="w4" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties" OnCallback="ASPxCallbackPanel1_Callback">
<ClientSideEvents EndCallback="function(s, e) {
	                                                    EndCallBack(s.cpLast);
                                                    }"></ClientSideEvents>
<PanelCollection>
<dxp:PanelContent runat="server"><TABLE><TBODY><TR><TD>Status: </TD><TD><asp:DropDownList runat="server" Width="100px" ID="cmbStatus" __designer:wfdid="w43"><asp:ListItem Text="Active" Value="Y"></asp:ListItem>
<asp:ListItem Text="Deactive" Value="N"></asp:ListItem>
</asp:DropDownList>











 </TD></TR><TR><TD>Date: </TD><TD><dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" EditFormat="Custom" Width="99px" ClientInstanceName="StDate" Font-Size="10px" TabIndex="21" ID="StDate" __designer:wfdid="w44">
<ButtonStyle Width="13px"></ButtonStyle>
</dxe:ASPxDateEdit>











 </TD></TR><TR><TD>Reason: </TD><TD><asp:TextBox runat="server" TextMode="MultiLine" Width="250px" ID="txtReason" __designer:wfdid="w45"></asp:TextBox>











 </TD></TR><TR><TD></TD><TD class="gridcellleft"><INPUT style="WIDTH: 60px" id="Button2" class="btnUpdate" tabIndex=41 onclick="btnSave_Click()" type=button value="Save" /> <INPUT style="WIDTH: 60px" id="Button3" class="btnUpdate" tabIndex=42 onclick="btnCancel_Click()" type=button value="Cancel" /> </TD></TR></TBODY></TABLE></dxp:PanelContent>
</PanelCollection>
</dxcp:ASPxCallbackPanel>










 </dxpc:PopupControlContentControl>
</ContentCollection>
</dxpc:ASPxPopupControl>

 </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Investment" Text="Investment"><ContentCollection>
<dxw:ContentControl runat="server">
<asp:Panel runat="server" Width="100%" ID="Panel1" __designer:wfdid="w1"><table width="100%"><tbody><tr><td><table width="100%"><tbody><tr><td colspan=2><table><tbody><tr>
<td class="mylabel1"><span style="FONT-SIZE: 8pt">Select Investment: </span></td>
<td>
<%--New Work 17/06/2024--%>
<%--<asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpdatePanel2" __designer:wfdid="w2">--%>
<%--End of New Work 17/06/2024--%>
<ContentTemplate>
<asp:DropDownList id="cmbFinYear" runat="server" Width="200px" __designer:wfdid="w3" AutoPostBack="true" OnSelectedIndexChanged="cmbFinYear_SelectedIndexChanged">
                                                    </asp:DropDownList> 
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
</Triggers>
<%--New Work 17/06/2024--%>
<%--</asp:UpdatePanel>--%>
<%--End of New Work 17/06/2024--%>

 </td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td>
 <%--New Work 17/06/2024--%>
<%-- <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpdatePanel1" __designer:wfdid="w4">--%>
<%--End of New Work 17/06/2024--%>
 <ContentTemplate>
<table class="TableMain100" width="100%" border=1><TBODY><TR><TD style="BACKGROUND-COLOR: #a9d4fa; TEXT-ALIGN: center" colSpan=2><SPAN style="FONT-SIZE: 8pt"><STRONG>Investment</STRONG></SPAN> </TD></TR><TR><TD colSpan=2><TABLE><TBODY><TR><TD class="mylabel1"><SPAN style="FONT-SIZE: 8pt">Financial Year:</SPAN> </TD><TD><asp:DropDownList id="drpFinyear" runat="server" Width="200px" __designer:wfdid="w5" OnSelectedIndexChanged="drpFinyear_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList> </TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 8pt">Effective Date:</SPAN> </TD><TD><dxe:ASPxDateEdit id="dtEffect" tabIndex=21 runat="server" ClientInstanceName="dtEffect" Width="99px" __designer:wfdid="w6" Font-Size="10px" EditFormat="Custom" UseMaskBehavior="True">
                                                                                                            <ButtonStyle Width="13px">
                                                                                                            </ButtonStyle>
                                                                                                        </dxe:ASPxDateEdit> </TD></TR></TBODY></TABLE></TD></TR><TR><TD style="WIDTH: 45%" vAlign=top><TABLE width="100%"><TBODY><TR><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Gross Annual Salary Range </SPAN></TD><TD>: </TD><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtgrossannualsalary" runat="server" __designer:wfdid="w7" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">To&nbsp;&nbsp;&nbsp;&nbsp;Rs.</SPAN><asp:TextBox id="txtgrossannualsalary2" runat="server" __designer:wfdid="w8" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="WIDTH: 154px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Annual Trunover Range </SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtannualTrunover" runat="server" __designer:wfdid="w9" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">To&nbsp;&nbsp;&nbsp;&nbsp;Rs.</SPAN><asp:TextBox id="txtannualTrunover2" runat="server" __designer:wfdid="w10" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="WIDTH: 154px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Gross Profit Range </SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtGrossProfit" runat="server" __designer:wfdid="w11" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">To&nbsp;&nbsp;&nbsp;&nbsp;Rs.</SPAN><asp:TextBox id="txtGrossProfit2" runat="server" __designer:wfdid="w12" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="WIDTH: 154px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Approx. Expenses (PM) Range</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtPMExpenses" runat="server" __designer:wfdid="w13" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">To&nbsp;&nbsp;&nbsp;&nbsp;Rs.</SPAN><asp:TextBox id="txtPMExpenses2" runat="server" __designer:wfdid="w14" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="WIDTH: 154px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Approx. Saving (PM) Range </SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtPMSaving" runat="server" __designer:wfdid="w15" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">To&nbsp;&nbsp;&nbsp;&nbsp;Rs.</SPAN><asp:TextBox id="txtPMSaving2" runat="server" __designer:wfdid="w16" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="WIDTH: 150px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">6 Month Bank Blnc Statement</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt; TEXT-ALIGN: left">High</SPAN><asp:TextBox id="txtbank1" runat="server" __designer:wfdid="w17" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Low</SPAN><asp:TextBox id="txtbank2" runat="server" __designer:wfdid="w18" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR></TBODY></TABLE></TD><TD style="WIDTH: 60%"><TABLE width="100%"><TBODY><TR><TD style="WIDTH: 260px"><TABLE><TBODY><TR><TD style="WIDTH: 128px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Annual Income Range</SPAN></TD><TD>:</TD><TD class="mylabel1"><asp:DropDownList style="FONT-SIZE: 10px; WIDTH: 130px" id="ddlIncomeRange" runat="server" __designer:wfdid="w19"></asp:DropDownList> </TD></TR><TR><TD style="WIDTH: 118px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Equity</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtequity" runat="server" __designer:wfdid="w20" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="WIDTH: 118px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Mutual Fund</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtMutalFund" runat="server" __designer:wfdid="w21" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="WIDTH: 118px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Bank FD's</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtBankFD" runat="server" __designer:wfdid="w22" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="WIDTH: 118px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Debt's Instruments</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtDebtsInstruments" runat="server" __designer:wfdid="w23" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="WIDTH: 118px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">NSS's</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtNSS" runat="server" __designer:wfdid="w24" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR></TBODY></TABLE></TD><TD><TABLE><TBODY><TR><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Networth</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN> <asp:TextBox id="txtNetworth" onkeypress="return validate(event)" runat="server" __designer:wfdid="w25" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Life Insurance</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN> <asp:TextBox id="txtLifeInsurance" runat="server" __designer:wfdid="w26" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Health Insurance</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtHealthInsurance" runat="server" __designer:wfdid="w27" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Real Estate</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtRealEstate" runat="server" __designer:wfdid="w28" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Precious Metals/Stones</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtPreciousMetals" runat="server" __designer:wfdid="w29" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Other's</SPAN></TD><TD>:</TD><TD class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Rs.</SPAN><asp:TextBox id="txtOthers" runat="server" __designer:wfdid="w30" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR><TR><TD><TABLE><TBODY><TR><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Has Fund For Investment </SPAN></TD><TD>:</TD><TD style="COLOR: blue"><asp:CheckBox id="chkHasFundInvestment" runat="server" __designer:wfdid="w31" ForeColor="Blue" font-size="10px" OnCheckedChanged="chkHasFundInvestment_CheckedChanged"></asp:CheckBox> </TD></TR><TR><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">If Yes Then Availabe Funds </SPAN></TD><TD>:</TD><TD class="mylabel1"><asp:TextBox id="txtAvailableFund" runat="server" __designer:wfdid="w32" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR><TR><TD style="TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">If Yes Then Investment Horizon </SPAN></TD><TD>:</TD><TD class="mylabel1"><asp:TextBox id="txtInvestmentHorizon" runat="server" __designer:wfdid="w33" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR></TBODY></TABLE></TD><TD><TABLE><TBODY><TR><TD><TABLE><TBODY><TR><TD style="WIDTH: 225px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">Ready to Transfer Existing Portfoilio </SPAN></TD><TD>:</TD><TD class="mylabel1"><asp:CheckBox id="chkPortFoilio" runat="server" __designer:wfdid="w34" ForeColor="Blue" font-size="10px" OnCheckedChanged="chkPortFoilio_CheckedChanged"></asp:CheckBox> </TD></TR><TR><TD style="WIDTH: 119px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">If Yes Then Amount </SPAN></TD><TD>:</TD><TD style="COLOR: black"><asp:TextBox id="TxtPortFoilioAmount" runat="server" __designer:wfdid="w35" ForeColor="Black" font-size="12px" width="50px"></asp:TextBox> </TD></TR></TBODY></TABLE></TD><TD><TABLE><TBODY><TR><TD style="WIDTH: 138px; TEXT-ALIGN: left"><SPAN style="FONT-SIZE: 6pt" class="mylabel1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Own House </SPAN></TD><TD style="WIDTH: 3px">:</TD><TD class="mylabel1"><asp:CheckBox id="chkhouse" runat="server" __designer:wfdid="w36" ForeColor="Black" font-size="10px"></asp:CheckBox> </TD></TR><TR><TD style="WIDTH: 138px; TEXT-ALIGN: left" class="mylabel1"><SPAN style="FONT-SIZE: 6pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Own Vehicle </SPAN></TD><TD style="WIDTH: 3px">:</TD><TD class="mylabel1"><asp:CheckBox id="chkVehicle" runat="server" __designer:wfdid="w37" ForeColor="Blue" font-size="10px"></asp:CheckBox> </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR><TR><TD style="TEXT-ALIGN: left" align=center colSpan=2><asp:Button id="Button1" onclick="btn_Finance_Save_Click" runat="server" __designer:wfdid="w38" Text="Save" CssClass="btnUpdate"></asp:Button> </TD></TR></TBODY></TABLE>
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="cmbFinYear" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="drpFinyear" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</Triggers>
<%--New Work 17/06/2024--%>
<%--</asp:UpdatePanel>--%>
<%--End of New Work 17/06/2024--%>






 </TD></TR></TBODY></TABLE></asp:Panel>







 </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
</tabpages>
                                            </dxtc:ASPxPageControl>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="DP Details">
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
                                <dxtc:TabPage Name="Group Member" Text="Group">
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
                            <TabStyle Font-Size="10px">
                            </TabStyle>
                        </dxtc:ASPxPageControl>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="BankDetails" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="BankDetailsSelect" 
            SelectCommandType="StoredProcedure" 
            OnInserted="BankDetails_Inserted" OnInserting="BankDetails_Inserting" OnUpdated="BankDetails_Updated">
            <SelectParameters>
                <asp:SessionParameter Name="insuId" SessionField="KeyVal_InternalID_New" Type="String" />
                <asp:SessionParameter Name="entryprofile" SessionField="userEntryProfileBank" Type="String" />
            </SelectParameters>
           
        </asp:SqlDataSource>
         <asp:Button ID="btnForce" runat="server" Text="Force" OnClick="btnForce_Click" Visible="false"  />
        <asp:HiddenField ID="hdnPOA" runat="server" />
        <asp:HiddenField ID="hdnIsPOA" runat="server" />
        <asp:HiddenField ID="hdnRefresh" runat="server" Value="n" />
        <asp:HiddenField ID="hdnRights" runat="server" />
    </form>
</body>
</html>
