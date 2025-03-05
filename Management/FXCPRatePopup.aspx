<%@ page language="C#" autoeventwireup="true" inherits="management_FXCPRatePopup, App_Web_mzqu16me" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
        Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <%--<link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />--%>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <%--<script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>--%>

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
    
    <%--New Work--%>
    <script language="javascript" type="text/javascript">
    function myFocus()
       {
          document.form1.txtFromCurrency.focus();
       }
    </script>
    <%--End of New Work--%>
    
    <script language="javascript" type="text/javascript">
    function CallAjax(obj1,obj2,obj3,Query)
    {
        var CombinedQuery=new String(Query);
        ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');       
    }
         
   function replaceChars(entry) 
   {
        out = "+"; // replace this
        add = "--"; // with this
        temp = "" + entry; // temporary holder

        while (temp.indexOf(out)>-1) {
        pos= temp.indexOf(out);
        temp = "" + (temp.substring(0, pos) + add + 
        temp.substring((pos + out.length), temp.length));
        }
        return temp;
    } 
  

    FieldName='none';
    function SignOff()
    {
        window.parent.SignOff();
    }    
      
    function displayrate()
    {
      document.getElementById("trrate").style.display = "inline";
    }
    
    function noNumbers(e)
    {
    //alert (e);
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
                //alert (keynum);
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
    function height()
    {
        if(document.body.scrollHeight>=300)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '300px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    
     function FillValues(obj)
    {
        parent.editwin.close(obj);      
    }
    
    </script>

</head>
<body onload="myFocus()" style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">ADD/Edit FX Coversion Premium Rates Mapping</span></strong>
                    </td>
                </tr>
            </table>
            <table width="750px" align="center" style="border: solid 1px white;">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    <asp:ValidationSummary ID="validate" ValidationGroup="a" runat="server" ShowSummary="true" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 120px;">
                                    From Currency :
                                </td>
                                <td style="width: 210px;">
                                    <asp:TextBox ID="txtFromCurrency" runat="server" Width="205px"></asp:TextBox>
                                    <asp:TextBox ID="txtFromCurrency_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                </td>
                                <td style="width: 2px; ">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFromCurrency" runat="server" ControlToValidate="txtFromCurrency"
                                        ErrorMessage="Please Select From Currency" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 120px;">
                                    To Currency :
                                </td>
                                <td style="width: 210px; vertical-align: top">
                                    <asp:TextBox ID="txtToCurrency" runat="server" Width="205px"></asp:TextBox>
                                    <asp:TextBox ID="txtToCurrency_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorToCurrency" runat="server" ControlToValidate="txtToCurrency"
                                        ErrorMessage="Please Select To Currency" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>                
                        <table>
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 120px;">
                                    Rate Date :
                                </td>
                                <td style="text-align: left; width: 164px;">
                                    <dxe:ASPxDateEdit ID="DtAddRateDate" runat="server" ClientEnabled="True" EditFormat="Custom" EditFormatString="dd-MM-yyyy" 
                                    ClientInstanceName="cDtAddRateDate" DateOnError="Today" UseMaskBehavior="True" Width="205px">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ControlToValidate="DtAddRateDate"
                                        ErrorMessage="Please Select Rate Date" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 1px;">
                                &nbsp;
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 120px;">
                                    FX Premium Profit Rate :
                                </td>
                                <td style="width: 110px;">
                                    <asp:TextBox ID="txtFXPPRate" runat="server" Width="205px" onkeypress="return noNumbers(event)"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFXPPRate" runat="server" ControlToValidate="txtFXPPRate"
                                        ErrorMessage="Please Insert FX Premium Profit Rate" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>                
                    </td>                
                </tr>
                
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 120px;">
                                    FX Premium Loss Rate :
                                </td>
                                <td style="width: 110px;">
                                    <asp:TextBox ID="txtFXPLRate" runat="server" Width="205px" onkeypress="return noNumbers(event)"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFXPLRate" runat="server" ControlToValidate="txtFXPLRate"
                                        ErrorMessage="Please Insert FX Premium Loss Rate" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td style="width: 500px;">
                                    &nbsp;
                                </td>
                                <td align="right" id="td_yes" runat="server" style="width: 40px;">
                                    <asp:Button ID="btnSave" runat="server" CssClass="btn" Text="Save" Width="120px" OnClick="btnSave_Click" AccessKey="S"
                                        ValidationGroup="a" />
                                </td>
                                <td style="width: 20px;">
                                    &nbsp;
                                </td>
                                <td align="right" id="td_no" runat="server" style="width: 40px;">
                                    <asp:Button ID="btnCancel" runat="server" CssClass="btn" Text="Cancel" Width="120px" AccessKey="C"
                                        OnClick="btnCancel_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
