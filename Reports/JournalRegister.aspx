<%@ page language="C#" autoeventwireup="true" inherits="Reports_JournalRegister, App_Web_91unyima" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Journal Register</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

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
    function grid_EndCallBack()
     {
      if (grid.cpproperties=="Export")
      {
 
            document.getElementById('BtnForExportEvent').click();
      }
      if (grid.cpproperties=="nullvalue")
      {
 
            document.getElementById('TrSelect').style.display='inline';
            document.getElementById('trgrid').style.display='none';
            alert('No Record Found !!');
      }
//      if (grid.cpproperties=="withvalue")
//      {
// 
//            document.getElementById('TrSelect').style.display='none';
//        document.getElementById('trgrid').style.display='inline';
//      }
    
        height();
     } 
     function btnexport_Click()
     {
        document.getElementById('BtnForExportEvent').click();
     }
     function btnfilter_Click()
     {
        document.getElementById('TrSelect').style.display='inline';
        document.getElementById('trgrid').style.display='none';
     }    
    function btnshow_Click()
    {
//    if (grid.items.length>1)
//        grid.items.clear();

    var param=(document.getElementById('ddlgeneration').value);
//    if (document.getElementById('ddlgeneration').value="SC")
if (param=="SC")
    {
        document.getElementById('TrSelect').style.display='none';
        document.getElementById('trgrid').style.display='inline';
     }
     else
     {
        document.getElementById('TrSelect').style.display='inline';
        document.getElementById('trgrid').style.display='none';
     }
        grid.PerformCallback("Show~"+param)
    }
    function ShowHideFilter(obj)
     {
        grid.PerformCallback(obj);
   
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
            document.getElementById('TdFilter').style.display='none';
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
        function btnAddsubscriptionlist_click()
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
        }
        function ForFilter(objSelected,objType)
        {
            if(objSelected=='A')
               document.getElementById('TdFilter').style.display='none';
            else                
            {
                 document.getElementById('TdFilter').style.display='inline';
                 if(objType=="Seg")
                    document.getElementById('cmbsearchOption').value='Segment';
                 else if(objType=="Branch")
                    document.getElementById('cmbsearchOption').value='Branch';
                 else if(objType=="EUser")
                    document.getElementById('cmbsearchOption').value='EntryUser';
            }
        }
        function Page_Load()
        {
            document.getElementById('TdFilter').style.display='none';
            document.getElementById('trgrid').style.display='none';
            document.getElementById('TdSpecific').style.display='none';
            
            height();
        }
        function ForSpecific(obj)
        {
            if(obj=='A')
                document.getElementById('TdSpecific').style.display='none';
            else
                document.getElementById('TdSpecific').style.display='inline';
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
            window.frameElement.width = document.body.scrollWidth;
        }
        function ShowAjax(obj1,obj2,obj3)
        {
            var obj4=document.getElementById("cmbsearchOption");
            ajax_showOptions(obj1,obj2,obj3,obj4.value,'Sub');
        }
        function HeightCall()
        {
            document.getElementById('TrSelect').style.display='none';
            document.getElementById('TrFilter').style.display='inline';
            height();
        }
        function ForFilter1()
        {
            document.getElementById('TrSelect').style.display='inline';
            height();
        }
        function selecttion()
        {
            var combo=document.getElementById('ddlExport');
            combo.value='Ex';
        }
        function DateChange(DateObj)
        {
            var Lck ='<%=Session["LCKBNK"] %>';
            var FYS ='<%=Session["FinYearStart"]%>';
            var FYE ='<%=Session["FinYearEnd"]%>'; 
            var LFY ='<%=Session["LastFinYear"]%>';
            var GetDate='<%=Session["ServerDate"]%>';
            var ExpDate='<%=Session["ExpireDate"]%>';
            DevE_CheckForLockDate(DateObj,Lck);
            DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
            DevE_CompareDateForMin(dtFrom,dtTo,'From Date Must Be Less than To Date!!!');
        }
        FieldName='lstSuscriptions';
    </script>

    <script type="text/ecmascript">
        function ReceiveServerData(rValue)
        {
            
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Journal Register</span></strong>
                    </td>
                </tr>
            </table>
            <table id="Tblheader">
                <tr id="TrSelect">
                    <td>
                        <table cellspacing="1" cellpadding="2" style="background-color: #B7CEEC; border: solid 1px  #ffffff"
                            border="1">
                            <tr>
                                <td class="gridcellleft">
                                    For A Date Range :
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <dxe:ASPxDateEdit ID="dtFrom" runat="server" ClientInstanceName="dtFrom" EditFormat="Custom"
                                                    EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Font-Size="10px" Width="108px">
                                                    <DropDownButton Text="From">
                                                    </DropDownButton>
                                                    <ClientSideEvents ValueChanged="function(s,e){DateChange(dtFrom);}" />
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="dtTo" runat="server" ClientInstanceName="dtTo" EditFormat="Custom"
                                                    EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Font-Size="10px" Width="98px">
                                                    <DropDownButton Text="To">
                                                    </DropDownButton>
                                                    <ClientSideEvents ValueChanged="function(s,e){DateChange(dtTo);}" />
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="chkIgnoreSystem" runat="server" Checked="true" />
                                            </td>
                                            <td class="gridcellleft">
                                                Ignore system generated accounting JVs
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft" style="width: 77px">
                                    Voucher Type
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="radAll" Checked="true" runat="server" GroupName="a" onclick="ForSpecific('A')" />
                                            </td>
                                            <td>
                                                All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="radSpecific" runat="server" GroupName="a" onclick="ForSpecific('B')" />
                                            </td>
                                            <td>
                                                Specific
                                            </td>
                                            <td id="TdSpecific">
                                                <dxe:ASPxTextBox ID="txtAccountCode" ClientInstanceName="txtAccountCode" runat="server"
                                                    Width="50px" MaxLength="2">
                                                    <%--<ValidationSettings>
                                            <RequiredField IsRequired="True" ErrorText="Select Prefix" />
                                        </ValidationSettings>--%>
                                                    <%--<ClientSideEvents KeyPress="function(s,e){window.setTimeout('updateEditorText()', 10);}" />--%>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    Segment :
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="RadSegmentAll" runat="server" Checked="True" onclick="ForFilter('A','Seg');"
                                                    GroupName="c" />
                                            </td>
                                            <td>
                                                All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="RadSegmentSelected" runat="server" onclick="ForFilter('S','Seg');"
                                                    GroupName="c" />
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
                                    Branch :
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="RadBranchAll" runat="server" onclick="ForFilter('A','Branch');"
                                                    Checked="True" GroupName="d" />
                                            </td>
                                            <td>
                                                All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="RadBranchSelected" runat="server" onclick="ForFilter('S','Branch');"
                                                    GroupName="d" />
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
                                    Entry User :
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="RadEntryAll" runat="server" Checked="True" onclick="ForFilter('A','EUser');"
                                                    GroupName="e" />
                                            </td>
                                            <td>
                                                All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="RadEntrySelected" runat="server" onclick="ForFilter('S','EUser');"
                                                    GroupName="e" />
                                            </td>
                                            <td>
                                                Selected
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft" style="width: 77px">
                                    Output Type
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList runat="server" ID="ddlgeneration" Width="100px" onchange="FnddlGeneration(this.value)">
                                        <asp:ListItem Text="Screen" Value="SC"></asp:ListItem>
                                        <asp:ListItem Text="Excel" Value="EX"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <%--<td class="gridcellleft" style="width: 77px">
                                    
                                </td>--%>
                                <td>
                                    <div class="frmleftCont" style="width: 110px; line-height: 20px">
                                        <dxe:ASPxButton ID="btnshow" runat="server" AutoPostBack="False" Text="Show" Width="110px">
                                            <ClientSideEvents Click="function (s, e) {btnshow_Click();}" />
                                        </dxe:ASPxButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="vertical-align: top;" id="TdFilter">
                        <table>
                            <tr>
                                <td class="gridcellleft" style="vertical-align: top; text-align: right">
                                    <asp:TextBox ID="txtsubscriptionID" runat="server" Font-Size="12px" onkeyup="ShowAjax(this,'SearchMainAccountBranchSegment',event);"
                                        Width="200px"></asp:TextBox>
                                    <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                        Enabled="false">
                                        <asp:ListItem>Segment</asp:ListItem>
                                        <asp:ListItem>Branch</asp:ListItem>
                                        <asp:ListItem>EntryUser</asp:ListItem>
                                    </asp:DropDownList>
                                    <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                        style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                            style="color: #009900; font-size: 8pt;"> </span>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">
                                    <asp:ListBox ID="lstSuscriptions" runat="server" Font-Size="10px" Height="90px" Width="270px">
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
                                        <tr>
                                            <td colspan="2">
                                                <asp:HiddenField ID="txtsubscriptionID_hidden" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <div id="trgrid">
                <div>
                    <div class="left" style="width: 70px;">
                        <a href="javascript:ShowHideFilter('s');"><span style="color: Gray; text-decoration: underline;
                            vertical-align: bottom; font-size: 12px">Search</span></a>
                    </div>
                    <div class="left" style="width: 70px;">
                        <a href="javascript:ShowHideFilter('All');"><span style="color: Gray; text-decoration: underline;
                            vertical-align: bottom; font-size: 12px">ShowAll</span></a>
                    </div>
                    <div class="left" style="width: 200px; text-align: right; margin-right: 20px;">
                        <dxe:ASPxButton ID="btnfilter" runat="server" AutoPostBack="False" Text="BACK"
                            Width="150px">
                            <ClientSideEvents Click="function (s, e) {btnfilter_Click();}" />
                        </dxe:ASPxButton>
                    </div>
                    <div class="left" style="width: 200px; text-align: right; margin-right: 20px;">
                        <dxe:ASPxButton ID="btnexport" runat="server" AutoPostBack="False" Text="Export To Excel"
                            Width="150px">
                            <ClientSideEvents Click="function (s, e) {btnexport_Click();}" />
                        </dxe:ASPxButton>
                    </div>
                </div>
                <span class="clear" style="height: 5px;">&nbsp;</span>
                <%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" runat="Server">
    <dx:ASPxCheckBox ID="chkSingleExpanded" runat="server" Text="Keep a single expanded row at a time"
        AutoPostBack="true" OnCheckedChanged="chkSingleExpanded_CheckedChanged" />
    <br />--%>
                <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" KeyFieldName="srno"
                    Width="95%" OnCustomCallback="grid_CustomCallback">
                    <SettingsLoadingPanel Text="Please Wait .." />
                    
                    <ClientSideEvents EndCallback="function(s, e) {grid_EndCallBack();}" />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="date" VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="voucherno" Caption="Voucher No" VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="description" VisibleIndex="2">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="segname" Caption="SegmentName" VisibleIndex="3">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Amtdr" Caption="Consolidated DR" ToolTip="Total DR"
                            VisibleIndex="4">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="AmtCr" Caption="Consolidated CR" ToolTip="Total CR"
                            VisibleIndex="5">
                        </dxwgv:GridViewDataTextColumn>
                        <%--<dxwgv:GridViewDataTextColumn FieldName="cnt_legalstatus" VisibleIndex="1">
                                    </dxwgv:GridViewDataTextColumn>--%>
                        <%--<dxwgv:GridViewDataTextColumn FieldName="City" VisibleIndex="2" > </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Country" VisibleIndex="3" > </dxwgv:GridViewDataTextColumn>--%>
                    </Columns>
                    <Settings ShowFooter="True" />
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem FieldName="Amtdr" SummaryType="Sum" DisplayFormat="0.00" />
                        <dxwgv:ASPxSummaryItem FieldName="AmtCr" SummaryType="Sum" DisplayFormat="0.00" />
                    </TotalSummary>
                    <Templates>
                        <DetailRow>
                            <dxwgv:ASPxGridView ID="detailGrid" runat="server" KeyFieldName="JournalVoucherDetail_VoucherNumber"
                                ClientInstanceName="grid1" Width="100%" OnInit="detailGrid_Init">
                                <%--OnBeforePerformDataSelect="detailGrid_DataSelect" OnCustomUnboundColumnData="detailGrid_CustomUnboundColumnData">--%>
                                <Columns>
                                    <%--<dxwgv:GridViewDataTextColumn FieldName="OrderID"  DataSourceID="detailDataSource" Caption="Order Id" VisibleIndex="1" > </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="OrderDate" VisibleIndex="2" > </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="ShipName" VisibleIndex="2" > </dxwgv:GridViewDataTextColumn>--%>
                                    <%--<dxwgv:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="1" Name="Quantity" > </dxwgv:GridViewDataTextColumn>--%>
                                    <%--<dxwgv:GridViewDataTextColumn FieldName="date" VisibleIndex="0">
                                    </dxwgv:GridViewDataTextColumn>--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="accountname" Caption="AccountName" VisibleIndex="0">
                                    </dxwgv:GridViewDataTextColumn>
                                    <%-- <dxwgv:GridViewDataTextColumn FieldName="description" VisibleIndex="2">
                                                </dxwgv:GridViewDataTextColumn>--%>
                                    <%--<dxwgv:GridViewDataTextColumn FieldName="segname" Caption="SegmentName" VisibleIndex="2">
                                    </dxwgv:GridViewDataTextColumn>--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="amntdr" Caption="AmountDR" ToolTip="Individual DR"
                                        VisibleIndex="1">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="amntcr" Caption="AmountCR" ToolTip="Individual CR"
                                        VisibleIndex="2">
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <Settings ShowFooter="True" />
                                <TotalSummary>
                                    <dxwgv:ASPxSummaryItem FieldName="amntdr" SummaryType="Sum" DisplayFormat="0.00" />
                                    <dxwgv:ASPxSummaryItem FieldName="amntcr" SummaryType="Sum" DisplayFormat="0.00" />
                                </TotalSummary>
                            </dxwgv:ASPxGridView>
                        </DetailRow>
                    </Templates>
                    <SettingsDetail ShowDetailRow="true" />
                </dxwgv:ASPxGridView>
            </div>
            <%--<asp:AccessDataSource ID="masterDataSource" runat="server" 
        SelectCommand="SELECT * FROM [Customers]"></asp:AccessDataSource>
            <asp:SqlDataSource ID="detailDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="select crg_cntID as OrderID,crg_company as UnitPrice,crg_exchange as Total from tbl_master_contactExchange">
                 <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="CustomerID" Type="String" />
        </SelectParameters>
            </asp:SqlDataSource>
            </asp:Content>--%>
        </div>
        <div style="display: none">
            <asp:Button ID="BtnForExportEvent" runat="server" OnClick="cmbExport_SelectedIndexChanged"
                BackColor="#DDECFE" BorderStyle="None" />
        </div>
    </form>
</body>
</html>
