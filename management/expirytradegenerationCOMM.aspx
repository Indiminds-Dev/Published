<%@ page language="C#" autoeventwireup="true" inherits="management_expirytradegenerationCOMM, App_Web_4andsqnv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Expiry Trade Generation</title>
     <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
                fn_ddlInstruType('0');
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
            window.frameElement.width = document.body.scrollWidth;
        }
   function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
      function  fn_ddlInstruType(obj)
       {
            if(obj=="0")
            {
                Hide('tr_generatetype');
                Show('tr_btngeneratefut');
                Hide('tr_Asset');
                Hide('tr_OptionType');
                Hide('tr_Expiry');
                Hide('tr_Scrip');
                Hide('showFilter');
                Hide('tr_forexcel');
                Hide('tr_Show');
            }
            else
            {
                Show('tr_generatetype');
                Hide('tr_btngeneratefut');
                Show('tr_Asset');
                Show('tr_OptionType');
                Show('tr_Expiry');
                Show('tr_Scrip');
                Hide('showFilter');
                Show('tr_forexcel');
                Show('tr_forexcelopen');
                Hide('tr_forexcelgenerate');
                Hide('tr_Show');
            }
           height();
       }
      function btnAddsubscriptionlist_click()
            {
            
                var cmb=document.getElementById('cmbsearchOption');
                        var userid = document.getElementById('txtSelectionID');
                        if(userid.value != '')
                        {
                            var ids = document.getElementById('txtSelectionID_hidden');
                            var listBox = document.getElementById('lstSlection');
                            var tLength = listBox.length;
                           
                            
                            var no = new Option();
                            no.value = ids.value;
                            no.text = userid.value;
                            listBox[tLength]=no;
                            var recipient = document.getElementById('txtSelectionID');
                            recipient.value='';
                        }
                        else
                            alert('Please search name and then Add!')
                        var s=document.getElementById('txtSelectionID');
                        s.focus();
                        s.select();
                   
            }
        
      function clientselectionfinal()
	        {
	            var listBoxSubs = document.getElementById('lstSlection');
	          
                var cmb=document.getElementById('cmbsearchOption');
                var listIDs='';
                var i;
                if(listBoxSubs.length > 0)
                {  
                           
                    for(i=0;i<listBoxSubs.length;i++)
                    {
                        if(listIDs == '')
                            listIDs = listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                        else
                            listIDs += ',' + listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                    }
                    var sendData = cmb.value + '~' + listIDs;
                    CallServer(sendData,"");
                   
                }
	            var i;
                for(i=listBoxSubs.options.length-1;i>=0;i--)
                {
                    listBoxSubs.remove(i);
                }
            
                Hide('showFilter');
                
	        }
	     
	        
	   function btnRemovefromsubscriptionlist_click()
            {
                
                var listBox = document.getElementById('lstSlection');
                var tLength = listBox.length;
                
                var arrTbox = new Array();
                var arrLookup = new Array();
                var i;
                var j = 0;
                for (i = 0; i < listBox.options.length; i++) 
                {
                    if (listBox.options[i].selected && listBox.options[i].value != "") 
                    {
                        
                    }
                    else 
                    {
                        arrLookup[listBox.options[i].text] = listBox.options[i].value;
                        arrTbox[j] = listBox.options[i].text;
                        j++;
                    }
                }
                listBox.length = 0;
                for (i = 0; i < j; i++) 
                {
                    var no = new Option();
                    no.value = arrLookup[arrTbox[i]];
                    no.text = arrTbox[i];
                    listBox[i]=no;
                }
            }
     function fnunderlying(obj)
       {
                if(obj=="a")
                    Hide('showFilter');
                 else
                 {
                      var cmb=document.getElementById('cmbsearchOption');
                      cmb.value='Product';
                      Show('showFilter');
                 }
                 height();
       }
    function fnScrip(obj)
       {
                if(obj=="a")
                {
                    Hide('showFilter');
                    Show('tr_forexcel');
                    Show('tr_forexcelopen');
                    Hide('tr_forexcelgenerate');
                    Hide('tr_Show');
                    Hide('td_txtscrip');
                 }
                 else
                 {
                     Hide('tr_forexcel');
                     Show('tr_Show');
                     Hide('tr_gridshow');
                     Hide('showFilter');
                     Show('td_txtscrip');
                 }
                Hide('tr_btnshow1');
                Hide('tr_btnshow2');
                 height();
       }
    function fnExpiry(obj)
       {
                if(obj=="a")
                {
                    Hide('td_txtexpiry');
                    Hide('showFilter');
                }
                 else
                 {
                      Show('td_txtexpiry');
                      Hide('showFilter');
                 }
                 height();
       }
    function fnexpirtycallajax(objID,objListFun,objEvent)
     {
         var date;
         date=new Date(dtFor.GetDate());
         date=parseInt(date.getMonth()+1)+'-'+date.getDate()+'-'+ date.getFullYear();
         ajax_showOptions(objID,'Searchproductandeffectuntil',objEvent,'Expiry'+'~'+date);
     }
    function ajaxcall(objID,objListFun,objEvent)
     {
     
        if(document.getElementById('cmbsearchOption').value=="Product")
        {
            ajax_showOptions(objID,'ShowClientFORMarginStocks',objEvent,'Product');
        }
       
       
     }
     function ajaxcallScrip(objID,objListFun,objEvent)
     {
        var criteritype='B';
        height();

          if(document.getElementById('rdbunderlyingselected').checked==true)
          {
             criteritype=' equity_productid IN (select DISTINCT PRODUCTS_ID from master_products  where (PRODUCTS_DERIVEDFROMID in('+ document.getElementById('HiddenField_Product').value+') or PRODUCTS_ID in('+ document.getElementById('HiddenField_Product').value+'))) and';
          }
          if(document.getElementById('chkopttypecall').checked==true && document.getElementById('chkopttypeput').checked==true)
          {
            if(criteritype!='B')
            {
                criteritype=criteritype+'  (EQUITY_SERIES IN ("CA","CE") OR EQUITY_SERIES IN ("PA","PE")) and';
            }
            else
            {
                criteritype='  (EQUITY_SERIES IN ("CA","CE") OR EQUITY_SERIES IN ("PA","PE")) and';
            }
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
          }
          if(document.getElementById('chkopttypecall').checked==true && document.getElementById('chkopttypeput').checked==false)
          {
            if(criteritype!='B')
            {
                criteritype=criteritype+'  EQUITY_SERIES IN ("CA","CE") and';
            }
            else
            {
                criteritype='  EQUITY_SERIES IN ("CA","CE") and';
            }
            
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
          }
          if(document.getElementById('chkopttypecall').checked==false && document.getElementById('chkopttypeput').checked==true)
          {
            if(criteritype!='B')
            {
                criteritype=criteritype+' EQUITY_SERIES IN ("PA","PE") and';
            }
            else
            {
                criteritype=' EQUITY_SERIES IN ("PA","PE") and';
            }
             criteritype=criteritype+'  ';
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
             criteritype=criteritype.replace('"',"'")
          }
        
        var date;
        date=new Date(dtFor.GetDate());
        date=parseInt(date.getMonth()+1)+'-'+date.getDate()+'-'+ date.getFullYear();
        
        
          if(document.getElementById('rdbExpirySpecific').checked==true)
          {
            criteritype=criteritype+' equity_effectuntil in ("'+document.getElementById('txtExpiry_hidden').value+'")';
            criteritype=criteritype.replace('"',"'")
            criteritype=criteritype.replace('"',"'")
          }
          if(document.getElementById('rdbExpiryAll').checked==true)
          {
            criteritype=criteritype+' equity_effectuntil>="'+date+'"';
            criteritype=criteritype.replace('"',"'")
            criteritype=criteritype.replace('"',"'")
          }
         ajax_showOptions(objID,'ShowClientFORMarginStocks',objEvent,'ScripCriteria'+'~'+criteritype);
        
     }
   function NORECORD(obj)
   {
       Hide('showFilter');
        
      if(obj=='1')
      {
                Show('tr_generatetype');
                Hide('tr_btngeneratefut');
                Show('tr_Asset');
                Show('tr_OptionType');
                Show('tr_Expiry');
                Show('tr_Scrip');
                Hide('showFilter');
                Show('tr_forexcel');
                Show('tr_forexcelopen');
                Hide('tr_forexcelgenerate');
          alert('No Record Found!!');
      }
      else if (obj=='2')
      {
                Show('tr_generatetype');
                Hide('tr_btngeneratefut');
                Show('tr_Asset');
                Show('tr_OptionType');
                Show('tr_Expiry');
                Show('tr_Scrip');
                Hide('showFilter');
                Show('tr_forexcel');
                Show('tr_forexcelopen');
                Hide('tr_forexcelgenerate');
          alert('Rates for this date does not exists!!');
      }
      else if (obj=='3')
      {
                Show('tr_generatetype');
                Hide('tr_btngeneratefut');
                Show('tr_Asset');
                Show('tr_OptionType');
                Show('tr_Expiry');
                Show('tr_Scrip');
                Hide('showFilter');
                Hide('tr_forexcel');
                Show('tr_Show');
                Show('tr_gridbtnshow');
                Hide('tr_gridshow');
                Hide('tr_btnshow1');
                Hide('tr_btnshow2');
      }
      if(obj=='4')
      {
                Show('tr_generatetype');
                Hide('tr_btngeneratefut');
                Show('tr_Asset');
                Show('tr_OptionType');
                Show('tr_Expiry');
                Show('tr_Scrip');
                Hide('showFilter');
                Hide('tr_forexcel');
                Show('tr_Show');
                Show('tr_gridbtnshow');
                Hide('tr_gridshow');
                Hide('tr_btnshow1');
         alert('No Record Found!!');
      }
        height();
   }
  
   function display(obj)
   {
     Hide('showFilter');
    if(obj=='1')
    {
        Hide('tr_btngeneratefut');
        Show('tr_forexcel');
        Hide('tr_forexcelopen');
        Show('tr_forexcelgenerate');
        Hide('tr_Show');
        document.getElementById('btnclose').click();
    }
   if(obj=='2')
    {
                Show('tr_generatetype');
                Hide('tr_btngeneratefut');
                Show('tr_Asset');
                Show('tr_OptionType');
                Show('tr_Expiry');
                Show('tr_Scrip');
                Hide('showFilter');
                
                if(document.getElementById('rdbScripAll').checked==true)
                  {
                    Show('tr_forexcel');
                    Show('tr_forexcelopen');
                    Hide('tr_forexcelgenerate');
                    Hide('tr_Show');
                  }
                else
                {
                    Hide('tr_forexcel');
                    Show('tr_Show');
                    Show('tr_gridbtnshow');
                    Hide('tr_gridshow');
                    Hide('tr_btnshow1');
                }
        alert('Expiry Trade Generate Successfully !!');
    }
  if(obj=='3')
  {
        Hide('tr_btngeneratefut');
        Hide('tr_forexcel');
        Show('tr_Show');
        Hide('tr_gridbtnshow');
        Show('tr_gridshow');
        Show('tr_btnshow1');
        Show('tr_btnshow2');
        Hide('tr_date');
        Hide('tr_btngeneratefut');
        Hide('tr_criteria');
  }  
    height();
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
   function Filter()
   {
        Show('tr_date');
        Hide('tr_btngeneratefut');
        Show('tr_criteria');
        Hide('tr_forexcel');
        Show('tr_Show');
        Show('tr_gridbtnshow');
        Hide('tr_gridshow');
        Hide('tr_btnshow1');
        Hide('tr_btnshow2');
        Hide('showFilter');
        Show('td_txtscrip');
        height();
   }
   function tabindexset(obj,obj1)
        {
            display(3);
            alert(obj1);
            document.getElementById(obj).focus();
            document.getElementById(obj).select();
           
        }
function formatField(objFormField)
{
  intFieldLength = objFormField.value.length;
  if(intFieldLength==2)
  {
       objFormField.value = objFormField.value + ",";
            return false;
  }
}
function futalert(obj)
{
    
                Hide('tr_generatetype');
                Show('tr_btngeneratefut');
                Hide('tr_Asset');
                Hide('tr_OptionType');
                Hide('tr_Expiry');
                Hide('tr_Scrip');
                Hide('showFilter');
                Hide('tr_forexcel');
                Hide('tr_Show');
                alert(obj);
                height();
}

 FieldName='lstSlection';
 </script>	
  <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
                var j=rValue.split('~');
              
                if(j[0]=='Product')
                {
                    document.getElementById('HiddenField_Product').value = j[1];
                }
               
        }
        </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server"  autocomplete="off">
    <div>
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

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 22px;">
                    <strong><span id="SpanHeader" style="color: #000099">Expiry Trade Generation</span></strong>
                </td>
                  <td class="EHEADER" width="15%" id="Td1" style="height: 22px">
                    <a href="javascript:void(0);" onclick="Filter();"><span style="color: Blue; text-decoration: underline;
                        font-size: 8pt; font-weight: bold">Filter</span></a></td>
            </tr>
        </table>
     
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
        <table>
           <tr id="tr_date"><td colspan="2"><table> <tr>
                <td valign="top">
                   For :</td>
                <td valign="top">
                    <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                        Font-Size="10px" Width="108px" ClientInstanceName="dtFor">
                        <DropDownButton Text="For">
                        </DropDownButton>
                    </dxe:ASPxDateEdit>
                </td>
                 <td valign="top">
                  Instrument Type :</td>
                <td valign="top">
                    <asp:DropDownList ID="ddlInstruType" runat="server" Width="100px" Font-Size="10px" onchange="fn_ddlInstruType(this.value)">
                        <asp:ListItem Value="0">Futures</asp:ListItem>
                        <asp:ListItem Value="1">Options</asp:ListItem>
                    </asp:DropDownList></td>
            </tr></table></td></tr>
            <tr id="tr_btngeneratefut">
                <td valign="top" colspan="4">
                <asp:Button ID="btnGenerate" runat="server"
                        Text="Generate" CssClass="btnUpdate" Height="23px" Width="101px" OnClick="btnGenerate_Click" />
            
                </td>
               
            </tr>
            <tr id="tr_criteria">
                <td valign="top" colspan="2">
                    <table>
                      <tr id="tr_generatetype">
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" style="width: 100px;" bgcolor="#B7CEEC">
                                            Generate Type:</td>
                                        <td colspan="2">
                                            <asp:DropDownList ID="ddlgeneratetype" runat="server" Width="150px" Font-Size="10px" onchange="fn_ddlInstruType(this.value)">
                        <asp:ListItem Value="EXC">Excercise</asp:ListItem>
                        <asp:ListItem Value="ASN">Assignment</asp:ListItem>
                        <asp:ListItem Value="BOTH">Both</asp:ListItem>
                    </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            
                        </tr>
                        <tr id="tr_Asset">
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" style="width: 100px;" bgcolor="#B7CEEC">
                                            Asset:</td>
                                        <td>
                                            <asp:RadioButton ID="rdbunderlyingall" runat="server" Checked="True" GroupName="a"
                                                onclick="fnunderlying('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbunderlyingselected" runat="server" GroupName="a" onclick="fnunderlying('b')" />Selected
                                            
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr id="tr_OptionType">
                                        <td class="gridcellleft" style="width: 100px;" bgcolor="#B7CEEC">
                                            Option Type:</td>
                                        <td>
                                            <asp:CheckBox ID="chkopttypecall" runat="server" Checked="true" />
                                            Call
                                        </td>
                                        <td>
                                           <asp:CheckBox ID="chkopttypeput" runat="server" Checked="true"/>
                                            Put
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            
                        </tr>
                         <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr id="tr_Expiry">
                                         <td class="gridcellleft" style="width: 100px;" bgcolor="#B7CEEC">
                                            Expiry :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbExpiryAll" runat="server" Checked="True" GroupName="b" onclick="fnExpiry('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbExpirySpecific" runat="server" GroupName="b" onclick="fnExpiry('b')" />
                                            Specific
                                        </td>
                                         <td id="td_txtexpiry" style="display:none;">
                                            <asp:TextBox runat="server" Width="150px" Font-Size="10px" ID="txtExpiry" onkeyup="fnexpirtycallajax(this,'Searchproductandeffectuntil',event)"></asp:TextBox>
                                            <asp:TextBox ID="txtExpiry_hidden" runat="server" Width="14px" Style="display: none;"> </asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            
                        </tr>
                          <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr id="tr_Scrip">
                                         <td class="gridcellleft" style="width: 100px;" bgcolor="#B7CEEC">
                                            Scrip :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbScripAll" runat="server" Checked="True" GroupName="c" onclick="fnScrip('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbScripSelected" runat="server" GroupName="c" onclick="fnScrip('b')" />
                                            Specific
                                        </td>
                                        <td id="td_txtscrip" style="display: none;">
                                            <asp:TextBox runat="server" Width="250px" Font-Size="10px" ID="txtScrip" onkeyup="ajaxcallScrip(this,'chkfn',event)"></asp:TextBox>
                                            <asp:TextBox ID="txtScrip_hidden" runat="server" Width="14px" Style="display: none;"> </asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                            
                        </tr>
                    </table>
                </td>
                <td valign="top" colspan="2">
                <table id="showFilter">
                        <tr>
                            <td >
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                            id="TdFilter">
                                            <span id="spanunder"></span><span id="spanclient"></span>
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="ajaxcall(this,'chkfn',event)"></asp:TextBox>
                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                Enabled="false">
                                                <asp:ListItem>Product</asp:ListItem>
                                                 <asp:ListItem>ScripCriteria</asp:ListItem>
                                            </asp:DropDownList>
                                            <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                    style="color: #009900; font-size: 8pt;"> </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:ListBox ID="lstSlection" runat="server" Font-Size="10px" Height="90px" Width="290px">
                                            </asp:ListBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <a id="A2" href="javascript:void(0);" onclick="clientselectionfinal()"><span style="color: #000099;
                                                            text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        <a id="A1" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
                                                            <span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Remove</span></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="tr_forexcel">
                <td colspan="4">
                    <table>
                        <tr id="tr_forexcelopen">
                            <td class="gridcellleft">
                                <asp:Button ID="btnexcelopen" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate Position"
                                    Width="120px" OnClick="btnexcelopen_Click" />
                            </td>
                        </tr>
                        <tr id="tr_forexcelgenerate">
                            <td class="gridcellleft">
                                <asp:Button ID="btngeneratetrade" runat="server" CssClass="btnUpdate" Height="20px"
                                    Text="Generate Trade" Width="101px" OnClick="btngeneratetrade_Click" /></td>
                            <td>
                                <asp:Button ID="btncancel" runat="server" CssClass="btnUpdate" Height="20px" Text="Cancel"
                                    Width="101px" OnClick="btncancel_Click" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="tr_Show">
                <td colspan="4" class="gridcellleft">
                    <table>
                        <tr id="tr_gridbtnshow">
                            <td>
                                <asp:Button ID="btnShow" runat="server" CssClass="btnUpdate" Height="20px" Text="Show Position"
                                    Width="101px" OnClick="btnShow_Click" /></td>
                        </tr>
                        <tr id="tr_btnshow1">
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button ID="btntradeinsert1" runat="server" Text="Generate" CssClass="btnUpdate" Height="20px" OnClick="btntradeinsert1_Click"
                                                        />
                                                    <asp:Button ID="btncancel1" runat="server" Text="Cancel" CssClass="btnUpdate" Height="20px" OnClick="btncancel1_Click" 
                                                        />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btntradeinsert1" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btncancel1" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="tr_gridshow">
                            <td>
                              <div id="display" runat="server">
                                </div>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ID="grdtrade" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                            ShowFooter="True" AutoGenerateColumns="false" BorderStyle="Solid" BorderWidth="2px"
                                            CellPadding="4" ForeColor="#0000C0" OnRowCreated="grdtrade_RowCreated" OnRowDataBound="grdtrade_RowDataBound">
                                            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                            <Columns>
                                                <asp:TemplateField HeaderText="Client Name">
                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False"></ItemStyle>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCLIENTNAME" runat="server" Text='<%# Eval("CLIENTNAME")%>'></asp:Label>
                                                    </ItemTemplate>
                                                   
                                            <FooterTemplate>
                                                    Total :
                                             </FooterTemplate>
                                               <FooterStyle Wrap="false" HorizontalAlign="left" VerticalAlign="Top" Font-Bold="true" ForeColor="white"  />
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Ucc">
                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False"></ItemStyle>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUCC" runat="server" Text='<%# Eval("UCC")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Open Buy Qty">
                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBUYQTY" runat="server" Text='<%# Eval("BUYQTY")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                    <asp:Label ID="lblBUYQTY_SUM" runat="server"  ForeColor="white" ></asp:Label>
                                                   
                                                    </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="false"/>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Open Sell Qty">
                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSELLQTY" runat="server" Text='<%# Eval("SELLQTY")%>'></asp:Label>
                                                    </ItemTemplate>
                                                      <FooterTemplate>
                                              <asp:Label ID="lblSELLQTY_SUM" runat="server"  ForeColor="white" ></asp:Label>
                                                   
                                                    </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="false"/>
                                                </asp:TemplateField>
                                                
                                                <asp:TemplateField HeaderText="EXC Qty">
                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                                    <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtEXCQTY" style="text-align:right;"  Onkeypress="return isNumberKey(event)" AutoPostBack="True"
                                                            Width="100px" Text='<%# Eval("EXCQTY")%>' runat="server" OnTextChanged="txtEXCQTY_TextChanged"></asp:TextBox>
                                                    </ItemTemplate>
                                                      <FooterTemplate>
                                              <asp:Label ID="txtEXCQTY_SUM" runat="server"  ForeColor="white" ></asp:Label>
                                                   
                                                    </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="false"/>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ASN Qty">
                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                                    <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtASNQTY" style="text-align:right;"  Width="100px"  runat="server" AutoPostBack="True"
                                                            Text='<%# Eval("ASNQTY")%>'  Onkeypress="return isNumberKey(event)"   OnTextChanged="txtASNQTY_TextChanged"></asp:TextBox>
                                                        <asp:Label ID="lblCLIENTID" runat="server" Text='<%# Eval("CLIENTID")%>'
                                                            Visible="false"></asp:Label>
                                                        <asp:Label ID="lblPRODUCTID" runat="server" Text='<%# Eval("PRODUCTID")%>'
                                                            Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                       <FooterTemplate>
                                              <asp:Label ID="txtASNQTY_SUM" runat="server"  ForeColor="white" ></asp:Label>
                                                   
                                                    </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="false"/>
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                                BorderWidth="1px"></RowStyle>
                                            <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                            <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                            <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                            <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                                Font-Bold="False"></HeaderStyle>
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                         <tr id="tr_btnshow2">
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button ID="btntradeinsert2" runat="server" Text="Generate" CssClass="btnUpdate" Height="20px" OnClick="btntradeinsert2_Click"
                                                        />
                                                    <asp:Button ID="btncancel2" runat="server" Text="Cancel" CssClass="btnUpdate" Height="20px" OnClick="btncancel2_Click"
                                                        />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btntradeinsert2" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btncancel2" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </ContentTemplate></asp:UpdatePanel>
          <table>
                <tr>
                    <td>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                    top: 50%; background-color: white; layer-background-color: white; height: 80;
                                    width: 150;'>
                                    <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                </tr>
            </table>
        <table>
            <tr>
                <td style="display: none;">
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                    <asp:HiddenField ID="HiddenField_Product" runat="server" />
                    <asp:DropDownList ID="cmbscrip" runat="server" Font-Size="10px" Width="300px" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:Button ID="btnclose" runat="server" Text="btnclose" OnClick="btnclose_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
