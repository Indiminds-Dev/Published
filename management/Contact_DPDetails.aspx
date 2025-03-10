<%@ page language="C#" autoeventwireup="true" inherits="management_Contact_DPDetails, App_Web_alid8jfz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
    <%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
    <%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DP Details</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff()
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
        document.location.href="Contact_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        //document.location.href="Contact_DPDetails.aspx"; 
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
    //New Work 27-10-2022
    function RefreshPage()
    {
      setTimeout(RefreshWork(),3000);
    }
    function RefreshWork()
    {
      alert('Data Updated Successfully.');
      document.location.href="Contact_DPDetails.aspx";
    }
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
        alert('Data Updated Successfully.');
      }
      document.location.href="Contact_DPDetails.aspx";
    }
    function OldState()
    {
      document.location.href="Contact_DPDetails.aspx";
    }
    //End of New Work 27-10-2022
    function CallList(obj,obj1,obj2)
        {
            ajax_showOptions(obj,obj1,obj2);
        } 
        FieldName='ASPxPageControl1_DpDetailsGrid_DXSelInput';
    function setvaluetovariable(obj)
    {
        if(obj=='1')
        {
            document.getElementById("TrPoaName").style.display="none";
        }
        else    
        {
            document.getElementById("TrPoaName").style.display="inline";
        }
    }
    
    //New Work
    function DPUpdate(keyValue)
        {
          var WhichRights = document.getElementById('hdnRights').value;
          if(WhichRights !="F" && keyValue!="")
          {
            alert("You have no Rights to Update Data.");
          }
          else
          {
            gridDp.UpdateEdit();
          }
        }
        //End of New Work
    
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
                   gridDp.PerformCallback('Delete~'+keyValue);
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
        if(obj =='N')
        {
            if(obj !='B')
             {  
            alert("Transactions exists for this ClientID...Deletion disallowed!!");   
            obj='B';     
            }
        }
        if(obj2 !='Y')
        {
       
               INR =confirm('Warning!!.\n\nThis DP Id and ClientId already assigned to  '+ obj2 +'.\n\nClick OK to Accept,Otherwise Click Cancel');
                   if(INR)
                  {
              
                                    
                                     WAR2 =confirm('Warning!!.\n\nThis DP Id and ClientId already assigned to  '+ obj2 +'.\n\nClick OK to Accept,Otherwise Click Cancel');
                                       if(WAR2)
                                      {
                                                                          
                                                                          
                                                                  WAR3 =confirm('Warning!!.\n\nThis DP Id and ClientId already assigned to  '+ obj2 +'.\n\nClick OK to Accept,Otherwise Click Cancel');
                                                                  if(WAR3)
                                                                   {
                                                                   alert('Your DPID and ClientID has been accepted.')
                                                                                    
                                                                   }
                                                                   else
                                                                   {
                                                                    obj='DeleteCurrentID';
                                                                    gridDp.PerformCallback(obj);
                                                                   }  
                                       }
                                       else
                                       {
                                        obj='DeleteCurrentID';
                                        gridDp.PerformCallback(obj);
                                       }
                                    
                                    
                   }
                   else
                   {
                    obj='DeleteCurrentID';
                    gridDp.PerformCallback(obj);
                   }
        }
     
     
     }
     
     
     
     //----------Update Status 
     
     
     function btnSave_Click()
    {  
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
        if(obj=='Y')
        {
         popup.Hide();        
         alert("Successfully Update!..");  
          gridDp.PerformCallback('GridBind');       
        }

     
    }
     function btnCancel_Click()
    {
        popup.Hide();
    }
    function isNumberKey(evt)
     {
        
        var charCode = (evt.which) ? evt.which : event.keyCode
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                {
                alert('Please Enter only Numeric Value!');
                return false;
                }
             else
                
             return true;   
        
     }
   function isLength()
    {
        alert('dd');  
        var len=document.getElementById('ASPxPageControl1_DpDetailsGrid_txtClientID').value;
        alert(len);
        
    
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
    <form id="form1" runat="server">
        <div>
            <table width="100%">
                <tr>
                    <td class="EHEADER" style="text-align: center">
                        <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="TableMain100">
                 <tr>
                    <td colspan="2">
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" Width="100%" ActiveTabIndex="3"
                            ClientInstanceName="page">
                            <TabPages>
                                <dxtc:TabPage  Name="General">
                                <TabTemplate ><span style="font-size:x-small">General</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage  Name="CorresPondence">
                                <TabTemplate ><span style="font-size:x-small">CorresPondence</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Bank">
                                <TabTemplate ><span style="font-size:x-small">Bank</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="DP" >
                                <%--New Work 27-10-2022--%>
                                <TabTemplate ><span style="font-size:x-small">DP</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <dxwgv:ASPxGridView runat="server" ClientInstanceName="gridDp" KeyFieldName="Id" AutoGenerateColumns="False" DataSourceID="DpDetailsdata"
                                                Width="100%" Font-Size="10px" ID="DpDetailsGrid" OnCustomJSProperties="DpDetailsGrid_CustomJSProperties" 
                                                OnCustomCallback="DpDetailsGrid_CustomCallback" OnHtmlEditFormCreated="DpDetailsGrid_HtmlEditFormCreated" 
                                                OnRowInserting="DpDetailsGrid_RowInserting" OnRowValidating="DpDetailsGrid_RowValidating" OnRowUpdating="DpDetailsGrid_RowUpdating">
                                                <ClientSideEvents EndCallback="function(s, e) {
                                                Emailcheck(s.cpHeight,s.cpWidth);
                                                }"></ClientSideEvents>
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Id" Caption="Type" Visible="False" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" Caption="ID"></EditFormSettings>
                                                    <CellStyle CssClass="gridcellleft"></CellStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="Category" Caption="Category" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" Caption="Category"></EditFormSettings>
                                                    <CellStyle CssClass="gridcellleft"></CellStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="DP" Caption="DP" VisibleIndex="1" Width="100px">
                                                    <EditFormSettings Visible="False" Caption="DP"></EditFormSettings>
                                                    <CellStyle CssClass="gridcellleft"></CellStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="ClientId" Caption="Client Id" VisibleIndex="2">
                                                    <EditFormSettings Visible="False" Caption="Client Id"></EditFormSettings>
                                                    <CellStyle CssClass="gridcellleft"></CellStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>

                                                    <dxwgv:GridViewDataTextColumn FieldName="POA" Caption="POA" VisibleIndex="3">
                                                    <EditFormSettings Visible="False" Caption="POA"></EditFormSettings>
                                                    <CellStyle CssClass="gridcellleft"></CellStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="POADate" Caption="POA Date" VisibleIndex="4" Width="60px" PropertiesTextEdit-DisplayFormatString="dd-MM-yyyy">
                                                    <EditFormSettings Visible="True" Caption="POA Date"></EditFormSettings>
                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
                                                    <CellStyle CssClass="gridcellleft"></CellStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="POAName" Caption="POA Name" VisibleIndex="5">
                                                    <EditFormSettings Visible="True" Caption="POA Name"></EditFormSettings>
                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
                                                    <CellStyle CssClass="gridcellleft"></CellStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>

                                                    <dxwgv:GridViewDataTextColumn FieldName="EDIS" Caption="EDIS" VisibleIndex="6">
                                                    <EditFormSettings Visible="False" Caption="EDIS"></EditFormSettings>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <CellStyle CssClass="gridcellleft"></CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>

                                                    <dxwgv:GridViewDataTextColumn FieldName="DISMandate" Caption="DIS Mandate" VisibleIndex="7">
                                                    <EditFormSettings Visible="False" Caption="DIS Mandate"></EditFormSettings>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <CellStyle CssClass="gridcellleft"></CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>

                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="Category" Caption="Category" Visible="False" VisibleIndex="0">
                                                    <PropertiesComboBox ValueType="System.String"></PropertiesComboBox>
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="DDPI" Caption="DDPI" VisibleIndex="8">
                                                    <EditFormSettings Visible="True" Caption="DDPI"></EditFormSettings>
                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
                                                    <CellStyle CssClass="gridcellleft"></CellStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="DDPIDate" Caption="DDPI Date" VisibleIndex="9" Width="60px" PropertiesTextEdit-DisplayFormatString="dd-MM-yyyy">
                                                    <EditFormSettings Visible="True" Caption="DDPI Date"></EditFormSettings>
                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
                                                    <CellStyle CssClass="gridcellleft"></CellStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="DDPIid" Caption="DDPI Id" VisibleIndex="10">
                                                    <EditFormSettings Visible="False" Caption="DDPI Id"></EditFormSettings>
                                                    <CellStyle CssClass="gridcellleft"></CellStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>

                                                    <dxwgv:GridViewDataTextColumn FieldName="DPName" Caption="DPName" Visible="False" VisibleIndex="0">
                                                    <EditFormSettings Visible="True" Caption="DPName"></EditFormSettings>
                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>

                                                    <dxwgv:GridViewDataTextColumn FieldName="status" VisibleIndex="11">
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                    <DataItemTemplate>
                                                        <a href="javascript:void(0);" onclick="OnAddEditClick(this,'Edit~'+'<%# Container.KeyValue %>')">                                                            
                                                            <dxe:ASPxLabel ID="ASPxTextBox2" runat="server" Text='<%# Eval("status")%>' Width="100%" ToolTip="Click to Change Status">
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
                                                        <a href="javascript:void(0);" onclick="gridDp.AddNewRow();"><span style="color: #000099;
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

                                                <SettingsEditing PopupEditFormWidth="600px" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center" 
                                                    PopupEditFormVerticalAlign="WindowCenter" PopupEditFormModal="True" EditFormColumnCount="1">
                                                </SettingsEditing>

                                                <Settings ShowTitlePanel="True" ShowStatusBar="Visible"></Settings>

                                                <SettingsText ConfirmDelete="Are You Want To Delete This Record ???" PopupEditFormCaption="Add/Modify DP Details"></SettingsText>

                                                <Styles>
                                                    <Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="EHEADER"></Header>
                                                    <AlternatingRow BackColor="AliceBlue" Font-Bold="True"></AlternatingRow>
                                                    <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                                                </Styles>

                                                <Templates>
                                                    <TitlePanel>
                                                        <span style="color :Maroon;font-size :12px">DP Details</span>
                                                    </TitlePanel>
                                                    <EditForm>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="text-align: center;">
                                                                    <table>
                                                                        <tr>
                                                                            <td class="lt" style="text-align: right; width: 30%">
                                                                                Category:</td>
                                                                            <td class="lt" colspan="2" style="text-align: left">
                                                                                <dxe:ASPxComboBox ID="comboCategory" runat="server" ValueType="System.String" width="203px"
                                                                                    Value='<%#Bind("Category") %>' SelectedIndex="0" TabIndex="1" SetFocus="true">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="Default" Value="Default" />
                                                                                        <dxe:ListEditItem Text="Secondary" Value="Secondary" />
                                                                                        <dxe:ListEditItem Text="CommodityDP" Value="CommodityDP" />
                                                                                        <dxe:ListEditItem Text="CommodityDP Sec" Value="CommodityDP Sec" />
                                                                                    </Items>
                                                                                    <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                                                                        <RequiredField IsRequired="True" ErrorText="Please Select Category." />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxComboBox>
                                                                                  <asp:Label ID="lblCategoryErrorMsg" runat="server" Text="Default Category already exists" ForeColor="red" Visible="false" ></asp:Label>
                                                                                  <asp:Label ID="lblCategoryErrorMsg1" runat="server" Text="CommodityDP Category already exists" ForeColor="red" Visible="false" ></asp:Label>
                                                                                  <asp:Label ID="lblCategoryErrorMsg2" runat="server" Text="Category Already Exists!" ForeColor="red" Visible="false" ></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="lt" style="text-align: right; width: 30%">
                                                                                DPName :</td>
                                                                            <td class="lt" style="text-align: left">                                                                       
                                                                                <asp:TextBox ID="txtDPName" runat="server" TabIndex="2" width="200px" Text='<%#Bind("DP") %>'>
                                                                                </asp:TextBox>
                                                                                <%--<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                                                                                  ControlToValidate="txtDPName"
                                                                                  ErrorMessage="Please Enter DP Name."
                                                                                  ForeColor="Red">
                                                                                </asp:RequiredFieldValidator>--%>
                                                                                <%--<asp:HiddenField ID="txtDPName_hidden" runat="server" />--%>
                                                                                <asp:Label ID="lblDPClientErrorMsg" runat="server" Text="This DP+ClientID is already enabled for EDIS for another client!  It Cannot be Flagged as YES for this Client." ForeColor="red" Visible="false" ></asp:Label>
                                                                                <asp:Label ID="lblDPNameErrorMsg" runat="server" Text="Please Enter DP Name." ForeColor="red" Visible="false" ></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="lt" style="text-align: right; width: 30%">
                                                                                ClientID :</td>
                                                                            <td style="text-align: left;" colspan="2">
                                                                                <asp:Label ID="lblId" runat="server" Text='<%#Bind("Id") %>' Visible="false" ></asp:Label>
                                                                                <asp:TextBox ID="txtClientID" runat="server" Text='<%#Bind("ClientId") %>'
                                                                                    width="200px" MaxLength="8" TabIndex="3" onkeypress="return isNumberKey(event)">
                                                                                </asp:TextBox>
                                                                                <%--<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                                                                                  ControlToValidate="txtClientID"
                                                                                  ErrorMessage="Please Enter Client ID Or ClientID Must be 8 character long."
                                                                                  ForeColor="Red">
                                                                                </asp:RequiredFieldValidator>--%>
                                                                                <asp:Label ID="lblClientIDErrorMsg" runat="server" Text="Please Enter Client ID." ForeColor="red" Visible="false" ></asp:Label>
                                                                                <asp:Label ID="lblClientIDErrorMsg1" runat="server" Text="ClientID Must be 8 character long." ForeColor="red" Visible="false" ></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                        <tr>
                                                                            <td class="lt" style="text-align: right; width: 30%">
                                                                                POA :
                                                                            </td>
                                                                            <td class="lt" colspan="2" style="text-align: left">
                                                                              <asp:DropDownList ID="ddlPOA"  runat="server"  Visible="false">
                                                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                                 <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                                              </asp:DropDownList> 
                                                                              <dxe:ASPxComboBox ID="comboPOA" EnableIncrementalFiltering="True" EnableSynchronization="False" TabIndex="4"
                                                                                    runat="server" AutoPostBack="true" ValueType="System.String" Width="200px" Value ='<%#Bind("POA") %>' 
                                                                                         onselectedindexchanged="comboPOA_SelectedIndexChanged" >
                                                                                    <%--<ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                                                                        <RequiredField IsRequired="True" ErrorText="Please Select POA." />
                                                                                    </ValidationSettings>--%>
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="Yes" Value="1" />
                                                                                        <dxe:ListEditItem Text="No" Value="0" />
                                                                                    </Items>                                                                       
                                                                                    <ButtonStyle Width="13px">
                                                                                    </ButtonStyle>
                                                                                </dxe:ASPxComboBox>
                                                                                <asp:Label ID="lblPOAErrorMsg" runat="server" Text="Please Select POA." ForeColor="red" Visible="false" ></asp:Label>
                                                                            </td>
                                                                        <%--</tr>
                                                                            
                                                                         <tr >--%>
                                                                            <td class="lt" style="text-align: right">                                                                               
                                                                                <asp:Label ID="lblPOADate" runat="server" Visible="false" Text="POA Date:"></asp:Label>
                                                                            </td>
                                                                            <td class="lt" colspan="2" style="text-align: right">
                                                                                <dxe:ASPxDateEdit ID="txtPOADate" Visible="false" runat="server" Width="200px" 
                                                                                  EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" TabIndex="5" Value='<%# Bind("POADate") %>' >
                                                                                    <ButtonStyle Width="13px">
                                                                                    </ButtonStyle>
                                                                                </dxe:ASPxDateEdit>
                                                                            </td>
                                                                        <%--</tr>
                                                                            
                                                                        <tr >--%>
                                                                            <td class="lt" style="text-align: left">                                                                               
                                                                                <asp:Label ID="lblPOAName" Visible="false" runat="server" Text="POAName:"></asp:Label>
                                                                            </td>
                                                                            <td class="lt" colspan="2" style="text-align: left">
                                                                                <asp:TextBox ID="txtPoaName" Visible="false" runat="server" Text='<%#Bind("POAName") %>'   
                                                                                    width="200px" MaxLength="100" TabIndex="6"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                            
                                                                        <tr>
                                                                            <td class="lt" style="text-align: right; width: 30%">
                                                                                EDIS :
                                                                            </td>
                                                                            <td class="lt" colspan="2" style="text-align: left">
                                                                              <asp:DropDownList ID="ddlEDIS"  runat="server"  Visible="false">
                                                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                                <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                                              </asp:DropDownList> 
                                                                              <dxe:ASPxComboBox ID="comboEDIS" EnableIncrementalFiltering="True" EnableSynchronization="False" TabIndex="7"
                                                                                    runat="server" AutoPostBack="true" ValueType="System.String" Width="200px" Value ='<%#Bind("EDIS") %>' 
                                                                                         onselectedindexchanged="comboEDIS_SelectedIndexChanged" >
                                                                                    <%--<ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                                                                        <RequiredField IsRequired="True" ErrorText="Please Select EDIS." />
                                                                                    </ValidationSettings>--%>
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="Yes" Value="1" />
                                                                                        <dxe:ListEditItem Text="No" Value="0" />
                                                                                    </Items>                                                                       
                                                                                    <ButtonStyle Width="13px">
                                                                                    </ButtonStyle>
                                                                              </dxe:ASPxComboBox>
                                                                              <asp:Label ID="lblEDISErrorMsg" runat="server" Text="EDIS flag is already set as YES for this client for another DP account. This account cannot be flagged as YES!" ForeColor="red" Visible="false" ></asp:Label>
                                                                              <asp:Label ID="lblEDISErrorMsg1" runat="server" Text="Please Select EDIS." ForeColor="red" Visible="false" ></asp:Label>
                                                                            </td>
                                                                        <%--</tr>
                                                                            
                                                                        <tr >--%>
                                                                            <td class="lt" style="text-align: right">                                                                               
                                                                                <asp:Label ID="lblDISMandate" Visible="false" runat="server" Text="DIS Mandate:"></asp:Label>
                                                                            </td>
                                                                            <td class="lt" colspan="2" style="text-align: right">
                                                                                <asp:TextBox ID="txtDISMandate" Visible="false" runat="server" Text='<%#Bind("DISMandate") %>'   
                                                                                    width="200px" MaxLength="25" TabIndex="8"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                            
                                                                        <tr>
                                                                            <td class="lt" style="text-align: right; width: 30%">
                                                                                DDPI :
                                                                            </td>
                                                                            <td class="lt" colspan="2" style="text-align: left">
                                                                              <asp:DropDownList ID="ddlDDPI"  runat="server" Visible="false">
                                                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                                <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                                              </asp:DropDownList> 
                                                                              <dxe:ASPxComboBox ID="comboDDPI" EnableIncrementalFiltering="True" EnableSynchronization="False" TabIndex="9"
                                                                                    runat="server" AutoPostBack="true" ValueType="System.String" Width="200px" Value ='<%#Bind("DDPI") %>' 
                                                                                         onselectedindexchanged="comboDDPI_SelectedIndexChanged" >
                                                                                    <%--<ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                                                                        <RequiredField IsRequired="True" ErrorText="Please Select DDPI." />
                                                                                    </ValidationSettings>--%>
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="Yes" Value="1" />
                                                                                        <dxe:ListEditItem Text="No" Value="0" />
                                                                                    </Items>
                                                                                    <ButtonStyle Width="13px">
                                                                                    </ButtonStyle>
                                                                              </dxe:ASPxComboBox>
                                                                              <asp:Label ID="lblDDPIErrorMsg" runat="server" Text="Please Select DDPI." ForeColor="red" Visible="false" ></asp:Label>
                                                                            </td>
                                                                        <%--</tr>
                                                                            
                                                                        <tr >--%>
                                                                            <td class="lt" style="text-align: right">                                                                               
                                                                                <asp:Label ID="lblDDPDate" runat="server" Visible="false" Text="DDPI Date:"></asp:Label>
                                                                            </td>
                                                                            <td class="lt" colspan="2" style="text-align: right">
                                                                                <dxe:ASPxDateEdit ID="dtDDPIDate" Visible="false" runat="server" Width="200px" 
                                                                                  EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" TabIndex="10" Value='<%# Bind("DDPIDate") %>' >
                                                                                    <ButtonStyle Width="13px">
                                                                                    </ButtonStyle>
                                                                                </dxe:ASPxDateEdit>
                                                                            </td>
                                                                        <%--</tr>
                                                                        
                                                                        <tr >--%>
                                                                            <td class="lt" style="text-align: right">
                                                                                <asp:Label ID="lblDDPIid" Visible="false" runat="server" Text="DDPIId:"></asp:Label>
                                                                            </td>
                                                                            <td class="lt" colspan="2" style="text-align: right">
                                                                                <asp:TextBox ID="txtDDPIid" Visible="false" runat="server" Text='<%#Bind("DDPIid") %>'   
                                                                                    width="200px" MaxLength="16" TabIndex="11"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                        <tr>
                                                                            <td colspan="2" style="display: none">
                                                                                <asp:TextBox ID="txtDPName_hidden" CssClass="EcoheadCon" Text='<%#Bind("DPName") %>'
                                                                                    runat="server" Width="279px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                            
                                                                        <tr>
                                                                            <td class="lt" colspan="2" style="text-align: right; width: 30%">
                                                                                <dxe:ASPxButton ID="btnUpdate" runat="server" Text="Update" ToolTip="Update data" TabIndex="12"
                                                                                    Height="18px" width="88px" AutoPostBack="true" OnClick="btnUpdate_Click" AccessKey="U" >
                                                                                   <ClientSideEvents Click="function(s, e) {gridDp.UpdateEdit();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                            <td class="lt" colspan="2" style="text-align: left">
                                                                                <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel data" TabIndex="13"
                                                                                    Height="18px" width="88px" AutoPostBack="False" OnClick="btnCancel_Click"  AccessKey="C">
                                                                                    <ClientSideEvents Click="function(s, e) {gridDp.CancelEdit();}" />
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
                                            <%--End of New Work 27-10-2022--%>
                                            <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="popup" runat="server"
                                                AllowDragging="True" PopupHorizontalAlign="WindowCenter" HeaderText="Set DP Status"
                                                EnableHotTrack="False" BackColor="#DDECFE" Width="400px" CloseAction="CloseButton">
                                                <ContentCollection>
                                                    <dxpc:PopupControlContentControl runat="server">
                                                        <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="400px" ClientInstanceName="popPanel"
                                                            OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
                                                            <PanelCollection>
                                                                <dxp:PanelContent runat="server">
                                                                
                                                                <table>
                                                                <tr>
                                                                <td>
                                                                Status:
                                                                </td>
                                                                <td>  <asp:DropDownList ID="cmbStatus" runat="server" Width="100px">
                                                                                    <asp:ListItem Text="Active" Value="Y"></asp:ListItem>
                                                                                    <asp:ListItem Text="Deactive" Value="N"></asp:ListItem>                                                                        
                                                                                   </asp:DropDownList>
                                                                
                                                                </td>
                                                                </tr>
                                                                <tr>
                                                                <td>
                                                                 Date:
                                                                </td>
                                                                <td>    <dxe:ASPxDateEdit ID="StDate" runat="server" ClientInstanceName="StDate" EditFormat="Custom"
                                                                                                                UseMaskBehavior="True" Width="99px" Font-Size="10px" TabIndex="21">
                                                                                                                <ButtonStyle Width="13px">
                                                                                                                </ButtonStyle>
                                                                                                            </dxe:ASPxDateEdit>
                                                                </td>
                                                                </tr>
                                                                <tr>
                                                                <td>
                                                                Reason:
                                                                </td>
                                                                <td>
                                                                <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Width="250px" ></asp:TextBox>
                                                                </td>
                                                                </tr>
                                                                
                                                                 <tr>
                                                                            <td>
                                                                            </td>
                                                                            <td colspan="2" class="gridcellleft">
                                                                                <input id="Button1" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                                    style="width: 60px" tabindex="41" />
                                                                                <input id="Button2" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                                                                    style="width: 60px" tabindex="42" />
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
                                                <HeaderStyle HorizontalAlign="Left">
                                                    <Paddings PaddingRight="6px" />
                                                </HeaderStyle>
                                                <SizeGripImage Height="16px" Width="16px" />
                                                <CloseButtonImage Height="12px" Width="13px" />
                                                <ClientSideEvents CloseButtonClick="function(s, e) {
	                                                 popup.Hide();
                                                }" />
                                            </dxpc:ASPxPopupControl>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Documents">
                                <TabTemplate ><span style="font-size:x-small">Documents</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                
                                <dxtc:TabPage Name="Registration">
                                <TabTemplate ><span style="font-size:x-small">Registration</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Other">
                                <TabTemplate ><span style="font-size:x-small">Other</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Group" Text="Group">
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
                </tr>
                <tr>
                    <td colspan="2" style="display: none; visibility: hidden">
                        <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox></td>
                </tr>
            </table>
        </div>
        <%--New Work 27-10-2022--%>
        <asp:SqlDataSource ID="DpDetailsdata" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="DPDetailsSelect" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="CntId" SessionField="KeyVal_InternalID_New" Type="String" />
                <asp:SessionParameter Name="entryprofile" SessionField="userEntryProfileDP" Type="String" />
            </SelectParameters>           
        </asp:SqlDataSource>
        <%--End of New Work 27-10-2022--%>
        <asp:SqlDataSource ID="SelectDp" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select DP_DepositoryID,DP_Name+' ['+DP_DepositoryID+']' as DP from Master_DP order by DP_Name">
        </asp:SqlDataSource>
        <asp:HiddenField ID="hdnRights" runat="server" />
    </form>
</body>
</html>
