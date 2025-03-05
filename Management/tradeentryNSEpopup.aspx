<%@ page language="C#" autoeventwireup="true" inherits="management_tradeentryNSEpopup, App_Web_n3rnr3dz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Trades Entry</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
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
        function PageLoad_Add()
        {
            document.getElementById('txtorderno').focus();
		    document.getElementById('btnshow').disabled=false;
           
            Show('tr_clientbuy');
            Show('tr_clientsell');
            Show('td_show');
            Hide('td_Update');
        }
        function PageLoad_Edit(objcategory)
        {
            document.getElementById('txtorderno').focus();
            if(objcategory=='2')
                document.getElementById('ddlremarks').value="OTHER";
            Hide('tr_clientbuy');
            Hide('tr_clientsell');
            Hide('td_show');
            Show('td_Update');
        }
      
       
       function cmbchangebuy()
      {
      
            var sell=document.getElementById('cmbSoldTo').value;
            if(sell=='Exchange')
            {
                   document.getElementById('cmbBoughtfrom').value='Clients';
                   Hide('txtsell');
                   document.getElementById('txtsell_hidden').value='';
            }
            if(document.getElementById('cmbBoughtfrom').value=='Clients')
            {
                   Show('txtbuy');
            }
            if(document.getElementById('cmbBoughtfrom').value=='Exchange')
            {
                  Hide('txtbuy');
                  document.getElementById('txtbuy_hidden').value='';
            }
         
      }
     function cmbchangesell()
      {
     
        var buy=document.getElementById('cmbBoughtfrom').value;
            if(buy=='Exchange')
            {
                  document.getElementById('cmbSoldTo').value='Clients';
                  Hide('txtbuy');
                  document.getElementById('txtbuy_hidden').value='';
                  
            }
            if(document.getElementById('cmbSoldTo').value=='Clients')
            {
                  Show('txtsell');
            }
            if(document.getElementById('cmbSoldTo').value=='Exchange')
            {
                  Hide('txtsell');
                  document.getElementById('txtsell_hidden').value='';
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
      function fn_callajaxclientto(objID,objListFun,objEvent,objCreteria)
       {
            if(objCreteria=='buy')
            {
                 if(document.getElementById('txtsell').value=='')
                     objCreteria='Clients';
                else
                    objCreteria='ClientsNotIn'+'~'+"'"+document.getElementById('txtsell_hidden').value+"'"; 
            }
            if(objCreteria=='sell')
            {
                if(document.getElementById('txtbuy').value=='')
                     objCreteria='Clients';
                else
                    objCreteria='ClientsNotIn'+'~'+"'"+document.getElementById('txtbuy_hidden').value+"'"; 
            } 
           
           ajax_showOptions(objID,objListFun,objEvent,objCreteria);
      }  
      function fn_callscripajax(objID,objListFun,objEvent,objCreteria)
       {
           
             var date2=null;
             var date1 = dtfor.GetDate();
             if(date1 != null) 
             {
               date2 =parseInt(date1.getMonth()+1)+'-'+date1.getDate()+'-'+ date1.getFullYear();
             }
             var criteritype='B';
             criteritype=' AND Equity_EffectUntil>="'+date2+'"  ';
             criteritype=criteritype.replace('"',"'");
             criteritype=criteritype.replace('"',"'");
             objCreteria=objCreteria+'~'+'Date'+'~'+criteritype;
            ajax_showOptions(objID,objListFun,objEvent,objCreteria);
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
        function closepopup(obj)
        {
             if(obj=='3')
             {
                alert('Please Select Clients !!');
             }
             else
             {
                 if(obj=='1')
                    alert('Trade Entry Successfully !!');
                if(obj=='2')
                    alert('Trade Modify Successfully !!');   
                parent.editwin.close();
             }
		        document.getElementById('btnshow').disabled=false;

        } 
         FieldName='lstSlection'; 
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
    <div>   <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
        <table>
            <tr>
                <td>
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr valign="top">
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Order No. :</td>
                            <td>
                                <asp:TextBox ID="txtorderno" runat="server" Width="100px" TabIndex="0"></asp:TextBox>
                            </td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Trade No. :</td>
                            <td>
                                <asp:TextBox ID="txttradeno" runat="server" Width="100px" TabIndex="0"></asp:TextBox>
                            </td>
                        </tr>
                       
                    </table>
                </td>
            </tr>
           
            <tr>
                <td>
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr valign="top">
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Instrument :</td>
                            <td>
                                <asp:TextBox ID="txtInstrument" runat="server" Width="280px" onkeyup="fn_callscripajax(this,'ShowClientFORMarginStocks',event,'ScripsExchange')" TabIndex="0"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr valign="top">
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Quantity :</td>
                            <td>
                                <asp:TextBox ID="txtqty" Onkeypress="return isNumberKey(event)" Width="100px" runat="server" TabIndex="0"></asp:TextBox>
                            </td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Market Rate :</td>
                            <td>
                                <asp:TextBox ID="txtrate" TabIndex="0" Onkeypress="return isNumberKey(event)" Width="100px" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr >
                <td>
                    <table>
                        <tr>
                            <td>
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr valign="top" id="tr_clientbuy">
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 40%;">
                                            Bought From :</td>
                                        <td>
                                            <asp:DropDownList ID="cmbBoughtfrom" runat="server" Font-Size="11px" Width="100px"
                                                onchange="cmbchangebuy()" TabIndex="0">
                                                <asp:ListItem>Clients</asp:ListItem>
                                                <asp:ListItem>Exchange</asp:ListItem>
                                                
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtbuy" runat="server" TabIndex="0" Width="200px" onkeyup="fn_callajaxclientto(this,'ShowClientFORMarginStocks',event,'buy')"></asp:TextBox></td>
                                    </tr>
                                    <tr valign="top" id="tr_clientsell">
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 40%;">
                                            Sold To :</td>
                                        <td>
                                            <asp:DropDownList ID="cmbSoldTo" TabIndex="0" runat="server" Font-Size="11px" Width="100px" onchange="cmbchangesell()">
                                                <asp:ListItem>Clients</asp:ListItem>
                                                <asp:ListItem>Exchange</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtsell" TabIndex="0" runat="server" Width="200px" onkeyup="fn_callajaxclientto(this,'ShowClientFORMarginStocks',event,'sell')"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                       <td colspan="3"> <table><tr><td class="gridcellleft" bgcolor="#B7CEEC">
                                            Brokerage :</td>
                                        <td>
                                            <asp:DropDownList ID="ddlremarks" TabIndex="0" runat="server" Font-Size="11px" Width="100px"
                                                >
                                                <asp:ListItem Value="0BRKG">Zero Brkg</asp:ListItem>
                                                <asp:ListItem Value="OTHER">Nornal</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Trade Category :</td>
                                        <td id="td_txtcategiry">
                                            <asp:TextBox runat="server" TabIndex="0" Width="200px" Font-Size="10px" ID="txtCategory" MaxLength="3"></asp:TextBox></td></tr></table></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
           
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td id="td_show">
                                <asp:Button ID="btnshow" TabIndex="0" runat="server" CssClass="btnUpdate" Height="20px" Text="Save"
                                    Width="100px" OnClick="btnshow_Click" /></td>
                            <td  id="td_Update">
                                <asp:Button ID="btnUpdate" TabIndex="0" runat="server" CssClass="btnUpdate" Height="20px" Text="Update"
                                    Width="100px" OnClick="btnUpdate_Click" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="display: none;">
                <td>
                    <asp:TextBox ID="txtInstrument_hidden" runat="server" Width="5px"></asp:TextBox>
                    <asp:TextBox ID="txtbuy_hidden" runat="server" Width="5px"></asp:TextBox>
                    <asp:TextBox ID="txtsell_hidden" runat="server" Width="5px"></asp:TextBox>
                    <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                        Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                        <DropDownButton Text="For">
                        </DropDownButton>
                    </dxe:ASPxDateEdit>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
