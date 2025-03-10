<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdl_InstrunctionSlipsReceiptBook, App_Web_lyh0nvfl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	
	</style>   
    <script  type="text/javascript" src="../JSFUNCTION/jquery.js"></script>
	<script language="javascript" type="text/javascript">
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
////            dtexec1.SetDate(new Date());
////            dtTransaction1.SetDate(new Date());
////            dtExecution1.SetDate(new Date());
            document.getElementById('imgloading').style.display='none';
       
       } 
       function height()
       {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
            window.frameElement.Width = document.body.scrollWidth;
       }
      function large(obj)
    {     
//       {
//        
         //parent.OnMoreInfoClick(obj,"Large Image",'940px','450px',"N");     
         //alert(document.getElementById('txtClient').value);         
         //alert('<%= dp %>');
         //alert(obj);
         var ss=new String(document.getElementById('hiddenbenaccno').value);
         //alert(ss);
         //alert('<%= dp %>');
         if(document.getElementById('hiddenSegment').value=='c')
           {   
             var url='view_signature.aspx?id=' + ss+'[CDSL]';
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
        if(document.getElementById('hiddenSegment').value=='c')
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
//            var currentTime = new Date()
//            if(currentTime<s.GetValue())
//            {           
//           
//            }
//            else
//            {                 
//            s.SetDate(currentTime);  
//                                
//            }
        
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
            
            
        }
        function validateformsave()
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
                    alert('Please Enter Total No of Instruction!');
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
        function SearchClient()
        {
             
            var param=SlipType.GetValue()+'~'+document.getElementById('<%=txtSlip.ClientID%>').value;
//            settlegrid.PerformCallback(param);
            grid.PerformCallback(param);
        }
        
        function showholding_pop()
        {
        
         var dpid=document.getElementById('txtClient').value;
         dpid=dpid.substr(0,8);   
        
         var url='FrmNsdl_ShowClientHolding_popup.aspx?BenAccNo='+dpid;
         parent.OnMoreInfoClick(url,"Free Holding",'940px','450px',"Y"); 
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
         
         
       function ShowSlip()
    {
        var accholder=document.getElementById('hiddenaccholder').value;
        var holdingdate=document.getElementById('hiddenholdingdate').value;
       var dpid= document.getElementById('hiddenclientdpid').value;
       var benid=document.getElementById('hiddenbenaccno').value;
      alert(accholder);
      alert(holdingdate);
       benid=benid.substring(benid.length-8);
     
         var url='frmIssuedSlip_NsdlCdsl.aspx?dpid=' + dpid + '&benid=' + benid;
         var  header='Slip issued for ' + accholder + ' on ' + holdingdate;
         
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
    
    
    
       
	</script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

   

    <form id="form1" runat="server" >
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
            <table width="70%">
                <tr>
                    <td style="width: 114px">
                        Client ID</td>
                    <td colspan="3">
                        <asp:TextBox ID="txtclient" runat="server" Width="165px" TabIndex="1" ></asp:TextBox>
                        </td>
                </tr>
               
                <tr style="color: #000000">
                    <td style="width: 114px" valign="top">
                                    Slip Number</td>
                    <td style="width: 100px" valign="top">
                        <asp:TextBox ID="txtSlip" runat="server" onkeypress="return AllowCharacterAndNumber(this);"
                            TabIndex="3" Width="165px"></asp:TextBox></td>
                    <td style="width: 100px" valign="top">
                        Slip Type</td>
                    <td style="width: 100px" valign="top">
                        <dxe:ASPxComboBox ID="ddlSlipType" runat="server" ClientInstanceName="SlipType" EnableIncrementalFiltering="True"
                            EnableSynchronization="False" SelectedIndex="0" TabIndex="4" ValueType="System.Double" Width="165px"
                            >
                            <Items>
                                <dxe:ListEditItem Text="Combined Instruction Slips" Value="1" />
                                <dxe:ListEditItem Text="Combined Instruction Slips (CM)" Value="2" />
                                <dxe:ListEditItem Text="Inter-Settlement" Value="3" />
                                <dxe:ListEditItem Text="Delivery out [CM-Payin]" Value="4" />
                                <dxe:ListEditItem Text="Delivery Out [CM Payout]" Value="5" />
                                <dxe:ListEditItem Text="Pool-To-Pool Transfers" Value="6" />
                                <dxe:ListEditItem Text="On Market" Value="7" />
                                <dxe:ListEditItem Text="Off Market" Value="8" />
                                <dxe:ListEditItem Text="Inter-Depository" Value="9" />
                                <dxe:ListEditItem Text="Pledge&amp;Hypothecation" Value="10" />
                                <dxe:ListEditItem Text="SLB Instructions" Value="11" />
                                <dxe:ListEditItem Text="Demat Request Forms" Value="12" />
                                <dxe:ListEditItem Text="Remat Request Forms" Value="13" />
                            </Items>
                        </dxe:ASPxComboBox>
                    </td>
                </tr>
               
                <tr>
                    <td style="width: 114px;">
                        <asp:Button ID="btnshow" runat="server" OnClick="btnshow_Click" Text="Show" OnClientClick="return validateform()" TabIndex="7" /></td>
                    <td style="width: 100px;">
                        <asp:Button ID="btnrefresh" runat="server" OnClick="btnrefresh_Click" Text="Refresh" TabIndex="8" /></td>
                    <td style="width: 100px;">
                        &nbsp;</td>
                    <td style="width: 100px;">
                    </td>
                </tr>
                    </div>
            </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress DynamicLayout="false" ID="UpdateProgress1" runat="server" >
          <ProgressTemplate>
              &nbsp;<img src="../images/ajax-loader(slip).gif"/> Loading ...
          </ProgressTemplate>
    </asp:UpdateProgress>
            &nbsp;
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
      <asp:Panel ID="pnlShowData" runat="server">
      
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
              
              <table>
                 <tr>
                    <td style="width: 114px; height: 44px;" valign="top">
                                    Recieve Date</td>
                    <td style="width: 100px; height: 44px;" valign="top">
                                    <dxe:ASPxDateEdit ID="dtexec" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                                        EditFormat="Custom" EditFormatString="dd/MM/yyyy" OnDateChanged="dtexec_DateChanged"
                                        TabIndex="5" UseMaskBehavior="True" Width="169px" Cursor="t">
                                        <ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtexec1);}" />
                                    </dxe:ASPxDateEdit>
                    </td>
                    <td style="width: 100px; height: 44px;" valign="top">
                        Total No of Instruction</td>
                    <td style="width: 100px; height: 44px;" valign="top">
                        <asp:TextBox ID="txt_totalNoOfInst" runat="server" Width="165px" TabIndex="6"></asp:TextBox></td>
                </tr>
                <tr>
                    <td valign="top">
                        Transaction Date
                    </td>
                     <td valign="top">
                        <dxe:ASPxDateEdit ID="dtTransaction" runat="server"  ClientInstanceName="dtTransaction1" DateOnError="Today" EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True" Width="169px" Cursor="t"><ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtTransaction1);}" />
                        
                        </dxe:ASPxDateEdit>
                    </td>
                     <td valign="top">
                        Execution Date
                    </td>
                     <td valign="top">
                         <dxe:ASPxDateEdit ID="dtExecution" runat="server"  ClientInstanceName="dtExecution1" DateOnError="Today" EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True" Width="169px" Cursor="t"><ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtExecution1);}" />
                        
                        </dxe:ASPxDateEdit>
                    </td>
                
                </tr>
              </table>  
      
      
          <table>
        <tr>
            <td style="width: 100px">
                <asp:Button ID="btnsave" runat="server" Text="Save" TabIndex="9" OnClientClick="return validateformsave()" OnClick="btnsave_Click" /></td>
            <td style="width: 100px">
                                        <asp:Button ID="btncan" runat="server" OnClick="btncan_Click" TabIndex="10" Text="Cancel" /></td>
        </tr>
    </table>
    
            </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            

            
        </div>
  
        <asp:HiddenField ID="hiddendpid" runat="server" />
        <asp:HiddenField ID="hiddenbenaccno" runat="server" />
        <asp:HiddenField ID="hiddenmsg" runat="server" />
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
