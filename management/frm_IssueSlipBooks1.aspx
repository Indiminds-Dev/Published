<%@ page language="C#" autoeventwireup="true" inherits="management_frm_IssueSlipBooks1, App_Web_snhbal_j" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
 

 
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    <%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>

 <html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"  >
    <title></title>    
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
 
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
		z-index:100;
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
		z-index:5;
	}
	
	form{
		display:inline;
	}
	
	</style> 


    

</head>
 <body>

     <script language="javascript" type="text/javascript">
 
 function PageLoad()
    {
        FieldName='btnSave';
        document.getElementById('txtAccount_hidden').style.display="none";
         document.getElementById('Div1').style.visibility='hidden';
    } 
 
function AllowNumericOnly(e)
            {
                var keycode;
                if (window.event) keycode = window.event.keyCode;
                else if (event) keycode = event.keyCode;
                else if (e) keycode = e.which;
                else return true;
                if( (keycode > 47 && keycode <= 57)  )
                {
                    return true;
                }
                else
                {
                    return false;
                }
                return true;

            }
            
   function AllowCharacterOnly(e)
            {
                var keycode;
                if (window.event) keycode = window.event.keyCode;
                else if (event) keycode = event.keyCode;
                else if (e) keycode = e.which;
                else return true;
                if( (keycode > 64 && keycode <= 90) || (keycode > 96 && keycode <= 122) )
                {
                    return true;
                }
                else
                {
                    return false;
                }
                return true;

            }    
            
    function ClearDefaultValue(e)
    {
    if (e.defaultValue==e.value)
        e.value = ""

    }
    
    function AssignDefaultValue(e)
    {
    if (e.value=="")
        e.value = e.defaultValue;

    } 
    
    function AllowCharacterAndNumber(e)
            {
                var keycode;
                if (window.event) keycode = window.event.keyCode;
                else if (event) keycode = event.keyCode;
                else if (e) keycode = e.which;
                else return true;
                if( (keycode > 64 && keycode <= 90) || (keycode > 96 && keycode <= 122) || (keycode > 47 && keycode <= 57) )
                {
                    return true;
                }
                else
                {
                    return false;
                }
                return true;

            } 
            
 function textCounter(field, countfield, maxlimit) {
 
    if (field.value.length > maxlimit) // if too long...trim it!
        field.value = field.value.substring(0, maxlimit);
        // otherwise, update 'characters left' counter
    else 
        countfield.value = maxlimit - field.value.length;
} 


function CallAjax(obj1,obj2,obj3)
    {
    var obj4=dpClient.GetValue();
    
     ajax_showOptions(obj1,obj2,obj3,obj4);
     
     }
     
function SearchOnPrefix(s)
{

var dest=document.getElementById('<%=txtTotalBook.ClientID%>');
 
var param=dpClient.GetValue()+'~'+SlipClient.GetValue()+'~'+document.getElementById('<%=txtSeries.ClientID%>').value+'~'+s+'~'+document.getElementById('<%=txtSlipFrom.ClientID%>').value+'~'+document.getElementById('<%=txtSlipTo.ClientID%>').value+'~'+document.getElementById('<%=txtBookNoFrom.ClientID%>').value+'~'+document.getElementById('<%=txtBookNoTo.ClientID%>').value;
 
PageMethods.GetContactName(param, CallSuccess, CallFailed, dest);
 
}
// set the destination textbox value with the ContactName
 function CallSuccess(res, destCtrl)
 {     
     var dest = document.getElementById(destCtrl);
     AssignValues(res);
 }
 
 // alert message on some failure
 function CallFailed(res, destCtrl)
 {
     alert(res.get_message());
 }
 
 
 function insert()
{
 var account= document.getElementById('<%=txtAccount.ClientID%>').value ;
 var slipfrom=document.getElementById('<%=txtSlipFrom.ClientID%>').value ;
 
 
  var slipto=document.getElementById('<%=txtSlipTo.ClientID%>').value ;
  
  if(account=="" ||slipfrom=="" ||slipto=="")
  {
  alert('Account Number, Slip Numbers Are Required.');
  
  }
  else
  {
   document.getElementById('Div1').style.visibility='visible';
 
xxx.PerformCallback();
}

 
}
 

