<%@ page language="C#" autoeventwireup="true" inherits="management_commtradeprocessing, App_Web_g1t3n0jz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Trade Processing </title>
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

  
    function PageLoad()///Call Into Page Load
            {
                 Hide('showFilter');
                 
                 fn_ddldateChange('0');
                 
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
            window.frameElement.width = document.body.scrollwidth;
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
  
   function FunClientScrip(objID,objListFun,objEvent)
        {
                var cmbVal;
                cmbVal=document.getElementById('cmbsearchOption').value;
                cmbVal=cmbVal;
                ajax_showOptions(objID,objListFun,objEvent,cmbVal);

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
             
              height();
        }
        function fn_Scrip(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='ScripsExchange';
                  Show('showFilter');
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
                document.getElementById('btnshow').disabled=false;
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
    
   
 
   function ALERTSTATUS(obj,obj1)
        {
          if (obj=='0')
               {
                    if (obj1=='0002')
                    {
                         alert('Trade Already Processes !!');
                    }
                    else if (obj1=='0')
                    {
                          alert('Trade Processed Successfully !!');
                    }
                    else if (obj1=='9')
                    {
                          alert('You Need to Generate Expiry Trades For This Date !!');
                    }
                    else if (obj1!='0')
                    {
                         alert('No Record To Processes!!');
                         htmlbtngenerate();
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
          if (obj=='9')
               {
                    alert('Trade Processed Successfully !!'+'\n'+'However, Expiry Trades Need to be imported/generated for the day !!');
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
       
       
       
       
       //       -------------------------------


  function CallMissing()
  {

  document.getElementById('btnhtmlcreate').click();
  }
  
   function CallPeriod()
  {
   document.getElementById('btnPeriod').click();

  }



     function  fn_ddldateChange(obj)
       {
            if(obj=='0')
            {
                Show('td_dtfor');
                Hide('td_dtfrom');
                Hide('td_dtto');
               // Show('tr_charges');
            }
            else
            {
                Hide('td_dtfor');
                Show('td_dtfrom');
                Show('td_dtto');
              //  Hide('tr_charges');
            }
            
           if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
       }
       
       
        function DateChangeForFrom()
        {
              
            var sessionVal ="<%#Session["LastFinYear"]%>";          
            var objsession=sessionVal.split('-');
            var MonthDate=dtfrom.GetDate().getMonth()+1;
            var DayDate=dtfrom.GetDate().getDate();
            var YearDate=dtfrom.GetDate().getYear();
                      
           
             var segcheck = document.getElementById('HSegName').value; 
            
          
            if(YearDate>=objsession[0])
            {
                if(MonthDate<4 && YearDate==objsession[0])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    
                    var datePost="";
                    
                    if (segcheck=='1')
                    {
                    
                      datePost=( document.getElementById('HFMonth').value +'-'+ document.getElementById('HFDay').value +'-'+ document.getElementById('HFYear').value);
                                      
                    }
                    
                    else
                    
                    {
                     datePost=(4+'-'+1+'-'+objsession[0]);
                    
                    }                                                        
                    
                    dtfrom.SetDate(new Date(datePost));
                }
                else if(MonthDate>3 && YearDate==objsession[1])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                  //  var datePost=(4+'-'+1+'-'+objsession[0]);
                  
                   var datePost='';
                    
                    if (segcheck=='1')
                    {
                    
                    datePost=( document.getElementById('HFMonth').value +'-'+ document.getElementById('HFDay').value +'-'+ document.getElementById('HFYear').value);
                    
                    }
                    
                    else
                    
                    {
                     datePost=(4+'-'+1+'-'+objsession[0]);
                    
                    }
                  
                    dtfrom.SetDate(new Date(datePost));
                }
                else if(YearDate!=objsession[0] && YearDate!=objsession[1])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                   
                    var datePost="";
                    
                    if (segcheck=='1')
                    {                    
                    datePost=( document.getElementById('HFMonth').value +'-'+ document.getElementById('HFDay').value +'-'+ document.getElementById('HFYear').value);
                    }
                    
                    else
                    
                    {
                     datePost=(4+'-'+1+'-'+objsession[0]);
                    
                    }
                   
                    dtfrom.SetDate(new Date(datePost));
                }
            }
            else
            {
                alert('Enter Date Is Outside Of Financial Year !!');
              
              
               var datePost="";
                    
                    if (segcheck=='1')
                    {                   
                  datePost=( document.getElementById('HFMonth').value +'-'+ document.getElementById('HFDay').value +'-'+ document.getElementById('HFYear').value);
                    }                    
                   else                    
                    {
                     datePost=(4+'-'+1+'-'+objsession[0]);
                    
                    }
              
                dtfrom.SetDate(new Date(datePost));
            }
        }
        function DateChangeForTo()
        {
            var sessionVal ="<%#Session["LastFinYear"]%>";
            var objsession=sessionVal.split('-');
            var MonthDate=dtto.GetDate().getMonth()+1;
            var DayDate=dtto.GetDate().getDate();
            var YearDate=dtto.GetDate().getYear();
            
            
             var segcheck =document.getElementById('HSegName').value;  
            
           
            
            if(YearDate<=objsession[1])
            {
                if(MonthDate<4 && YearDate==objsession[0])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    
                     var datePost="";
                    
                    if (segcheck=='1')
                    {                                       
                  datePost=( document.getElementById('HTMonth').value +'-'+ document.getElementById('HTDay').value +'-'+ document.getElementById('HTYear').value);
                    }                         
                   else
                    {                    
                     datePost=(3+'-'+31+'-'+objsession[1]);
                    }
                    
                    dtto.SetDate(new Date(datePost));
                }
                else if(MonthDate>3 && YearDate==objsession[1])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    
                    var datePost="";
                    
                    if (segcheck=='1')
                    {    
                                   
                   datePost=( document.getElementById('HTMonth').value +'-'+ document.getElementById('HTDay').value +'-'+ document.getElementById('HTYear').value);
                    
                    }                         
                   else
                    {
                    
                    var datePost=(3+'-'+31+'-'+objsession[1]);
                    }
                    dtto.SetDate(new Date(datePost));
                }
                else if(YearDate!=objsession[0] && YearDate!=objsession[1])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    var datePost="";
                    
                    if (segcheck=='1')
                    {    
                                   
                  datePost=( document.getElementById('HTMonth').value +'-'+ document.getElementById('HTDay').value +'-'+ document.getElementById('HTYear').value);
                    
                    }                         
                   else
                    {
                    
                    var datePost=(3+'-'+31+'-'+objsession[1]);
                    }
                    dtto.SetDate(new Date(datePost));
                }
            }
            else
            {
                alert('Enter Date Is Outside Of Financial Year !!');
                var datePost="";
                    
                    if (segcheck=='1')
                    {    
                                   
                  datePost=( document.getElementById('HTMonth').value +'-'+ document.getElementById('HTDay').value +'-'+ document.getElementById('HTYear').value);
                    
                    }                         
                   else
                    {
                    
                    var datePost=(3+'-'+31+'-'+objsession[1]);
                    }
                dtto.SetDate(new Date(datePost));
            }
        }



