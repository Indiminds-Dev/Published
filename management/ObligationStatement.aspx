<%@ page language="C#" autoeventwireup="true" inherits="management_ObligationStatement, App_Web_fbvamflg" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Bill Printing</title>
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
   function MailsendT()
    {
    alert("Mail Sent Successfully");
    }
   function MailsendF()
    {
    alert("Error on sending!Try again..");
    }
  function SignOff()
    {
        window.parent.SignOff();
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
   function Page_Load()
   {
         document.getElementById('txtClient_hidden').style.display="none";
         document.getElementById('Div1').style.display="none";
         rsltChk=0; 
         hide('tdtxtname');
         hide('tdList');
         hide('TdPRINT');  
         show('TdScreen');
         hide('displayAll');
         hide('td_dtto');
         hide('td_dtfrom');
         height();
   }
  function rdbtnSelected(obj)
        {
            document.getElementById('showFilter').style.display='inline';
            document.getElementById('TdFilter').style.display='inline';
            if(obj=='Client')
            {
                 document.getElementById('cmbsearchOption').value='Clients';
                 document.getElementById('btnScreen').disabled=true;
                 document.getElementById('spanall').style.display="inline";
            }
          
        }
  function rdbtnAll(obj)
        {
            document.getElementById('showFilter').style.display='none';
            document.getElementById('TdFilter').style.display='none';
            document.getElementById('btnScreen').disabled=false;
            
        } 
    function clientselectionfinal()
	    {
	        var listBoxSubs = document.getElementById('lstSlection');
	        var listIDs='';
            var i;
            if(listBoxSubs.length > 0)
            {                
                for(i=0;i<listBoxSubs.length;i++)
                {
                    if(listIDs == '')
                        listIDs = "'"+listBoxSubs.options[i].value+"'";
                    else
                        listIDs += "," +"'"+ listBoxSubs.options[i].value+"'";
                }
            }
            document.getElementById('clientid').value=listIDs;
	        document.getElementById('Div1').style.display="inline"; 
        }
        
  function afterPartialPostBack()
     {
          document.getElementById('Div1').style.display="none";
         
          height();
          if(rsltChk==1)
          {
            show('td_main');
            hide('displayAll');
            alert('No Record Found');
             rsltChk=0;
          }
          else if(rsltChk==2)
          {
            show('td_main');
            hide('displayAll');
            alert('Rates for this date does not exists');
            rsltChk=0;
          }
       
          else
           {
            show('displayAll');
           } 
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
            
            
    function btnAddsubscriptionlist_click()
        {
            var userid = document.getElementById('txtClient_hidden');
            if(userid.value != '')
            {
                var ids = document.getElementById('txtClient_hidden');
                var Client = document.getElementById('txtClient');
                var listBox = document.getElementById('lstSlection');
                var tLength = listBox.length;
                 
                
                
                var no = new Option();
                no.value = ids.value;
                no.text = Client.value;
                listBox[tLength]=no;
                var recipient = document.getElementById('txtClient_hidden');
                recipient.value='';
            }
            else
                alert('Please search name and then Add!')
            var s=document.getElementById('txtClient');
            s.value='';
            s.focus();
            s.select();
        } 
        
        function CallAjax(obj1,obj2,obj3)
         { 
         
             ajax_showOptions(obj1,obj2,obj3,"Clients");
    
         }
         
   function fnClients(s)
        {
          document.getElementById('txtClient_hidden').value=""; 
           if(s=='A')
            {
                hide('tdtxtname'); 
                hide('tdList'); 
                document.getElementById('txtClient_hidden').style.display="none";
                document.getElementById('txtClient').value=""; 
               
            }
            if(s=='S')
            {
                var listBox = document.getElementById('lstSlection');
                listBox.length = 0;
                
                show('tdtxtname'); 
                show('tdList'); 
                document.getElementById('txtClient_hidden').style.display="none";
               
                
            } 
        }
    function show(obj1)
        {
             document.getElementById(obj1).style.display='inline';
        }
        function hide(obj1)
        {
             document.getElementById(obj1).style.display='none';
        }
    function done()
        {
         hide('tdtxtname');
         hide('tdList'); 
        }
    
        FieldName='lstSlection';
        
 
 function showProgress()
        { 
         document.getElementById('Div1').style.display="inline";
        }
        
function hideProg()
        { 
        document.getElementById('Div1').style.display="none";
        } 
function displaydate(obj)
        {
            document.getElementById('spandate').innerText=obj;
        }   
function filter()
        {
             show('td_main');
             hide('displayAll');
             height();
        } 
function displayresult()
        {
        
             hide('td_main');
             show('displayAll');
             
        }
function norecord(obj)
        {
          rsltChk=obj; 
            
        }
function RBShowHide(obj)
        {
      
             if(obj=='rbPrint')
                 {
                     hide('TdScreen');  
                     show('TdPRINT');
                 }
             else
                 {
                     hide('TdPRINT');  
                     show('TdScreen');
                 }
                 height();
        } 
function  ddldateChange()
{
    var obj=document.getElementById('ddldate').value;
   
    if(obj=="0")
    {
        hide('td_dtto');
        hide('td_dtfrom');
        show('td_dtfor');
    }
    else
    {
        show('td_dtto');
        show('td_dtfrom');
        hide('td_dtfor');
    }
}
        
   </script>
   


</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="load()">
    <form id="form1" runat="server"  autocomplete="off">
    <asp:HiddenField ID="clientid" runat="server" />
    <div>
    <asp:ScriptManager runat="server" ID="s1" AsyncPostBackTimeout="360000">
        </asp:ScriptManager>

        <script language="javascript" type="text/javascript">

        function load() 
        {
           Sys.WebForms.PageRequestManager.getInstance().add_endRequest(afterPartialPostBack);
        }
         </script>
 
<table class="TableMain100">
        <tr>
            <td class="EHEADER" colspan="0" style="text-align:center;">
                <strong><span id="SpanHeader" style="color: #000099">Bill Printing</span></strong>
            </td>
            <td class="EHEADER" width="10%" id="f">
                                    <a href="javascript:void(0);" onclick="filter();"><span
                        style="color: Blue; text-decoration: underline; font-size: 8pt; font-weight:bold ">Filter</span></a>

             </td>
             
        </tr>
</table>
        <table class="TableMain100" id="td_main">
            <tr>
                <td>
                    <table>
                        <tr id="TdAll1">
                            <td colspan="2">
                                <table width="100%">
                                    <tr valign="top">
                                        <td style="width: 110px">
                                            <asp:DropDownList ID="ddldate" runat="server" Width="100px" Font-Size="10px" onchange="ddldateChange()">
                                                <asp:ListItem Value="0">For a Date</asp:ListItem>
                                                <asp:ListItem Value="1">For a Period</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td id="td_dtfor" style="width: 130px;">
                                            <dxe:ASPxDateEdit ID="dtfor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                                                <DropDownButton Text="For">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td id="td_dtfrom" style="width: 130px;">
                                            <dxe:ASPxDateEdit ID="dtfrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="108px" ClientInstanceName="dtfrom">
                                                <DropDownButton Text="From">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td id="td_dtto" style="width: 130px;">
                                            <dxe:ASPxDateEdit ID="dtto" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="108px" ClientInstanceName="dtto">
                                                <DropDownButton Text="To">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td class="gridcellleft" style="vertical-align: top; text-align: right" id="tdtxtname">
                                            <asp:TextBox ID="txtClient_hidden" runat="server" Width="14px"></asp:TextBox>
                                            <asp:TextBox ID="txtClient" runat="server" Font-Size="12px" Width="200px"></asp:TextBox>
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
                                            <dxe:ASPxRadioButtonList ID="rbUser" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                                RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px" TabIndex="2">
                                                <Items>
                                                    <dxe:ListEditItem Text="All" Value="A" />
                                                    <dxe:ListEditItem Text="Specific" Value="S" />
                                                </Items>
                                                <ClientSideEvents ValueChanged="function(s, e) {fnClients(s.GetValue());}" />
                                                <Border BorderWidth="0px" />
                                            </dxe:ASPxRadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                                <table border="0">
                                    <tr>
                                        <td id="Td3">
                                            <asp:RadioButton ID="rbScreen" runat="server" GroupName="a" Checked="True" onclick="RBShowHide(this.value)" />Screen
                                        </td>
                                        <td id="Td4">
                                            <asp:RadioButton ID="rbPrint" runat="server" GroupName="a" onclick="RBShowHide(this.value)" />Print
                                        </td>
                                    </tr>
                                </table>
                                <table border="0">
                                    <tr>
                                        <td id="TdScreen">
                                            <dxe:ASPxButton ID="btnScreen" runat="server" Text="Generate" OnClick="btnScreen_Click">
                                                <ClientSideEvents Click="function(s, e) {
	                            clientselectionfinal();
                            }" />
                                            </dxe:ASPxButton>
                                        </td>
                                        <td id="TdPRINT">
                                            <dxe:ASPxButton ID="btnPrint" runat="server" AutoPostBack="True" Text="Generate"
                                                OnClick="btnPrint_Click">
                                                <ClientSideEvents Click="function(s, e) {
	                            clientselectionfinal();hideProg();
                            }" />
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="text-align: right; vertical-align: top; width: 16%">
                                <table width="100%" id="tdList">
                                    <tr>
                                        <td style="text-align: right; vertical-align: top; height: 134px; width: 295px;">
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
                                                                    <a id="A2" href="javascript:void(0);" onclick="done()"><span style="color: #000099;
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
                                        <td style="height: 23px; width: 295px;">
                                            <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                 <td id="Td_DateDisply" valign="top">
                        <table>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                        <ContentTemplate>
                                            <div id="DivDateDisply" runat="server">
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </td>
            </tr>
        </table>
    </div>
       <div id="displayAll">
          <asp:UpdatePanel runat="server" ID="u1">
                <ContentTemplate>
                    <table width="100%" border="1">
                     <TR BORDERCOLOR=Blue>
                            <td ><table width="100%"><tr><td align="left"><span id="spanshow" style="color: Blue; font-weight: bold">
                                Period :</span>&nbsp;&nbsp;<span id="spandate"></span></td><td></td><td align="right">   <asp:LinkButton Font-Bold="True" Font-Underline="True" ForeColor="Blue" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Send Mail</asp:LinkButton></td></tr></table>
                            </td>
                        </tr>
                        <tr BORDERCOLOR=Blue>
                            <td align="center">
                                <table id="tblpage" cellspacing="0" cellpadding="0" runat="server" width="100%">
                                    <tr>
                                        <td width="20" style="padding: 5px">
                                            <asp:LinkButton ID="ASPxFirst" runat="server" Font-Bold="True" ForeColor="maroon"  OnClientClick="javascript:showProgress();" OnClick="ASPxFirst_Click">First</asp:LinkButton></td>
                                        <td width="25">
                                            <asp:LinkButton ID="ASPxPrevious" runat="server" Font-Bold="True" ForeColor="Blue"  OnClientClick="javascript:showProgress();" OnClick="ASPxPrevious_Click">Previous</asp:LinkButton></td>
                                        <td width="20" style="padding: 5px">
                                            <asp:LinkButton ID="ASPxNext" runat="server" Font-Bold="True" ForeColor="maroon" OnClientClick="javascript:showProgress();" OnClick="ASPxNext_Click" >Next</asp:LinkButton></td>
                                        <td width="20">
                                            <asp:LinkButton ID="ASPxLast" runat="server" Font-Bold="True" ForeColor="Blue" OnClientClick="javascript:showProgress();" OnClick="ASPxLast_Click" >Last</asp:LinkButton></td>
                                        <td align="right">
                                            <asp:Label ID="listRecord" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <span style="color: red; text-align: center; display: none" id="norecord" class="Ecoheadtxt" runat="server"><strong>No Record Found</strong></span>
                            </td>
                        </tr>
                        <tr BORDERCOLOR=Gray>
                            <td>
                                <table cellspacing="0" cellpadding="0" width="100%" style="text-align: left">
                                    <tr style="font-size: 12px; font-family: Calibri">
                                        <td>
                                           <span style="color:Green;"><b>Client Name :</b></span> 
                                      
                                      
                                            <asp:Label ID="CName" runat="server" Font-Bold="True"></asp:Label>
                                              <asp:HiddenField ID="CID" runat="server" />
                                           
                                             </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="8" style="height: 12px">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="display" runat="server" >
                                   </div>
                            </td>
                        </tr>
                      
                        <tr style="background-color:White;">
                            <td align="right">
                            <div id="displaySummary" runat="server" style="border: solid 1px balck;width:50%;">
                            
                                   </div>
                            </td>
                        </tr>
                          <tr>
                            <td>
                                <div id="displaymargin" runat="server" >
                                
                                   </div>
                            </td>
                        </tr>
                        
                          <tr style="background-color:White;">
                            <td align="right" ><br />
                            <div id="displaymarginSummary" runat="server" style="border: solid 1px balck;width:55%;">
                            
                                   </div>
                            </td>
                        </tr>
                    </table>
              </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnScreen" EventName="Click"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%; top: 20%; height: 80; width: 150;'>
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
    </form>
</body>
</html>