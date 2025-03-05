<%@ page language="C#" autoeventwireup="true" inherits="management_frm_SlipBookStock, App_Web_i8xxwgwk" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
 

 
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    <%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>

 <html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
 
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
 <body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

     <script language="javascript" type="text/javascript">
           function SignOff()
            {
              window.parent.SignOff();
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
                var slipPrefixLength=document.getElementById('<%=txtSlipPrefix.ClientID%>').value.length;
                if (slipPrefixLength==4)
                    return false;
                else
                    {
                    var keycode;
                    if (window.event) keycode = window.event.keyCode;
                    else if (event) keycode = event.keyCode;
                    else if (e) keycode = e.which;
                    else return true;
                    
                    if( (keycode > 64 && keycode <= 90)||(keycode > 96 && keycode <= 122) )
                    {
                        if (keycode > 96 && keycode <= 122)
                        {
                         var slipPrefix = document.getElementById('<%=txtSlipPrefix.ClientID%>').value;
                         var upperSlipPrefix= String.fromCharCode(keycode-32);
                         document.getElementById('<%=txtSlipPrefix.ClientID%>').value=slipPrefix+upperSlipPrefix;
                         return false;
                        }
                        else
                         return true;
                    }
                   
                             
                    else
                    {
                        return false;
                    }
                    
                }
                

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
            
    function OnSlipTypeChanged(SlipTypeValue) {
     
   document.getElementById('<%=txtSlipPrefix.ClientID%>').focus();
    
}

function OnDpIdChange(DpId)
{
document.getElementById('<%=txtSlipPrefix.ClientID%>').focus();
}

function AssignValues(values)
{

var splitVales;
splitVales=values.split(",");
globalvar=splitVales[2];
document.getElementById('hiddenRange').value=splitVales[0];
document.getElementById('<%=txtBookNoFrom.ClientID%>').value=splitVales[2];
document.getElementById('<%=txtBookNoFrom.ClientID%>').defaultValue=splitVales[2];

document.getElementById('<%=txtSlipNoFrom.ClientID%>').value= splitVales[1];
document.getElementById('<%=txtSlipNoFrom.ClientID%>').defaultValue= splitVales[1];

}


            
     function NumberOfBooks()
        {
         var SlipsPerBook=document.getElementById('<%=txtSlipPerBook.ClientID%>');
         var BookNoFrom=document.getElementById('<%=txtBookNoFrom.ClientID%>');
         var SlipNoFrom=document.getElementById('<%=txtSlipNoFrom.ClientID%>');
         var SlipNoTo=document.getElementById('<%=txtSlipNoTo.ClientID%>');
         var BookNoTo=document.getElementById('<%=txtBookNoTo.ClientID%>');
         var TotalBooks=document.getElementById('<%=txtTotalNoBooks.ClientID%>');
         var PreFix=document.getElementById('<%=txtSlipPrefix.ClientID%>');
         var strings=BookNoFrom.value;
         var totalBook; 
         var number;
         
         
         if(parseInt(SlipNoFrom.value)>parseInt(SlipNoTo.value))
         {
         alert('Slip Range Must Be Positive');
         SlipNoTo.value='';
         SlipNoTo.focus();

         }
         else
         {
         if( SlipsPerBook.value!="0")
         {
         totalBook=Math.ceil (parseInt(SlipNoTo.value-parseInt(SlipNoFrom.value)+1)/parseInt(SlipsPerBook.value) );

         TotalBooks.value=totalBook;
         number=strings.match(/\d+/,strings);
         
         var x=number;
         var bookToValue;
         var y;
         y=parseInt(number)+'';
        
         
         if (null==number)
         {
        
         
         BookNoFrom.value=BookNoFrom.value+'1' ;
         }
         
         number=BookNoFrom.value.match(/\d+/,strings);
         x=number;
         
         bookToValue=parseInt(number)+parseInt(totalBook);
         
          if(x[0].length>y.length)
         {
            bookToValue=zeroPad(bookToValue,x[0].length-y.length); 

         }
         
         if(BookNoFrom.value!="")
         {
         
         
         BookNoTo.value=BookNoFrom.value.substring(0,(BookNoFrom.value.length-x[0].length))+(bookToValue-1);
         
         }
         
       
         var range=document.getElementById('hiddenRange').value;
          
         if(range!="0")
         {
         if(parseInt(SlipNoTo.value.substring(PreFix.value.length))-parseInt(SlipNoFrom.value.substring(PreFix.value.length))+1>parseInt(range))
         {
         //alert(parseInt(SlipNoTo.value.substring(PreFix.value.length))-parseInt(SlipNoFrom.value.substring(PreFix.value.length))+1);
            alert(+range+ ' Slips Available in this Range.'  );
            SlipNoTo.value="";
            BookNoTo.value="";
            TotalBooks.value="";
            }
         } 

         }
         
         }
            perbookcheck();
        }
        
        function zeroPad(num,count)
        { 
        var numZeropad = num + '';
        while(numZeropad.length <= count) {

        numZeropad = "0" + numZeropad; 
        }
        return numZeropad;
        }

        
        function CallMe(src,dest)
 {     
     var ctrl = document.getElementById(src);
    
    
    
     var dpId = dpClient.GetValue();
     var SlipType= SlipClient.GetValue();
     var PrefFix=document.getElementById('<%=txtSlipPrefix.ClientID%>');
     var param=dpId+'~'+SlipType+'~'+PrefFix.value;
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


var bookto=document.getElementById('<%=txtBookNoTo.ClientID%>').value ;
var total=document.getElementById('<%=txtTotalNoBooks.ClientID%>').value;

 var SlipsPerBook=document.getElementById('<%=txtSlipPerBook.ClientID%>').value ;
 var BookNoFrom=document.getElementById('<%=txtBookNoFrom.ClientID%>').value;
         
 if(parseInt(SlipsPerBook)>0 && (bookto=="" || BookNoFrom==""))
 {
 alert('Please Enter Book Numbers');
 
 }
 else
 
 {
if(document.getElementById('<%=txtSlipNoFrom.ClientID%>').value!="" && document.getElementById('<%=txtSlipNoTo.ClientID%>').value!="")
{
//alert(bookto+'~'+total);
xxx.PerformCallback(bookto+'~'+total);
}
else
{
alert('Please Enter Slip Numbers.');
}
}
}


function insertCheck(s)
{
var a= s.split(',');

if(a[0]=="0")
{
//alert('Successfully Created');
document.getElementById('<%=txtSlipNoTo.ClientID%>').value="";
document.getElementById('<%=txtBookNoTo.ClientID%>').value="";
document.getElementById('<%=txtTotalNoBooks.ClientID%>').value="";
document.getElementById('<%=txtRemarks.ClientID%>').value="";

globalvar="";
//PopulateData();
CallMe("txtSlipPrefix.ClientID","txtSlipNoTo.ClientID")
document.getElementById('<%=txtSlipNoTo.ClientID%>').focus();


}
if(a[0]=="2")
{
alert('Slip From No. Already in Stock.');
}
 
parent.editwin.close();
}

function textCounter(field, countfield, maxlimit) {
//alert(field);
//alert(countfield);
    if (field.value.length > maxlimit) // if too long...trim it!
        field.value = field.value.substring(0, maxlimit);
        // otherwise, update 'characters left' counter
    else 
        countfield.value = maxlimit - field.value.length;
}


 function perbookcheck()
 {
 
 var bookto=document.getElementById('<%=txtBookNoTo.ClientID%>')  ;
var total=document.getElementById('<%=txtTotalNoBooks.ClientID%>') ;

 var SlipsPerBook=document.getElementById('<%=txtSlipPerBook.ClientID%>').value ;
 var BookNoFrom=document.getElementById('<%=txtBookNoFrom.ClientID%>') ;
  
 if(SlipsPerBook=="0")
 {
 bookto.value="";
 BookNoFrom.value="";
 total.value="";
 
 }
 else
 {
 if(BookNoFrom.value=="")
 {
 BookNoFrom.value=globalvar;
 }
 
 }
 
 }
 
     </script>

     <form id="form1" runat="server">
         <input id="hiddenRange" type="hidden" />
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
         <div  style="padding-left:8px">
             <table class="TableMain100" style="border:solid 1px white;" >
                 <tr style="display: none;">
                     <td align="right" colspan="4" style="text-align: center">
                         <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                             ValueType="System.String" Width="310px" ID="ASPxComboBox1" SelectedIndex="0"
                             ClientInstanceName="xxx" OnCallback="ASPxComboBox1_Callback">
                             <ClientSideEvents EndCallback="function(s, e) {insertCheck(xxx.cpDataExists);}" />
                         </dxe:ASPxComboBox>
                     </td>
                 </tr>
                 <%--<tr>
                     <td align="right" colspan="4" class="EHEADER" style="text-align: center;">
                         <span style="color: #3300cc"><strong>DP Slips Stock</strong></span><br />
                     </td>
                 </tr>--%>
                 <tr>
                     <td align="right">
                         <span class="gridcellleft">DP ID </span>
                     </td>
                     <td colspan="3" align="left">
                         <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                             ValueType="System.String" Width="310px" ID="ddlDPID" SelectedIndex="0" ClientInstanceName="dpClient"
                               
                             OnCallback="ddlDPID_Callback">
                             <ClientSideEvents SelectedIndexChanged="function(s, e) { OnDpIdChange(s.GetValue()); }">
                             </ClientSideEvents>
                         </dxe:ASPxComboBox>
                     </td>
                 </tr>
                 <tr>
                     <td align="right">
                         <span class="gridcellleft">Slip Type</span>
                     </td>
                     <td colspan="3" align="left">
                         <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                             ValueType="System.String" Width="310px" ID="ddlSlipType" ClientInstanceName="SlipClient"
                               
                             OnCallback="ddlSlipType_Callback1" SelectedIndex="0">
                             <ClientSideEvents EndCallback="function(s, e) {AssignValues(SlipClient.cpDataExists);}"
                                 SelectedIndexChanged="function(s, e) { OnSlipTypeChanged(s.GetValue()); }" />
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
                                 <dxe:ListEditItem Text="Combined Instruction Slips (POA)" Value="99" />
                                 
                                  <dxe:ListEditItem Text="Delivery Instruction (On/Off Market)" Value="100" />
                                  
                                 
                             </Items>
                         </dxe:ASPxComboBox>
                     </td>
                 </tr>
                 <tr>
                    <td align="right">
                        <span class="gridcellleft">Stock In Date:</span>
                     </td>
                     <td colspan="3">
                     <dxe:ASPxDateEdit ID="txtStockDate" runat="server" ClientInstanceName="e1" 
                                             Width="150px" EditFormat="Custom" UseMaskBehavior="True"
                                            AllowNull="False" EditFormatString="dd-MM-yyyy" >
                                            <ButtonStyle Width="13px"></ButtonStyle>
                                        </dxe:ASPxDateEdit>
                     </td>    
                 </tr>
                 <tr width="100%">
                     <td align="right" width="30%">
                         <span class="gridcellleft">Slip Number Prefix </span>
                     </td>
                     <td align="left" style="width: 103px">
                         <asp:TextBox ID="txtSlipPrefix" runat="server" onkeypress="return AllowCharacterOnly(this);"
                               MaxLength="4" Width="150px"></asp:TextBox>
                     </td>
                     <td style="width: 129px">
                         <span class="gridcellleft">Slips per book</span></td>
                     <td width="40%">
                         <asp:TextBox ID="txtSlipPerBook" runat="server" onkeypress="return AllowNumericOnly(this);"
                             MaxLength="3" Text="0" Width="150px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td align="right">
                         <span class="gridcellleft">Slip Number From</span></td>
                     <td align="left" style="width: 103px" >
                         <asp:TextBox ID="txtSlipNoFrom" runat="server" MaxLength="20" onkeypress="return AllowNumericOnly(this);"
                             Width="150px"></asp:TextBox></td>
                     <td style="width: 129px">
                         <span class="gridcellleft">Slip Number To </span>
                     </td>
                     <td>
                         <asp:TextBox ID="txtSlipNoTo" runat="server" MaxLength="20" onkeypress="return AllowCharacterAndNumber(this);"
                             Width="150px"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td align="right" >
                         <span class="gridcellleft">Book Number From</span>
                     </td>
                     <td align="left" style="width: 103px" >
                         <asp:TextBox ID="txtBookNoFrom" runat="server" MaxLength="10" onkeypress="return AllowCharacterAndNumber(this);"
                             Width="150px"></asp:TextBox>
                     </td>
                     <td style="width: 129px">
                         <span class="gridcellleft">Book Number To </span>
                     </td>
                     <td>
                         <asp:TextBox ID="txtBookNoTo" runat="server" MaxLength="10" Width="150px" onblur="perbookcheck()"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td align="right">
                         <span class="gridcellleft">Total Number of Books</span>
                     </td>
                     <td align="left" colspan="3" >
                         <asp:TextBox ID="txtTotalNoBooks" runat="server" Width="152px" ReadOnly="True"></asp:TextBox></td>
                     
                 </tr>
                 <tr>
                     <td align="right">
                         <span class="gridcellleft">Remarks</span>
                     </td>
                     <td colspan="3" align="left">
                         <asp:TextBox ID="txtRemarks" runat="server" MaxLength="50" Height="52px" TextMode="MultiLine"
                             Width="310px" onKeyDown="textCounter(this,remLen,50);" onKeyUp="textCounter(this,remLen,50);">
                         </asp:TextBox>
                         <input readonly type="text" id="remLen" maxlength="2" value="50" tabindex="100" style="width: 18px">
                         characters left</td>
                 </tr>
                 <tr>
                     <td>
                     </td>
                     <td align="left" colspan="3">
                         <dxe:ASPxButton ID="btnSave" runat="server" 
                              AutoPostBack="false" Text="Save" ValidationGroup="a">
                             <ClientSideEvents Click="function(s, e) {insert();}" />
                         </dxe:ASPxButton>
                     </td>
                 </tr>
             </table>
          
         </div>
     </form>
 </body>
</html>

