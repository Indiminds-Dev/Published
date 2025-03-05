<%@ page language="C#" autoeventwireup="true" inherits="Management_DutyRates_Int, App_Web_n3rnr3dz" %>

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
                    strQuery_WhereClause = "  ( Products_Name like (\'%RequestLetter%') or Products_ShortName like (\'%RequestLetter%') ) and Products_Producttypeid in (5,8,10,21)";
                    
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
                        <strong><span style="color: #000099">Inter-Exchange Duty Rates</span></strong>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                     <td class="gridcellleft" style="background-color: #B7CEEC; width: 150px;">
                        Date :
                    </td>
                    <td style="width: 200px; vertical-align: top;">
                        <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                            ClientInstanceName="cDtDate" UseMaskBehavior="True" Font-Size="13px" Width="300px">
                        </dxe:ASPxDateEdit>
                    </td>
                    <td class="gridcellleft" style="background-color: #B7CEEC; width: 150px;">
                        Asset :
                    </td>
                    <td style="width: 200px;">
                        <asp:TextBox ID="txtasset" runat="server" Width="300px"></asp:TextBox>
                        <asp:TextBox ID="txtasset_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="background-color: #B7CEEC; width: 150px;">
                        Exchange From:
                    </td>
                    <td style="width: 200px; vertical-align: top">
                        <asp:TextBox ID="txtexchangefrom" runat="server" Width="300px"></asp:TextBox>
                        <asp:TextBox ID="txtexchangefrom_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                    </td>
                     <td class="gridcellleft" style="background-color: #B7CEEC; width: 150px;">
                        Exchange To:
                    </td>
                    <td style="width: 200px; vertical-align: top">
                        <asp:TextBox ID="txtexchangeto" runat="server" Width="300px"></asp:TextBox>
                        <asp:TextBox ID="txtexchangeto_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtexchangefrom"
                            ErrorMessage="Please Insert Exchange From" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtexchangeto"
                            ErrorMessage="Please Insert Exchange To" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="background-color: #B7CEEC; width: 150px;">
                        Rate :
                    </td>
                    <td style="width: 200px; vertical-align: top;">
                        <dxe:ASPxSpinEdit ID="txtRate" ClientInstanceName="ctxtRate" Width="300px" runat="server"
                            DecimalPlaces="10" MinValue="0" MaxValue="99999999.9999999999" NullText="00000000.0000000000">
                            <spinbuttons showincrementbuttons="true" />
                        </dxe:ASPxSpinEdit>
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
