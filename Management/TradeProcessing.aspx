<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="management_TradeProcessing, App_Web_2wstwz9u" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" >
    <title>Trade Processing</title>
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
    
// function HeightIframne(objH)
//        {
//            var Iframe=document.getElementById("IfreameAtt")=300;
//        }
//         function OnMoreInfoClick(url,HeaderText,Width,Height,anyKey) //AnyKey will help to call back event to child page, if u have to fire more that one function 
//        {
//             
//             editwin=dhtmlmodal.open("Editbox", "iframe", url,HeaderText , "width="+Width+",height="+Height+",center=1,resize=1,scrolling=2,top=500", "recal")
//             document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='hidden';

//             editwin.onclose=function()
//             {
//                document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='visible';

//                 if(anyKey=='Y')
//                 {
//                    document.getElementById('IfreameAtt').contentWindow.callback();
//                   

//                 }
//             }
//        }
        function DhtmlClose()
        {
         
          parent.editwin.close(); 
          var btn22=document.getElementById('btnclose'); 
          btn22.click();
          
        }
        function norecord()
        {
          alert('No Record Found');
        }
   
     function PageLoad()
    {

         document.getElementById('showFilter').style.display='none';
         document.getElementById('TdFilter').style.display='none';
         document.getElementById('td_terminal').style.display='none';
         document.getElementById('td_CTCLID').style.display='none';
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
      function showOptions(obj1,obj2,obj3)
         {
            var cmb=document.getElementById('cmbsearchOption');
          
            var obj4=cmb.value;
            
            ajax_showOptions(obj1,obj2,obj3,obj4);
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
              
                document.getElementById('showFilter').style.display='none';
                document.getElementById('TdFilter').style.display='none';
                document.getElementById('btnGenarate').disabled=false;
                document.getElementById('btnReGenarate').disabled=false;

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
//         function fnsession()
//         {
//         
//            alert("<%=Session["LastFinYear"]%>");
//            alert("<%=Session["LastSettNo"]%>");
//            alert("<%=Session["userbranchHierarchy"]%>");
//             alert("<%=Session["usersegid"]%>");
//              alert("<%=Session["LastCompany"]%>");
//         }
       function rdbtnSegAll(obj)
        {

            document.getElementById('td_terminal').style.display="none"; 
            document.getElementById('showFilter').style.display='none';
            document.getElementById('TdFilter').style.display='none';
            document.getElementById('btnGenarate').disabled=false;
            document.getElementById('btnReGenarate').disabled=false;
            
        } 
       function rdbtnSelected(obj)
        {
            document.getElementById('showFilter').style.display='inline';
            document.getElementById('TdFilter').style.display='inline';
            if(obj=='Client')
            {

                 document.getElementById('cmbsearchOption').value='Clients';
                 document.getElementById('btnGenarate').disabled=true;
                 document.getElementById('btnReGenarate').disabled=true;
                 document.getElementById('spanall').style.display="inline";
                 document.getElementById('td_terminal').style.display="none";
            }
            else if(obj=='Instrument')
            {

                document.getElementById('cmbsearchOption').value='Instruments';
                document.getElementById('btnGenarate').disabled=true;
                 document.getElementById('btnReGenarate').disabled=true;
                document.getElementById('spanall').style.display="inline";
                document.getElementById('td_terminal').style.display="none";
            }
          
             else if(obj=='TerminalId')
            {

                 document.getElementById('cmbsearchOption').value='TerminalId';
                 document.getElementById('showFilter').style.display='none';
                 document.getElementById('TdFilter').style.display='none';
                 document.getElementById('td_terminal').style.display="inline";
                 document.getElementById('txtterminal_hidden').style.display='none';

            }
                else if(obj=='CTCLID')
            {

                document.getElementById('cmbsearchOption').value='CTCLID';
                document.getElementById('btnGenarate').disabled=true;
                 document.getElementById('btnReGenarate').disabled=true;
                document.getElementById('spanall').style.display="inline";
                document.getElementById('td_terminal').style.display="inline";
            }
        }
        
        function Message(obj)
        {
        

         if (obj=='1')
               {
                    alert('Contract No Already Generated');
               }
         else if(obj=='3')
               {
                InfoClick();
               }
          else if(obj=='2')
               {
                 alert('Trade Processed Successfully');
               }
           
         else if(obj=='4')
               {
                 alert('Brkg Not Set For That Client');
               }

        } 
        function Message1()
        {
            alert('Trade Processed Successfully !!'+'\n'+'Contract No Already Generated For Certain Clients');
        }
        function InfoClick()
        {
          
            var date1=dtfrom.GetDate();
            var date=parseInt(date1.getMonth()+1)+'-'+date1.getDate()+'-'+ date1.getFullYear();
            var URL='TradeICEXCOMM.aspx?fromdate='+date ;
            parent.OnMoreInfoClick(URL,'Brkg Not Set For Following Clients','500px','300px','N');
        }
      
        function tradeprocess(obj)
        {
        
              if(obj=='remaining')
              {
                    var btntrade=document.getElementById('btntrade');
                    btntrade.click();   
              }
              
             if(obj=='default')
              {
                    var btndefault=document.getElementById('btndefault');
                    btndefault.click();   
              }
        
        }
       
        

   
        FieldName='lstSlection';
    
    
    </script>

    <script type="text/ecmascript">
        
	    function ReceiveServerData(rValue)
        {
            var Data=rValue.split('~');
           
            
            if(Data[0]=='Instruments')
            {
                var combo = document.getElementById('litInstrumentMain');
                var NoItems=Data[1].split(',');
                var i;
                var val='';
                for(i=0;i<NoItems.length;i++)
                {
                
                    var items = NoItems[i].split(';');
                   
                    if(val=='')
                    {
                        val='('+items[1];
                    }
                    else
                    {
                        val+=','+items[1];
                    }
                }
                val=val+')';
                combo.innerText=val;
            }
             if(Data[0]=='Clients')
            {
            
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
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Trade Processing</span></strong>
                    </td>
                </tr></table>

        <table class="TableMain100">
                <tr id="TdAll1">
                    <td colspan="2">
                        <table width="100%">
                            <tr>
                                <td style="width: 110px">
                                    
                                   <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        Font-Size="10px" Width="108px" ClientInstanceName="dtfrom">
                                        <DropDownButton Text="From">
                                        </DropDownButton>
                                      

                                    </dxe:ASPxDateEdit>
                                </td>
                                <td style="width: 110px">
                                  
                                </td>
                                <td class="gridcellleft" style="width: 76px">
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td class="gridcellleft" style="vertical-align: top; text-align: right" id="TdFilter">
                                  <span id="spanall">
                                        <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px"></asp:TextBox></span>
                                    
                                    <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                        Enabled="false">
                                        <asp:ListItem>Clients</asp:ListItem>
                                        <asp:ListItem>Instruments</asp:ListItem>
                                        <asp:ListItem>TerminalId</asp:ListItem>
                                        <asp:ListItem>CTCLID</asp:ListItem>
                                        <asp:ListItem>other</asp:ListItem>
                                       
                              
                                    </asp:DropDownList>
                                    <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                        style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                            style="color: #009900; font-size: 8pt;"> </span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="TrAll">
                    <td style="text-align: left; vertical-align: top;">
                        <table border="0">
                            <tr>
                                <td class="gridcellleft" id="TdAc">
                                    Clients
                                </td>
                                <td style="text-align: left;" id="TdAc1">
                                    <table>
                                        <tr>
                                            <td>
                                                  <asp:RadioButton ID="rdClientAll" runat="server" Checked="True" GroupName="a" />
                                            </td>
                                            <td>
                                                All
                                            </td>
                                            <td>
                                                 <asp:RadioButton ID="rdClientSelected" runat="server" GroupName="a" />
                                            </td>
                                              <td>
                                                Selected
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                     Instruments
                                </td>
                                <td style="text-align: left;" colspan="2">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="rdInstrumentAll" runat="server" Checked="True" GroupName="b" />
                                            </td>
                                            <td>
                                                All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdInstrumentSelected" runat="server" GroupName="b" />
                                            </td>
                                            <td>
                                                Selected
                                            </td>
                                            <td>
                                                <span id="litInstrumentMain" runat="server" style="color: Maroon"></span>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td colspan="1" style="text-align: left">
                                </td>
                            </tr>
                            <tr style="display:none;">
                                <td class="gridcellleft">
                                    Terminal Id</td>
                                <td style="text-align: left;" colspan="2">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="rdbTerminalAll" runat="server"  Checked="true" GroupName="d"/>
                                            </td>
                                            <td>
                                                All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbTerminalSelected" runat="server" GroupName="d" />
                                            </td>
                                             <td>
                                               Specific
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td colspan="1" style="text-align: left;vertical-align:top;" id="td_terminal">
                                    <asp:TextBox ID="txtterminal" runat="server" Font-Size="10px" Width="150px"></asp:TextBox>
                                    <asp:TextBox ID="txtterminal_hidden" runat="server" Width="5px"></asp:TextBox></td>
                            </tr>
                              <tr id="td_CTCLID" style="display:none;">
                                <td class="gridcellleft" >
                                    CTCL ID</td>
                                <td style="text-align: left;" colspan="2">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="rdbCTCLIDAll" runat="server"  Checked="true" GroupName="gg"/>
                                            </td>
                                            <td>
                                                All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbCTCLIDSelected" runat="server" GroupName="gg" />
                                            </td>
                                             <td>
                                                Selected
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                  <td colspan="1" style="text-align: left">
                                  </td>
                            </tr>
                        </table>
                    </td>
                    <td style="text-align: right; vertical-align: top; width: 16%">
                        <table width="100%" id="showFilter">
                            <tr>
                                <td style="text-align: right; vertical-align: top; height: 134px;">
                                    <table cellpadding="0" cellspacing="0">
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
                            <tr style="display: none">
                                <td style="height: 23px">
                                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                     <asp:TextBox ID="dtFrom_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
               
                    
        <tr>
            <td id="td_generate" style="height: 41px">
             <table border="0" cellpadding="0" cellspacing="0">
            <tr><td> 
         <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
             
                            <ContentTemplate>
                <dxe:ASPxButton ID="btnGenarate" runat="server" 
                     Text="Generate"  AutoPostBack="false" OnClick="btnGenarate_Click">
                  
                </dxe:ASPxButton>
        </ContentTemplate>
                  <Triggers>
                  <asp:AsyncPostBackTrigger ControlID="btntrade" EventName="Click" />
                  <asp:AsyncPostBackTrigger ControlID="btndefault" EventName="Click" />
                 
                 </Triggers>
                </asp:UpdatePanel>
                </td><td style="width:5%;"> </td><td>  
         <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
             
                            <ContentTemplate>
                <dxe:ASPxButton ID="btnReGenarate" runat="server" 
                     Text="Re-Generate" ValidationGroup="a" AutoPostBack="false" OnClick="btnReGenarate_Click">
                  
                </dxe:ASPxButton>
            </ContentTemplate>
                 <Triggers>
                  <asp:AsyncPostBackTrigger ControlID="btntrade" EventName="Click" />
                  <asp:AsyncPostBackTrigger ControlID="btndefault" EventName="Click" />
                 
                 </Triggers>
                </asp:UpdatePanel>
                </td></tr>
             </table>
            </td>
       
            <td style="display:none;">

              
                <asp:Button ID="btntrade" runat="server" Text="btntrade" OnClick="btntrade_Click" />
                <asp:Button ID="btndefault" runat="server" Text="btndefault" OnClick="btndefault_Click" />  
              
            </td>
         
     
        </tr>
        <tr id="loading"><td> 
      <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                <progresstemplate>
                                    <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                        top: 50%;  background-color: white; layer-background-color: white; height: 80;
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
                                </progresstemplate>
                            </asp:UpdateProgress>
         </td></tr>
    <tr id="Tr1">
    <td> 
                            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                <progresstemplate>
                                    <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                        top: 50%;  background-color: white; layer-background-color: white; height: 80;
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
                                </progresstemplate>
                            </asp:UpdateProgress>
                               </td></tr>
                               <tr><td style="display:none;"> <asp:Button ID="btnclose" runat="server" Text="btnclose" OnClick="btnclose_Click" /> </td></tr>
 
            </table>
            

    </div>
    </form>
</body>
</html>

