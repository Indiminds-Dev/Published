<%@ page language="C#" autoeventwireup="true" inherits="management_CTTGeneration, App_Web_x5xbqja1" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>CTT Generation</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
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

    .grid_scrollNSEFO
    {
        overflow-y: no;  
        overflow-x: scroll; 
        width:92%;
        scrollbar-base-color: #C0C0C0;
    
    }




	
	form{
		display:inline;
	}
	
	</style>
    <script language="javascript" type="text/javascript">
     function SignOff()
    {
        window.parent.SignOff();
    }

    function Page_Load()///Call Into Page Load
     {
                document.getElementById('showFilter').style.display='none';
                document.getElementById('TdFilter').style.display='none';
                document.getElementById('tddisplay').style.display='none';

                height();
           
     }
        
    
  function showOptions(obj1,obj2,obj3)
         {
            var cmb=document.getElementById('cmbsearchOption');
            ajax_showOptions(obj1,obj2,obj3,cmb.value);

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
                document.getElementById('btn_generate').disabled=false;
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
            
       function rdbtnSegAll(obj)
        {
            document.getElementById('showFilter').style.display='none';
            document.getElementById('TdFilter').style.display='none';
             document.getElementById('btn_generate').disabled=false;
           
        }
   
            
       function rdbtnSelected(obj)
        {
            document.getElementById('showFilter').style.display='inline';
            document.getElementById('TdFilter').style.display='inline';
            if(obj=='Client')
            {
                 document.getElementById('cmbsearchOption').value='Clients';
                 document.getElementById('btn_generate').disabled=true;
                 document.getElementById('spanall').style.display="inline";
            }
        
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
            window.frameElement.widht = document.body.scrollWidht;
        }
       
        function Disable(obj)
        {
            
            var gridview = document.getElementById('grdCTTgenerate'); 
            var rCount = gridview.rows.length;
            
            if(rCount<10)
                rCount='0'+rCount;
            if(obj=='P')
            {
                document.getElementById("grdCTTgenerate_ctl08_FirstPage").style.display='none';
                document.getElementById("grdCTTgenerate_ctl08_PreviousPage").style.display='none';
                document.getElementById("grdCTTgenerate_ctl08_NextPage").style.display='inline';
                document.getElementById("grdCTTgenerate_ctl08_LastPage").style.display='inline';
            }
            else
            {
                document.getElementById("grdCTTgenerate_ctl"+rCount+"_NextPage").style.display='none';
                document.getElementById("grdCTTgenerate_ctl"+rCount+"_LastPage").style.display='none';
            }
        }
        function ChangeRowColorgrid(rowID,rowNumber) 
        {             
            
            var gridview = document.getElementById('grdCTTgenerate'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1;
            var rowCount=0;
            if(rCount==18)
                 rowCount=15;
            else    
               rowCount=rCount-2;
            if(rowNumber>15 && rCount<18)
                rowCount=rCount-3;
            for (rowIndex; rowIndex<=rowCount; rowIndex++) 
            { 
                var rowElement = gridview.rows[rowIndex]; 
                rowElement.style.backgroundColor='#FFFFFF'
            }
            var color = document.getElementById(rowID).style.backgroundColor;
            if(color != '#ffe1ac') 
            {
                oldColor = color;
            }
            if(color == '#ffe1ac') 
            {
                document.getElementById(rowID).style.backgroundColor = oldColor;
            }
            else 
                document.getElementById(rowID).style.backgroundColor = '#ffe1ac'; 

        } 
     


        FieldName='lstSlection';
        function display()
        {
         document.getElementById('tddisplay').style.display='inline';
         height();
        }
        function Nodisplay()
        {
                document.getElementById('showFilter').style.display='none';
                document.getElementById('TdFilter').style.display='none';
                document.getElementById('tddisplay').style.display='none';
                alert('CTT Generate Successfully');
                height();
           
        }
    
   
    </script>
    
    
      <script type="text/ecmascript">
        
	    function ReceiveServerData(rValue)
        {
            var Data=rValue.split('~');
           
             if(Data[0]=='Clients')
            {

            }
      
        } 
      
      
    
    </script>
       
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
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

      

      //if (postBackElement.id == 'ctl00_ContentPlaceHolder3_btnShow') 

         $get('UpdateProgress1').style.display = 'block'; 
         document.getElementById('btn_generate').disabled=true;
         
   } 

 

   function EndRequest(sender, args) 

   { 

      // if (postBackElement.id == 'ctl00_ContentPlaceHolder3_btnShow') 

          $get('UpdateProgress1').style.display = 'none'; 
          document.getElementById('btn_generate').disabled=false;
         
    
        
   } 
   </script>
                       <table class="TableMain100">
       <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">CTT Generation</span></strong>
                    </td>
                </tr></table>
         <table class="TableMain100">
                <tr id="TdAll1">
                    <td colspan="2">
                        <table width="100%">
                            <tr valign="top">
                                <td>
                                    <table>
                                        <tr valign="top">
                                            <td>
                                                Date:
                                            </td>
                                            <td class="gridcellleft">
                                                <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="150px" ClientInstanceName="dtfrom">
                                                    <DropDownButton Text="Select Date">
                                                    </DropDownButton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td  style="width: 76px">
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td class="gridcellleft" style="vertical-align: top; text-align: right" id="TdFilter">
                                  <span id="spanall">
                                        <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px"></asp:TextBox></span>
                                    
                                    <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                        Enabled="false">
                                        <asp:ListItem>Clients</asp:ListItem>
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
                    <td style="text-align: left; vertical-align: top; width: 953px;">
                        <table border="0">
                            <tr>
                                <td style="text-align: left;" id="TdAc1">
                                    <table>
                                        <tr>
                                        <td>Clients:</td>
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
                                            <td>
                                               <span id="litClientMain" runat="server" style="color: Maroon"></span>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <asp:Button id="btn_generate" runat="server" Width="101px" Height="23px" Text="Generate" CssClass="btnUpdate" OnClick="btn_generate_Click1"></asp:Button></td>
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
                                </td>
                            </tr>
                           
                        </table>
                    </td>
                </tr>
             <tr id="tddisplay">
                  <td colspan="2" style="text-align: left; vertical-align:top;background-color:Silver;" >
                     <asp:Label ID="lblerror" runat="server" Text="Following Clients CTT Generation Pattern is set to 'Contract Number Wise'.However Contract Number is not generated for the given day.Hence CTT not generated.Please generate Contract Number and generate CTT."></asp:Label>
                 </td>
             </tr>
                 <tr id="Tr1">
                  <td colspan="2" style="text-align: left; vertical-align:top;" >
                 </td>
             </tr>
               
                <tr>
                    <td colspan="2" style="text-align: left; vertical-align: bottom;">

                     <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

                            <ContentTemplate>
                                <asp:GridView ID="grdCTTgenerate" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                    ShowFooter="True" AllowSorting="true"
                                    AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" 
                                     AllowPaging="True" PageSize="5" ForeColor="#0000C0" OnRowCreated="grdCTTgenerate_RowCreated"  >
                                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                    
                                    <Columns>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemStyle Wrap="false" BorderWidth="1px"   HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle    HorizontalAlign="Center" Font-Bold="False" CssClass="gridstyleheight1">
                                            </HeaderStyle>
                                            <ItemTemplate >
                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("name")%>'></asp:Label>
                                            </ItemTemplate>
                                            
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="Code">
                                            <ItemStyle Wrap="false" BorderWidth="1px"    HorizontalAlign="Left"  ></ItemStyle>
                                            <HeaderStyle  HorizontalAlign="Left" Font-Bold="False" CssClass="gridstyleheight1" >
                                            </HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblCode" runat="server" Text='<%# Eval("code")%>'   ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                      
                                        
                                       
                                         
                                    </Columns>
                                  
                                    <PagerTemplate>
                                        <table>
                                            <tr>
                                                <td colspan="10">
                                                    <asp:LinkButton ID="FirstPage" runat="server" Font-Bold="true" CommandName="First"
                                                        OnCommand="NavigationLink_Click" Text="[First Page]"> </asp:LinkButton>
                                                    <asp:LinkButton ID="PreviousPage" runat="server" Font-Bold="true" CommandName="Prev"
                                                        OnCommand="NavigationLink_Click" Text="[Previous Page]">  </asp:LinkButton>
                                                    <asp:LinkButton ID="NextPage" runat="server" Font-Bold="true" CommandName="Next"
                                                        OnCommand="NavigationLink_Click" Text="[Next Page]">
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="LastPage" runat="server" Font-Bold="true" CommandName="Last"
                                                        OnCommand="NavigationLink_Click" Text="[Last Page]">
                                                    </asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </PagerTemplate>
                                    <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                        BorderWidth="1px"></RowStyle>
                                    <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                    <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                    <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                    <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                        Font-Bold="False"></HeaderStyle>
                                </asp:GridView>
                                <asp:HiddenField ID="CurrentPage" runat="server"></asp:HiddenField>
                                <asp:HiddenField ID="TotalPages" runat="server"></asp:HiddenField>
                                <asp:HiddenField ID="TotalClient" runat="server" />
                            </ContentTemplate>
                              <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btn_generate" EventName="Click" />
                           
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
               <tr >
                                <td style="height: 23px" colspan="2">
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                <progresstemplate>
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
                                </progresstemplate>
                            </asp:UpdateProgress>
                                </td>
                            </tr>
            </table>
            
    </div>
    </form>
</body>
</html>
