<%@ page language="C#" autoeventwireup="true" inherits="Management_Export_DISMasterUpload, App_Web_akbpwr7y" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
    <%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>DIS MASTER EXPORT</title>
     <!--External Style-->
    <!--Internal Style-->
    <link type="text/css" href="../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/GenericJscript.js"></script>
    
   <%-- <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>--%>
    <style type="text/css">       
        #MainFull { padding:5px; width:995px}
        #Container1 { width: 550px; padding:5px}
        #Container3 { width: 500px; padding:5px}
        .LableWidth { width:120px;}
        .ContentWidth { width:125px; height:21px;}
        .ABS_ContentWidth { width:260px; height:21px;}
        .labelCont { font-size:13px; margin-top:7px;}      
        .btnRight { margin-right:18px; float:right;} 
        .txt_left { text-align:left;}
        .txt_right { text-align:right;}  
        .frmleftCont{float:left; margin:2px; padding:2px; height:26px; border: solid 1px  #D1E0F3; font-size:12px;}                                         
   </style>
   
   <script language="javascript" type="text/javascript">
      FieldName="none";
      ddlSelectedValue='';
      AjaxComQuery='';
      function replaceChars(entry)
      {
        out = "+"; // replace this
        add = "--"; // with this
        temp = "" + entry; // temporary holder
        while (temp.indexOf(out)>-1) 
        {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
         }
         return temp;
      }
      function PageLoad()
      {
         HideShow('btnExport','H');
         HideShow('btnCancel','H'); 
         HideShow('divFrom','H'); 
         HideShow('divTo','H'); 
         HideShow('divSlipTo','H');
         HideShow('DivSlipType','H');
         HideShow('DivSlipRange','H');
         HideShow('DivClientRow','H');
         HideShow('DivSlipRow','H'); 
         HideShow('DivSlipTypeCombo','H'); 
         //document.getElementById('<%=ddlMode.ClientID%>').value='N';                
      }
      function SignOff()
      {
        window.parent.SignOff();
      }
      function height()
      {
       if(document.body.scrollHeight>=600)
        window.frameElement.height = document.body.scrollHeight;
       else
        window.frameElement.height = '600px';
        window.frameElement.Width = document.body.scrollWidth;
      }
      function keyVal(obj)
      {
        var Data = obj.split('@');            
        if(ddlSelectedValue !='') 
            ddlSelectedValue='';
        if(Data[2]!='') 
            ddlSelectedValue=Data[2];          
      }
      function ShowExport()
      {
        HideShow('btnExport','S');
        HideShow('btnCancel','S'); 
        if(document.getElementById('<%=ddlMode.ClientID%>').value=='M')
        {
         HideShow('divFrom','S'); 
         HideShow('divTo','S'); 
         HideShow('divSlipTo','S');
         //HideShow('DivSlipType','S');
         //HideShow('DivSlipRange','S');
         HideShow('DivClientRow','S');
         HideShow('DivSlipRow','S'); 
         HideShow('DivSlipTypeCombo','S');
        } 
      }
      function HideExport()
      {
        HideShow('btnExport','H');
        HideShow('btnCancel','H'); 
        alert('No data Found');
      }
      function Goback()
      {
        window.location="../Management/Export_DISMasterUpload.aspx"; 
      }
      function btnAddIDTolist_click()
      {
        var cmb=document.getElementById('<%=cmbsearch.ClientID%>');        
        var selectedName = document.getElementById('<%=txtSelection.ClientID%>');
        if(selectedName.value != '')
        {
            if(cmb.Value=="Clients" && ddlSelectedType=='CLIENTS')
                document.getElementById('HiddenField_Client').value=ddlSelectedValue;
            if(cmb.Value=="Branch" && ddlSelectedType=='BRANCH')
                document.getElementById('HiddenField_Branch').value=ddlSelectedValue;
            if(cmb.Value=="Group" && ddlSelectedType=='GROUP')
                document.getElementById('HiddenField_Group').value=ddlSelectedValue;    
            var listBox = document.getElementById('<%=SelectionList.ClientID%>');
            var tLength = listBox.length;
            var no = new Option();
            no.value = ddlSelectedValue;
            no.text = selectedName.value;               
            listBox[tLength]=no;                       
            var recipient = document.getElementById('<%=txtSelection.ClientID%>');
            recipient.value='';
        }
        else
            alert('Please search name and then Add!');
        var s=document.getElementById('<%=txtSelection.ClientID%>');
        s.focus();
        s.select();
      }
      //=====for client
      function OnClientFilter(obj)
      {
            if(obj=='A')
            {
                document.getElementById('HiddenField_Client').value = '';
                var OptId=document.getElementById('<%=SelectionList.ClientID%>').options.length;
                if(OptId!="undefined" || OptId!=0)
                        OptId=0;                
                Hide('showFilter');
            }
            else if(obj=='S')
            {             
                document.getElementById('<%=cmbsearch.ClientID%>').value='Clients';                
                document.getElementById('<%=txtSelection.ClientID%>').value="";                
                Show('showFilter');
                CallServer1("CallAjax-Client","");
            }
            
      }
      function OnSlipFilter(obj)
      { 
        if(obj=='A')
        {
         HideShow('DivSlipType','H');
         HideShow('DivSlipRange','H');
        }
        else if(obj=='S')
        {
         HideShow('DivSlipType','S');
         HideShow('DivSlipRange','S');
        }
      }
      function OnSlipTypeFilter(obj)
      {
        if(obj=='S')
        {    
         HideShow('divSlipNo','S');
         HideShow('divSlipFrom','S');     
         HideShow('divFrom','H');
         HideShow('divTo','H');
         HideShow('divSlipTo','H');
        }
        else if(obj=='R')
        {
         HideShow('divSlipNo','H');
         HideShow('divSlipFrom','S');     
         HideShow('divFrom','S');
         HideShow('divTo','S');
         HideShow('divSlipTo','S');
        }
      }
      function onModeChange()
      {
        if(document.getElementById('ddlMode').value == 'N')
        {
            HideShow('DivClientRow','H');
            HideShow('DivSlipRow','H');
            HideShow('DivSlipTypeCombo','H'); 
        }
        else if(document.getElementById('ddlMode').value == 'M')
        {
            HideShow('DivClientRow','S');
            HideShow('DivSlipRow','S');
            HideShow('DivSlipTypeCombo','S'); 
        }
      }
      function clientselection()
      {
        var listBoxSubs = document.getElementById('<%=SelectionList.ClientID%>');
        var cmb=document.getElementById('<%=cmbsearch.ClientID%>');
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
            CallServer1(sendData,"");
            var j;
            for(j=listBoxSubs.options.length-1;j>=0;j--)
            {
                listBoxSubs.remove(j);
            }
            Hide('showFilter');
        }
        else if((document.getElementById('showFilter').style.display=="inline") && (listBoxSubs.length == 0))
        {
            alert("Please Select Atleast One "+cmb.value+" Item!!!");
            if(cmb.value=="Clients")
            {
                crbGroupBy.SetValue('C');
                crbUser.SetValue('S');
            }
            Show('showFilter');
            document.getElementById('<%=txtSelection.ClientID%>').focus();
        }
       }
        function btnRemoveFromlist_click()
        {
            var listBox = document.getElementById('<%=SelectionList.ClientID%>');
            var tLength = listBox.length;
            var arrTbox = new Array();
            var arrLookup = new Array();
            var i;
            var j = 0;
            for (i = 0; i < listBox.options.length; i++)
            {
                if (listBox.options[i].selected && listBox.options[i].value != "")
                {
                    //For remove option from Selected Branch /Group DropDownList
                    var removeCmbType=document.getElementById('<%=cmbsearch.ClientID%>').value;
                    removeFromComboOnSelection(removeCmbType,i);
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
      
      function ReceiveSvrData(rValue)
      {
            var Data=rValue.split('~');
            var btnHideGroupType=document.getElementById('btnGroupTypehide');
            if(Data[1]!="undefined")
            {
                if(Data[0]=='Clients')
                {
                    document.getElementById('HiddenField_Client').value = Data[1];                   
                }
                if(Data[0]=='Branch')
                {
                    document.getElementById('HiddenField_Branch').value = Data[1];                    
                }
                if(Data[0]=='Group')
                { 
                    document.getElementById('HiddenField_Group').value = Data[1];
                }
            }
            if(Data[0]=='AjaxQuery')
            {                
                AjaxComQuery = Data[1];
                var AjaxList_TextBox=document.getElementById('<%=txtSelection.ClientID%>');                          
                AjaxList_TextBox.value='';
                AjaxList_TextBox.attachEvent('onkeyup',CallGenericAjaxJS);
            }            
        }
        function CallGenericAjaxJS(e)
        {
            //if(string_contains(AjaxComQuery,'ISINName')==true)
            var AjaxList_TextBox=document.getElementById('<%=txtSelection.ClientID%>');
            AjaxList_TextBox.focus();
            AjaxComQuery=AjaxComQuery.replace("\'","'");
            //alert(AjaxComQuery);
            ajax_showOptions(AjaxList_TextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main');
        }
        function Hide(obj)
        {
          document.getElementById(obj).style.display='none';      
        }
        function Show(obj)
        {
            document.getElementById(obj).style.display='inline';       
        }
        function DateChange(DateObj)
        {
            var Lck ='<%=Session["LCKBNK"] %>';
            var FYS ='<%=Session["FinYearStart"]%>';
            var FYE ='<%=Session["FinYearEnd"]%>'; 
            var LFY ='<%=Session["LastFinYear"]%>';
            var GetDate='<%=Session["ServerDate"]%>';
            var ExpDate='<%=Session["ExpireDate"]%>';
            //var ExpDate='31-12-2013';
        
            DevE_CheckForLockDate(DateObj,Lck);
            DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
        }
        function DateCompare()
        {
            DevE_CompareDateForMin(cdtIssueFrom,cdtIssueTo,'Issued From Date can not be greater than Issued To Date');
        }
    
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div id="MainFull">
        <div id="Header" class="Header">
              <%--  <div id="divReset" style="font-size: 7; text-align: right; margin-right: 100px;">
                    &nbsp;</div>--%>
                DIS Master Export
        </div>
        <div id="Container1" class="container" style="width: 434px">
            <div id="C1_Row1" class="Row">
                <div id="C1_Row1_Col1" class="LFloat_Lable LableWidth">
                    &nbsp;Mode</div>
                <div id="C1_Row1_Col2" class="LFloat_Content">
                    <asp:DropDownList ID="ddlMode" runat="server" onchange="onModeChange()">
                        <asp:ListItem Value="N">New</asp:ListItem>
                        <asp:ListItem Value="M">Modified</asp:ListItem>
                    </asp:DropDownList>&nbsp;</div>
            </div>
            <span class="clear"></span>
            <div id="C1_Row11" class="Row">
                <div id="C1_Row11_Col1" class="LFloat_Lable LableWidth" style="height: 26px">
                    &nbsp;Issue From</div>
                <div id="C1_Row11_Col2" class="LFloat_Content" style="height: 26px">
                    <dxe:aspxdateedit id="dtIssueFrom" runat="server" clientinstancename="cdtIssueFrom" dateonerror="Today" editformat="Custom" editformatstring="dd-MM-yyyy" font-size="11px" tabindex="0" usemaskbehavior="True" width="125px">
                                <dropdownbutton text="Select">
                                </dropdownbutton>
                                <clientsideevents DateChanged="function(s,e){DateChange(cdtIssueFrom);}"></clientsideevents>
                            </dxe:aspxdateedit>
                    </div>
            </div>
            <span class="clear"></span>
            <div id="C1_Row2" class="Row">
                <div id="C1_Row2_Col1" class="LFloat_Lable LableWidth" style="height: 26px">
                    &nbsp;Issue To</div>
                    <div id="Div1" class="LFloat_Content" style="height: 26px">
                        <dxe:aspxdateedit id="dtIssueTo" runat="server" clientinstancename="cdtIssueTo" dateonerror="Today" editformat="Custom" editformatstring="dd-MM-yyyy" font-size="11px" tabindex="0" usemaskbehavior="True" width="125px">
                                <dropdownbutton text="Select">
                                </dropdownbutton>
                                <clientsideevents DateChanged="function(s,e){DateChange(cdtIssueTo);DateCompare();}"></clientsideevents>
                            </dxe:aspxdateedit>
                    </div>
                
            </div>
           <span class="clear"></span> 
           <div id="DivClientRow" class="Row">
            <div id="Div3" class="LFloat_Lable LableWidth" style="height: 26px">
                   Select Client</div>
            <div class="LFloat_Content" style="height: 26px;">
                <dxe:ASPxRadioButtonList ID="rbUser" runat="server" SelectedIndex="0" ItemSpacing="10px"
                    RepeatDirection="Horizontal" TextWrap="False" Font-Size="12px" TabIndex="0" ClientInstanceName="crbUser">
                    <Items>
                        <dxe:ListEditItem Text="All" Value="A" />
                        <dxe:ListEditItem Text="Selected" Value="S" />
                    </Items>
                    <ClientSideEvents ValueChanged="function(s, e) {OnClientFilter(s.GetValue());}" />
                    <Border BorderWidth="0px" />
                </dxe:ASPxRadioButtonList>
            </div>
           </div>
           <span class="clear"></span>
           <div id="DivSlipTypeCombo" class="Row">
            <div id="Div4" class="LFloat_Lable LableWidth" style="height: 26px">
                   Select Slip Type</div>
            <div class="LFloat_Content" style="padding-top: 4px; height: 26px; Width:184px">
                 <dxe:ASPxComboBox ID="ComboSlipType" runat="server" ClientInstanceName="cComboSlipType" EnableIncrementalFiltering="True"
                    EnableSynchronization="False" SelectedIndex="0" TabIndex="0" ValueType="System.String"
                    Width="182px" Font-Size="11px">
                    <Items>
                        <dxe:ListEditItem Text="Combined Instruction Slips" Value="1"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Combined Instruction Slips (CM)" Value="2"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Inter-Settlement" Value="3"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Delivery out [CM-Payin]" Value="4"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Delivery Out [CM Payout]" Value="5"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Pool-To-Pool Transfers" Value="6"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="On Market" Value="7"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Off Market" Value="8"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Inter-Depository" Value="9"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Pledge&amp;Hypothecation" Value="10"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="SLB Instructions" Value="11"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Demat Request Forms" Value="12"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Remat Request Forms" Value="13"></dxe:ListEditItem>
                    </Items>
                </dxe:ASPxComboBox>
            </div>
           </div>
           <span class="clear"></span>
            <div id="DivSlipRow" class="Row" style="margin-top: 5px">
                <div id="Div5" class="LFloat_Lable LableWidth" style="height: 26px">
                    Select Slip</div>
                <div class="LFloat_Content" style="padding-top: 3px; height: 26px;">
                    <dxe:ASPxRadioButtonList ID="rbSlip" runat="server" SelectedIndex="0" ItemSpacing="10px"
                        RepeatDirection="Horizontal" TextWrap="False" Font-Size="12px" TabIndex="0" ClientInstanceName="crbUser">
                        <Items>
                            <dxe:ListEditItem Text="All" Value="A" />
                            <dxe:ListEditItem Text="Selected" Value="S" />
                        </Items>
                        <ClientSideEvents ValueChanged="function(s, e) {OnSlipFilter(s.GetValue());}" />
                        <Border BorderWidth="0px" />
                    </dxe:ASPxRadioButtonList>
                </div>
                <div id="DivSlipType" class="LFloat_Lable LableWidth" style="padding-top: 3px; height: 26px;">
                    <dxe:ASPxRadioButtonList ID="rbSliptype" runat="server" SelectedIndex="0" ItemSpacing="5px"
                        RepeatDirection="Horizontal" TextWrap="False" Font-Size="12px" TabIndex="0" ClientInstanceName="crbUser">
                        <Items>
                            <dxe:ListEditItem Text="Single" Value="S" />
                            <dxe:ListEditItem Text="Range" Value="R" />
                        </Items>
                        <ClientSideEvents ValueChanged="function(s, e) {OnSlipTypeFilter(s.GetValue());}" />
                        <Border BorderWidth="0px" />
                    </dxe:ASPxRadioButtonList>
                </div>
                <div id="DivSlipRange" class="LFloat_Lable LableWidth" style="padding-top: 3px; margin-top: 5px;
                    height: 26px; width: 391px;">
                    <div id="divSlipNo" class="LFloat_Lable" style="width: 43px; border: none">
                        Slip No</div>
                    <div id="divFrom" class="LFloat_Lable" style="width: 43px; border: none">
                        From</div>
                    <div id="divSlipFrom" class="LFloat_Lable" style="padding-top: 3px; height: 26px;
                        float: left; border: none">
                        <asp:TextBox ID="TxtSlipFrom" runat="server" Font-Size="12px" Height="13px" Width="100px"
                            TabIndex="0"></asp:TextBox>
                    </div>
                    <div id="divTo" class="LFloat_Lable" style="width: 26px; border: none">
                        To</div>
                    <div id="divSlipTo" class="LFloat_Lable" style="padding-top: 3px; height: 26px; float: left;
                        border: none">
                        <asp:TextBox ID="TxtSlipTo" runat="server" Font-Size="12px" Height="13px" Width="100px"
                            TabIndex="0"></asp:TextBox>
                    </div>
                </div>
            </div>
            <span class="clear"></span>
            <div id="C1_Row6" class="Row" style="margin-top:5px">
                <asp:Button ID="btnGenerate" runat="server" Text="Generate" OnClick="btnGenerate_Click" />
            </div>
            <div>
                <asp:GridView ID="GvShow" runat="server" BackColor="peachPuff" BorderColor="blue" BorderStyle="solid" BorderWidth="1px"
                EmptyDataText="No Record Found" Font-Size="Small" AutoGenerateColumns="false">
                <Columns>
                <asp:BoundField HeaderText="Slip Type" DataField="SlipType"  />
                <asp:BoundField HeaderText="No of Instruction" DataField="NoOfInstruction" ItemStyle-HorizontalAlign="Right" />
                </Columns>
                
                </asp:GridView>
                <br />
                <asp:Button ID="btnExport" runat="server" Text="Export" OnClick="btnExport_Click" Width="76px" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="76px" OnClientClick="Goback()"/></div>
        </div>
        <div class="right" style="width: 472px; margin-right: 10px;">
            <div id="showFilter" class="left frmContent" style="display: none;">
                <div style="width: 100%">
                    <div class="frmleftContent">
                        <asp:TextBox ID="txtSelection" runat="server" Font-Size="12px" Height="13px" Width="233px"
                            TabIndex="0"></asp:TextBox>
                    </div>
                    <div class="frmleftContent" style="padding-top: 3px">
                        <asp:DropDownList ID="cmbsearch" runat="server" Font-Size="13px" Width="110px" Enabled="false">
                            <asp:ListItem>Clients</asp:ListItem>
                        </asp:DropDownList></div>
                    <div class="frmleftContent">
                        <a id="A3" href="javascript:void(0);" tabindex="0" onclick="btnAddIDTolist_click()">
                            <span style="color: #009900; text-decoration: underline; font-size: 10pt; line-height: 2;">
                                Add to List</span></a>
                    </div>
                </div>
                <span class="clear" style="background-color: #B7CEEC;"></span>
                <div class="frmleftContent" style="height: 105px; margin-top: 5px">
                    <asp:ListBox ID="SelectionList" runat="server" Font-Size="12px" Height="100px" Width="450px"
                        TabIndex="0"></asp:ListBox>
                </div>
                <span class="clear" style="background-color: #B7CEEC;"></span>
                <div class="frmleftContent" style="text-align: center">
                    <a id="AA2" href="javascript:void(0);" tabindex="0" onclick="clientselection()"><span
                        style="color: #000099; text-decoration: underline; font-size: 10pt; line-height: 2;">
                        Done</span></a>&nbsp;&nbsp; <a id="AA1" href="javascript:void(0);" tabindex="0" onclick="btnRemoveFromlist_click()">
                            <span style="color: #cc3300; text-decoration: underline; font-size: 10pt; line-height: 2;">
                                Remove</span></a>
                </div>
            </div>
        </div>

    </div>
    <asp:HiddenField ID="HiddenField_Client" runat="server" />
    </form>
</body>
</html>
