<%@ page language="C#" autoeventwireup="true" inherits="management_TRADEPROCESSINGSPOT, App_Web_e81qjzgk" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1">
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
    
     function PageLoad()
        {
              Hide('showFilter');
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
              
                Hide('showFilter');
                document.getElementById('btngenerate').disabled=false;

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
         function fn_Clients(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Clients';
                  Show('showFilter');
             }
             selecttion();
              height();
        }  
        function ajaxcall(objID,objListFun,objEvent)
        {
             ajax_showOptions(objID,'ShowClientFORMarginStocks',objEvent,document.getElementById('cmbsearchOption').value);
        } 
        function fn_Instrument(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='ScripsExchange';
                  Show('showFilter');
             }
             selecttion();
             height();
        } 
      
        
        function ALERTSTATUS(obj,obj1)
        {
          if (obj=='0')
               {
                    if (obj1>'0')
                    {
                        alert('No Record To Processes');
                         htmlbtngenerate();
                    }
                    else
                    {
                        alert('Trade Processed Successfully !!');
                    }
               }
          if (obj=='1')
               {
                    alert('Trade Processed Successfully !!'+'\n'+'Certain Clients Could Not Be Found !!');
                    if (obj1>'0')
                    {
                         htmlbtngenerate();
                    }
               }
          if (obj=='12')
               {
                    alert('Trade Processed Successfully !!'+'\n'+'Certain Clients and/or Products Could Not Be Found !!');
                    if (obj1>'0')
                    {
                         htmlbtngenerate();
                    }
               }
          if (obj=='2')
               {
                    alert('Trade Processed Successfully !!'+'\n'+'Certain Products Could Not Be Found !!');
                    if (obj1>'0')
                    {
                         htmlbtngenerate();
                    }
               }
         if (obj=='16')
               {
                    alert('Contract No Already Generated!!');
               }
         if (obj=='17')
               {
                    alert('Trade Processed Successfully !!'+'\n'+'Contract No Already Generated For Certain Clients');
               }
        
        } 
       function htmlbtngenerate()
       {
        document.getElementById('btnhtmlcreate').click();
       }
       function confirmmessage()
       {
            if(confirm('Contract Notes generated For Some Clients...'+'\n'+'Routine will not Process Trade of Such Clients !!'+'\n'+'Do you want to Process for Remaining Clients !!'))
              {
                document.getElementById('btnregenerate').click();
              }
       }
     
       
        FieldName='lstSlection';
    
    
    </script>

    <script type="text/ecmascript">
        
	    function ReceiveServerData(rValue)
        {
             var j=rValue.split('~');
             if(j[0]=='Clients')
                {
                    document.getElementById('HiddenField_Client').value = j[1];
                } 
               
                else if(j[0]=='ScripsExchange')
                {
                    document.getElementById('HiddenField_Scrip').value = j[1];
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
            </tr>
        </table>
           <table id="tab2" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr valign="top">
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Date :
                            </td>
                            <td id="td_dtfrom" class="gridcellleft">
                                <dxe:ASPxDateEdit ID="dtfrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dtfrom">
                                    <dropdownbutton text="From">
                                    </dropdownbutton>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td id="td_dtto" class="gridcellleft">
                                <dxe:ASPxDateEdit ID="dtto" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dtto">
                                    <dropdownbutton text="To">
                                    </dropdownbutton>
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Clients :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="a" onclick="fn_Clients('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="radPOAClient" runat="server" GroupName="a" onclick="fn_Clients('a')" />POA
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="a" onclick="fn_Clients('b')" />
                                            Selected
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Instrument :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbInstrumentALL" runat="server" Checked="True" GroupName="b" onclick="fn_Instrument('a')"/>
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbInstrumentSelected" runat="server" GroupName="b" onclick="fn_Instrument('b')"/>
                                            Selected
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Action :</td>
                                        <td style="text-align: left;" colspan="3">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddlaction" runat="server" Font-Size="11px" Width="100px" >
                                                            <asp:ListItem Value="0">Generate</asp:ListItem>
                                                            <asp:ListItem Value="1">Re-Generate</asp:ListItem>
                                                        </asp:DropDownList>
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
                <td id="showFilter">
                    <table >
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
                                                <asp:ListItem>Clients</asp:ListItem>
                                                <asp:ListItem>ScripsExchange</asp:ListItem>
                     
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
        </table>
        <table>
            <tr>
                <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                  <asp:Button ID="btngenerate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                                    Width="101px" OnClick="btngenerate_Click" />
                                     </ContentTemplate>
                                   
                                </asp:UpdatePanel>
                </td>
                <td style="display: none;">
                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                    <asp:HiddenField ID="HiddenField_Scrip" runat="server" />
                </td>
            </tr>
        </table>
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
                                                        <font size='1' face='Tahoma'><strong align='center'>Please Wait..</strong></font></td>
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
<table><tr><td style="display:none;"><asp:Button ID="btnhtmlcreate" runat="server" Text="htmlcreate" OnClick="btnhtmlcreate_Click" />
<asp:Button ID="btnregenerate" runat="server" Text="Regenerate" OnClick="btnregenerate_Click" /> </td></tr></table>
    </div>
    </form>
</body>
</html>