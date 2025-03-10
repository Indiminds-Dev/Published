<%@ page language="C#" autoeventwireup="true" inherits="management_tradeentrycommpopup, App_Web_lyh0nvfl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" >
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
		    document.getElementById('BtnUpdateAdd').disabled=false;
           
            Show('tr_clientbuy');
            Show('tr_clientsell');
          
            document.getElementById("BtnUpdateAdd").value ="Add";
            
        }
        function PageLoad_Edit(objcategory)
        {
            document.getElementById('txtorderno').focus();
            if(objcategory=='2')
                document.getElementById('ddlremarks').value="OTHER";
            Hide('tr_clientbuy');
            Hide('tr_clientsell');
            document.getElementById("BtnUpdateAdd").value="Update";
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
      function FunCallAjaxList(objID,objEvent,ObjType,ObjClient)
        {
               var strQuery_Table = '';
               var strQuery_FieldName = '';
               var strQuery_WhereClause = '';
               var strQuery_OrderBy='';
               var strQuery_GroupBy='';
               var CombinedQuery='';
            
            if (ObjType=='Scrip')
            {
                var j=window.location.search.substring(1).split('&');
                var k=j[0].split('=');
                
                var ExchangeSegmentid='<%=Session["ExchangeSegmentID"]%>';
                strQuery_Table = "(select (case when isnull(commodity_StrikePrice,0)=0.0 then isnull(rtrim(ltrim(commodity_TickerSymbol)),'')+' '+isnull(rtrim(ltrim(Commodity_TickerSeries)),isnull(rtrim(ltrim(Commodity_Tickerseries)),''))+' '+isnull(convert(varchar(9),commodity_ExpiryDate,6),'') else isnull(rtrim(ltrim(commodity_TickerSymbol)),'')+' '+isnull(rtrim(ltrim(Commodity_TickerSeries)),isnull(rtrim(ltrim(Commodity_Tickerseries)),''))+' '+isnull(convert(varchar(9),commodity_ExpiryDate,6),'')+' '+cast(cast(round(commodity_StrikePrice,2) as numeric(28,2)) as varchar) end) as TickerSymbol,Commodity_ProductSeriesID from Master_commodity  WHERE commodity_ExchangeSegmentID='" + ExchangeSegmentid + "' and Commodity_ExpiryDate>='"+k[1]+"')as tb";
                strQuery_FieldName = " distinct top 10 TickerSymbol,Commodity_ProductSeriesID";
                strQuery_WhereClause = " (TickerSymbol like (\'RequestLetter%') )";
            } 
            else
            { 
                if(ObjClient=="Buy")
                {
                     strQuery_Table = "tbl_master_contact,tbl_master_branch ,tbl_master_contactexchange";
                     strQuery_FieldName = "distinct top 10 isnull(rtrim(cnt_firstName),'')+' '+isnull(rtrim(cnt_middlename),'')+' '+isnull(rtrim(cnt_lastName),'')+' ['+isnull(rtrim(crg_tcode),'')+'] ['+isnull(rtrim( BRANCH_DESCRIPTION),'')+']' ,cnt_internalID ";
                     
                     if(document.getElementById('txtsell_hidden').value=='')
                       strQuery_WhereClause = " cnt_branchid=branch_id and crg_cntid=cnt_internalid and crg_exchange='"+document.getElementById('litSegmentMain').value+"' and cnt_internalid like 'CL%' and (crg_tcode like (\'RequestLetter%') or CNT_FIRSTNAME like (\'RequestLetter%')) and branch_id in (<%=Session["userbranchHierarchy"]%>)";
                     else
                       strQuery_WhereClause = " cnt_branchid=branch_id and crg_cntid=cnt_internalid and crg_cntid<>'"+document.getElementById('txtbuy_hidden').value+"' and crg_exchange='"+document.getElementById('litSegmentMain').value+"' and cnt_internalid like 'CL%' and (crg_tcode like (\'RequestLetter%') or CNT_FIRSTNAME like (\'RequestLetter%')) and branch_id in (<%=Session["userbranchHierarchy"]%>)";
                }
               if(ObjClient=="Sell")
                {
                     strQuery_Table = "tbl_master_contact,tbl_master_branch ,tbl_master_contactexchange";
                     strQuery_FieldName = "distinct top 10 isnull(rtrim(cnt_firstName),'')+' '+isnull(rtrim(cnt_middlename),'')+' '+isnull(rtrim(cnt_lastName),'')+' ['+isnull(rtrim(crg_tcode),'')+'] ['+isnull(rtrim( BRANCH_DESCRIPTION),'')+']' ,cnt_internalID ";
                     
                     if(document.getElementById('txtbuy_hidden').value=='')
                       strQuery_WhereClause = " cnt_branchid=branch_id and crg_cntid=cnt_internalid and crg_exchange='"+document.getElementById('litSegmentMain').value+"' and cnt_internalid like 'CL%' and (crg_tcode like (\'RequestLetter%') or CNT_FIRSTNAME like (\'RequestLetter%')) and branch_id in (<%=Session["userbranchHierarchy"]%>)";
                     else
                       strQuery_WhereClause = " cnt_branchid=branch_id and crg_cntid=cnt_internalid and crg_cntid<>'"+document.getElementById('txtbuy_hidden').value+"' and crg_exchange='"+document.getElementById('litSegmentMain').value+"' and cnt_internalid like 'CL%' and (crg_tcode like (\'RequestLetter%') or CNT_FIRSTNAME like (\'RequestLetter%')) and branch_id in (<%=Session["userbranchHierarchy"]%>)";

                   
                }
            }
            CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
            ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery));
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
                if(obj=='11')
                    alert('The Data is Locked !!');  
                parent.editwin.close();
             }
		        document.getElementById('BtnUpdateAdd').disabled=false;

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
                                <asp:TextBox ID="txtInstrument" runat="server" Width="280px" onkeyup="FunCallAjaxList(this,event,'Scrip','NA')" TabIndex="0"></asp:TextBox>
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
                                Lots :</td>
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
                <td >
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
                                            <asp:TextBox ID="txtbuy" runat="server" TabIndex="0" Width="200px" onkeyup="FunCallAjaxList(this,event,'Client','Buy')"></asp:TextBox></td>
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
                                            <asp:TextBox ID="txtsell" TabIndex="0" runat="server" Width="200px" onkeyup="FunCallAjaxList(this,event,'Client','Sell')"></asp:TextBox>
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
                   <asp:Button ID="BtnUpdateAdd" TabIndex="0" runat="server" CssClass="btnUpdate" Height="20px"
                                Width="100px" OnClick="BtnUpdateAdd_Click"  />
                </td>
            </tr>
            <tr style="display: none;">
                <td>
                    <asp:TextBox ID="txtInstrument_hidden" runat="server" Width="5px"></asp:TextBox>
                    <asp:TextBox ID="txtbuy_hidden" runat="server" Width="5px"></asp:TextBox>
                    <asp:TextBox ID="txtsell_hidden" runat="server" Width="5px"></asp:TextBox>
                     <asp:HiddenField ID="litSegmentMain" runat="server" />
                    <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                        Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                        <dropdownbutton text="For">
                        </dropdownbutton>
                    </dxe:ASPxDateEdit>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
