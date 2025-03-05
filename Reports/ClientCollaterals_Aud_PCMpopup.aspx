<%@ page language="C#" autoeventwireup="true" inherits="Reports_ClientCollaterals_Aud_PCMpopup, App_Web__-dtd0z2" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
  
    <title>Holding Report</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
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
      function Page_Load()///Call Into Page Load
            {   
                height();
            }
      function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
  function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
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
//            window.frameElement.width = document.body.scrollwidth;
        }
    function FunClient(objID,objListFun,objEvent,ObjType)
        {
            var obj=document.getElementById('lblclientall_hidden').value;
            if(document.getElementById('lblclientall_hidden').value=='')
            {
                ObjType='Clients';
            }
            else
            {
                ObjType='ClientsNotIn';
            }
            ajax_showOptions(objID,objListFun,objEvent,ObjType+'~'+obj);
        }
        
    function FunRetCodesClients(objID,objListFun,objEvent)
        {
            var cmbVal;
            cmbVal='RetCodesForClients';
            ajax_showOptions(objID,'ShowRetCodesForClients',objEvent,cmbVal);
        }
    function DISPLAY(obj)
    {
         var s=document.getElementById(obj);
         s.focus();
         s.select();
       
    }
  function btnchk(obj)
  {
 
        if(obj=='0')
        {
            document.getElementById('btnSave').disabled=true;
        }
        else
        {
             document.getElementById('btnSave').disabled=false;
        }
  }
//    function fncheckqty(obj,obj2)
//    {
//        var obj1=obj.split('.');
//        if(parseInt(obj1[0])>parseInt(document.getElementById('lblQty_hidden').value))
//        {
//            alert('Qty Cant Be Greater Than '+document.getElementById('lblQty_hidden').value+'');
//            document.getElementById(obj2).focus();
//            document.getElementById(obj2).select();
//            document.getElementById(obj2).innerText=document.getElementById('lblQty_hidden').value;
//        }
//           
//    }

