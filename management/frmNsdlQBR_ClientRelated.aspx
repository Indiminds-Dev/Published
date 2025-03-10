<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlQBR_ClientRelated, App_Web_cvaj-tqf" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
    <%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Untitled Page</title>
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
	/*  Loading
**********************************************************************/

.loading {
	position: absolute;
	display: none;
	border: 1px solid #5c9ccc;
	padding: 2px;
	background-color: #5c9ccc;
	color: #ffffff;
	opacity: 0.90;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	width: 100px;
	height: 50px;
	text-align: center;
	z-index: 100000;
}
	
       .rightAlign { text-align:right; }     

	</style>   
    <script language="javascript" type="text/javascript">
        function txtclear(obj)
        {
            obj.value='';
        }
	    function CallAjaxclient(obj1,obj2,obj3)
        {
            
            var Variable1 =document.getElementById('hiddendpid').value; 
            var str=Variable1.substring(0,3); 
           //alert(Variable1+'~'+document.getElementById('hiddendpid').value);
                                             
            ajax_showOptions(obj1,obj2,obj3,str+'~'+Variable1,'Main');
          
          //document.getElementById("hidden_setfocus").value=obj1.name;
        }
        function PageLoad()
       {    
            FieldName='any';
            dttran1.SetDate(new Date()); 
//            document.getElementById('imgloading').style.display='none';
       
       } 
      function height()
        {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '700px';
        window.frameElement.Width = document.body.scrollWidth;
        }
      function large(obj)
    {     
//       {
//        
         //parent.OnMoreInfoClick(obj,"Large Image",'940px','450px',"N");     
         //alert(document.getElementById('txtClient').value);         
       
         var ss=new String(document.getElementById('hiddenbenaccno').value);
        
//         if('<%= dp %>'=='CDSL' ||'<%= dp %>'=='10')
            if(document.getElementById('hiddenSegment').value=='c')
           {   
             var url='view_signature.aspx?id=' + ss.substr(5,8)+'[CDSL]';
             parent.OnMoreInfoClick(url,"View Signature",'940px','450px',"Y");         
           }
         else
           {
            var url='view_signature.aspx?id=' + ss+'[NSDL]';
            parent.OnMoreInfoClick(url,"View Signature",'940px','450px',"Y");      
           }    
    }
    

     function OnMoreInfoClick(obj) 
        { 
        var ss=new String(document.getElementById('hiddenbenaccno').value);    
        if(dptype=='CDSL')
         {   
         var url='view_signature.aspx?id=' + ss+'[CDSL]';
         parent.OnMoreInfoClick(url,"Edit Seetlement Details",'940px','450px',"Y");         
         }
         else
         {
         var url='view_signature.aspx?id=' + ss+'[NSDL]';
          parent.OnMoreInfoClick(url,"Edit Seetlement Details",'940px','450px',"Y");      
         }
        }
       function keyVal(obj)
       {   
       
//        var BenAccNo=new string(obj);
//        document.getElementById('hiddenbenaccno').value=BenAccNo.split('~')[0];
//        alert(document.getElementById('hiddenbenaccno').value);
        var status=new String(obj);
        status=status.split('~')[0];
        var status1=new String(status.split('_')[0]);
        var segment=status.split('_')[1];
        document.getElementById('hiddenSegment').value=segment;
        // if('<%= dp %>'=='NSDL' || '<%= dp %>'=='9' )
         if(segment=='n')
         {
         
            var substring=status.substring(8,16);
            var nsdldpid=status.substring(0,8);
            document.getElementById('hiddenbenaccno').value=substring;
             document.getElementById('hiddenclientdpid').value=nsdldpid;
           
         }
         else
         {
            
            var cdsldpid= '120' + status1.substring(0,5);
            document.getElementById('hiddenclientdpid').value=cdsldpid;
            document.getElementById('hiddenbenaccno').value=status1;
            
         }
//        document.getElementById('UpdatePanel2').style.visibility='hidden';
                  
        }
        void setgridempty_whenslipchange()
        {
            settlegrid.PerformCallback(param);
            grid.PerformCallback(param);
        }
        function DateChangeForFrom(s)
           {
                var currentTime = new Date()
                if(currentTime<s.GetValue())
                {           
               
                }
                else
                {                 
                s.SetDate(currentTime);  
                                    
                }
            
            }
        function validateform()
        {
           if(document.getElementById('txtclient').value=='')
            {
                alert('Please Enter Client Id');
                document.getElementById('txtclient').focus();
                return false;
            }
            if(document.getElementById('txtslip').value=='')
            {
                alert('Please Enter Slip No');
                document.getElementById('txtslip').focus();
                return false;
            }
            if(document.getElementById('txt_totalNoOfInst').value=='')
            {
                alert('Please Enter Total No Of Instruction');
                document.getElementById('txt_totalNoOfInst').focus();
                return false;
            }
        }
        function ShowResult(str)
        {
//            alert(str);
//           
//            if(str!=null)
//            {
//                arr=str.split('~');
//                if(arr[0]='show')
//                document.getElementById('imgloading').style.display='inline';
//                if(arr[0]='hide')
//                document.getElementById('imgloading').style.display='none';
//                   
//            }
            
        }     
        function ShowError(obj)
        {
            document.getElementById('Div1').style.display="none";
            if(obj=="b")
            {
                alert('Accounts Ledger Repost !!');
            }
            else
            {
                alert('No Data In This Company And Segment !!');
            }
        }     
        function showmsg()
        {
//            var msg=document.getElementById("hiddenmsg").value;
//            if(msg!='')
//                alert(msg);
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
        
        
        function showholding_pop(s)
        {
       
         var accholdername;
         var holdingdate;
         
         if(s!=null)
         { 
          arr = s.split('~');
          accholdername=arr[0];
          holdingdate=arr[1];
         }
         
        //if('<%= dp %>'=='NSDL' || '<%= dp %>'=='9' )
         if(document.getElementById('hiddenSegment').value=='n')
         {
          var dpid=document.getElementById('txtClient').value;
          dpid=dpid.substr(0,8);   
//         alert(dpid);

          var header='Free Holding Of '+accholdername+'['+dpid+'] On '+ holdingdate;
          

          //var url='FrmNsdl_ShowClientHolding_popup.aspx?BenAccNo='+dpid;
           var url='FrmNsdl_ShowClientHolding_popup.aspx?seg=NSDL&BenAccNo='+document.getElementById('hiddenbenaccno').value + '&dpid=' + document.getElementById('hiddenclientdpid').value + '&acc=' + accholdername + '&cid='+ dpid + '&dt=' + holdingdate;
        
           
          parent.OnMoreInfoClick(url,header,'940px','460px',"Y"); 
         }
         else
         {
          var dpid=document.getElementById('txtClient').value;
          dpid=dpid.substr(0,8);   
//          alert(document.getElementById('hiddendpid').value);
//          alert(dpid);
//             var arr1=holdingdate.split(' ');
//            holdingdate=arr1[0];
          var header='Free Holding Of '+accholdername+'['+dpid+'] On '+ holdingdate;
          
           
//          var url='FrmCdsl_ShowClientHolding_popup.aspx?BOID='+document.getElementById('hiddendpid').value+dpid;
     var url='FrmCdsl_ShowClientHolding_popup.aspx?seg=CDSL&BOID='+document.getElementById('hiddenclientdpid').value+document.getElementById('hiddenbenaccno').value.substring(5) + '&acc=' + accholdername + '&cid=' + dpid + '&dt=' + holdingdate;
    

          parent.OnMoreInfoClick(url,header,'960px','480px',"Y"); 
         }
        }
        function dormant_showholding_pop(s)
        {
         if('<%= dp %>'=='NSDL' || '<%= dp %>'=='9' )
         {
           var dpid=s;
           var url='FrmNsdl_ShowClientHolding_popup.aspx?BenAccNo='+dpid;
           parent.OnMoreInfoClick(url,'Free Holding','940px','460px','Y');
         } 
         else
         {
           var dpid=s;
           //alert(dpid);
           var url='FrmCdsl_ShowClientHolding_popup.aspx?BOID='+document.getElementById('hiddendpid').value+dpid;
           parent.OnMoreInfoClick(url,'Free Holding','940px','460px','Y'); 
         }
        }
        function ClearAllControls()
        {
              for (i=0; i<document.forms[0].length; i++)
              {
                    doc = document.forms[0].elements[i];
                    switch (doc.type)
                    {
                        case "text" :
                                doc.value = "";
                                break;
                          default :
                                break;
                    }
              }
              document.getElementById('hiddenbenaccno').value='';
        }
        function setvisibility(s)
        {
//            arr = s.split('~');
//            visiblevalue=arr[0];
//            alert(visiblevalue)
//                 
//            if(visiblevalue='1')
//            {
//                document.getElementById('paneldormant').style.visibility = 'hidden'; 
//                document.getElementById('panelaccinfo').style.visibility = 'visible'; 
//                alert('1');
//            }
//             if(visiblevalue='2')
//            {
//                document.getElementById('panelaccinfo').style.visibility='hidden';
//                document.getElementById('paneldormant').style.visibility='visible'; 
//                alert('2');
//            }
        }
         
         function DateChangeForFrom()
           {
                var currentTime = new Date()
                s.SetDate(currentTime);  
           }
           function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
          
       
function Mytable_onclick() {

}

    function Showtransaction()
    {
    if(document.getElementById('hiddenSegment').value=='c')
        {
//      var url='../reports/frmReport_TransactionSingleClientCDSL.aspx?boid=1202280000006299';
//       var url='../reports/frmReport_TransactionSingleClientCDSL.aspx?boid=' + document.getElementById('hiddenbenaccno').value;
         var url='../reports/frmReport_TransactionSingleClientCDSL.aspx?boid=' + document.getElementById('hiddenclientdpid').value+document.getElementById('hiddenbenaccno').value.substring(5);  
      var  header='CDSL Transaction';
      }
      else
      {
//      var url='../reports/frmReport_TransactionSingleClientNSDL.aspx?benaccno=10000527';
       var url='../reports/frmReport_TransactionSingleClientNSDL.aspx?benaccno=' + document.getElementById('hiddenbenaccno').value;
      
      var  header='NSDL Transaction';
            
      }
     parent.OnMoreInfoClick(url,header,'940px','460px',"Y"); 
    
    
    }
    
    
      function Showledger()
    {
    if(document.getElementById('hiddenSegment').value=='c')
        {
//      var url='../reports/frmReport_TransactionSingleClientCDSL.aspx?boid=1202280000006299';
       var url='../reports/frmReport_IframeLedgerViewSingleClient.aspx?accno=' + document.getElementById('hiddenbenaccno').value + '&seg=c';
          
      var  header='Ledger Balance';
      }
      else
      {
//      var url='../reports/frmReport_TransactionSingleClientNSDL.aspx?benaccno=10000527';
       var url='../reports/frmReport_IframeLedgerViewSingleClient.aspx?accno=' + document.getElementById('hiddenbenaccno').value + '&seg=n';
      var  header='Ledger Balance';
            
      }
     parent.OnMoreInfoClick(url,header,'940px','460px',"Y"); 
    
    
    }
    
    function ShowSlip()
    {
        var accholder=document.getElementById('hiddenaccholder').value;
        var holdingdate=document.getElementById('hiddenholdingdate').value;
       var dpid= document.getElementById('hiddenclientdpid').value;
       var benid=document.getElementById('hiddenbenaccno').value;
       benid=benid.substring(benid.length-8);
      
         var url='frmIssuedSlip_NsdlCdsl.aspx?dpid=' + dpid + '&benid=' + benid;
         var  header='Slip issued for ' + accholder + ' on ' + holdingdate;
         
         parent.OnMoreInfoClick(url,header,'940px','460px',"Y"); 
    }
    
    function ShowTransaction()
    {
    
    
        var benaccno=document.getElementById('hiddenbenaccno').value;
        if(document.getElementById('hiddenSegment').value=='c')
           { 
             var url='frmTransactionSingleClient.aspx?Boid=120' + benaccno;
              window.open('http://www.google.com','ViewTransactions','width=350,height=250');    
             //parent.OnMoreInfoClick(url,"View Transactions",'940px','450px',"Y");     
            }
         else
            {
               var url='frmNSDLTransactionSingleClient.aspx?Benid=' + benaccno;
               parent.OnMoreInfoClick(url,"View Transactions",'940px','450px',"Y");     
            }
     }

	</script>
</head>
<body style="margin: 0px 0px 0px 10px; background-color: #DDECFE" onload="clearPreloadPage()">

   

    <form id="form1" runat="server" >
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            
            <table>
                        <tr>
                            <td style="width: 100px; vertical-align: top; height: 16px;">
                        <table>
                            <tr>
                                <td style="width: 100px" valign="top">
                        QueryType</td>
                                <td style="width: 100px">
                        <dxe:ASPxComboBox id="ddlSlipType" runat="server" ClientInstanceName="SlipType" EnableIncrementalFiltering="True"
                            EnableSynchronization="False" SelectedIndex="0" tabIndex="4" ValueType="System.String"
                            Width="140px" AutoPostBack="True" OnSelectedIndexChanged="ddlSlipType_SelectedIndexChanged">
                            <items>
<dxe:ListEditItem Text="Account Information" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Dormant Accounts" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="No Holding Clients" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="AMC Due Clients" Value="4"></dxe:ListEditItem>
<dxe:ListEditItem Text="Banned Entities" Value="5"></dxe:ListEditItem>
<dxe:ListEditItem Text="Active Clients" Value="6"></dxe:ListEditItem>
</items>
       
                        </dxe:ASPxComboBox></td>
                            </tr>
                        </table>
                            </td>
                            <td valign="top" style="height: 16px" >
                        <asp:Panel ID="panelaccinfo" runat="server">
                            <table>
                                <tr>
                                    <td valign="top" >
                                        ClientID</td>
                                    <td valign="top" >
                        <asp:TextBox ID="txtclient" runat="server" Width="320px" TabIndex="1" ></asp:TextBox></td>
                                   
                                </tr>
                            </table>
                        </asp:Panel>
                            </td>
                            <td valign="top" style="height: 16px" >
                       
                            </td>
                            <td valign="top" style="width: 50px; height: 16px;">
                                <table>
                                    <tr>
                                        <td style="width: 100px">
                                            &nbsp;<asp:Button ID="Button2" runat="server" CssClass="btnUpdate" OnClick="Button1_Click"
                                                OnClientClick="javascript:selecttion();" Text="Show" /></td>
                                        <td style="width: 100px; vertical-align: top;">
                                </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 3px; height: 16px;" valign="top">
                                
                                </td>
                        </tr>
                    </table>
                    <asp:Panel ID="UpdatePanel2" runat="server" Height="50px" Width="92%" Wrap="False" Visible="False">
        <table border="1" style="border-right: black thin solid; border-top: black thin solid;
            font-weight: bold; border-left: black thin solid; border-bottom: black thin solid;
            background-color: #ddecfe; text-align: left;" id="Mytable" language="javascript" onclick="return Mytable_onclick()" width="100%">
            <tr>
                <td colspan="7" style="height: 20px; width: 147px;">
                    Account Information <b> <asp:Label ID="lblClientSegment" runat="Server" ></asp:Label></b></td>
            </tr>
            <tr>
                <td style="width: 147px; height: 20px;">
                    ClientID</td>
                <td style="height: 20px; font-weight: bold;">
                    <asp:Label ID="lblfirstholdname" runat="server" ></asp:Label></td>
                <td colspan="5" style="font-weight: bold; font-size: medium; text-align: center">
                    <asp:Label ID="lblclientname" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 147px; height: 20px;">
                    Second Holder Name</td>
                <td style="font-weight: bold; height: 20px" colspan="4" >
                    <asp:Label ID="lblsecholdname" runat="server" ></asp:Label></td>
                <td colspan="1" style="width: 139px">
                    Hoding Value</td>
                <td colspan="1" style="font-weight: bold; width: 139px">
                        <dxe:ASPxButton id="ASPxButton1" runat="server" AutoPostBack="false" tabIndex="3"
                            Text="Show Free Holding" ValidationGroup="a" Width="118px" ToolTip="Click To Show the Details" OnCustomJSProperties="ASPxButton1_CustomJSProperties">
                            <clientsideevents click="function(s, e) {showholding_pop(s.cpretValue);}"></clientsideevents>
                        </dxe:ASPxButton></td>
            </tr>
            <tr>
                <td style="width: 147px; height: 20px;">
                    Current ledger Balance</td>
                <td style="height: 20px; font-weight: bold;">
                    <asp:Label ID="lblcurlegbal" runat="server"></asp:Label></td>
                <td colspan="2" style="width: 104px;">
                    Balance Since</td>
                <td style="width: 100px; font-weight: bold;">
                    <asp:Label ID="lblbalsince" runat="server"></asp:Label></td>
                <td style="width: 139px;">
                    Next AMC Due</td>
                <td style="width: 139px; font-weight: bold;">
                    <asp:Label ID="lblnxtamc" runat="server" Text='<%# Eval("LastTransaction") %>'></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 147px; height: 20px;">
                    
                    <a href="javascript:void(0);" onclick="Showledger();"><span style="font-weight:bold; color:Blue;text-decoration:underline">Last Payment by client</span></a>
                    </td>
                <td style="font-weight: bold; height: 20px;">
                    <asp:Label ID="lbllaspayment" runat="server"></asp:Label></td>
                <td colspan="2" >
                  <a href="javascript:void(0);" onclick="Showtransaction();"><span style="font-weight:bold; color:Blue; text-decoration:underline"> Last Transaction Recorded On</span></a></td>
                <td style="width: 100px; font-weight: bold;">
                    <asp:Label ID="lbllasttrans" runat="server" Text='<%# Eval("LastTransaction") %>'></asp:Label></td>
                <td style="width: 139px;">
                    Last Bill Date</td>
                <td style="width: 139px; font-weight: bold;">
                    <asp:Label ID="lbllastbill" runat="server" Text='<%# Eval("LastTransaction") %>'></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 147px; height: 20px;">
                    Account Type</td>
                <td style="font-weight: bold; height: 20px;">
                    <asp:Label ID="lblacctype" runat="server"  ></asp:Label></td>
                    <td colspan="3" rowspan="3" valign="top">
                        <table width="100%" border="1" >
                            <tr>
                                <td style="width:70px; height:100%">
                                    Address
                                </td>
                                <td colspan="2"  valign="top" style="font-weight:bold">
                                   <asp:Label ID="lbladd" runat="server" ></asp:Label>
                                   <asp:Label ID="lbladdd2" runat="server"></asp:Label>
                                   <asp:Label ID="lbladd3" runat="server"></asp:Label>
                                   <asp:Label ID="lbladd4" runat="server"></asp:Label>
                                   <asp:Label ID="lblpincode" runat="server"></asp:Label>
                                </td>
                               
                            </tr>
                            
                        </table>
                    </td>
                   
                    
                    
                <td colspan="2" rowspan="8" style="font-weight: bold" valign="top">
                    <asp:Panel Height="150px" ID="Panel2" runat="server" ScrollBars="Vertical" Width="100%">
                        <dxwgv:ASPxGridView id="gridSign" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
                            KeyFieldName="doc_source" OnCustomCallback="gridSign_CustomCallback" OnCustomJSProperties="gridSign_CustomJSProperties"
                            Width="95%">
                            <settingspager visible="False"></settingspager>
                            <border bordercolor="#DDECFE"></border>
                            <clientsideevents endcallback="function(s, e) {ShowResult(s.cpretValue);}"></clientsideevents>
                            <columns>
<dxwgv:GridViewDataTextColumn Caption="Signature" VisibleIndex="0"><DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="large('<%# Container.KeyValue %>')">
                                            <asp:Image ID="Image1" runat="server" Height="100px" Width="95%" ImageUrl='<%# Eval("doc_source") %>'
                                                />
                                        </a>
                                    
</DataItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</dxwgv:GridViewDataTextColumn>
</columns>
                        </dxwgv:ASPxGridView>
                                        </asp:Panel>
                </td>
            </tr>
            <tr>
                <td style="width: 147px; height: 20px;">
                    Account Sub Type</td>
                <td style="font-weight: bold; height: 20px;">
                    <asp:Label ID="lblaccountsubtype" runat="server" ></asp:Label></td>
                   
            </tr>
            <tr>
                <td style="width: 147px; height: 20px;">
                    Account Status</td>
                <td style="font-weight: bold; height: 20px;">
                    <asp:Label ID="lblaccstatus" runat="server" ></asp:Label></td>
                   
            </tr>
            <tr>
                <td style="width: 147px; height: 20px;">
                    Account Opening Date</td>
                <td style="font-weight: bold; height: 20px;">
                    <asp:Label ID="lblopeningacc" runat="server"></asp:Label></td>
                    <td colspan="3" rowspan="5">
                         <table style="height:100%" width="100%" border="1" >
                            <tr>
                                <td style="width:70px; height:20px">
                                    Phone
                                </td>
                                 <td valign="top" style="font-weight:bold">
                                    <asp:Label ID="lblphone" runat="server" ></asp:Label>
                                 </td>
                                
                            </tr>
                            <tr>
                                <td style="width:70px; height:20px">
                                    Mobile
                                </td>
                                 <td valign="top" style="font-weight:bold">
                                    <asp:Label ID="lblmob" runat="server"></asp:Label>
                                 </td>
                                
                            </tr>
                            <tr>
                                <td style="width:70px; height:20px">
                                    Email
                                </td>
                                 <td valign="top" style="font-weight:bold">
                                   <asp:Label ID="lblemail" runat="server" ></asp:Label>
                                 </td>
                                
                            </tr>
                            <tr>
                                <td style="width:70px; height:20px">
                                    Branch Name
                                </td>
                                 <td valign="top" style="font-weight:bold">
                                     <asp:Label ID="lblbranchname" runat="server" ></asp:Label>
                                 </td>
                                
                            </tr>
                            <tr>
                                <td style="width:70px; height:20px">
                                    Group Name
                                </td>
                                 <td valign="top" style="font-weight:bold">
                                     <asp:Label ID="lblgroupname" runat="server" ></asp:Label>
                                 </td>
                                
                            </tr>
                          </table>
                    </td>
                    
            </tr>
            <tr>
                <td style="width: 147px; height: 20px;">
                    Account Close \ Susp Date</td>
                <td style="font-weight: bold; height: 20px;">
                    <asp:Label ID="lblaccclose" runat="server" ></asp:Label></td>
                    
            </tr>
            <tr>
                <td style="width: 147px; height: 20px;">
                    Account Close \ Susp Reason</td>
                <td style="font-weight: bold; height: 20px;">
                    <asp:Label ID="lblaccclosereson" runat="server" ></asp:Label></td>
                  
            </tr>
            <tr>
                <td style="width: 147px; height: 20px;">
                    First Holder Pan</td>
                <td style="font-weight: bold; height: 20px;">
                    <asp:Label ID="lblfirstholdpan" runat="server" ></asp:Label></td>
                   
            </tr>
            <tr>
                <td style="width: 147px; height: 20px;">
                    Second Holder Pan</td>
                <td style="font-weight: bold; height: 20px;">
                    <asp:Label ID="lblsecondhlpan" runat="server" ></asp:Label></td>
                    
                    
            </tr>
            
            <tr>
                <td colspan="7" style="height: 20px; width: 147px;">
                <a href="javascript:void(0);" onclick="ShowSlip();"><span style="font-weight:bold; color:Blue;text-decoration:underline">Slip Issued</span></a>
                     
                     
                    
                    </td>
            </tr>
            
            <tr>
                <td style="width: 147px; height: 20px;" colspan="7">
                
                </td>
            </tr>
        </table>
                    </asp:Panel>
                    
                   

            
        </div>
  
        <asp:HiddenField ID="hiddendpid" runat="server" />
        <asp:HiddenField ID="hiddenbenaccno" runat="server" />
        <asp:HiddenField ID="hiddenaccholder" runat="server" />
        <asp:HiddenField ID="hiddenholdingdate" runat="server" />
        <asp:HiddenField ID="hiddenSegment" runat="server" />
        <asp:HiddenField ID="hiddenclientdpid" runat="server" />
        <br />
        <br />
        <div style="text-align: left">
            &nbsp;</div>
      </form>
</body>
</html>