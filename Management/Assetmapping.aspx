<%@ page language="C#" autoeventwireup="true" inherits="management_Assetmapping, App_Web_zsukfi_p" %>

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
    
    <%--New Work--%>
    <script language="javascript" type="text/javascript">
    function myFocus()
       {
          document.form1.txtasset.focus();
       }
    </script>
    <%--End of New Work--%>
    
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
<body onload="myFocus()" style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">ADD/Edit Asset Mapping</span></strong>
                    </td>
                </tr>
            </table>
            <%--New Work--%>
            <%--<table width="750px" align="center" style="border: solid 1px white;">--%>
            <table width="1000px" align="center" style="border: solid 1px white;">            
            <%--End of New Work--%>
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
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    Asset :
                                </td>
                                <td style="width: 210px;">
                                    <asp:TextBox ID="txtasset" runat="server" Width="205px"></asp:TextBox>
                                    <asp:TextBox ID="txtasset_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                </td>
                                <td style="width: 2px; ">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorasset" runat="server" ControlToValidate="txtasset"
                                        ErrorMessage="Please Insert Asset" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    Exchange :
                                </td>
                                <td style="width: 210px; vertical-align: top">
                                    <asp:TextBox ID="txtexchange" runat="server" Width="205px"></asp:TextBox>
                                    <asp:TextBox ID="txtexchange_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorexchange" runat="server" ControlToValidate="txtexchange"
                                        ErrorMessage="Please Insert Exchange" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                                <%--New Work--%>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;display: none;">
                                    Broker :
                                </td>
                                <td style="width: 0px; vertical-align: top;">
                                    <asp:TextBox ID="txtbroker" runat="server" Width="200px" Style="display: none"></asp:TextBox>
                                    <asp:TextBox ID="txtbroker_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 85px;">
                                    Quote Currency :
                                </td>
                                
                                <td style="width: 196px;">
                                    <asp:TextBox ID="txtcurrency" runat="server" Width="190px" ></asp:TextBox>
                                    <asp:TextBox ID="txtcurrency_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorcurr" runat="server" ControlToValidate="txtcurrency"
                                        ErrorMessage="Please Insert Currency" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                                <%--<td class="gridcellleft" bgcolor="#B7CEEC" style="width: 190px;">
                                    RTS/AOne/CQG/ATIN Code :
                                </td>
                                <td style="width: 120px; vertical-align: top;">
                                    <asp:TextBox ID="txtRtsCode" runat="server" Width="120px" ></asp:TextBox>
                                </td>--%>
                                <%--End of New Work--%>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--New Work--%>
                <tr>
                    <td>                
                        <table>
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    Trade Lot :
                                </td>
                                <td style="width: 110px;">
                                    <asp:TextBox ID="txttrdlot" runat="server" Width="100px" onkeypress="return noNumbers(event)"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortrdlot" runat="server" ControlToValidate="txttrdlot"
                                        ErrorMessage="Please Insert TradeLot" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 87px; vertical-align: top;">
                                    <asp:DropDownList ID="drpdownuom" runat="server" Width="70px" Font-Size="12px">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 1px;">
                                &nbsp;
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    Quote Lot:
                                </td>
                                <td style="width: 110px;">
                                    <asp:TextBox ID="txtqlot" runat="server" Width="100px" onkeypress="return noNumbers(event)"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorqlot" runat="server" ControlToValidate="txtqlot"
                                        ErrorMessage="Please Insert QuoteLot" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 100px; vertical-align: top;">
                                    <asp:DropDownList ID="dropdownuomqot" runat="server" Width="78px" Font-Size="12px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>                
                    </td>                
                </tr>  
                <%--End of New Work--%>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <%--New Work--%>
                                <%--<td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    Broker :
                                </td>
                                <td style="width: 210px; vertical-align: top;">
                                    <asp:TextBox ID="txtbroker" runat="server" Width="200px" ></asp:TextBox>
                                    <asp:TextBox ID="txtbroker_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                &nbsp;
                                </td>--%>
                                 <%--<td style="width: 95px;">
                                &nbsp;
                                </td>--%>
                                <%--<td class="gridcellleft" bgcolor="#B7CEEC" style="width: 150px;">
                                    RTS/AOne/CQG/ATIN Code :
                                </td>
                                <td style="width: 120px; vertical-align: top;">
                                    <asp:TextBox ID="txtRtsCode" runat="server" Width="120px" ></asp:TextBox>
                                </td>--%>
                                <%--<td class="gridcellleft" bgcolor="#B7CEEC" style="width: 85px;">
                                    Quote Currency :
                                </td>
                                
                                <td style="width: 196px;">
                                    <asp:TextBox ID="txtcurrency" runat="server" Width="190px" ></asp:TextBox>
                                    <asp:TextBox ID="txtcurrency_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorcurr" runat="server" ControlToValidate="txtcurrency"
                                        ErrorMessage="Please Insert Currency" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>--%>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    Asset Code :
                                </td>
                                <td style="width: 120px; vertical-align: top;">                                   
                                    <asp:TextBox ID="txtastcode" runat="server" Width="109"></asp:TextBox>                                   
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorastcode" runat="server" ControlToValidate="txtastcode"
                                        ErrorMessage="Please Insert AssetCode" ValidationGroup="a">*</asp:RequiredFieldValidator>                                        
                                </td>
                                <td style="width: 92px;">
                                &nbsp;
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 190px;">
                                    RTS/AOne/CQG/ATIN Code :
                                </td>
                                <td style="width: 120px; vertical-align: top;">
                                    <asp:TextBox ID="txtRtsCode" runat="server" Width="190px" ></asp:TextBox>
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 190px;">
                                    X-Trader/PAT Code :
                                </td>
                                <td style="width: 120px; vertical-align: top;">
                                    <asp:TextBox ID="txtXTrade" runat="server" Width="100px" ></asp:TextBox>
                                    
                                     <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtXTrade"
                                        ErrorMessage=" Please Insert X-Trader Code " ValidationGroup="a">*</asp:RequiredFieldValidator>--%>
                                </td>
                                <%--End of New Work--%>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--New Work--%>
                <%--<tr>
                <td>
                
                <table>
                            <tr>--%>
                                <%--New Work--%>
                                <%--<td class="gridcellleft" bgcolor="#B7CEEC" style="width: 100px;">
                                    Asset Code :
                                </td>
                                <td style="width: 120px; vertical-align: top;">
                                   
                                    <asp:TextBox ID="txtastcode" runat="server" Width="100px"></asp:TextBox>
                                   
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorastcode" runat="server" ControlToValidate="txtastcode"
                                        ErrorMessage="Please Insert AssetCode" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                        
                                </td>--%>
                                 <%--<td class="gridcellleft" bgcolor="#B7CEEC" style="width: 100px;">
                                    RTS/AOne/CQG/ATIN Code :
                                </td>
                                <td style="width: 120px; vertical-align: top;">
                                    <asp:TextBox ID="txtRtsCode" runat="server" Width="100px" ></asp:TextBox>--%>
                                    
                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtRtsCode"
                                        ErrorMessage="Please Insert RTS/AOne/CQG/ATIN Code" ValidationGroup="a">*</asp:RequiredFieldValidator>--%>
                                <%--</td>--%>                                
                                <%--<td class="gridcellleft" bgcolor="#B7CEEC" style="width: 85px;">
                                    X-Trader Code :
                                </td>
                                <td style="width: 120px; vertical-align: top;">
                                    <asp:TextBox ID="txtXTrade" runat="server" Width="100px" ></asp:TextBox>--%>
                                    
                                     <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtXTrade"
                                        ErrorMessage=" Please Insert X-Trader Code " ValidationGroup="a">*</asp:RequiredFieldValidator>--%>
                                <%--</td>--%>                                
                                <%--<td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    Trade Lot :
                                </td>
                                <td style="width: 110px;">
                                    <asp:TextBox ID="txttrdlot" runat="server" Width="100px" onkeypress="return noNumbers(event)"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortrdlot" runat="server" ControlToValidate="txttrdlot"
                                        ErrorMessage="Please Insert TradeLot" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 87px; vertical-align: top;">
                                    <asp:DropDownList ID="drpdownuom" runat="server" Width="70px" Font-Size="12px">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 1px;">
                                &nbsp;
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    Quote Lot:
                                </td>
                                <td style="width: 110px;">
                                    <asp:TextBox ID="txtqlot" runat="server" Width="100px" onkeypress="return noNumbers(event)"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorqlot" runat="server" ControlToValidate="txtqlot"
                                        ErrorMessage="Please Insert QuoteLot" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 100px; vertical-align: top;">
                                    <asp:DropDownList ID="dropdownuomqot" runat="server" Width="78px" Font-Size="12px">
                                    </asp:DropDownList>
                                </td>--%>
                                <%--End of New Work--%>
                            <%--</tr>
                        </table>                
                </td>                
                </tr>     --%>
                <%--End of New Work--%>    
                <%--New Work--%>
                <%--<tr>
                    <td>
                        <table>
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    Trade Lot :
                                </td>
                                <td style="width: 110px;">
                                    <asp:TextBox ID="txttrdlot" runat="server" Width="100px" onkeypress="return noNumbers(event)"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortrdlot" runat="server" ControlToValidate="txttrdlot"
                                        ErrorMessage="Please Insert TradeLot" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 92px; vertical-align: top;">
                                    <asp:DropDownList ID="drpdownuom" runat="server" Width="70px" Font-Size="12px">
                                    </asp:DropDownList>
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    Quote Lot:
                                </td>
                                <td style="width: 110px;">
                                    <asp:TextBox ID="txtqlot" runat="server" Width="100px" onkeypress="return noNumbers(event)"></asp:TextBox>
                                </td>
                                <td style="width: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorqlot" runat="server" ControlToValidate="txtqlot"
                                        ErrorMessage="Please Insert QuoteLot" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 100px; vertical-align: top;">
                                    <asp:DropDownList ID="dropdownuomqot" runat="server" Width="70px" Font-Size="12px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>--%>
                                
                <tr>
                    <td>
                        <table id="Table1" runat="server">
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    <asp:Label ID="lblAarnaCode" runat="server" Text="Aarna Code :"></asp:Label>
                                </td>
                                <td>                       
                                    <asp:TextBox ID="txtAarnaCode" runat="server" Width="100px" MaxLength="10"></asp:TextBox>                      
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    <asp:Label ID="lblBerkCode" runat="server" Text="Berk Code :"></asp:Label>
                                </td>
                                <td>                       
                                    <asp:TextBox ID="txtBerkCode" runat="server" Width="100px" MaxLength="10"></asp:TextBox>                      
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    <asp:Label ID="lblPhillipCode" runat="server" Text="Phillip Code :"></asp:Label>
                                </td>
                                <td>                       
                                    <asp:TextBox ID="txtPhillipCode" runat="server" Width="100px" MaxLength="10"></asp:TextBox>                      
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    <asp:Label ID="lblDGCXCode" runat="server" Text="DGCX Code :"></asp:Label>
                                </td>
                                <td>                       
                                    <asp:TextBox ID="txtDGCXCode" runat="server" Width="100px" MaxLength="10"></asp:TextBox>                      
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    <asp:Label ID="lblOrientCode" runat="server" Text="Orient Code :"></asp:Label>
                                </td>
                                <td>                       
                                    <asp:TextBox ID="txtOrientCode" runat="server" Width="100px" MaxLength="10"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <table id="Table2" runat="server">
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    <asp:Label ID="lblBPICode" runat="server" Text="BPI Code :"></asp:Label>
                                </td>
                                <td>                       
                                    <asp:TextBox ID="txtBPICode" runat="server" Width="100px" MaxLength="10"></asp:TextBox>                      
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    <asp:Label ID="lblEDFCode" runat="server" Text="EDF Code :"></asp:Label>
                                </td>
                                <td>                       
                                    <asp:TextBox ID="txtEDFCode" runat="server" Width="100px" MaxLength="10"></asp:TextBox>                      
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    <asp:Label ID="lblNseFOCode" runat="server" Text="NseFO Code :"></asp:Label>
                                </td>
                                <td>                       
                                    <asp:TextBox ID="txtNseFOCode" runat="server" Width="100px" MaxLength="20"></asp:TextBox>                      
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    <asp:Label ID="lblNseCDCode" runat="server" Text="NseCD Code :"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNseCDCode" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    <asp:Label ID="lblMCXCode" runat="server" Text="MCX Code :"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMCXCode" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--End of New Work--%>

                <%--New Work 13Feb2023--%>
                <tr>
                    <td>
                        <table id="Table3" runat="server">
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 70px;">
                                    <asp:Label ID="lblKGICode" runat="server" Text="KGI Code :"></asp:Label>
                                </td>
                                <td>                       
                                    <asp:TextBox ID="txtKGICode" runat="server" Width="100px" MaxLength="10"></asp:TextBox>                      
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--End Of New Work 13Feb2023--%>
                
                <tr>
                    <td>
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
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
