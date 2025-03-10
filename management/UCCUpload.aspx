<%@ page language="C#" autoeventwireup="true" inherits="management_UCCUpload, App_Web_udicbieo" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
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
	
	form{
		display:inline;
	}
	
	</style>

    <script language="javascript" type="text/javascript">
   // var seg='S';
   var seg;
   function AccountTypeChange(val)
    {
   
        if(val=="N")
            window.location='../Segments/User/BL/AllSeg_UciUpload.aspx';
    }
   function TmCodeFind()
   {
        alert("TM Code not found!...!..Please Try again");
   }
   
   function ErrorList(obj)
   {
      alert(obj);
   }
   function ClientFind()
   {
   alert("Client not found!..Please Try again");
   }
   
   function filteroff()
   {
        document.getElementById('showFilter').style.display="none";
   
   }
     function PageLoad()
    {
     
      seg='S';
      document.getElementById('showFilter').style.display="none";
     
        
    }
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    
    
    
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
        
        }
     function showOptions(obj1,obj2,obj3)
         {
             //  var cmb=document.getElementById('cmbsearchOption');
                var obj4 = txtAgreDate.GetText()+'-'+seg;
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
              
//                document.getElementById('showFilter').style.display='none';
//                document.getElementById('TdFilter').style.display='none';
 
              //  document.getElementById('btn_show').disabled=false;
                document.getElementById('showFilter').style.display='none';
                 height();
                
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
            document.getElementById('showFilter').style.display="none";
           // document.getElementById('showFilter').style.display="none";
             height();

        }
        
      function rdbtnSelected(obj)
        {
                  
            if(obj=='Client')
            {
            
            document.getElementById('cmbsearchOption').value='Client';
            }
           //document.getElementById('showFilter').style.display="none";
           document.getElementById('showFilter').style.display="inline";
            height();
          
        }
        
        function rdbtnSegment(obj1)
        {
          if(obj1=='A')
           {
           seg=obj1;
          } 
          else
           {
            seg=obj1;
            
           }
            
        }
        function fncInputNumericValuesOnly()	
        {		if(!(event.keyCode==45||event.keyCode==46||event.keyCode==48||event.keyCode==49||event.keyCode==50||event.keyCode==51||event.keyCode==52||event.keyCode==53||event.keyCode==54||event.keyCode==55||event.keyCode==56||event.keyCode==57))		{			event.returnValue=false;		}	}
       
        
        FieldName='lstSlection';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;" colspan="2">
                        <strong><span style="color: #000099">UCC Upload</span></strong>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>--%>
                        <table width="400px">
                            <tr>
                                <td class="gridcellleft">
                                    Segment:</td>
                                <td class="gridcellleft">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="rdbSegAll" runat="server" GroupName="d" />
                                            </td>
                                            <td id="td_both" runat="server" style="color: Maroon; width: 800px">
                                                Both (NSE-CM & NSE-FO)
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbSegSelected" runat="server" Checked="True" GroupName="d" />
                                            </td>
                                            <td>
                                                Selected
                                            </td>
                                            <td style="width: 500px">
                                                (<span id="litSegment" runat="server" style="color: Maroon"></span>)
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="tr_type" runat="server">
                                <td class="gridcellleft">
                                    Type:
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="cmbType" runat="server" Width="75px" TabIndex="7">
                                        <asp:ListItem Selected="True" Value="I">New</asp:ListItem>
                                        <asp:ListItem Value="M">Modify</asp:ListItem>
                                        <%--<asp:ListItem Value="D">Delete</asp:ListItem>--%>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="tr_generate" runat="server">
                                <td class="gridcellleft">
                                    UCI Format:
                                </td>
                                <td class="gridcellleft">
                                     <dxe:ASPxComboBox ID="ddlAccountType" Width="160px" runat="server" Font-Size="13px"
                                    ValueType="System.String" ClientInstanceName="cddlAccountType" Font-Bold="False"
                                    SelectedIndex="0" TabIndex="0">
                                    <Items>
                                        <dxe:ListEditItem Text="OLD" Value="O" />
                                        <dxe:ListEditItem Text="NEW" Value="N" />
                                        
                                    </Items>
                                    <ClientSideEvents ValueChanged="function(s, e) {AccountTypeChange(s.GetValue());}" />
                                    <Paddings PaddingBottom="0px"></Paddings>
                                </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    Agreement Date:
                                </td>
                                <td class="gridcellleft">
                                    <table>
                                        <tr>
                                            <td>
                                                <dxe:ASPxDateEdit ID="txtAgreDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Width="250px">
                                                    <buttonstyle width="13px">
                                                    </buttonstyle>
                                                    <dropdownbutton text="From Date">
                                                    </dropdownbutton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    Generate UCI File For Client:</td>
                                <td class="gridcellleft">
                                    <table>
                                        <tr>
                                            <td>
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
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    Business Date:
                                </td>
                                <td class="gridcellleft">
                                    <table>
                                        <tr>
                                            <td>
                                                <dxe:ASPxDateEdit ID="txtFromDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Width="250px">
                                                    <buttonstyle width="13px">
                                                    </buttonstyle>
                                                    <dropdownbutton text="From Date">
                                                    </dropdownbutton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    Batch Number:
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtBatch" runat="server" Width="30px" onkeypress="fncInputNumericValuesOnly('txtQty')"
                                        MaxLength="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBatch"
                                        ErrorMessage="Required!"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                </td>
                                <td class="gridcellleft">
                                    <asp:Button ID="btnSave" Text="Generate" runat="server" OnClick="btnSave_Click" CssClass="btnUpdate" />
                                </td>
                            </tr>
                            <%-- <tr id="tdDownload" runat="server" visible="false">
                 <td colspan="2" id="td_file">
                                            
                            <asp:Label ID="lbltxt" runat="server" Text="File" Font-Size="10px"></asp:Label>
                            <asp:TextBox ID="txtname" runat="server" Font-Size="10px"></asp:TextBox>
                            <asp:Label ID="lblgenerate" runat="server" Text="Generated Successfully !" Font-Size="10px"></asp:Label>
                            
                                <asp:Button ID="Download" runat="server" CssClass="btnUpdate" Height="20px" Text="Download File"
                            Width="100px" OnClick="Download_Click" />
                     </td>
                
                </tr>--%>
                        </table>
                        <%-- </ContentTemplate>
                        </asp:UpdatePanel>--%>
                    </td>
                    <td valign="top">
                        <table id="showFilter">
                            <tr>
                                <td class="gridcellleft" style="vertical-align: top; text-align: right" id="TdFilter">
                                    <span id="spanall">
                                        <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="190px"></asp:TextBox></span>
                                    <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                        Enabled="false">
                                        <asp:ListItem>Client</asp:ListItem>
                                        <asp:ListItem>Segment</asp:ListItem>
                                        <%-- <asp:ListItem>Clients</asp:ListItem>
                                                    <asp:ListItem>Segment</asp:ListItem>
                                                    <asp:ListItem>Branch</asp:ListItem>
                                                    <asp:ListItem>SettlementNo</asp:ListItem>
                                                    <asp:ListItem>SettlementType</asp:ListItem>
                                                    <asp:ListItem>other</asp:ListItem>--%>
                                    </asp:DropDownList>
                                    <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                        style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                            style="color: #009900; font-size: 8pt;"> </span>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; vertical-align: top; height: 146px;">
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
                                        <tr style="display: none">
                                            <td style="height: 23px">
                                                <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                                <%-- <asp:TextBox ID="dtFrom_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>--%>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <%--  <tr>
                                    <td style="text-align:left;">
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="btnUpdate" Text="Send" /></td>
                                    </tr>--%>
                        </table>
                    </td>
                </tr>
                <tr id="tdDownload" runat="server" visible="false">
                    <td colspan="2" id="td_file" style="padding-left: 30px;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label ID="lbltxt" runat="server" Text="File" Font-Size="10px"></asp:Label>
                                <asp:TextBox ID="txtname" runat="server" Width="150px" Font-Size="10px"></asp:TextBox>
                                <asp:Label ID="lblgenerate" runat="server" Text="Generated Successfully !" Font-Size="10px"></asp:Label>
                            </ContentTemplate>
                            <%--<Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Generate" EventName="Click" />
                        </Triggers>--%>
                        </asp:UpdatePanel>
                        <asp:Button ID="Download" runat="server" CssClass="btnUpdate" Height="20px" Text="Download File"
                            Width="100px" OnClick="Download_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