function insertCheck(s)
{
   document.getElementById('Div1').style.visibility='hidden';
var a= s.split(',');
alert(a[1]);
document.getElementById('<%=txtBookNoTo.ClientID%>').value="";
 document.getElementById('<%=txtTotalBook.ClientID%>').value="";
  document.getElementById('<%=txtSlipTo.ClientID%>').value="";
 parent.PopulateGrid();
 SearchOnPrefix('pre');
}

 function AssignValues(s)
 {
 var a=s.split(',');
  
 if(a[0]=='s')
 {
 if(a[2]!=-1)
 {
 document.getElementById('<%=txtBookNoFrom.ClientID%>').value=a[2];
 document.getElementById('<%=txtSlipFrom.ClientID%>').value=a[1];
 
 }
 else
 {
  document.getElementById('<%=txtBookNoFrom.ClientID%>').value="";
 document.getElementById('<%=txtSlipFrom.ClientID%>').value="";
 
 document.getElementById('<%=txtBookNoTo.ClientID%>').value="";
 document.getElementById('<%=txtTotalBook.ClientID%>').value="";
  document.getElementById('<%=txtSlipTo.ClientID%>').value="";
 
 
 alert('Please Update Stock Entry');
 }
 }
 
 if(a[0]=='b')
 {
 document.getElementById('<%=txtBookNoFrom.ClientID%>').value=a[1];
 document.getElementById('<%=txtBookNoTo.ClientID%>').value=a[2];
 
 var numberFrm;
 var numberTo;
 var stringsFrm;
 var stringsTo;
 stringsFrm=document.getElementById('<%=txtBookNoFrom.ClientID%>').value;
 stringsTo=document.getElementById('<%=txtBookNoTo.ClientID%>').value;
 
 numberFrm=stringsFrm.match(/\d+/,stringsFrm);
 numberTo=stringsTo.match(/\d+/,stringsTo);
 
 document.getElementById('<%=txtTotalBook.ClientID%>').value=(parseInt(numberTo[0])-parseInt(numberFrm[0]))+1;
 }
 
 if(a[0]=='assignSlip')
 {
  document.getElementById('<%=txtSlipFrom.ClientID%>').value=a[1];
  document.getElementById('<%=txtSlipTo.ClientID%>').value=a[2];
 
 }
 
 SlipFrmToCheck();
 
 }
 
 function BookTo()
 {
 var from=document.getElementById('<%=txtBookNoFrom.ClientID%>').value;
 var total=document.getElementById('<%=txtTotalBook.ClientID%>').value;
 var number;
 number=from.match(/\d+/,from);
 
  var x=number;
         var bookToValue;
         var y;
         y=parseInt(number)+'';
        
         
         if (null==number)
         {
        
         
         BookNoFrom.value=BookNoFrom.value+'1' ;
         }
         
         number==from.match(/\d+/,from);
         x=number;
         
         bookToValue=parseInt(number)+parseInt(total);
         
          if(x[0].length>y.length)
         {
            bookToValue=zeroPad(bookToValue,x[0].length-y.length); 

         }
          
         if(from!="")
         {
         
         
         document.getElementById('<%=txtBookNoTo.ClientID%>').value= from.substring(0,(from.length-x[0].length))+(bookToValue-1) ;
         
         }
 
 
 
 
 SearchOnPrefix('assignSlip');
 FrmToBookCheck();
 
 
 }
 
  function zeroPad(num,count)
        { 
        var numZeropad = num + '';
        while(numZeropad.length <= count) {

        numZeropad = "0" + numZeropad; 
        }
        return numZeropad;
        }
        
  function FrmToBookCheck()
  {
  var from=document.getElementById('<%=txtBookNoFrom.ClientID%>').value;
 var total=document.getElementById('<%=txtTotalBook.ClientID%>').value;
 var to=  document.getElementById('<%=txtBookNoTo.ClientID%>').value;
 
 var number,number1;
 number=from.match(/\d+/,from);
 number1=to.match(/\d+/,to);
 
 if(parseInt(number[0])>parseInt(number1[0]))
 {
 alert('Please Enter Valid Book Range.');
 document.getElementById('<%=txtTotalBook.ClientID%>').value="";
  document.getElementById('<%=txtBookNoTo.ClientID%>').value="";
 
 }
  
  
  }
  
  function SlipFrmToCheck()
  {
   var slipfrom=document.getElementById('<%=txtSlipFrom.ClientID%>').value ;
   var slipto=document.getElementById('<%=txtSlipTo.ClientID%>').value ;
   
   if(parseInt(slipfrom)>parseInt(slipto))
 {
 alert('Please Enter Valid Slip Range.');
 
  document.getElementById('<%=txtSlipTo.ClientID%>').value="";
 
 }
  
  }
  
  function ClearTextBox()
  {
   document.getElementById('<%=txtAccount.ClientID%>').value="";
     	 document.getElementById('<%=txtAccount_hidden.ClientID%>').value="";
  }
 


     </script>

     <form id="form1" runat="server">
         <asp:ScriptManager ID="s1" runat="server" EnablePageMethods="true">
         </asp:ScriptManager>
         <table width="99%" style="width: 99%; border-right: #3300ff thin solid; border-top: #3300ff thin solid;
             border-bottom-width: thin; border-bottom-color: #3300ff; border-left: #3300ff thin solid;
             border-bottom: #3300ff thin solid; background-color: #ddecfe;" align="center">
             <tr style="display: none;">
                 <td align="right" width="140">
                 </td>
                 <td align="left">
                     <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                         ValueType="System.String" Width="310px" ID="ASPxComboBox1" SelectedIndex="0"
                         ClientInstanceName="xxx" OnCallback="ASPxComboBox1_Callback">
                         <ClientSideEvents EndCallback="function(s, e) {insertCheck(xxx.cpDataExists);}" />
                     </dxe:ASPxComboBox>
                 </td>
             </tr>
             <tr>
                 <td align="right" colspan="2">
                 </td>
             </tr>
             <tr>
                 <td align="right" colspan="2" class="EHEADER" style="text-align: center;">
                     <span style="color: #3300cc"><strong>Issue Slips</strong></span><br />
                 </td>
             </tr>
             <tr>
                 <td align="right" colspan="2">
                     <br />
                 </td>
             </tr>
             <tr>
                 <td align="right" width="140">
                     <span class="Ecoheadtxt">DP ID </span>
                 </td>
                 <td align="left">
                     <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                         ValueType="System.String" Width="260px" ID="ddlDPID" ClientInstanceName="dpClient">
                         <ClientSideEvents ValueChanged="function(s, e) {ClearTextBox();
	
}" />
                     </dxe:ASPxComboBox>
                 </td>
             </tr>
             <tr>
                 <td align="right" width="140">
                     <span class="Ecoheadtxt">Account No </span>
                 </td>
                 <td align="left">
                     <asp:TextBox ID="txtAccount" runat="server" Width="255px"></asp:TextBox>
                     <asp:TextBox ID="txtAccount_hidden" runat="server" Width="14px"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td align="right" width="140">
                     <span class="Ecoheadtxt">Date</span></td>
                 <td align="left">
                     <dxe:ASPxDateEdit ID="txtDate" runat="server" ClientInstanceName="e1" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css"
                         EditFormat="Custom" EditFormatString="dd MMMM yyyy" UseMaskBehavior="True" AllowNull="False"
                         Width="150px">
                         <ButtonStyle Width="13px">
                         </ButtonStyle>
                         <Paddings PaddingBottom="0px"></Paddings>
                     </dxe:ASPxDateEdit>
                 </td>
             </tr>
             <tr>
                 <td align="right" width="140">
                     <span class="Ecoheadtxt">Slip Type</span>
                 </td>
                 <td align="left">
                     <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                         ValueType="System.String" Width="260px" ID="ddlSlipType" ClientInstanceName="SlipClient"
                         SelectedIndex="0">
                         <Items>
                             <dxe:ListEditItem Text="Combined Instruction Slips" Value="1" />
                             <dxe:ListEditItem Text="Combined Instruction Slips (CM)" Value="2" />
                             <dxe:ListEditItem Text="Inter-Settlement" Value="3" />
                             <dxe:ListEditItem Text="Delivery out [CM-Payin]" Value="4" />
                             <dxe:ListEditItem Text="Delivery Out [CM Payout]" Value="5" />
                             <dxe:ListEditItem Text="Pool-To-Pool Transfers" Value="6" />
                             <dxe:ListEditItem Text="On Market " Value="7" />
                             <dxe:ListEditItem Text="Off Market" Value="8" />
                             <dxe:ListEditItem Text=" Inter-Depository " Value="9" />
                             <dxe:ListEditItem Text="Pledge&amp;Hypothecation" Value="10" />
                             <dxe:ListEditItem Text=" SLB Instructions " Value="11" />
                             <dxe:ListEditItem Text="Demat Request Forms" Value="12" />
                             <dxe:ListEditItem Text="Remat Request Forms" Value="13" />
                         </Items>
                     </dxe:ASPxComboBox>
                 </td>
             </tr>
             <tr>
                 <td align="right" width="130" valign="bottom">
                     <span class="Ecoheadtxt">Will be used for POA</span></td>
                 <td align="left" valign="top">
                     <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                         ValueType="System.String" Width="50px" ID="ddlPOA" SelectedIndex="1">
                         <Items>
                             <dxe:ListEditItem Text="Yes" Value="Y" />
                             <dxe:ListEditItem Text="No" Value="N" />
                         </Items>
                     </dxe:ASPxComboBox>
                 </td>
             </tr>
             <tr>
                 <td align="right" colspan="2" style="padding-left: 0px; padding-top: 0px; padding-right: 0px">
                     <table cellspacing="0" cellpadding="0" width="600" align="left" style="padding-left: 5px;
                         padding-top: 2px; padding-right: 2px; padding-bottom: 2px">
                         <tr>
                             <td align="right" width="135">
                                 <span class="Ecoheadtxt">Series </span>
                             </td>
                             <td align="left">
                                 <asp:TextBox ID="txtSeries" runat="server" Width="90px" MaxLength="2" onkeypress="return AllowCharacterOnly(this);"
                                     onblur="SearchOnPrefix('pre');"></asp:TextBox>
                             </td>
                             <td>
                             </td>
                             <td align="left">
                             </td>
                         </tr>
                         <tr>
                             <td align="right">
                                 <span class="Ecoheadtxt">Book Number From</span></td>
                             <td align="left">
                                 <asp:TextBox ID="txtBookNoFrom" runat="server" Width="90px" onkeypress="return AllowCharacterAndNumber(this);"
                                     MaxLength="10"></asp:TextBox></td>
                             <td>
                                 <span class="Ecoheadtxt">Total Book</span></td>
                             <td align="left">
                                 <asp:TextBox ID="txtTotalBook" runat="server" Width="95px" onkeypress="return AllowNumericOnly(this);"
                                     MaxLength="3" onblur="BookTo();"></asp:TextBox>
                                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                 &nbsp; &nbsp; &nbsp; &nbsp;
                             </td>
                         </tr>
                         <tr>
                             <td align="right">
                                 <span class="Ecoheadtxt">Book Number To</span></td>
                             <td align="left">
                                 <asp:TextBox ID="txtBookNoTo" runat="server" Width="90px" onkeypress="return AllowCharacterAndNumber(this);"
                                     MaxLength="10" onblur="FrmToBookCheck();" ReadOnly="True"></asp:TextBox>
                             </td>
                             <td>
                             </td>
                             <td align="left">
                             </td>
                         </tr>
                         <tr>
                             <td align="right">
                                 <span class="Ecoheadtxt">Slip No From</span></td>
                             <td align="left">
                                 <asp:TextBox ID="txtSlipFrom" runat="server" Width="90px" onkeypress="return AllowNumericOnly(this);"
                                     MaxLength="20"></asp:TextBox>
                             </td>
                             <td>
                                 <span class="Ecoheadtxt">Slip No To</span></td>
                             <td align="left">
                                 <asp:TextBox ID="txtSlipTo" runat="server" Width="95px" onkeypress="return AllowNumericOnly(this);"
                                     MaxLength="20" onblur="SearchOnPrefix('slip');"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                             <td align="right">
                                 <span class="Ecoheadtxt">Remarks</span></td>
                             <td align="left" colspan="3">
                                 <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Width="275px" onKeyDown="textCounter(this,remLen,50);"
                                     onKeyUp="textCounter(this,remLen,50);"></asp:TextBox>
                                 <input readonly type="text" id="remLen" maxlength="2" value="50" tabindex="100" style="width: 18px">
                                 characters left
                             </td>
                         </tr>
                         <tr>
                             <td align="right">
                             </td>
                             <td align="left" colspan="3">
                                 <dxe:ASPxButton ID="btnSave" runat="server" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css"
                                     CssPostfix="Office2003_Blue" AutoPostBack="false" Text="Save" ValidationGroup="a">
                                     <ClientSideEvents Click="function(s, e) {insert();}" />
                                 </dxe:ASPxButton>
                             </td>
                         </tr>
                     </table>
                 </td>
             </tr>
         </table>
         <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
             top: 50%; = background-color: white; layer-background-color: white; height: 80;
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
         <asp:SqlDataSource ID="DpIdSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
             SelectCommand="select  cmp_Name +'-' +dp_dpid  as compname, dp_dpid &#13;&#10;from  tbl_master_address,tbl_master_company,tbl_master_companyDp &#13;&#10;where&#13;&#10;dp_companyId=cmp_internalid and cmp_internalid=add_cntId  &#13;&#10; ">
         </asp:SqlDataSource>
     </form>
 </body> 
                </html> 
 

