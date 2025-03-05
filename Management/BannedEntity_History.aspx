<%@ page language="C#" autoeventwireup="true" inherits="management_BannedEntity_History, App_Web_2wstwz9u" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Log Report Of Sebi Banned Entity</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    
    
      <%--//------------------------------------------------%>
     
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

   
    
   <%-- ------------------------------------------------------------------------------%>
    
    
      <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:10px;	/* Width of box */
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
        function SignOff() {
            window.parent.SignOff();
        }

        function Page_Load()///Call Into Page Load
        {

            height();

        }

        function height() {
            if (document.body.scrollHeight >= 320) {
                window.frameElement.height = document.body.scrollHeight;
            }
            else {
                window.frameElement.height = '320px';
            }
            window.frameElement.width = document.body.scrollWidth;
            document.getElementById('hidScreenWd').value = screen.width - 20;
        }

        function Show() {
            document.getElementById('tr_filter').style.display = 'inline';
        }
        function CallList(obj1, obj2, obj3) {
            var cmb = document.getElementById('cmbsearchOption');

            ajax_showOptions(obj1, obj2, obj3, cmb.value);


        }
        function rdbtnSegAll(obj) {

            document.getElementById('TrFilter').style.display = 'none';
            document.getElementById('showFilter').style.display = 'none';

            if (obj == 'other') {

            }
            else {
                document.getElementById('btn_show').disabled = false;
            }
        }
        function rdbtnSelected(obj) {

            document.getElementById('TrFilter').style.display = 'inline';
            document.getElementById('showFilter').style.display = 'inline';
            if (obj == 'Client') {
                document.getElementById('cmbsearchOption').value = 'Clients';
                document.getElementById('btn_show').disabled = true;
                document.getElementById('spanall').style.display = "inline";
            }
            else if (obj == 'Branch') {
                document.getElementById('cmbsearchOption').value = 'Branch';
                document.getElementById('btn_show').disabled = true;
                document.getElementById('spanall').style.display = "inline";
            }


        }


        function Disable(obj) {

            var gridview = document.getElementById('grdContractRegister');
            var rCount = gridview.rows.length;

            if (rCount < 10)
                rCount = '0' + rCount;

            if (obj == 'P') {
                document.getElementById("grdContractRegister_ctl" + rCount + "_FirstPage").style.display = 'none';
                document.getElementById("grdContractRegister_ctl" + rCount + "_PreviousPage").style.display = 'none';
                document.getElementById("grdContractRegister_ctl" + rCount + "_NextPage").style.display = 'inline';
                document.getElementById("grdContractRegister_ctl" + rCount + "_LastPage").style.display = 'inline';
            }
            else {
                document.getElementById("grdContractRegister_ctl" + rCount + "_NextPage").style.display = 'none';
                document.getElementById("grdContractRegister_ctl" + rCount + "_LastPage").style.display = 'none';
            }
        }
        function NoRecord() {

            alert('No Record Found');
            Page_Load();
        }
        function ALLSELECTED() {
            document.getElementById('td_span').style.display = 'inline';
            document.getElementById('tr_date').style.display = 'none';
            document.getElementById('tr_branchid').style.display = 'none';
            document.getElementById('tr_Clientid').style.display = 'none';
            document.getElementById('btn_show').style.display = 'none';
            document.getElementById('td_grid').style.display = 'inline';
            document.getElementById('tr_branchdisplay').style.display = 'none';

            height();
        }
        function btnCancel_Click() {
            document.getElementById('td_span').style.display = 'none';
            document.getElementById('tr_filter').style.display = 'none';
            document.getElementById('tr_date').style.display = 'inline';
            document.getElementById('tr_branchid').style.display = 'inline';
            document.getElementById('tr_Clientid').style.display = 'inline';
            document.getElementById('td_grid').style.display = 'none';
            document.getElementById('btn_show').style.display = 'inline';
            document.getElementById('tr_branchdisplay').style.display = 'inline';


            height();
        }
        function displaydate(obj) {
            document.getElementById('spanshow2').innerText = obj;
        }
        function ChangeRowColor(rowID, rowNumber) {
            var gridview = document.getElementById('grdContractRegister');

            var rCount = gridview.rows.length;
            var rowIndex = 1;
            var rowCount = 0;
            if (rCount == 18)
                rowCount = 15;
            else
                rowCount = rCount - 2;
            if (rowNumber > 15 && rCount < 18)
                rowCount = rCount - 3;
            for (rowIndex; rowIndex <= rowCount; rowIndex++) {
                var rowElement = gridview.rows[rowIndex];
                rowElement.style.backgroundColor = '#FFFFFF'
            }
            var color = document.getElementById(rowID).style.backgroundColor;
            if (color != '#ffe1ac') {
                oldColor = color;
            }
            if (color == '#ffe1ac') {
                document.getElementById(rowID).style.backgroundColor = oldColor;
            }
            else
                document.getElementById(rowID).style.backgroundColor = '#ffe1ac';

        }


        function ReceiveServerData(rValue) {
            var Data = rValue.split('~');

            if (Data[0] == 'Branch') {
                var combo = document.getElementById('litBranchMain');
                var NoItems = Data[1].split(',');
                var i;
                var val = '';
                for (i = 0; i < NoItems.length; i++) {

                    var items = NoItems[i].split(';');

                    if (val == '') {
                        val = '(' + items[1];
                    }
                    else {
                        val += ',' + items[1];
                    }
                }
                val = val + ')';
                combo.innerText = val;
            }
            if (Data[0] == 'Clients') {


            }

        }


        function clientselectionfinal() {




            var listBoxSubs = document.getElementById('lstSlection');

            var cmb = document.getElementById('cmbsearchOption');
            var listIDs = '';
            var i;
            if (listBoxSubs.length > 0) {

                for (i = 0; i < listBoxSubs.length; i++) {
                    if (listIDs == '')
                        listIDs = listBoxSubs.options[i].value + ';' + listBoxSubs.options[i].text;
                    else
                        listIDs += ',' + listBoxSubs.options[i].value + ';' + listBoxSubs.options[i].text;
                }
                var sendData = cmb.value + '~' + listIDs;
                CallServer(sendData, "");

            }
            var i;
            for (i = listBoxSubs.options.length - 1; i >= 0; i--) {
                listBoxSubs.remove(i);
            }


            document.getElementById('TrFilter').style.display = 'none';
            document.getElementById('showFilter').style.display = 'none';
            document.getElementById('btn_show').disabled = false;
        }

        function btnRemovefromsubscriptionlist_click() {

            var listBox = document.getElementById('lstSlection');
            var tLength = listBox.length;

            var arrTbox = new Array();
            var arrLookup = new Array();
            var i;
            var j = 0;
            for (i = 0; i < listBox.options.length; i++) {
                if (listBox.options[i].selected && listBox.options[i].value != "") {

                }
                else {
                    arrLookup[listBox.options[i].text] = listBox.options[i].value;
                    arrTbox[j] = listBox.options[i].text;
                    j++;
                }
            }
            listBox.length = 0;
            for (i = 0; i < j; i++) {
                var no = new Option();
                no.value = arrLookup[arrTbox[i]];
                no.text = arrTbox[i];
                listBox[i] = no;
            }
        }

        function btnAddsubscriptionlist_click() {

            var cmb = document.getElementById('cmbsearchOption');

            var userid = document.getElementById('txtSelectionID');
            if (userid.value != '') {
                var ids = document.getElementById('txtSelectionID_hidden');
                var listBox = document.getElementById('lstSlection');
                var tLength = listBox.length;


                var no = new Option();
                no.value = ids.value;
                no.text = userid.value;
                listBox[tLength] = no;
                var recipient = document.getElementById('txtSelectionID');
                recipient.value = '';
            }
            else
                alert('Please search name and then Add!')
            var s = document.getElementById('txtSelectionID');
            s.focus();
            s.select();

        }

        FieldName = 'lstSlection';







        //        ------------ For Auto Complete Start -----------------

        function FunCallAjaxList(objID, objEvent, ObjType) {

            var strQuery_Table = '';
            var strQuery_FieldName = '';
            var strQuery_WhereClause = '';
            var strQuery_OrderBy = '';
            var strQuery_GroupBy = '';
            var CombinedQuery = '';

            if (ObjType == 'PAN') {

                document.getElementById('TxtPAN_hidden').value = '';

                strQuery_Table = "tbl_master_contactRegistration";
                strQuery_FieldName = "distinct top 10 rtrim(ltrim(crg_Number))+' ['+isnull(crg_cntId,'')+']' AS loginid,crg_Number user_id";
                strQuery_WhereClause = " crg_type in ('Pancard')   and ( crg_Number like (\'%RequestLetter%') or crg_cntId like (\'%RequestLetter%'))";

            }

          

            CombinedQuery = new String(strQuery_Table + "$" + strQuery_FieldName + "$" + strQuery_WhereClause + "$" + strQuery_OrderBy + "$" + strQuery_GroupBy);


            ajax_showOptions(objID, 'GenericAjaxList', objEvent, replaceChars(CombinedQuery));
            //  alert (CombinedQuery);
        }


        function replaceChars(entry) {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out) > -1) {
                pos = temp.indexOf(out);
                temp = "" + (temp.substring(0, pos) + add +
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
        }
        
        
        
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
             <script language="javascript" type="text/javascript">

                 var prm = Sys.WebForms.PageRequestManager.getInstance();

                 prm.add_initializeRequest(InitializeRequest);

                 prm.add_endRequest(EndRequest);

                 var postBackElement;


                 function InitializeRequest(sender, args) {

                     if (prm.get_isInAsyncPostBack())

                         args.set_cancel(true);



                     postBackElement = args.get_postBackElement();



                     //if (postBackElement.id == 'ctl00_ContentPlaceHolder3_btnShow') 

                     $get('UpdateProgress1').style.display = 'block';
                     // document.getElementById('btn_show').disabled=true;

                 }



                 function EndRequest(sender, args) {

                     // if (postBackElement.id == 'ctl00_ContentPlaceHolder3_btnShow') 

                     $get('UpdateProgress1').style.display = 'none';
                     //document.getElementById('btn_show').disabled=false;




                 } 
   </script>
   <table class="TableMain100">
               <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 22px;">
                        <strong><span id="SpanHeader" style="color: #000099">Log Of Sebi Banned Entity&nbsp;<asp:Label ID="lblSegment" runat="server"></asp:Label></span></strong>
                    </td>
                    <td class="EHEADER" width="25%" id="tr_filter" style="height: 22px">
                        <a href="javascript:void(0);"
                                onclick="btnCancel_Click();"><span style="color: Blue; text-decoration: underline; font-size: 8pt;
                                    font-weight: bold"></span></a>
                       
                    </td>
                </tr>
            </table>
          

            <table>
                <tr>
                    <td colspan="4" valign="top" style="width: 98%">
                        <table border="0">
                        <tr id="tr_date"> 
                        
                        <td>
                        From Date
                        </td>
                        
                         <td style="width: 110px">
                                    
                                   <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        Font-Size="10px" Width="108px" ClientInstanceName="dtfrom" >
                                        <DropDownButton Text="">
                                        </DropDownButton>
                                       <ClientSideEvents valuechanged="function(s, e) {dateassign(s.GetValue());}" />

                                    </dxe:ASPxDateEdit>
                                </td>
                                
                                <td>
                                
                                To Date
                                
                                </td>
                                
                                <td style="width: 110px">
                                   <dxe:ASPxDateEdit ID="dtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        Font-Size="10px" Width="98px" ClientInstanceName="dtto">
                                        <DropDownButton Text="">
                                        </DropDownButton>
                                      <ClientSideEvents valuechanged="function(s, e) {dateassign(s.GetValue());}" />

                                    </dxe:ASPxDateEdit>
                                </td> <td colspan="1" style="text-align: left">
                                </td></tr>
                           
                         
                            
                             <tr style="display:none;">
                             
                             
                             
                            
                             
                             <td>
                             PAN No.
                             </td>
                             
                             <td colspan="3">
                             
                              <asp:TextBox ID="TxtPAN" runat="server" onkeyup="FunCallAjaxList(this,event,'PAN')"  Width="250px" ></asp:TextBox>
                                              
                                               <asp:TextBox ID="TxtPAN_hidden" Style="display: none" runat="server" Width="100px"  ></asp:TextBox>
                             </td>
                             
                             
                             </tr>
                             
                             <tr>
                               
                                <td style="width: 104px" >
                                
                               
                                
                                 Report Type 
                                  </td>
                                  
                                  <td colspan="3">
                                 <asp:DropDownList ID="ddlExport" runat="server"  Font-Size="10px" Width="120px">
                            <asp:ListItem Selected="True" Value="S">Screen</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>
                            <asp:ListItem Value="P">PDF</asp:ListItem>
                        </asp:DropDownList>
                                
                                </td>
                                
                                
                              
                                </tr>
                                
                                <tr>
                                
                                <td>
                                
                                &nbsp;
                                
                                </td>
                                </tr>
                            
                            
                           
                               <tr>
                               
                                <td style="text-align:center;" colspan="4"  >
                                
                                
                                
                                    <asp:Button ID="btn_show" OnClick="btn_show_Click" runat="server" Width="101px" Height="23px"
                                        Text="Generate" CssClass="btnUpdate"></asp:Button></td>
                          <td></td>
                            </tr>
                        </table>
                    
            <table>
                <tr>
                    <td id="td_span">
                        <span id="spanshow1" style="color: Blue; font-weight: bold">
                            </span>&nbsp;&nbsp;<span id="spanshow2"></span></td>
              
                </tr>
                <tr><td colspan="2" style="height:10px;"></td></tr>
                <tr>
                    <td colspan="2" id="td_grid">
                      <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>--%>
                            <%-- <div id="divgrid"  runat="Server" >  --%>
                                <asp:GridView ID="grdContractRegister" runat="server"  BorderColor="CornflowerBlue"
                                    ShowFooter="True" AllowSorting="True" AutoGenerateColumns="False" BorderStyle="Solid"
                                    BorderWidth="2px" AllowPaging="True" PageSize="15" ForeColor="#0000C0"                                                                         
                                     onpageindexchanging="grdContractRegister_PageIndexChanging">
                                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                    
                                    <EmptyDataTemplate>No Record Found</EmptyDataTemplate>
                                    <Columns>
                                       
                                       
                                        <asp:TemplateField HeaderText="SL No."  >
                                            <ItemStyle Wrap="false"  BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("[SL No]")%>'
                                                    CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                         <asp:TemplateField HeaderText="Entry Date" >
                                            <ItemStyle Wrap="false"   BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("[Log Entry Date]")%>'
                                                    CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        
                                        
                                        <asp:TemplateField HeaderText="No. Of Record Affected"    >
                                            <ItemStyle     BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate >
                                                <asp:Label ID="Label3"  runat="server" Text='<%# Eval("[No Of Record Affected]")%>'
                                                    CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        
                                        
                                        
                                        
                                         <asp:TemplateField HeaderText="Affected PAN No." >
                                            <ItemStyle  Width="400"  BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("[Affected PAN No]")%>'
                                                    CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                       
                                     
                                        

                                    </Columns>
                               
                                    <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                        BorderWidth="1px"></RowStyle>
                                    <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                    <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                    <PagerStyle ForeColor="Blue" HorizontalAlign="Center"></PagerStyle>
                                    <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                        Font-Bold="False"></HeaderStyle>
                                </asp:GridView>
                                
                               <%-- </div>--%>
                                <asp:HiddenField ID="CurrentPage" runat="server"></asp:HiddenField>
                                <asp:HiddenField ID="TotalPages" runat="server"></asp:HiddenField>
                                <asp:HiddenField ID="TotalClient" runat="server" />
                            
                           <%-- </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btn_show" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>--%>
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="hidScreenWd" runat="server" />   
        </div>
    </form>
</body>
</html>