//        -------------------------------------------------

       
       
       
       
       
     
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
                if(j[0]=='ScripsExchange')
                {
                    document.getElementById('HiddenField_ScripsExchange').value = j[1];
                } 
        }
        </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
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
    <div>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Trade Processing </span></strong></td>
                
              
            </tr>
        </table>
    
       <table id="tab2" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td class="gridcellleft">
                    <table>
                        <tr valign="top">
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr valign="top">
                                        <td class="gridcellleft">
                                            <asp:DropDownList ID="ddldate" runat="server" Width="100px" Font-Size="10px" onchange="fn_ddldateChange(this.value)">
                                                <asp:ListItem Value="0">For a Date</asp:ListItem>
                                                <asp:ListItem Value="1">For a Period</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td id="td_dtfor" class="gridcellleft">
                                            <dxe:ASPxDateEdit ID="dtfor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                                                <DropDownButton Text="For">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        
                                         <%-- ----------------- For Period Start----------------------%>
                                       
                                        <td id="td_dtfrom">
                                            <dxe:ASPxDateEdit ID="dtfrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="108px" ClientInstanceName="dtfrom">
                                                <DropDownButton Text="From">
                                                </DropDownButton>
                                                 <ClientSideEvents DateChanged="function(s,e){DateChangeForFrom();}" />
                                            </dxe:ASPxDateEdit>
                                        </td>
                                       
                                         <td id="td_dtto">
                                            <dxe:ASPxDateEdit ID="dtto" runat="server" EditFormat="Custom" UseMaskBehavior="True" 
                                                Font-Size="10px" Width="108px" ClientInstanceName="dtto"  >
                                                <DropDownButton Text="To">
                                                </DropDownButton>
                                                 <ClientSideEvents DateChanged="function(s,e){DateChangeForTo();}" />
                                            </dxe:ASPxDateEdit>
                                        <%--OnDateChanged="dtto_DateChanged" AutoPostBack="True"--%>
                                        </td>
                                       
                                        <%-- ----------------- For Period End----------------------%>
                                        
                                       
                                    </tr>
                                </table>
                            </td>
                           
                        </tr>
                        <tr>
                            <td  class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                   
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Clients :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="c" onclick="fn_Clients('a')" />
                                            All 
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="c" onclick="fn_Clients('b')" />
                                            Selected 
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                         <tr>
                            <td  class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                   
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Scrip :</td>
                                        <td>
                                            <asp:RadioButton ID="rdScripAll" runat="server" Checked="True" GroupName="b" onclick="fn_Scrip('a')" />
                                            All 
                                        </td>
                                       
                                        <td>
                                            <asp:RadioButton ID="rdScripSelected" runat="server" GroupName="b" onclick="fn_Scrip('b')" />
                                            Selected 
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                      
                        <tr>
                            <td class="gridcellleft">
                                <table>
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
                        <tr> <td class="gridcellleft">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                  <asp:Button ID="btngenerate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                                    Width="101px" OnClick="btngenerate_Click" />
                                     </ContentTemplate>
                                   
                                </asp:UpdatePanel>
                </td></tr>
                    </table>
                </td>
                <td>
                    <table id="showFilter">
                        <tr>
                            <td >
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                            id="TdFilter">
                                            <span id="spanunder"></span><span id="spanclient"></span>
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
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
                <td style="display: none;">
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                     <asp:HiddenField ID="HiddenField_Client" runat="server" />
                    <asp:HiddenField ID="HiddenField_ScripsExchange" runat="server" />
                    
                    
                   <%-- //-----------------------------------------------------%>
                    
                     <asp:HiddenField ID="HSegName" runat="server" />
                      <asp:HiddenField ID="HFDay" runat="server" />
                       <asp:HiddenField ID="HFMonth" runat="server" />
                        <asp:HiddenField ID="HFYear" runat="server" />
                         <asp:HiddenField ID="HTDay" runat="server" />
                          <asp:HiddenField ID="HTMonth" runat="server" />
                          <asp:HiddenField ID="HTYear" runat="server" />
                          
                    
                    
                   <%-- ----------------------------------------------------------%>
                    
                    
                   
                </td>
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
        <table>
            <tr>
                <td style="display:none;">
                    <asp:Button ID="btnhtmlcreate" runat="server" Text="htmlcreate" OnClick="btnhtmlcreate_Click"  />
                    
                     <asp:Button ID="btnPeriod" runat="server" Text="htmlperiod" 
                        onclick="btnPeriod_Click"   />
                  
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
