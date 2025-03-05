<%@ page language="C#" autoeventwireup="true" inherits="Management_MarginRate_Int, App_Web_e81qjzgk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
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

    <script language="javascript" type="text/javascript">
function CallAjax(obj1,obj2,obj3,Query)
         {

        var CombinedQuery=new String(Query);
        ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
       
         }
         
  function FunCallAjaxList(objID,objEvent,ObjType)
        {
        
               var strQuery_Table = '';
               var strQuery_FieldName = '';
               var strQuery_WhereClause = '';
               var strQuery_OrderBy='';
               var strQuery_GroupBy='';
               var CombinedQuery='';
               if(ObjType=='Asset')
                {
               
                     strQuery_Table = "Master_Products";
                     strQuery_FieldName = "distinct top 10 (isnull(Products_Name,''))+'[' + Products_ShortName+']',Products_ID";
                    strQuery_WhereClause = "  ( Products_Name like (\'%RequestLetter%') or Products_ShortName like (\'%RequestLetter%') ) and Products_Producttypeid in (1,5,8,10,21)";
                    
                }
                if(ObjType=='Exchange')
                {
               
                     strQuery_Table = "Master_Exchange";
                     strQuery_FieldName = "distinct top 10 (isnull(exchange_shortname,'')),exchange_id";
                     strQuery_WhereClause = "  ( exchange_shortname like (\'%RequestLetter%') )";
                    
                     }
                if(ObjType=='Broker')
                {
               
                     strQuery_Table = "tbl_master_contact";
                     strQuery_FieldName = "distinct top 10 isnull(rtrim(cnt_firstName),'')+' '+isnull(rtrim(cnt_middlename),'')+' '+isnull(rtrim(cnt_lastName),'')+' ['+isnull(rtrim(cnt_ucc),'')+']' ,cnt_internalID";
                     
                    strQuery_WhereClause = "cnt_internalid like 'BO%' AND (cnt_firstName like (\'%RequestLetter%')  OR cnt_ucc  like (\'%RequestLetter%'))";
                    
                    
                }
                if(ObjType=='Currency')
                {
               
                     strQuery_Table = "Master_Currency";
                     strQuery_FieldName = "distinct top 10 isnull(rtrim(Currency_Name),'')+' ['+isnull(rtrim(Currency_AlphaCode),'')+']' ,Currency_ID";
                     
                    strQuery_WhereClause = " (Currency_Name like (\'%RequestLetter%')  OR Currency_AlphaCode  like (\'%RequestLetter%'))";
                    
                    
                }
                
                
                CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
                
                 ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery));
                 //alert (CombinedQuery);
              
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
// function CallAjax(obj1,obj2,obj3)
//    {
//    
//       // FieldName='ctl00_ContentPlaceHolder1_Headermain1_cmbCompany';
//       ajax_showOptions(obj1,obj2,obj3);
//       //alert (ajax_showOptions);
//    }
  

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
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">ADD/Edit Margin Rate</span></strong>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="gridcellleft" style="background-color:#B7CEEC;width: 150px;">
                        Asset :
                    </td>
                    <td style="width: 200px;">
                        <asp:TextBox ID="txtasset" runat="server" Width="300px"></asp:TextBox>
                        <asp:TextBox ID="txtasset_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                    </td>
                    <td class="gridcellleft" style="background-color:#B7CEEC;width: 150px;">
                        Exchange :
                    </td>
                    <td style="width: 200px; vertical-align: top">
                        <asp:TextBox ID="txtexchange" runat="server" Width="300px"></asp:TextBox>
                        <asp:TextBox ID="txtexchange_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorasset" runat="server" ControlToValidate="txtasset"
                            ErrorMessage="Please Insert Asset" ValidationGroup="a">*</asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorexchange" runat="server" ControlToValidate="txtexchange"
                            ErrorMessage="Please Insert Exchange" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                <tr>
                    <td class="gridcellleft" style="background-color:#B7CEEC;width: 150px;">
                        Calculation Basis :
                    </td>
                    <td style="width: 200px; vertical-align: top;">
                        <asp:DropDownList ID="ddlCalBas" runat="server" Width="300px">
                            <asp:ListItem Selected="true" Text="% Of Mkt Value" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Fixed Per Lot" Value="L"></asp:ListItem>
                            <asp:ListItem Text="Fixed Per Unit" Value="U"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="gridcellleft" style="background-color:#B7CEEC;width: 150px;">
                        Date From :
                    </td>
                    <td style="width: 200px; vertical-align: top;">
                        <dxe:ASPxDateEdit ID="dtExFrom" runat="server" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                            ClientInstanceName="cDtExFrom" UseMaskBehavior="True" Font-Size="13px" Width="300px">
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="background-color:#B7CEEC;width: 150px;">
                        Currency :
                    </td>
                    <td style="width: 210px;">
                        <asp:TextBox ID="txtcurrency" runat="server" Width="300px"></asp:TextBox>
                        <asp:TextBox ID="txtcurrency_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                    </td>
                   <td class="gridcellleft" style="background-color:#B7CEEC;width: 150px;">
                        Initial Margin :
                    </td>
                    <td style="width: 200px; vertical-align: top;">
                        <dxe:ASPxTextBox ID="txtIniMargin" runat="server" Width="300px" ClientInstanceName="ctxtIniMargin"
                            HorizontalAlign="Right" Font-Size="13px" meta:resourcekey="txtdebitResource1">
                            <validationsettings errordisplaymode="None"></validationsettings>
                            <masksettings mask="<0..9999999g>.<0..99>" includeliterals="DecimalSymbol" />
                        </dxe:ASPxTextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcurrency"
                            ErrorMessage="Please Insert Currency" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="background-color:#B7CEEC;width: 150px;">
                        Exposure Margin Rate :
                    </td>
                    <td style="width: 200px; vertical-align: top;">
                         <dxe:ASPxTextBox ID="txtExMarRate" runat="server" Width="300px" ClientInstanceName="ctxtExMarRate"
                            HorizontalAlign="Right" Font-Size="13px" meta:resourcekey="txtdebitResource1">
                            <validationsettings errordisplaymode="None"></validationsettings>
                            <masksettings mask="<0..9999999g>.<0..99>" includeliterals="DecimalSymbol" />
                        </dxe:ASPxTextBox>
                        
                    </td>
                    <td class="gridcellleft" style="background-color:#B7CEEC;width: 150px;">
                        Add. Long Margin :
                    </td>
                    <td style="width: 200px; vertical-align: top;">
                     <dxe:ASPxTextBox ID="txtAddLongMargin" runat="server" Width="300px" ClientInstanceName="ctxtAddLongMargin"
                            HorizontalAlign="Right" Font-Size="13px" meta:resourcekey="txtdebitResource1">
                            <validationsettings errordisplaymode="None"></validationsettings>
                            <masksettings mask="<0..9999999g>.<0..99>" includeliterals="DecimalSymbol" />
                        </dxe:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="background-color:#B7CEEC;width: 150px;">
                        Add. Short Margin :
                    </td>
                    <td style="width: 200px; vertical-align: top;">
                    <dxe:ASPxTextBox ID="txtAddShortMargin" runat="server" Width="300px" ClientInstanceName="ctxtAddShortMargin"
                            HorizontalAlign="Right" Font-Size="13px" meta:resourcekey="txtdebitResource1">
                            <validationsettings errordisplaymode="None"></validationsettings>
                            <masksettings mask="<0..9999999g>.<0..99>" includeliterals="DecimalSymbol" />
                        </dxe:ASPxTextBox>
                    </td>
                    <td class="gridcellleft" style="background-color:#B7CEEC;width: 150px;">
                        Open Exposure Interest Rate :
                    </td>
                    <td style="width: 200px; vertical-align: top;">
                     <dxe:ASPxTextBox ID="txtExpIntRate" runat="server" Width="300px" ClientInstanceName="ctxtExpIntRate"
                            HorizontalAlign="Right" Font-Size="13px" meta:resourcekey="txtdebitResource1">
                            <validationsettings errordisplaymode="None"></validationsettings>
                            <masksettings mask="<0..9999999g>.<0..9999>" includeliterals="DecimalSymbol" />
                        </dxe:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="background-color:#B7CEEC;width: 150px;">
                        Apply LIBOR To Int.Rate :
                    </td>
                    <td style="width: 200px; vertical-align: top;">
                        <asp:DropDownList ID="ddlLibor" runat="server" Width="300px">
                            <asp:ListItem Selected="true" Text="Apply" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="Do Not Apply" Value="No"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

            </table>
            <table>
                <tr>
                    <td style="width: 500px;">
                        &nbsp;
                    </td>
                    <td align="right" id="td_yes" runat="server" style="width: 40px;">
                        <asp:Button ID="btnYes" runat="server" CssClass="btn" Text="Save" Width="120px" OnClick="btnYes_Click"
                            ValidationGroup="a" />
                    </td>
                    <td style="width: 20px;">
                        &nbsp;
                    </td>
                    <td align="right" id="td_no" runat="server" style="width: 40px;">
                        <asp:Button ID="btnNo" runat="server" CssClass="btn" Text="Cancel" Width="120px"
                            OnClick="btnNo_Click" />
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="gridcellleft" style="background-color:#B7CEEC;width: 250px;">
                        <asp:ValidationSummary ID="validate" ValidationGroup="a" runat="server" ShowSummary="true" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