function WaterMarkFocus(txt, text) {    
        if (txt.value == text) {    
            txt.value = "";    
            txt.style.color = "black";    
        }    
    }    
     
    function WaterMarkBlur(txt, text) {    
        if (txt.value == "") {    
            txt.value = text;    
            txt.style.color = "gray";    
        }    
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
     function ForDiscard()
     {    
         parent.editwin.close();
     }
   function alertsameclient()
     {
        btnchk('0');
        alert('This Reason Code Already Exists !');         
     }
     
     function alertemptyreasoncode()
     {
        btnchk('0');
        alert('Please Select Reason Code.');         
     }
     
     function alertexceedvalue()
     {
        btnchk('0');
        alert('Entered Amount should not be exceed than Total Amount !!');         
     }
     
        FieldName='lblclientall_hidden';
        </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form2" runat="server" autocomplete="off">
  <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            </asp:ScriptManager>
    <div>
        <table>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="grdCCRetention" runat="server" DataKeyNames="CCRetentionReason_ID" CssClass="gridcellleft"
                                CellPadding="4" ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px"  BorderColor="#507CD1"
                                Width="100%" AutoGenerateColumns="False" ShowFooter="True" OnRowDataBound="grdCCRetention_RowDataBound" OnRowCommand="grdCCRetention_RowCommand">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" BorderWidth="1px" />
                                <EditRowStyle BackColor="#E59930" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle Font-Bold="False" ForeColor="Black" CssClass="EHEADER" BorderColor="AliceBlue"
                                    BorderWidth="1px" />
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Client Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblClientUCC" runat="server" Text='<%# Eval("ClientUCC") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtclientucc" Font-Size="10px" Text='<%# Eval("ClientUCC") %>' Width="80px" runat="server"  ></asp:TextBox>
                                            <asp:HiddenField ID="txtclientucc_hidden" runat="server" Value='<%# Eval("ClientUCC") %>' />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Reason Code TM">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReasonCodeTM" runat="server" Text='<%# Eval("ReasonCodeTM") %>'></asp:Label>
                                        </ItemTemplate>                                        
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtReasonCodeTM" Font-Size="10px" Text='<%# Eval("ReasonCodeTM") %>' Width="180px" ToolTip="Search Reason Code here." onfocus="WaterMarkFocus(this,'Search Reason Code here.')" onblur="WaterMarkBlur(this,'Search Reason Code here.')"
                                                onkeyup="FunRetCodesClients(this,'ShowRetCodesForClients',event)" OnTextChanged="txtReasonCodeTM_TextChanged" runat="server" AutoPostBack="true"></asp:TextBox>
                                            <asp:HiddenField ID="txtReasonCodeTM_hidden" runat="server" Value='<%# Eval("ReasonCodeTM") %>' />
                                            <asp:Label ID="lblID" Visible="false" runat="server" Text='<%# Eval("CCRetentionReason_ID") %>'></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Retained by TM">
                                        <ItemStyle HorizontalAlign="Right" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblRetainedbyTM" runat="server" Text='<%# Eval("RetainedbyTM") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtRetainedbyTM"  Onkeypress="return isNumberKey(event)" 
                                                Width="120px" Text='<%# Eval("RetainedbyTM")%>' 
                                                runat="server" AutoPostBack="true"  
                                                OnTextChanged="txtRetainedbyTM_TextChanged"  style="text-align:right;" >
                                            </asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Reason Code CM">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReasonCodeCM" runat="server" Text='<%# Eval("ReasonCodeCM") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtReasonCodeCM" Font-Size="10px" Text='<%# Eval("ReasonCodeCM") %>' Width="180px" 
                                                onkeyup="FunRetCodesClients(this,'ShowRetCodesForClients',event)" runat="server"  ></asp:TextBox>
                                            <asp:HiddenField ID="txtReasonCodeCM_hidden" runat="server" Value='<%# Eval("ReasonCodeCM") %>' />
                                            <%--<asp:Label ID="lblID" Visible="false" runat="server" Text='<%# Eval("CCRetentionReason_ID") %>'></asp:Label>--%>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Ret By CM">
                                        <ItemStyle HorizontalAlign="Right" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblRetByCM" runat="server" Text='<%# Eval("RetByCM") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtRetByCM"  Onkeypress="return isNumberKey(event)" 
                                                Width="120px" Text='<%# Eval("RetByCM")%>' 
                                                runat="server" AutoPostBack="true"  
                                                OnTextChanged="txtRetByCM_TextChanged"  style="text-align:right;" ></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="RC09 Notes">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRC09Notes" runat="server" Text='<%# Eval("RC09Notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtRC09Notes" Font-Size="10px" Text='<%# Eval("RC09Notes") %>' Width="180px" 
                                                runat="server"  ></asp:TextBox>
                                            <%--<asp:HiddenField ID="txtRC09Notes_hidden" runat="server" Value='<%# Eval("ClientCode") %>' />--%>
                                            <%--<asp:Label ID="lblID" Visible="false" runat="server" Text='<%# Eval("CCRetentionReason_ID") %>'></asp:Label>--%>
                                        </FooterTemplate>
                                    </asp:TemplateField>                                    
                                   <asp:TemplateField>
                                        <ItemTemplate> 
                                        </ItemTemplate>
                                         <FooterTemplate>
                                                <asp:Button ID="btnassign" runat="server" Text="Assign" CommandName="assign" />
                                                                                        </FooterTemplate>
                                    </asp:TemplateField> 
                                </Columns>
                            </asp:GridView>
                            <asp:HiddenField ID="lblRetainedbyTM_hidden" runat="server" />
                            <asp:HiddenField ID="lblRetByCM_hidden" runat="server" />
                            <asp:HiddenField ID="lblReasonCodeTM_hidden" runat="server" />
                            <asp:HiddenField ID="lblReasonCodeCM_hidden" runat="server" />
                            <asp:HiddenField ID="lblclientall_hidden" runat="server" />
                        </ContentTemplate>
                        <Triggers>
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="btnSave" CssClass="btnUpdate" Height="20px" runat="server" Text="Save" OnClick="btnSave_Click" />
                     <asp:Button ID="btnDiscard" CssClass="btnUpdate" Height="20px" runat="server" Text="Discard" OnClick="btnDiscard_Click" />
                </td>
           
            </tr>
            
        </table>
    </div>
    </form>
</body>
</html>
