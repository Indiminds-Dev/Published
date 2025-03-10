<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="Reports_frmReport_CashBankSummary, App_Web_w8tpuxyq" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cash Bank Summary</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
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
	
	</style>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">

        <script language="javascript" type="text/javascript">
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
    FieldName='ctl00_ContentPlaceHolder1_Headermain1';
        function showOptions(obj1,obj2,obj3)
         {
             var cmb=document.getElementById('<%=cmbsearchOption.ClientID%>');
            //alert(cmb.value);
            ajax_showOptions(obj1,obj2,obj3,cmb.value);
         }
        function btnAddsubscriptionlist_click()
        {
            var userid = document.getElementById('<%=txtsubscriptionID.ClientID%>');
            if(userid.value != '')
            {
                var ids = document.getElementById('<%=txtsubscriptionID_hidden.ClientID%>');
                var listBox = document.getElementById('<%=lstSuscriptions.ClientID%>');
                var tLength = listBox.length;
                //alert(tLength);
                
                var no = new Option();
                no.value = ids.value;
                no.text = userid.value;
                listBox[tLength]=no;
                var recipient = document.getElementById('<%=txtsubscriptionID.ClientID%>');
                recipient.value='';
            }
            else
                alert('Please search name and then Add!')
            var s=document.getElementById('<%=txtsubscriptionID.ClientID%>');
            s.focus();
            s.select();
        }
        function btnRemovefromsubscriptionlist_click()
        {
            
            var listBox = document.getElementById('<%=lstSuscriptions.ClientID%>');
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
            //var listBox1 = document.getElementById("ctl00_ContentPlaceHolder3_ListBoxUserAll");
            listBox.length = 0;
            for (i = 0; i < j; i++) 
            {
                var no = new Option();
                no.value = arrLookup[arrTbox[i]];
                no.text = arrTbox[i];
                listBox[i]=no;
            }
        }
        function Page_Load()
        {
            document.getElementById('showFilter').style.display='none';
            document.getElementById('TdFilter').style.display='none';
        }
        function SegAll(obj)
        {
            document.getElementById('showFilter').style.display='none';
            document.getElementById('TdFilter').style.display='none';
            if(obj=='seg')
            {
                //document.getElementById('<%=litSegment.ClientID%>').innerText='';
            }
            else
            {
                document.getElementById('<%=litBranch.ClientID%>').innerText='';
                document.getElementById('<%=Button1.ClientID%>').disabled=false;
            }
        }
        function SegSelected(obj)
        {
            document.getElementById('showFilter').style.display='inline';
            document.getElementById('TdFilter').style.display='inline';
            if(obj=='seg')
            {
                document.getElementById('<%=cmbsearchOption.ClientID%>').value='Segment';
            }
            else
            {
                document.getElementById('<%=cmbsearchOption.ClientID%>').value='Branch';
                document.getElementById('<%=Button1.ClientID%>').disabled=true;
            }
        }
        function CheckDataExists()
        {
            alert('No Data Found');
        }
        
        document.body.style.cursor = 'pointer'; 
        var oldColor = '';
	    function ChangeRowColor(rowID,rowNumber,gridview) 
        {
            var gridview = document.getElementById(gridview); 
            var rCount = gridview.rows.length;
            var rowIndex=1;
            var rowCount=0;
            rowCount=rCount-2;
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
        </script>

        <script type="text/ecmascript">
        function clientselectionfinal()
	    {
	        var listBoxSubs = document.getElementById('<%=lstSuscriptions.ClientID%>');
            var cmb=document.getElementById('<%=cmbsearchOption.ClientID%>');
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
	        //alert('You have selected '+listBoxSubs.length+' '+ cmb.value +'!');
	        var i;
            for(i=listBoxSubs.options.length-1;i>=0;i--)
            {
                listBoxSubs.remove(i);
            }
            document.getElementById('showFilter').style.display='none';
            document.getElementById('TdFilter').style.display='none';
            document.getElementById('<%=Button1.ClientID%>').disabled=false;
	    }
	    function ReceiveServerData(rValue)
        {
            var Data=rValue.split('~');
            if(Data[0]=='Segment')
            {
                var combo = document.getElementById('<%=litSegment.ClientID%>');
                var NoItems=Data[1].split(',');
                var i;
                var val=''
                for(i=0;i<NoItems.length;i++)
                {
                    var items = NoItems[i].split(';');
                    if(val=='')
                    {
                        val=items[1];
                    }
                    else
                    {
                        val+=','+items[1];
                    }
                }
                combo.innerText=val;
            }
            if(Data[0]=='Branch')
            {
                var combo = document.getElementById('<%=litBranch.ClientID%>');
                var NoItems=Data[1].split(',');
                var i;
                var val=''
                for(i=0;i<NoItems.length;i++)
                {
                    var items = NoItems[i].split(';');
                    var items1=items[1].split('-');
                    if(val=='')
                    {
                        val='('+items1[1];
                    }
                    else
                    {
                        val+=','+items1[1];
                    }
                }
                val=val+')';
                combo.innerText=val;
            }
        } 
        function selecttion()
        {
            var combo=document.getElementById('ddlExport');
            combo.value='Ex';
        }    
        </script>

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Cash/Bank Summary</span></strong>
                </td>
            </tr>
        </table>
        <table class="TableMain100">
            <tr>
                <td style="text-align: left; vertical-align: top">
                    <table cellspacing="1" cellpadding="2" style="background-color: #B7CEEC; border: solid 1px  #ffffff"
                        border="1">
                        <tr>
                            <td class="gridcellleft" style="width: 58px">
                                As On Date
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" style="width: 58px">
                                Segment
                            </td>
                            <td style="text-align: left;" colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdbSegAll" runat="server" Checked="True" GroupName="a" />
                                        </td>
                                        <td>
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbSegSelected" runat="server" GroupName="a" />
                                        </td>
                                        <td>
                                            Selected
                                        </td>
                                        <td>
                                            (<span id="litSegment" runat="server" style="color: Maroon"></span>)
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" style="width: 58px">
                                Branch
                            </td>
                            <td style="text-align: left;" colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdbbAll" runat="server" Checked="True" GroupName="b" />
                                        </td>
                                        <td>
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbbSelected" runat="server" GroupName="b" />
                                        </td>
                                        <td>
                                            Selected
                                        </td>
                                        <td>
                                            <span id="litBranch" runat="server" style="color: Maroon"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="TrBtn">
                            <td colspan="2">
                                <asp:Button ID="Button1" runat="server" Text="Show" OnClick="Button1_Click" CssClass="btnUpdate"
                                    OnClientClick="selecttion()" Height="23px" Width="101px" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="text-align: left; vertical-align: top;">
                    <table width="100%" id="showFilter">
                        <tr>
                            <td class="gridcellleft" style="vertical-align: top;" id="TdFilter">
                                <asp:TextBox ID="txtsubscriptionID" runat="server" Font-Size="12px" Width="200px"></asp:TextBox>
                                <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                    Enabled="false">
                                    <asp:ListItem>Segment</asp:ListItem>
                                    <asp:ListItem>Branch</asp:ListItem>
                                </asp:DropDownList>
                                <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                    style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                        style="color: #009900; font-size: 8pt;"> </span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left; vertical-align: top">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="padding-left:5px;">
                                            <asp:ListBox ID="lstSuscriptions" runat="server" Font-Size="10px" Height="90px" Width="253px">
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
                            <td>
                                <asp:TextBox ID="txtsubscriptionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="text-align: right" colspan="2">
                    <asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged">
                        <asp:ListItem Value="Ex" Selected="True">Export</asp:ListItem>
                        <asp:ListItem Value="E">Excel</asp:ListItem>
                        <asp:ListItem Value="P">PDF</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="grdCashBankSummary" runat="server" Width="100%" ShowFooter="True"
                                OnRowDataBound="grdCashBankSummary_RowDataBound" ForeColor="#0000C0" CellPadding="4"
                                BorderWidth="2px" BorderStyle="Solid" AutoGenerateColumns="false" BorderColor="CornflowerBlue"
                                OnRowCreated="grdCashBankSummary_RowCreated">
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr.No">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("SRNO")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bank Code">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("AccountsLedger_MainAccountID")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bank Name">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("AccountsLedger_CashBankName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Account Number">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("AcNumber")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AmountDr">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Right" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Dr")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AmountCr">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Right" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Cr")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle BackColor="#FFFFFF" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                    BorderWidth="1px"></RowStyle>
                                <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                    Font-Bold="False"></HeaderStyle>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
