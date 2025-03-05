<%@ page language="C#" autoeventwireup="true" inherits="management_frmNSECMQBR_ClientRelated, App_Web_sjbhlkdr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
     

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
   
     <script language="javascript" type="text/javascript">
      function Page_Load()
        {
            document.getElementById('showFilter').style.display='none';
            document.getElementById('TdFilter').style.display='none';
            document.getElementById('TdAc').style.display='none';
            document.getElementById('TdAc1').style.display='none';
            document.getElementById('showDetail').style.display='none';
            dtFrom.SetDate(new Date());
            dtTo.SetDate(new Date());
            OnSelectedValueChanged();
            cDetailsGrid.PerformCallback();
            height();            
        }
        FieldName='lstSuscriptions';
        function showOptions(obj1,obj2,obj3)
         {
          var cmb=document.getElementById('cmbsearchOption');
          ajax_showOptions(obj1,obj2,obj3,cmb.value,'Sub');
         }
        function keyVal(obj)
         {
            document.getElementById('HdnBranch').value='';
            document.getElementById('HdnSegment').value='';
            document.getElementById('HdnSubAc').value='';
            document.getElementById('HdnGroup').value='';
            var obj1=obj.split('~');
            Mainvalue="'"+obj1[0]+"'";
            document.getElementById('HdnMainAc').value=Mainvalue;
            document.getElementById('HdnSubLedgerType').value=obj1[1];
            document.getElementById('HdnForBranchGroup').value='a';
            if(obj1[1]=='None')
            {
                document.getElementById('TrSubAccount').style.display='none';
                document.getElementById('TrForGroup').style.display='none';
                document.getElementById('TrForClient').style.display='none';
                dateTimeForSubledger='a';
            }
            else
            {
                if(obj1[1]=='Custom' || obj1[1]=='Products-Equity' || obj1[1]=='Products-Commodity  ' || obj1[1]=='Products-MF'  || obj1[1]=='Products-Insurance ' || obj1[1]=='Products-ConsumerFinance' || obj1[1]=='RTAs ' || obj1[1]=='MFs' || obj1[1]=='AMCs ' || obj1[1]==' Insurance Cos'  || obj1[1]=='Consumer Finance Cos  ' || obj1[1]=='Custodians ' || obj1[1]=='Consultants' || obj1[1]=='Share Holder' || obj1[1]=='Debtors'  || obj1[1]=='Creditors')
                {
                    document.getElementById('TrForGroup').style.display='none';
                    document.getElementById('TrForClient').style.display='none';
                    document.getElementById('TrSubAccount').style.display='inline';
                }
                else
                {
                    document.getElementById('TrForGroup').style.display='inline';
                    document.getElementById('TrForClient').style.display='inline';
                    document.getElementById('TrSubAccount').style.display='none';
                    if(obj1[1]!='NSDL Clients' || obj1[1]!='CDSL Clients')
                        document.getElementById('HdnForBranchGroup').value=obj1[1];
                }
                dateTimeForSubledger='b';                
            }
         }
         function height()
        {
            if(document.body.scrollHeight>=500)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '500';
            }
            window.frameElement.widht = document.body.scrollWidht;
        }
        function SegAll(obj)
        {
            document.getElementById('showFilter').style.display='none';
            document.getElementById('TdFilter').style.display='none';
            if(obj=='seg')
            {
                
            }
           
        }
        function SegSelected(obj)
        {
            document.getElementById('showFilter').style.display='inline';
            document.getElementById('TdFilter').style.display='inline';
            if(obj=='seg')
            {
                document.getElementById('cmbsearchOption').value='Segment';
                 document.getElementById('spanall').style.display="inline";
                 document.getElementById('span2').style.display="none";
            }
            else
            {
                document.getElementById('cmbsearchOption').value='Sub Ac';
                document.getElementById('spanall').style.display="none";
                document.getElementById('span2').style.display="none";
                
            }
        }
        function btnAddsubscriptionlist_click()
        {
            var cmb=document.getElementById('cmbsearchOption');
            if(cmb.value=='Clients' || cmb.value=='Branch' || cmb.value=='Group')
            {
                var userid = document.getElementById('txtSubsubcriptionIDBranch');
                if(userid.value != '')
                {
                    var ids = document.getElementById('txtSubsubcriptionIDBranch_hidden');
                    var listBox = document.getElementById('lstSuscriptions');
                    var tLength = listBox.length;
                    //alert(tLength);
                    
                    var no = new Option();
                    no.value = ids.value;
                    no.text = userid.value;
                    listBox[tLength]=no;
                    var recipient = document.getElementById('txtSubsubcriptionIDBranch');
                    recipient.value='';
                }
                else
                    alert('Please search name and then Add!')
                var s=document.getElementById('txtSubsubcriptionIDBranch');
                s.focus();
                s.select();
            }
            else if(cmb.value!='Sub Ac')
            {
                var userid = document.getElementById('txtsubscriptionID');
                if(userid.value != '')
                {
                    var ids = document.getElementById('txtsubscriptionID_hidden');
                    var listBox = document.getElementById('lstSuscriptions');
                    var tLength = listBox.length;
                    //alert(tLength);
                    
                    var no = new Option();
                    no.value = ids.value;
                    no.text = userid.value;
                    listBox[tLength]=no;
                    var recipient = document.getElementById('txtsubscriptionID');
                    recipient.value='';
                }
                else
                    alert('Please search name and then Add!')
                var s=document.getElementById('txtsubscriptionID');
                s.focus();
                s.select();
                var AcVal=document.getElementById('ddlAccountType').value;
                if(AcVal=='3')
                    clientselectionfinal();
            }            
            else    
            {
                var userid = document.getElementById('txtSubsubcriptionID');
                if(userid.value != '')
                {
                    var ids = document.getElementById('txtSubsubcriptionID_hidden');
                    var listBox = document.getElementById('lstSuscriptions');
                    var tLength = listBox.length;
                    //alert(tLength);
                    
                    var no = new Option();
                    no.value = ids.value;
                    no.text = userid.value;
                    listBox[tLength]=no;
                    var recipient = document.getElementById('txtSubsubcriptionID');
                    recipient.value='';
                }
                else
                    alert('Please search name and then Add!')
                var s=document.getElementById('txtSubsubcriptionID');
                s.focus();
                s.select();
            }
        }
        function btnRemovefromsubscriptionlist_click()
        {
            var listBox = document.getElementById('lstSuscriptions');
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
        function btnCancel_Click()
        {
            document.getElementById("TrAll").style.display='none';
            document.getElementById("TdAll1").style.display='none';
            document.getElementById("TrBtn").style.display='none';
            document.getElementById('showDetail').style.display='inline';
            document.getElementById('spanBtn').style.display='none';
            height();
        }
        function DateChangeForTo()
    {
//        var sessionVal ="<%=Session["LastFinYear"]%>";
//        var objsession=sessionVal.split('-');
//        var MonthDate=dtTo.GetDate().getMonth()+1;
//        var DayDate=dtTo.GetDate().getDate();
//        var YearDate=dtTo.GetDate().getYear();
//        
//        if(YearDate<=objsession[1])
//        {
//            if(MonthDate<4 && YearDate==objsession[0])
//            {
//                alert('Enter Date Is Outside Of Financial Year !!');
//                var datePost=(3+'-'+31+'-'+objsession[1]);
//                dtTo.SetDate(new Date(datePost));
//            }
//            else if(MonthDate>3 && YearDate==objsession[1])
//            {
//                alert('Enter Date Is Outside Of Financial Year !!');
//                var datePost=(3+'-'+31+'-'+objsession[1]);
//                dtTo.SetDate(new Date(datePost));
//            }
//            else if(YearDate!=objsession[0] && YearDate!=objsession[1])
//            {
//                alert('Enter Date Is Outside Of Financial Year !!');
//                var datePost=(3+'-'+31+'-'+objsession[1]);
//                dtTo.SetDate(new Date(datePost));
//            }
//        }
//        else
//        {
//            alert('Enter Date Is Outside Of Financial Year !!');
//            var datePost=(3+'-'+31+'-'+objsession[1]);
//            dtTo.SetDate(new Date(datePost));
//        }
    }
    function clientselectionfinal()
	    {
	        var listBoxSubs = document.getElementById('lstSuscriptions');
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
            document.getElementById('Button1').disabled=false;
	    }
	    function OnSelectedValueChanged()
        {
            var ddlvalue=document.getElementById('<%=ddltopic.ClientID %>').value;
            var ddltopic = document.getElementById("<%=ddltopic.ClientID%>");
            var ddltext = ddltopic.options[ddltopic.selectedIndex].text; 

            //alert(ddltext);
//            document.getElementById('spnheader').innerText = ddltext;
            if (ddlvalue == 1 || ddlvalue == 2 )
            {
              trsegment.style.display='inline';
              traddsegment.style.display='inline';
              trdatefromto.style.display='inline';
              trlegalstatus.style.display='none';
              trdormantday.style.display='none';
            }
            else if(ddlvalue == 3)
            {
              trsegment.style.display='inline';
              traddsegment.style.display='inline';
              trdormantday.style.display='inline';
              trdatefromto.style.display='none';
              trlegalstatus.style.display='none';
            }
            else if(ddlvalue == 4)
            {
              trsegment.style.display='inline';
              traddsegment.style.display='inline';
              trlegalstatus.style.display='inline';
              trdatefromto.style.display='none';
              trdormantday.style.display='none';
            }
            else
            {
              trsegment.style.display='none';
              traddsegment.style.display='none';
              trdatefromto.style.display='none';
              trlegalstatus.style.display='none';
              trdormantday.style.display='none';
            }
            cgrdReportQuery.PerformCallback("RowDel");
        }
         function ShowTrTd(obj)
        {
//            document.getElementById(obj).style.display='inline';
           obj.style.display='inline';
        }
        function HideTrTd(obj)
        {
//            document.getElementById(obj).style.display='none';
            obj.style.display='none';
        }
        function ButtonShowClick()
        {
            var ddlvalue=document.getElementById('<%=ddltopic.ClientID %>').value;
            var ddltopic = document.getElementById("<%=ddltopic.ClientID%>");
            var ddltext = ddltopic.options[ddltopic.selectedIndex].text; 
            document.getElementById('spnheader').innerText = ddltext;
            cgrdReportQuery.PerformCallback();
        }
        
   </script>
   
     <script type="text/ecmascript">
        
	    function ReceiveServerData(rValue)
        {
            var Data=rValue.split('~');
            if(Data[0]=='Segment')
            {
                document.getElementById('HdnBranch').value=Data[1];
            }
            if(Data[0]=='Branch')
            {
                groupvalue=Data[1];
                document.getElementById('HdnSegment').value=Data[1];
            }            
            if(Data[0]=='Sub Ac')
            {
                document.getElementById('HdnSubAc').value='';
                document.getElementById('HdnSubAc').value=Data[1];
            }
            if(Data[0]=='Clients')
            {
                document.getElementById('HdnSubAc').value='';
                groupvalue=Data[1];
                document.getElementById('HdnSubAc').value=Data[1];
            }
            if(Data[0]=='Group')
            {
                groupvalue=Data[1];
                document.getElementById('HdnGroup').value=Data[1];
            }
            if(Data[0]=='Ac Name')
            {
                 Mainvalue=Data[1];
                document.getElementById('HdnMainAc').value=Data[1];
                document.getElementById('HdnSubLedgerType').value=Data[2];
            }
        } 
        
        function grdReportQuery_EndCallBack()
        {
            if(cgrdReportQuery.cpExcel != null)
            {
                if(cgrdReportQuery.cpExcel != "E")
                    document.getElementById("btnExport").click();
                else
                    alert(cgrdReportQuery.cpExcel);
            }
            height();
        }
        
        
            
    </script>
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="TableMain100" style="width: 97%">
            <tr>
                <td style="border: solid 1px blue; width: 926px">
                    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
                    </asp:ScriptManager>
                    <table border="0" style="width: 791px">
                        <tr>
                            <td class="gridcellleft" style="width: 80px" valign="top">
                                Topic</td>
                            <td colspan="2" style="text-align: left">
                                <asp:DropDownList ID="ddltopic" runat="server" onchange="OnSelectedValueChanged();">
                                    <asp:ListItem Text="List of Clients Registered In Selected Segment of a Company between a given date range"
                                        Value="1"></asp:ListItem>
                                    <asp:ListItem Text="List Of Active Clients in Selected segment of a company between a given date range"
                                        Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Number of clients who have been dormant(not traded) for more than 'n' number of Days in selected segment(s)"
                                        Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Clients as per their Legal Status selected by a user" Value="4"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr id="trsegment">
                            <td class="gridcellleft" style="width: 80px" valign="top">
                                Segment</td>
                            <td colspan="2" style="text-align: left">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdbSegAll" runat="server" GroupName="a" TabIndex="1" />
                                        </td>
                                        <td>
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbSegSelected" runat="server" Checked="True" GroupName="a"
                                                TabIndex="2" />
                                        </td>
                                        <td>
                                            Selected
                                        </td>
                                        <td>
                                            (<span id="litSegment" runat="server" style="color: maroon"></span>)
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="traddsegment">
                            <td class="gridcellleft" style="width: 80px" valign="top">
                            </td>
                            <td colspan="2" style="text-align: left">
                                <table id="showFilter" style="width: 30%">
                                    <tr>
                                        <td style="vertical-align: top; width: 946px; height: 134px;">
                                            <table>
                                                <tr>
                                                    <td id="TdFilter" class="" style="vertical-align: top; text-align: right">
                                                        <asp:TextBox ID="txtsubscriptionID" runat="server" Font-Size="12px" Width="150px"
                                                            TabIndex="3"></asp:TextBox><span id="span2"></span>
                                                        <asp:DropDownList ID="cmbsearchOption" runat="server" Enabled="false" Font-Size="11px"
                                                            Width="70px">
                                                            <asp:ListItem>Segment</asp:ListItem>
                                                            <asp:ListItem>Branch</asp:ListItem>
                                                            <asp:ListItem>Ac Name</asp:ListItem>
                                                            <asp:ListItem>Sub Ac</asp:ListItem>
                                                            <asp:ListItem>Group</asp:ListItem>
                                                            <asp:ListItem>Clients</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                            style="font-size: 8pt; color: #009900; text-decoration: underline" tabindex="4">
                                                            Add to List</span></a><span style="font-size: 8pt; color: #009900"> </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 90px">
                                                        <asp:ListBox ID="lstSuscriptions" runat="server" Font-Size="10px" Height="90px" Width="290px">
                                                        </asp:ListBox><span style="font-size: 8pt; color: #cc3300; text-decoration: underline">
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr style="font-size: 8pt; color: #cc3300; text-decoration: underline">
                                                    <td style="text-align: center">
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="height: 14px">
                                                                    <a id="A2" href="javascript:void(0);" onclick="clientselectionfinal()"><span style="color: #000000;"
                                                                        tabindex="5">Done</span></a> &nbsp;
                                                                </td>
                                                                <td style="height: 14px">
                                                                    <a id="A1" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
                                                                        <span style="color: #cc3300; text-decoration: underline; font-size: 8pt;" tabindex="6">
                                                                            Remove</span></a>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="display: none">
                                        <td style="width: 946px">
                                            <asp:TextBox ID="txtsubscriptionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                            <asp:TextBox ID="txtSubsubcriptionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                            <asp:TextBox ID="txtSubsubcriptionIDBranch_hidden" runat="server" Font-Size="12px"
                                                Width="1px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="trdatefromto">
                            <td class="gridcellleft" style="width: 80px" valign="top">
                                Date
                            </td>
                            <td style="height: 6px">
                                <div style="float: left; margin-right: 10px">
                                    <dxe:ASPxDateEdit id="ASPxDateEdit1" runat="server" ClientInstanceName="dtFrom" EditFormat="Custom"
                                        Font-Size="10px" UseMaskBehavior="True" Width="108px" DateOnError="Today" EditFormatString="dd-MM-yyyy"
                                        tabIndex="7">
                                        <dropdownbutton text="From"></dropdownbutton>
                                        <clientsideevents gotfocus="function(s,e){dateChange11();}" valuechanged="function(s,e){dateChange();DateChangeForFrom();}"></clientsideevents>
                                    </dxe:ASPxDateEdit>
                                </div>
                                <div>
                                    <dxe:ASPxDateEdit id="ASPxDateEdit2" runat="server" ClientInstanceName="dtTo" EditFormat="Custom"
                                        Font-Size="10px" UseMaskBehavior="True" Width="108px" DateOnError="Today" EditFormatString="dd-MM-yyyy"
                                        OnDateChanged="ASPxDateEdit2_DateChanged" tabIndex="8">
                                        <dropdownbutton text="To"></dropdownbutton>
                                        <clientsideevents gotfocus="function(s,e){dateChange11();}" valuechanged="function(s,e){dateChange();DateChangeForTo();}"></clientsideevents>
                                    </dxe:ASPxDateEdit>
                                </div>
                            </td>
                        </tr>
                        <tr id="trdormantday" style="display: none">
                            <td style="height: 11px">
                                &nbsp; Dormant Days</td>
                            <td style="height: 11px">
                                <asp:TextBox ID="txtdormantday" runat="server" Width="50px">0</asp:TextBox></td>
                        </tr>
                        <tr id="trlegalstatus" style="display: none">
                            <td>
                                &nbsp; Legal Status</td>
                            <td>
                                <asp:DropDownList ID="cmbLegalStatus" runat="server" TabIndex="9" Width="160px" OnSelectedIndexChanged="cmbLegalStatus_SelectedIndexChanged">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <dxe:ASPxButton ID="btnShow" runat="server" AutoPostBack="False" Text="Show" Width="55px">
                                    <clientsideevents click="function (s, e) { ButtonShowClick(); }" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr runat="server">
                <td class="EHEADER" style="vertical-align: top; height: 1px; text-align: right" width="70%">
                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                        ClientInstanceName="exp" Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                        SelectedIndex="0" ValueType="System.Int32" Width="130px">
                        <items>
                        <dxe:ListEditItem Text="Select" Value="0" />
                        <dxe:ListEditItem Text="PDF" Value="1" />
                        <dxe:ListEditItem Text="XLS" Value="2" />
                        <dxe:ListEditItem Text="RTF" Value="3" />
                        <dxe:ListEditItem Text="CSV" Value="4" />
                    </items>
                        <buttonstyle backcolor="#C0C0FF" forecolor="Black">
                    </buttonstyle>
                        <itemstyle backcolor="Navy" forecolor="White">
                        <HoverStyle BackColor="#8080FF" ForeColor="White">
                        </HoverStyle>
                    </itemstyle>
                        <border bordercolor="White" />
                        <dropdownbutton text="Export">
                    </dropdownbutton>
                        <clientsideevents selectedindexchanged="OncmbExportSelectedIndexChanged" />
                    </dxe:ASPxComboBox>
                </td>
            </tr>
            <tr id="trgridviewheader" runat="server">
                <td class="EHEADER" style="vertical-align: top; text-align: center" width="70%">
                    <span id="spnheader" style="color: #3300cc; font-weight: bold"></span>
                </td>
            </tr>
            <tr id="trgridview" runat="server">
                <td>
                    <dxwgv:ASPxGridView ID="grdReportQuery" ClientInstanceName="cgrdReportQuery" Width="100%"
                        runat="server" OnCustomCallback="grdReportQuery_CustomCallback">
                        <clientsideevents endcallback="function(s, e) {
	                                                    grdReportQuery_EndCallBack(); }" />
                        <settingspager mode="ShowAllRecords" numericbuttoncount="20" pagesize="30" showseparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </settingspager>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HdnSegment" runat="server" />
        <asp:HiddenField ID="HdnBranch" runat="server" />
        <asp:HiddenField ID="HdnMainAc" runat="server" />
        <asp:HiddenField ID="HdnSubAc" runat="server" />
        <asp:HiddenField ID="HdnSubLedgerType" runat="server" />
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
        <div id="hiddenDiv" style="display:none"><asp:Button id="btnExport" Text="Client" runat="server" OnClick="btnExport_Click" /></div>
    </div>
    </form>
</body>
</html>
