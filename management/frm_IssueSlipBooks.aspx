<%@ page language="C#" autoeventwireup="true" inherits="management_frm_IssueSlipBooks, App_Web_x5xbqja1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %> 
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
 
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <%--<script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>--%>

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
        
        function AfterShowClickView_IfSlipExist()
        {
           tdsignaturepanel.style.display='inline';
           
        }
        function EntryTableInitialView()
        {
//         trMarketTypeToFrom.style.display='inline';
//         tCmAccExch.style.display='none';
//         trISIN.style.display='none';
//         trDPidClientID.style.display='none';
//         tdsettlementto.style.display='none';
//         tdsettlementto1.style.display='none';
//         tdsettlementfrom.style.display='none';
//         tdsettlementfrom1.style.display='none';
//         tdmkttypefrom.style.display='none';
//         tdmkttypefrom1.style.display='none';
//         tdmkttypeto.style.display='none';
//         tdmkttypeto1.style.display='none';
//         trinsttype.style.display='none';
//         tdCmAccNo.style.display='none';
//         tdCmAccNo1.style.display='none';
//         tdExch.style.display='none';
//         tdExch1.style.display='none';
        
        }
        function Signature_PopUpCall(obj)
        {
            //parent.OnMoreInfoClick(obj,"Large Image",'940px','450px',"N");  
              var BenAccNo;  
//             alert(document.getElementById('txtClient').value);         
             //alert('<%= dp %>');
//             alert(obj);
             //alert(document.getElementById('hiddenbenid').value);
             BenAccNo=document.getElementById('hiddenbenid').value;
            
             
             if('<%= dp %>'=='CDSL')
               {
                 BenAccNo=BenAccNo.split('[')[1].toString().split(']')[0]; 
                 //alert(BenAccNo);
                 BenAccNo=BenAccNo.substr(9,8);
                 //alert(BenAccNo);  
                 var url='view_signature.aspx?id=' + BenAccNo+'[CDSL]';
//                 parent.OnMoreInfoClick(url,"View Signature",'500px','500px',"Y");  
                 popup.SetContentUrl(url);
                 popup.Show();
                      
               }
             else
               {
                BenAccNo=BenAccNo.split('[')[1].toString().split(']')[0]; 
                //alert(BenAccNo);  
                var url='view_signature.aspx?id=' + BenAccNo+'[NSDL]';
//                parent.OnMoreInfoClick(url,"View Signature",'500px','500px',"Y"); 
                    popup.SetContentUrl(url);
                    popup.Show(); 
               }    
        }
       function keyVal(obj)
        {   
              document.getElementById('tdsignaturepanel').style.display='inline';
            
              grid.PerformCallback();
                
            
        }
        function Signature_Show(obj1,obj2,obj3)
        {
        //parent.OnMoreInfoClick(obj,"Large Image",'940px','450px',"N");     
         //alert(document.getElementById('txtClient').value);
         //alert(obj1);
         //alert(obj2);
         //alert(obj3);         
         //alert('<%= dp %>');
         var transactiondate=obj1;
         var LedgerBalance=obj2;
         var BenAccNo;
        
         if('<%= dp %>'=='NSDL')
         {
               document.getElementById('hiddenbenid').value=obj3;
               BenAccNo=document.getElementById('hiddenbenid').value;
               BenAccNo=BenAccNo.split('[')[1].toString().split(']')[0];
               //alert(BenAccNo);
         }
         if(obj1!='undefined')
         {
            document.getElementById('lbltransactiondate').innerText=transactiondate;
         }
         if(obj2!='undefined')
         {
            document.getElementById('lblLedgerBalance').innerText=LedgerBalance;
         }
        
             
             
             
         
              if('<%= dp %>'=='CDSL')
             {   
                  document.getElementById('hiddenbenid').value=obj3; 
                  BenAccNo=document.getElementById('hiddenbenid').value;
                  //alert(BenAccNo);
             }
        }
        
       function SignOff()
        {
            window.parent.SignOff();
        }
    
       function PageLoad()
        {
            
            FieldName='btnSave';
            document.getElementById('txtAccount_hidden').style.display="none";
             document.getElementById('Div1').style.visibility='hidden';
            document.getElementById('tdsignaturepanel').style.display='none';

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
            var slipPrefixLength=document.getElementById('<%=txtSeries.ClientID%>').value.length;
                if (slipPrefixLength==4)
                    return false;
                else
                {
                    var keycode;
                    if (window.event) keycode = window.event.keyCode;
                    else if (event) keycode = event.keyCode;
                    else if (e) keycode = e.which;
                    else return true;
                    if( (keycode > 64 && keycode <= 90) || (keycode > 96 && keycode <= 122) )
                    {
                       if (keycode > 96 && keycode <= 122)
                        {
                         var slipPrefix = document.getElementById('<%=txtSeries.ClientID%>').value;
                         var upperSlipPrefix= String.fromCharCode(keycode-32);
                         document.getElementById('<%=txtSeries.ClientID%>').value=slipPrefix+upperSlipPrefix;
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
            
         function textCounter(field, countfield, maxlimit)
        {
 
            if (field.value.length > maxlimit) // if too long...trim it!
                field.value = field.value.substring(0, maxlimit);
                // otherwise, update 'characters left' counter
            else 
                countfield.value = maxlimit - field.value.length;
        } 


        function CallAjax(obj1,obj2,obj3)
        {
            var obj4=dpClient.GetValue();
            ajax_showOptions(obj1,obj2,obj3,obj4,'Main');
            
        }
     
        function SearchOnPrefix(s)
        {
            //alert(s);
            var dest=document.getElementById('<%=txtTotalBook.ClientID%>'); 
            var param=dpClient.GetValue()+'~'+SlipClient.GetValue()+'~'+document.getElementById('<%=txtSeries.ClientID%>').value+'~'+s+'~'+document.getElementById('<%=txtSlipFrom.ClientID%>').value+'~'+document.getElementById('<%=txtSlipTo.ClientID%>').value;
            PageMethods.GetContactName(param, CallSuccess, CallFailed, dest);
         
        }
        // set the destination textbox value with the ContactName
         function CallSuccess(res, destCtrl)
         {  
            //alert(res);
            //alert(destCtrl);   
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
//             alert(account);
//             alert(slipfrom);
//             alert(slipto);
 
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
            document.getElementById('<%=txtTotalBook.ClientID%>').value="";
            document.getElementById('<%=txtSlipTo.ClientID%>').value="";
           // parent.PopulateGrid();
             SearchOnPrefix('pre');
		pageclose();
       }

         function AssignValues(s)
         {
         var a=s.split(','); 
         if(a[0]=='s')
         {
             if(a[2]!=-1)
             {
                document.getElementById('<%=txtSlipFrom.ClientID%>').value=a[1]; 
             }
             else
             {
                 document.getElementById('<%=txtSlipFrom.ClientID%>').value="";
             
                 document.getElementById('<%=txtSlipTo.ClientID%>').value="";
             
                 alert('Please Update Stock Entry');
             }
         }         
         if(a[0]=='b')
         {
             //alert(a);
//             alert(a[1]);
//             alert(a[2]);
//             alert(a[3]);
             document.getElementById('<%=txtTotalBook.ClientID%>').value=a[3];
//             var numberFrm;
//             var numberTo;
//             var stringsFrm;
//             var stringsTo;
             
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
//            var from=document.getElementById('<%=txtBookNoFrom.ClientID%>').value;
//              var total=document.getElementById('<%=txtTotalBook.ClientID%>').value;
//              var number;
//              number=from.match(/\d+/,from); 
//              var x=number;
//              var bookToValue;
//              var y;
//              y=parseInt(number)+''; 
//              if (null==number)
//              { 
//                  BookNoFrom.value=BookNoFrom.value+'1' ;
//              } 
//               number==from.match(/\d+/,from);
//               x=number; 
//               bookToValue=parseInt(number)+parseInt(total); 
//            if(x[0].length>y.length)
//              {
//                    bookToValue=zeroPad(bookToValue,x[0].length-y.length); 

//               } 
//             if(from!="")
//               { 
//                 document.getElementById('<%=txtBookNoTo.ClientID%>').value= from.substring(0,(from.length-x[0].length))+(bookToValue-1) ;
//                 
//               } 
//         SearchOnPrefix('assignSlip');
//         FrmToBookCheck(); 
         }

	    function pageclose()
            {
                var x=window.confirm("Do you want to close the window?");
                if(x)
                {
                parent.editwin.close();
                }
                else
                {
//                 document.getElementById('txtisin').focus();
                }
                
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
       
         
 
function TABLE1_onclick() {

}

     </script>
      
    <form id="form1" runat="server">
    <div align="left">
    <table class="TableMain100"><tr>
                 <td align="left" colspan="140" class="EHEADER" style="text-align: center;">
                     <span style="color: #3300cc"><strong>Issue Slips</strong></span><br />
                 </td>
             </tr>
             <asp:ScriptManager ID="s1" runat="server" EnablePageMethods="true">
         </asp:ScriptManager>
         <%--<table style="border:solid 1px white;">--%>
             <tr style="display: none;">
             <td>
             <table border="10px">
             <tr>
                 <td align="left" style="width: 109px">
                 </td>
                 <td align="left">
                     <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                         ValueType="System.String" ID="ASPxComboBox1" SelectedIndex="0"
                         
                         ClientInstanceName="xxx" OnCallback="ASPxComboBox1_Callback">
                         <ClientSideEvents EndCallback="function(s, e) {insertCheck(xxx.cpDataExists);}" />
                     </dxe:ASPxComboBox>
                 </td>
                 <td align="left">
                     </td>
                    </tr>
                   </table>
                </td> 
             </tr>
             <%--<tr align="left">
                <td style="width: 99px">
                </td>
                <td>
                </td>
                 
             </tr>--%>
             <%--<tr align="left">
                <td style="width: 99px">
                </td>
                <td>
                </td>
                
             </tr>--%>
             <tr>
                <td>
                <table border="10px">
                <tr>
                 <td align="left" style="width:108px">
                     <span class="gridcellleft">DP ID </span>
                 </td>
                 <td align="left" style="width: 321px">
                     <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                         
                         ValueType="System.String" Width="289px" ID="ddlDPID" ClientInstanceName="dpClient">
                         <ClientSideEvents ValueChanged="function(s, e) {ClearTextBox();}" />
                     </dxe:ASPxComboBox>
                 </td>
                 <td>
                
                <table>
                <tr>
                 <td align="left" style="width:40px">
                      <%--<dxe:ASPxLabel ID="lbltransactiondatecaption" runat="server" Text="Last Trans Date:"></dxe:ASPxLabel>
                      <dxe:ASPxLabel ID="lbltransactiondate" ClientInstanceName="trandate" runat="server" Text=""></dxe:ASPxLabel>--%>
                      <asp:Label ID="lbltransactiondatecaption" runat="server" Text="Last Trans Date:" Width="134px"></asp:Label></td>
                 <td align="left" style="width:100px">
                      <label id="lbltransactiondate" runat="server">
                       </label><%--<asp:Label ID="lbltransactiondate" runat="server"></asp:Label>--%></td>
                  </tr>
               </table>
               </td>
               </tr>
               </table>
                 </td>
             </tr>
             <tr>
             <td>
             <table border="10px">
             <tr>
                 <td align="left" style="width: 109px">
                     <span class="gridcellleft">Account No</span>
                 </td>
                 <td align="left" style="width: 321px">
                     <asp:TextBox ID="txtAccount" runat="server" Width="296px"></asp:TextBox><asp:TextBox ID="txtAccount_hidden" runat="server" Width="14px"></asp:TextBox>
                 </td>
                  <td>
                <table style="height:40px">
                <tr>
                 <td align="left" style="width:40px">
                 
                      <asp:Label ID="lblLedgerBalanceCaption" runat="server" Text="Ledger Balance:" Width="136px" Height="7px"></asp:Label>
                 </td>
                 <td align="left" style="width:100px">
                      <label id="lblLedgerBalance" runat="server"></label>
                      <%--<asp:Label ID="lblLedgerBalance" runat="server"></asp:Label>--%>
                        <%--<dxe:ASPxLabel ID="lblLedgerBalanceCaption" runat="server" Text="Ledger Balance:"></dxe:ASPxLabel>
                      <dxe:ASPxLabel ID="lblLedgerBalance" ClientInstanceName="LedgerBal" runat="server" Text=""></dxe:ASPxLabel>--%>
                        
                 </td>
                 </tr>
                 </table>
                 </td>
                 </tr>
                 </table>
                 </td>  
             </tr>
             <tr>
            
             </tr>
             <tr>
             <td>
             <table border="10px">
             <tr>
                 <td align="left" style="width: 110px">
                     <span class="gridcellleft">Date</span></td>
                 <td align="left">
                     <dxe:ASPxDateEdit ID="txtDate" runat="server" ClientInstanceName="e1" 
                        
                         EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" AllowNull="False">
                         <ButtonStyle Width="13px">
                         </ButtonStyle>
                         <Paddings PaddingBottom="0px"></Paddings>
                     </dxe:ASPxDateEdit>
                 </td>
                 </tr>
                 </table>
                 </td>
             </tr>
             <tr>
             <td>
             <table border="10px">
             <tr>
               
                 <td align="left" style="width: 110px">
                     <span class="gridcellleft">Slip Type</span>
                 </td>
                 <td align="left">
                     <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                         
                         ValueType="System.String" Width="300px" ID="ddlSlipType" ClientInstanceName="SlipClient" 
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
                             <dxe:ListEditItem Text="Inter-Depository " Value="9" />
                             <dxe:ListEditItem Text="Pledge&amp;Hypothecation" Value="10" />
                             <dxe:ListEditItem Text="SLB Instructions " Value="11" />
                             <dxe:ListEditItem Text="Demat Request Forms" Value="12" />
                             <dxe:ListEditItem Text="Remat Request Forms" Value="13" />
                             
                              <dxe:ListEditItem Text="Delivery Instruction (On/Off Market)" Value="100" />
                              
                             
                         </Items>
                     </dxe:ASPxComboBox>
                 </td>
                 </tr>
                 
                 </table>
                
                   </td>
             </tr>
         </table>
                   
                   <table>
         <tr>
        
                    </tr>
                    
             <tr>
             <td style="width: 552px">
             <table border="10px">
             <tr>
                 <td class="gridcellleft" align="left" valign="top" style="width: 99px;">
                                    <span>Will be used for POA</span></td>
                         <td align="left" valign="top" style="width: 269px; height: 39px">
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
                     <td align="left" class="gridcellleft" style="width: 99px" valign="top">
                         Is Slip Loose</td>
                     <td align="left" style="width: 269px; height: 39px" valign="top">
                         <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" Width="50px" ID="Cmb_IsSlipLoose" SelectedIndex="1">
                             <items>
                                <dxe:ListEditItem Text="Yes" Value="Y"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="No" Value="N"></dxe:ListEditItem>
                             </items>
                         </dxe:ASPxComboBox>
                    </td>
                 </tr>
                  <tr>
                     <td align="left" class="gridcellleft" style="width: 99px" valign="top">
                         Dis Format</td>
                     <td align="left" style="width: 269px; height: 39px" valign="top">
                         <dxe:ASPxComboBox runat="server" EnableSynchronization="False" 
                         EnableIncrementalFiltering="True" ValueType="System.String" Width="60px" 
                         ID="Cmb_DisFormat" SelectedIndex="0">
                             <items>
                                <dxe:ListEditItem Text="Old" Value="O"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="New" Value="N"></dxe:ListEditItem>
                             </items>
                         </dxe:ASPxComboBox>
                    </td>
                 </tr>
                </table>
                </td> 
             </tr>
        <tr>
            <td align="left" class="gridcellleft" colspan="2" style="height: 39px" valign="top" >
                            <table border="10px">
                            <tr>
                             <td style="width: 41px">
                                 Prefix 
                             </td>
                             <td  style="width: 40px">
                                 <asp:TextBox ID="txtSeries" runat="server"  MaxLength="4" onkeypress="return AllowCharacterOnly(this);"
                                    onblur="SearchOnPrefix('pre');"
                                     Width="37px"></asp:TextBox>
                             </td>
                             <td  style="width: 60px">
                                 Slip No From</td>
                             <td style="width: 20px">
                                 <asp:TextBox ID="txtSlipFrom" runat="server"  onkeypress="return AllowNumericOnly(this);"
                                     MaxLength="20" Width="63px"></asp:TextBox>
                             </td>
                             <td  style="width: 60px">
                                 Slip No To</td>
                             <td>
                                 <asp:TextBox ID="txtSlipTo" runat="server"  onkeypress="return AllowNumericOnly(this);"
                                     MaxLength="20" onblur="SearchOnPrefix('slip');" Width="68px"></asp:TextBox>
                             </td>
                             <td class="gridcellleft" style="width: 60px">
                                 Total Book</td>
                             <td class="gridcellleft" style="height: 26px">
                                 <asp:TextBox ID="txtTotalBook" runat="server"  onkeypress="return AllowNumericOnly(this);"
                                     MaxLength="3" onblur="BookTo();" Width="68px"></asp:TextBox>
                             </td>
                             
                                     </tr>
                             </table>
            </td>
        </tr>
       
        <tr style="display:none">
            <td align="left" colspan="2" style="display:none">
                     <table cellspacing="0" cellpadding="0" align="left" style="padding-left: 5px;
                         padding-top: 2px; padding-right: 2px; padding-bottom: 2px; width: 866px;"  border="10px" id="TABLE1" onclick="return TABLE1_onclick()">
                         <tr>
                             <td class="gridcellleft" style="width: 104px" >
                                 Book Number From</td>
                             <td class="gridcellleft" style="height: 26px; width: 158px;">
                                 <asp:TextBox ID="txtBookNoFrom" runat="server"  onkeypress="return AllowCharacterAndNumber(this);"
                                     MaxLength="10"></asp:TextBox></td>
                                     
                              <td class="gridcellleft" style="width: 101px">
                                Book Number To</td>
                             <td class="gridcellleft">
                                 <asp:TextBox ID="txtBookNoTo" runat="server"  onkeypress="return AllowCharacterAndNumber(this);"
                                     MaxLength="10"  ReadOnly="True"></asp:TextBox>
                             </td>
                          </tr>
                          </table>
               </td>
                
              
         </tr>       
        <tr>
             <td style="width: 552px">
             <table border="10px">
             <tr>
                             <td class="gridcellleft" style="width: 162px">
                                 Remarks</td>
                             <td  class="gridcellleft" colspan="3">
                                 <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Width="300px" onKeyDown="textCounter(this,remLen,50);"
                                     onKeyUp="textCounter(this,remLen,50);"></asp:TextBox>
                                 <input readonly type="text" id="remLen" maxlength="2" value="50" tabindex="100" style="width: 18px">
                                 characters left
                             </td>
               </tr>
              </table>
              </td>
        </tr>                   
        <tr>
                           
             <td style="text-align: center;">
                                 <dxe:ASPxButton ID="btnSave" runat="server" 
                                     AutoPostBack="false" Text="Save" ValidationGroup="a">
                                     <ClientSideEvents Click="function(s, e) {insert();}" />
                                 </dxe:ASPxButton>
                             </td>
                             <td style="display:none; width: 156px;">
                                <dxe:ASPxButton ID="BtnPrint1" runat="server" AutoPostBack="True" Text="Generate" Visible="false" TabIndex="12" OnClick="BtnPrint1_Click">
                                </dxe:ASPxButton>
                             </td>
          </tr>
          </table>
             <%--<tr>
                 <td align="left" colspan="2">
                     <table cellspacing="0" cellpadding="0" align="left" style="padding-left: 5px;
                         padding-top: 2px; padding-right: 2px; padding-bottom: 2px; width: 866px;" id="TABLE1" onclick="return TABLE1_onclick()">
                         <!--<tr>
                             <td class="gridcellright" style="width: 26px" >
                                 Book Number From</td>
                             <td class="gridcellleft" style="height: 26px">
                                 <asp:TextBox ID="txtBookNoFrom" runat="server"  onkeypress="return AllowCharacterAndNumber(this);"
                                     MaxLength="10"></asp:TextBox></td>
                             <td class="gridcellright" style="width: 26px">
                                 Total Book</td>
                             <td class="gridcellleft" style="height: 26px">
                                 <asp:TextBox ID="txtTotalBook" runat="server"  onkeypress="return AllowNumericOnly(this);"
                                     MaxLength="3" onblur="BookTo();"></asp:TextBox>
                                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                 &nbsp; &nbsp; &nbsp; &nbsp;
                             </td>
                         </tr>-->
                         <!--<tr>
                             <td class="gridcellright" style="width: 26px">
                                Book Number To</td>
                             <td class="gridcellleft">
                                 <asp:TextBox ID="txtBookNoTo" runat="server"  onkeypress="return AllowCharacterAndNumber(this);"
                                     MaxLength="10" onblur="FrmToBookCheck();" ReadOnly="True"></asp:TextBox>
                             </td>
                             <td>
                             </td>
                             <td>
                             </td>
                         </tr>-->
                         <tr>
                             <td class="gridcellright" style="width: 162px">
                                 Slip No From</td>
                             <td class="gridcellleft">
                                 <asp:TextBox ID="txtSlipFrom" runat="server"  onkeypress="return AllowNumericOnly(this);"
                                     MaxLength="20"></asp:TextBox>
                             </td>
                             <td class="gridcellright" style="width: 60px">
                                 Slip No To</td>
                             <td class="gridcellleft">
                                 <asp:TextBox ID="txtSlipTo" runat="server"  onkeypress="return AllowNumericOnly(this);"
                                     MaxLength="20" onblur="SearchOnPrefix('slip');"></asp:TextBox>
                             </td>
                         </tr>
                         
                         <tr>
                             <td style="width: 162px" >
                             </td>
                            
                             
                         </tr>
                     </table>
                     </td>
             </tr>--%>
         <%--</table>--%>
         
         <div id='Div1' style="position: absolute; font-family: arial; font-size: 30; left: 53%;
             top: 61%;background-color: white; layer-background-color: white; height: 80;
             width: 150;">
             <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                 <tr>
                     <td style="height: 47px">
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
        <div id='Div2' style="position: absolute; font-family: arial; font-size: 30; left: 61%;
             top: 25%;background-color: white; layer-background-color: white; height: 80;
             width: 150;">
        <table class="TableMain100" style="width: 1%">
        <tr>
        <td id="tdsignaturepanel" align="left" rowspan="5" valign="top" style="width: 326px">
                        <asp:Panel ID="Panel1" runat="server" Height="150px" ScrollBars="Auto" Width="323px">
                            <dxwgv:ASPxGridView id="gridSign" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
                                customcallback="gridSign_CustomCallback"
                                KeyFieldName="doc_source" 
                                Width="100%" OnCustomCallback="gridSign_CustomCallback" OnCustomJSProperties="gridSign_CustomJSProperties">
                                <clientsideevents endcallback="function(s, e) {Signature_Show(s.cpTranDateValue,s.cpLedgerBalance,s.cpBenID);}"></clientsideevents>
                                <styles>
<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</styles>
                                <settingspager visible="False"></settingspager>
                                <columns>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" Caption="Signature">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<DataItemTemplate>
<a href="javascript:void(0);" onclick="Signature_PopUpCall('<%# Container.KeyValue %>')" tabindex="-1">
                                    <asp:Image ID="Image1" runat="server" TabIndex="-1" ImageUrl='<%# Eval("doc_source") %>'/>
                                </a>
</DataItemTemplate>

<CellStyle HorizontalAlign="Center"></CellStyle>
</dxwgv:GridViewDataTextColumn>
</columns>
                                <border bordercolor="#DDECFE"></border>
                            </dxwgv:ASPxGridView>
                            <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="view_signature.aspx"
                                                CloseAction="CloseButton" Top="100" Left="400" ClientInstanceName="popup" Height="500px"
                                                Width="900px" HeaderText="View Signature">
                                                <ContentCollection>
                                                    <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                                    </dxpc:PopupControlContentControl>
                                                </ContentCollection>
                                                <HeaderStyle BackColor="Blue" Font-Bold="True" ForeColor="White" />
                             </dxpc:ASPxPopupControl>
                        </asp:Panel>
                    </td>
        </tr>
        </table>
        </div>

    </div>
              <asp:HiddenField ID="hiddenbenid" runat="server" />
              <asp:HiddenField ID="hdnTransactionDate" runat="server" />
              <asp:HiddenField ID="hdnLedgerBalance" runat="server" />

    </form>
</body>
</html>
