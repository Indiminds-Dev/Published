<%@ page language="C#" autoeventwireup="true" inherits="Reports_APILogOutFile, App_Web_tuwtz_6w" enableeventvalidation="false" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Create API Logout File</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    <script language="javascript" type="text/javascript" src="../CentralData/JSScript/timeSolver.min.js"></script>

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
 <script language="javascript" type="text/javascript">

    function myFocus()
       {
          document.form1.txtMemberCode.focus();
       }
       
    function Page_Load()///Call Into Page Load
            {
                 height();
            }
   function height()
        {
            if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '350px';
            }
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }    

    function dispaly()
     {
        height()
     }
    function dispalycreate()
     {
        alert('File Create Successfully !!');
        height()
     }
     
   function heightlight(obj)
   {      
        var colorcode=obj.split('&');
        
         if((document.getElementById('hiddencount').value)==0)
         {
            prevobj='';
            prevcolor='';
            document.getElementById('hiddencount').value=1;
         }
          document.getElementById(obj).style.backgroundColor='#ffe1ac';
         
          if(prevobj!='')
          {
            document.getElementById(prevobj).style.backgroundColor=prevcolor;
          }
          prevobj=obj;
          prevcolor=colorcode[1];

    } 
  
    FieldName='lstSlection';

    function GnrcCallBackPanel_Methods(WhichCall)
    {
        Show("divLoading");
        cLogoutFileCreate.SetEnabled(false);
        cGnrcCallBackPanel.PerformCallback(WhichCall+'~');
        Height('350','350'); 
    }
    function GnrcCallBackPanel_EndCallBack()
    {
        Hide("divLoading");
        cLogoutFileCreate.SetEnabled(true);
        if(cGnrcCallBackPanel.cpIsSpData!=undefined)
        {
            if(cGnrcCallBackPanel.cpIsSpData=="LogoutFile")
                GetObjectID('btnLogoutFileCreate').click();
            else 
                alert(cGnrcCallBackPanel.cpIsSpData);
        }
        if(cGnrcCallBackPanel.cpDateSat!=undefined)
        {
            DtFor.SetDate(new Date(cGnrcCallBackPanel.cpDateSat));
        }
        Height('350','350'); 
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
    
 </script> 
</head>
<body onload="myFocus()" style="margin: 0px 0px 0px 0px; background-color: #DDECFE">

    <form id="form1" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
        </asp:ScriptManager>

        <script language="javascript" type="text/javascript"> 
   var prm = Sys.WebForms.PageRequestManager.getInstance(); 
   prm.add_initializeRequest(InitializeRequest); 
   prm.add_endRequest(EndRequest); 
   var postBackElement; 
   function InitializeRequest(sender, args) 
   { 
      if (prm.get_isInAsyncPostBack()) 
         args.set_cancel(true); 
            postBackElement = args.get_postBackElement(); 
         $get('UpdateProgress1').style.display = 'block'; 
   } 
   function EndRequest(sender, args) 
   { 
          $get('UpdateProgress1').style.display = 'none'; 
 
   } 
        </script>

        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                        <strong><span id="SpanHeader" style="color: #000099">Create API Logout File
                        </span></strong>
                    </td>
                   
                </tr>
            </table>
            <table>
                <tr>
                    <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 120px;">
                        Member Code :
                    </td>
                    <td style="width: 210px;">
                        <asp:TextBox ID="txtMemberCode" runat="server" MaxLength="5" Width="205px" onkeypress="return noNumbers(event)"></asp:TextBox>
                        <asp:TextBox ID="txtMemberCode_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                    </td>
                    <td style="width: 2px; ">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMemberCode" runat="server" ControlToValidate="txtMemberCode"
                            ErrorMessage="Please Enter Member Code" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
             </table>
             <table>
                <tr>
                    <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 120px;">
                        Api User LoginID :
                    </td>
                    <td style="width: 210px; vertical-align: top">
                        <asp:TextBox ID="txtAPILoginID" runat="server" Width="205px"></asp:TextBox>
                        <asp:TextBox ID="txtAPILoginID_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                    </td>
                    <td style="width: 2px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAPILoginID" runat="server" ControlToValidate="txtAPILoginID"
                            ErrorMessage="Please Enter LoginID" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
                 </tr>
             </table>
        </div>
                
        <table>
            <tr>
                <td id="Td_API">
                    <table>
                        <tr>
                            <td>
                                <dxe:ASPxButton ID="LogoutCreate" runat="server" AutoPostBack="False" ClientInstanceName="cLogoutFileCreate"
                                    Text="Generate Logout File">
                                    <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('LogoutFile');}" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div id="divLoading">
            <dxcp:ASPxCallbackPanel ID="GnrcCallBackPanel" runat="server" ClientInstanceName="cGnrcCallBackPanel"
                BackColor="White" OnCallback="GnrcCallBackPanel_Callback" LoadingPanelText="Generating File...Please Wait..."
                LoadingPanelStyle-Font-Size="Medium">
                <PanelCollection>
                    <dxp:panelcontent>
                    </dxp:panelcontent>
                </PanelCollection>
                <ClientSideEvents EndCallback="function(s, e) {
	                                                    GnrcCallBackPanel_EndCallBack(); }" />
            </dxcp:ASPxCallbackPanel>
        </div>
        <div style="display: none">
            <asp:Button ID="btnLogoutFileCreate" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnLogoutFileCreate_Click" />
        </div>
    </form>
</body>
</html>

