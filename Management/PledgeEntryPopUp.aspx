<%@ page language="C#" autoeventwireup="true" inherits="management_PledgeEntryPopUp, App_Web_rtil2eyr" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Pledged Portfolio Stocks</title>
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
            document.getElementById('txtProduct').focus();
            Show('td_Show');
            Hide('td_Update');
        }
        function PageLoad_Edit()
        {
            document.getElementById('txtProduct').focus();
            Hide('td_Show');
            Show('td_Update');
        }
       function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
        function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
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
             if(obj=='4')
             {
                alert('Please Select Product !!');
             }
             else
             {
                if(obj=='1')
                    alert('Pledged Portfolio Stocks Entry Successfully !!');
                if(obj=='2')
                    alert('Pledged Portfolio Stocks Modify Successfully !!');   
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
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Product:
                            </td>
                            <td>
                                <asp:TextBox ID="txtProduct" runat="server" Width="200px" Font-Size="10px" onkeyup="ajax_showOptions(this,'ShowClientFORMarginStocks',event,'Product')"></asp:TextBox>
                            </td>
                            <td style="display: none;">
                                <asp:TextBox ID="txtProduct_hidden" runat="server" Width="5px"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <table>
                        <tr>
                            <td>
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr valign="top">
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Purchase Date :</td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="DtPurchaseDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="150px" ClientInstanceName="DtPurchaseDate">
                                                <dropdownbutton text="For">
                                        </dropdownbutton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr valign="top">
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Quantity :</td>
                                        <td>
                                            <asp:TextBox ID="txtQuantity" Onkeypress="return isNumberKey(event)" Width="100px"
                                                Font-Size="10px" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
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
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr valign="top">
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Pledge Date :</td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="DtPledgeDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="150px" ClientInstanceName="DtPledgeDate">
                                                <dropdownbutton text="For">
                                        </dropdownbutton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr valign="top">
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Un-Pledge Date :</td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="DtUnPledgeDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="150px" ClientInstanceName="DtUnPledgeDate">
                                                <dropdownbutton text="For">
                                        </dropdownbutton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
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
                                Pledgee With:</td>
                            <td>
                                <asp:TextBox ID="txtPledgee" runat="server" TextMode="MultiLine" Width="250px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td id="td_Show">
                                <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Save"
                                    Width="100px" OnClick="btnshow_Click" /></td>
                            <td id="td_Update">
                                <asp:Button ID="btnUpdate" runat="server" CssClass="btnUpdate" Height="20px" Text="Update"
                                    Width="100px" OnClick="btnUpdate_Click" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
