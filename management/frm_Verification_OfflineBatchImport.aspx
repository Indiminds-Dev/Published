<%@ page language="C#" autoeventwireup="true" inherits="management_frm_Verification_OfflineBatchImport, App_Web_kqhq1k1d" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2"  %>
<%@ Register Assembly="CheckBoxListExCtrl" Namespace="CheckBoxListExCtrl" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Verify Matched Record</title>
    
    <%--MultiSelectionDropDownList--%>
    <link href="../CSS/MultipleSelectionDDLCSS.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JSFUNCTION/MultipleSelectionDDLJS.js"></script>
    <%--End MultiSelectionDropDownList--%>
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
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
		position:inherit;
		z-index:5;
	}
	
	form{
		display:inline;
	}
	.forceInline
    {
        white-space: no-wrap;
    }
	</style>

     <script language="javascript" type="text/javascript">

       function PageLoad()
       {   
//        InitialEditFormEnableDisable();
        var AcceptRejectText=ctxtAcceptReject.GetValue();
        alert(AcceptRejectText);
       }
       function SignOff()
       {
        window.parent.SignOff()
       }
       function disp_prompt(name)
       {
         if ( name == "tab0")
        {
        //alert(name);
        document.location.href="frm_DoubleCapture_MatchedRecord.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="frm_DoubleCapture_UnMatchedRecord.aspx"; 
        }
       } 
       function height()
       {
        
       if(document.body.scrollHeight>=800)
        window.frameElement.height = document.body.scrollHeight;
       else
        window.frameElement.height = '800px';
        window.frameElement.Width = document.body.scrollWidth;
       }   
        
       FieldName='none'; 
       function CallAjaxSettlementfrm(obj1,obj2,obj3)
       { 
        var trantypevalue=cComboTranType.GetValue();
        var Mktfrm =cComboMktfrm.GetValue();
        var Exchangefrm = ctxtSourceCCCMID.GetValue();
        //alert(trantypevalue+'~'+Mktfrm+'~'+Exchangefrm);                                     
        ajax_showOptions(obj1,obj2,obj3,Mktfrm+'~'+Exchangefrm+'~'+trantypevalue,'Main');
        //alert(document.getElementById('hiddensettlefrom').value);
        }
        function CallAjaxSettlementto(obj1,obj2,obj3)
        {
            var strSessionDPValue =document.getElementById('hdnDPSessionValue').value;
            var Mkttovalue=cComboMarketTypeTo.GetValue();
            var Mkttotxt=cComboMarketTypeTo.GetText();
            var Exchangefrm=ctxtSourceCCCMID.GetValue();
            var Exchangeto =ctxtExchange.GetValue();
            var trantype=cComboTranType.GetValue();
            if(strSessionDPValue=='NSDL')
            {Exchangeto=Exchangeto.substr(0,8);}
            else
            {Exchangeto=Exchangeto.substr(0,2);}
            if(trantype=='31' || trantype=='32')
            {
                trantype='3';
                
                if (Exchangeto == "IN001002")
                {
                    Exchangeto = "12";
                }
                else if (Exchangeto == "IN001019")
                {
                    Exchangeto = "11";
                }
                else if (Exchangeto == "IN001027")
                {
                    Exchangeto = "13";
                }
                else
                {
                    Exchangeto = Exchangeto;
                }
            }
           
            //alert(Mkttovalue+'~'+Mkttotxt+'~'+Exchangefrm+'~'+Exchangeto+'~'+trantype);                                     
            if(trantype== '5' || trantype== '61' || trantype== '62')
            {
                ajax_showOptions(obj1,obj2,obj3,Mkttotxt+'~'+Exchangefrm+'~'+Mkttovalue+'~'+trantype,'Main');
            }
            else
            {
                ajax_showOptions(obj1,obj2,obj3,Mkttotxt+'~'+Exchangeto+'~'+Mkttovalue+'~'+trantype,'Main');
            }
        }
        function CallAjaxcmbpid(obj1,obj2,obj3)
        {  
            //var dp=document.getElementById('hdn_NSDLCDSL').value;
            var EarlyOrNormal=''; 
            var trantype=cComboTranType.GetValue();
            //alert(trantype);
            if(trantype=='31')
            {
                EarlyOrNormal='N';
                trantype='3';
            }
            if(trantype=='32')
            {
                EarlyOrNormal='E';
                trantype='3';
            }
            if(trantype=='13')
            {
                EarlyOrNormal='On';
                trantype='1';
            }
            ajax_showOptions(obj1,obj2,obj3,trantype+'~'+EarlyOrNormal,'Main');
        }
        function CallAjaxMarkettodata(obj1,obj2)
        {  
            // alert('a4');                                                        
            ajax_showOptions(obj1,obj2);
        }
        function CallAjaxdpid(obj1,obj2,obj3)
        {                     
          var Mktfrm =cComboMktfrm.GetValue();
          var Exchangefrm=ctxtSourceCCCMID.GetValue();
          var trantype=cComboTranType.GetValue();
            if(trantype=='31' ||trantype=='32')
            {
               trantype='3';
            }
           //alert(Mktfrm+'~'+Exchangefrm+'~'+trantype);                                     
          ajax_showOptions(obj1,obj2,obj3,Mktfrm+'~'+Exchangefrm+'~'+'IN3'+'~'+trantype ,'Main');
          //alert(document.getElementById('hiddensettlefrom').value);
        }
        function CallAjaxclient(obj1,obj2,obj3)
        {
           var OtherDPID; 
            if(document.getElementById('hdnajaxotherdpid').value=='')
               OtherDPID=ctxtOtherDPID.GetValue();
            else
               OtherDPID=document.getElementById('hdnajaxotherdpid').value;
           var trantype=cComboTranType.GetValue();
           if(trantype=='31' ||trantype=='32')
            {
               trantype='3';
            }
           var ClientID=clblclient.GetValue();
           //alert(OtherDPID+'~'+trantype);
           ajax_showOptions(obj1,obj2,obj3,'IN3~'+OtherDPID+'~'+trantype+'~'+ClientID,'Main');
        }
        function CallAjaxisin(obj1,obj2,obj3)
        {    
//           var Mktto=cComboMarketTypeTo.GetValue();
//           var Exchangefrm = ctxtSourceCCCMID.GetValue();
           var trantype=cComboTranType.GetValue();
           // alert(Mktto+'~'+Exchangefrm+'~'+trantype);                                     
           ajax_showOptions(obj1,obj2,obj3,' ~ ~'+trantype ,'Main');
           
        }
       
            function keyVal(obj)
            {   
                 //alert(obj);
                 var WhichCode=new String(obj);
                 var ExchangeToNAME=new String(obj);
                 var ExchangeToID=new String(obj);
                 var SelectedItem=new String(obj);
                 var bplistcode=new String(obj);
                 var trantype=cComboTranType.GetValue();
                 var otherddpid=new String(obj);
                 var CHID=new String(obj);
                 var CMID=new String(obj);
                 var SettlementToValue=new String(obj);
                 WhichCode=WhichCode.split('+')[3];
                 //alert(WhichCode);
                 if(WhichCode == 'cmbpid')
                 {
                    ExchangeToNAME=ExchangeToNAME.split('+')[2];
                    ExchangeToID=ExchangeToID.split('+')[0];
                    otherddpid=otherddpid.split('+')[1];
                    bplistcode=bplistcode.split('+')[0];
                    CHID=CHID.split('+')[4];
                    CMID=CMID.split('+')[5];
                    document.getElementById('hdnotherddpid').value=otherddpid;
                    document.getElementById('hdnbplistcode').value=bplistcode;
                    document.getElementById('hdnCHID').value=CHID;
                    document.getElementById('hdnCMID').value=CMID;
                    if(trantype=='3')
                    {
                        if (ExchangeToID == "IN001002")
                        {
                            ExchangeToID = "12";
                        }
                        else if (ExchangeToID == "IN001019")
                        {
                            ExchangeToID = "11";
                        }
                        else if (ExchangeToID == "IN001027")
                        {
                            ExchangeToID = "13";
                        }
                        else
                        {
                            ExchangeToID = ExchangeToID;
                        }
                        ctxtExchange.SetText(ExchangeToID+'[ '+ExchangeToNAME+' ]');
                    }
                    if(trantype=='31' || trantype=='32')
                    {
                        if (ExchangeToID == "12")
                        {
                            ExchangeToID = "IN001002";
                        }
                        else if (ExchangeToID == "11")
                        {
                            ExchangeToID = "IN001019";
                        }
                        else if (ExchangeToID == "13")
                        {
                            ExchangeToID = "IN001027";
                        }
                        else
                        {
                            ExchangeToID = ExchangeToID;
                        }
                        ctxtExchange.SetText(ExchangeToID+'[ '+ExchangeToNAME+' ]');
                    }
                    else
                    {
                        ctxtExchange.SetText(ExchangeToID+'[ '+ExchangeToNAME+' ]');
                    }
                    //OnMartketToChanged(cComboMarketTypeTo);
                    cComboMarketTypeTo.PerformCallback(ExchangeToID+'~KeyVal');
                 }
                 if(WhichCode == 'isin')
                 {
                    SelectedItem=SelectedItem.split('+')[2];
                     if(SelectedItem=='Suspended for Debit')
                     {
                       alert(SelectedItem);
                     }
                     if(SelectedItem=='To be Closed')
                     {
                       alert(SelectedItem);
                     }
                     
                 }
                 if(WhichCode == 'dpid')
                 {
                    //alert(selecteddpid.split('+')[0]);
                    document.getElementById('hdnajaxotherdpid').value=SelectedItem.split('+')[0];
                 }
                 if(WhichCode == 'settlementto')
                 {
                   SettlementToValue=SettlementToValue.split('+')[0];
                   //alert(SettlementToValue);
                   document.getElementById('hiddensettleto').value=SettlementToValue;
                 }  
                
                          
            }
            
            //Code For When Tran Type Change
            function OnTransSelectedIndexChanged()
            {
                var SelectedValue=cComboTranType.GetValue();
                SetTdVisibleAccTran(SelectedValue);
            }
            function SetTdVisibleAccTran(pSelectedValue)
            {
                
                TdShowHide(tdCCCMIDName,'e');
                TdShowHide(tdCCCMIDValue,'e');
                TdShowHide(tdMarketTypeName,'e');
                TdShowHide(tdMarketTypeValue ,'e');
                TdShowHide(tdOtherClientIDName,'e');
                TdShowHide(tdOtherClientIDValue,'e');
                TdShowHide(tdOtherCMBPIDName,'e');
                TdShowHide(tdOtherCMBPIDValue ,'e');
                TdShowHide(tdOtherDPIDName,'e');
                TdShowHide(tdOtherDPIDValue,'e');
                TdShowHide(tdOtherMarketTypeName,'e');
                TdShowHide(tdOtherMarketTypeValue,'e');
                TdShowHide(tdOtherSettlementNumberName,'e');
                TdShowHide(tdOtherSettlementNumberValue,'e');
                TdShowHide(tdSettlementNumberName,'e');
                TdShowHide(tdSettlementNumberValue,'e');
                
                if(pSelectedValue=='1')
                {
                    TdShowHide(tdOtherClientIDName,'d');
                    TdShowHide(tdOtherClientIDValue,'d');
                    TdShowHide(tdOtherDPIDName,'d');
                    TdShowHide(tdOtherDPIDValue,'d');
                }
                if(pSelectedValue=='2')
                {
                    TdShowHide(tdOtherMarketTypeName,'d')
                    TdShowHide(tdOtherMarketTypeValue,'d')
                    TdShowHide(tdOtherCMBPIDName,'d')
                    TdShowHide(tdOtherCMBPIDValue ,'d')
                    TdShowHide(tdCCCMIDName,'d')
                    TdShowHide(tdCCCMIDValue,'d')
                    TdShowHide(tdOtherSettlementNumberName,'d')
                    TdShowHide(tdOtherSettlementNumberValue,'d')
                    
                }
                if(pSelectedValue=='31' || pSelectedValue=='32')
                {
                    TdShowHide(tdOtherClientIDName,'d');
                    TdShowHide(tdOtherClientIDValue,'d');
                    TdShowHide(tdOtherDPIDName,'d');
                    TdShowHide(tdOtherDPIDValue,'d');
                }
                if(pSelectedValue=='4')
                {
                    TdShowHide(tdOtherMarketTypeName,'d');
                    TdShowHide(tdOtherMarketTypeValue,'d');
                    TdShowHide(tdOtherCMBPIDName,'d');
                    TdShowHide(tdOtherCMBPIDValue ,'d');
                    TdShowHide(tdCCCMIDName,'d');
                    TdShowHide(tdCCCMIDValue,'d');
                    TdShowHide(tdOtherSettlementNumberName,'d');
                    TdShowHide(tdOtherSettlementNumberValue,'d');
                }
                if(pSelectedValue=='5')
                {
                    TdShowHide(tdOtherDPIDName,'d');
                    TdShowHide(tdOtherDPIDValue,'d');
                    TdShowHide(tdOtherClientIDName,'d');
                    TdShowHide(tdOtherClientIDValue,'d');
                    TdShowHide(tdOtherCMBPIDName,'d');
                    TdShowHide(tdOtherCMBPIDValue ,'d');
                    TdShowHide(tdCCCMIDName ,'d');
                    TdShowHide(tdCCCMIDValue ,'d');
                    
                }
                if(pSelectedValue=='61' || pSelectedValue=='62')
                {
                    TdShowHide(tdMarketTypeName,'d');
                    TdShowHide(tdMarketTypeValue ,'d');
                    TdShowHide(tdOtherDPIDName,'d');
                    TdShowHide(tdOtherDPIDValue,'d');
                    TdShowHide(tdOtherClientIDName,'d');
                    TdShowHide(tdOtherClientIDValue,'d');
                    TdShowHide(tdOtherCMBPIDName,'d');
                    TdShowHide(tdOtherCMBPIDValue ,'d');
                    TdShowHide(tdCCCMIDName,'d');
                    TdShowHide(tdCCCMIDValue,'d');
                    TdShowHide(tdSettlementNumberName,'d');
                    TdShowHide(tdSettlementNumberValue,'d');
                }
                if(pSelectedValue=='7')
                {
                    TdShowHide(tdOtherDPIDName,'d');
                    TdShowHide(tdOtherDPIDValue,'d');
                    TdShowHide(tdOtherClientIDName,'d');
                    TdShowHide(tdOtherClientIDValue,'d');
                }
            }
            function TdShowHide(obj,HideShow)
            {
                if(HideShow=='d')
                    obj.style.display='none'
                else
                    obj.style.display='inline'
            }
            function InitialShowEditForm()
            {
              var trantype=cComboTranType.GetValue();
              SetTdVisibleAccTran(trantype);
            }
            // End Code For When Tran Type Change
            
            function GridViewDataTextColumnOnKeyPress(AspxTextBoxAccetReject) {
            
                 if(AspxTextBoxAccetReject.GetValue()=='R' || AspxTextBoxAccetReject.GetValue()=='r')
                 {
                    ctxtAcceptReject.SetText('Reject');
                    TdShowHide(tdRejectReason,'nd');
                 }
                 else if(AspxTextBoxAccetReject.GetValue()=='A' || AspxTextBoxAccetReject.GetValue()=='a')
                 {
                    ctxtAcceptReject.SetText('Accept');
                    TdShowHide(tdRejectReason,'d');
                 }
                 else if(AspxTextBoxAccetReject.GetValue()=='Accep' || AspxTextBoxAccetReject.GetValue()=='Rejec')
                 {
                    ctxtAcceptReject.SetText('');
                    TdShowHide(tdRejectReason,'d');
                 }
                 else
                 {
                    ctxtAcceptReject.SetText('Accept');
                    TdShowHide(tdRejectReason,'d');
                 }
            }
            
            function readCheckBoxList(chkBox, ddlList, hiddenFieldText, hiddenFieldValue, hiddenFieldSelIndex) {
            var checkedItems = getCheckBoxListItemsChecked(chkBox);
            var Data='';
            var mySplitResult = checkedItems[1].split(",");
            //alert(mySplitResult[0]);
            for(i = 0; i < mySplitResult.length; i++){
                if(Data=='')
                {Data=mySplitResult[i].split("+")[0];}
                else
                {Data=Data+","+mySplitResult[i].split("+")[0];}
                }
//            alert(Data);
            $get(ddlList).options[0].innerHTML = Data;//set the dropdownlist value
            $get(ddlList).title = checkedItems[1]; //set the title for the dropdownlist
            //set hiddenfield value
            $get(hiddenFieldValue).value = checkedItems[1];
            $get(hiddenFieldText).value = checkedItems[0];
            $get(hiddenFieldSelIndex).value = checkedItems[2];
            cGvMatchedRecord.PerformCallback(checkedItems[2]+'*'+checkedItems[0]+'|'+checkedItems[1]+'~SlipNumber');
            }
            function OnEditUpdate() {
            __doPostBack("< %= UpdatePanel1.ClientID%>", ''); 
            }
            function VerifyRecord()
            {
                cGvMatchedRecord.PerformCallback('A*B|C~VerifyRecord');
            }
            function OnComboSlipIndexChange(obj)
            {
               cGvMatchedRecord.PerformCallback("0"+'*'+cCmbSlip.GetText()+'|'+cCmbSlip.GetValue()+'~SlipNumber');
            }
            
            function ddlExport_OnChange()
            {
              var ddlExport=document.getElementById("<%=ddlExport.ClientID%>");  
              var ddlvalue = document.getElementById("<%=ddlExport.ClientID%>").value;
//               alert(ddlvalue);
              document.getElementById("hdnExportValue").value= ddlvalue;
              document.getElementById('Button1').click();                                
              ddlExport.options[0].selected=true; 
             
            }
            function VerifyAll()
            {
                cGvMatchedRecord.PerformCallback('A*B|C~VerifyAllRecord');
            }
    </script>
    
  
    

</head>

<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
    
         <table class="TableMain100">
             <tr>
                 <td>
                 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <div style="float:left">
                     <dxe:ASPxDateEdit ID="dtentrydate" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                         EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="200px" OnValueChanged="dtentrydate_ValueChanged">
                         <dropdownbutton text="Enter Date">
                         </dropdownbutton>
                     </dxe:ASPxDateEdit>
                     </div>
                     <div >
                 <asp:Button ID="btnshow1" Text="Show" runat="server" OnClick="btnshow1_Click" />
                        <asp:DropDownList ID="ddlExport" runat="server" Onchange="ddlExport_OnChange()">
                            <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                            <%--<asp:ListItem Value="E">Excel</asp:ListItem>--%>
                            <asp:ListItem Value="P">PDF</asp:ListItem>
                            <%--<asp:ListItem Value="PM">RPT</asp:ListItem>--%>
                        </asp:DropDownList></div>
                 </td>
             </tr>
                <tr>
                    <td>
                       
                            
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                         <table>
                <tr>
                    <td colspan="2" style="width: 358px; height: 50px;" valign="top">
                        <dxe:ASPxComboBox ID="CmbSlip" ClientInstanceName="cCmbSlip" runat="server" Width="335px"
                            DropDownWidth="335px" ValueType="System.String" TextFormatString="{0}" EnableCallbackMode="True"
                            IncrementalFilteringMode="StartsWith" CallbackPageSize="30" EnableAnimation="False">
                            <ListBoxStyle HorizontalAlign="Justify" Wrap="False" CssClass=".forceInline">
                            </ListBoxStyle>
                            <DropDownButton Text="Select Slip to Verify">
                            </DropDownButton>
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { OnComboSlipIndexChange(s); }">
                            </ClientSideEvents>
                        </dxe:ASPxComboBox>
                    </td>
                    <td style="vertical-align: top; width: 81px; text-align: left; height: 50px;">
                        <dxe:ASPxButton ID="abtnverifyall" runat="server" Height="15px" Text="Verify All">
                            <ClientSideEvents Click="function(s, e) { VerifyAll(); }" />
                        </dxe:ASPxButton>
                    </td>
                    <td style="vertical-align: top; width: 551px; text-align: left; height: 50px;">
                        <dxe:ASPxComboBox ID="CmbRecordChoser" runat="server" ClientInstanceName="cCmbRecordChoser"
                            EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                            TabIndex="1" ValueType="System.String" Width="184px" AutoPostBack="True" OnSelectedIndexChanged="CmbRecordChoser_SelectedIndexChanged">
                            <Items>
                                <dxe:ListEditItem Text="Select Record" Value="1"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="All" Value="2"></dxe:ListEditItem>
                                <dxe:ListEditItem ImageUrl="~/images/Box_Green.png" Text="Verified" Value="3"></dxe:ListEditItem>
                                <dxe:ListEditItem ImageUrl="~/images/Box_Red.png" Text="Rejected" Value="4"></dxe:ListEditItem>
                                <dxe:ListEditItem ImageUrl="~/images/Box_Black.PNG" Text="ToBeVerify" Value="5"></dxe:ListEditItem>
                            </Items>
                            <DropDownButton ImagePosition="Top" Text="Show Selected Record">
                            </DropDownButton>
                        </dxe:ASPxComboBox>
                    </td>
                </tr>
                </table>
                  <dxwgv:ASPxGridView ID="GvMatchedRecord" ClientInstanceName="cGvMatchedRecord" runat="server"
                        KeyFieldName="id" AutoGenerateColumns="False" Width="950px" OnHtmlEditFormCreated="GvMatchedRecord_HtmlEditFormCreated"
                        OnRowUpdating="GvMatchedRecord_RowUpdating" OnCustomCallback="GvMatchedRecord_CustomCallback"  OnCancelRowEditing="GvMatchedRecord_CancelRowEditing" OnHtmlRowCreated="GvMatchedRecord_HtmlRowCreated" EnableCallbackCompression="True" OnRowUpdated="GvMatchedRecord_RowUpdated">
                        <Columns>
                            <dxwgv:GridViewCommandColumn VisibleIndex="0" FixedStyle="Left" Width="50px">
                                <EditButton Visible="True" />
                                <CellStyle BackColor="Salmon">
                                </CellStyle>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="AcceptReject" VisibleIndex="1" FixedStyle="Left" Width="75px" Visible="False" Name="Status">
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataColumn FieldName="SlipNumber" VisibleIndex="1" FixedStyle="Left"
                                Width="50px">
                                <CellStyle BackColor="#FFFFD6">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="BenIDName" VisibleIndex="2" FixedStyle="Left"
                                Width="280px" Caption="ClientID">
                                <CellStyle Wrap="False" BackColor="#FFFFD6">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="TransactionType" VisibleIndex="3" FixedStyle="Left"
                                Width="150px" Caption="Tran.Type">
                                <CellStyle Wrap="False" BackColor="#FFFFD6">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="MarketType" VisibleIndex="4" Width="130px" Caption="SrcMktType">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="SettlementNumber" VisibleIndex="5" Width="100px" Caption="ScrSettle.No">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="OtherDPID" VisibleIndex="6" Width="300px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="OtherBenIDName" VisibleIndex="7" Width="200px" Caption="OtherClientID">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="OtherCMBPID" VisibleIndex="8" Width="350px" Caption="OtherCMID">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="CCCMID" VisibleIndex="9" Width="250px" Caption="OtherExchID" Visible="false">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="OtherMarketType" VisibleIndex="10" Width="130px" Caption="OtherMktType">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="OtherSettlementNumber" VisibleIndex="11" Width="100px" Caption="OtherSett.No">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="ISIN" VisibleIndex="12" Width="350px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="Quantity" VisibleIndex="13" Width="100px" Caption="Qty">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="TransactionDate" VisibleIndex="14" Width="100px" Caption="Tran.Date">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="ExecutionDate" VisibleIndex="15" Width="100px" Caption="Exec.Date">
                                <CellStyle Wrap="False">
                                </CellStyle>
                                
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="EntryUserRole" VisibleIndex="16" Width="200px" Caption="EnteredBy">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="CCCMID" VisibleIndex="18" Visible="False" Width="100px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="ClientID" VisibleIndex="19" Visible="False"
                                Width="100px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="NsdlOffline_MarketType" VisibleIndex="20" Visible="False"
                                Width="100px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="NsdlOffline_OtherMarketType" VisibleIndex="21"
                                Visible="False" Width="100px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="NsdlOffline_TransactionType" VisibleIndex="22"
                                Visible="False" Width="100px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="SourceCCCMID" VisibleIndex="23" Visible="False"
                                Width="100px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="id" VisibleIndex="24" Visible="False"
                                Width="100px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="SlipType" VisibleIndex="25" Visible="False" Width="100px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="AcceptReject" VisibleIndex="26" Visible="False" Width="100px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <%--<ClientSideEvents  EndCallback="function(s, e) {OnEditUpdate();}" />--%>
                        <SettingsEditing Mode="EditForm" />
                        <Settings ShowGroupPanel="True" ShowHorizontalScrollBar="True" />
                        <Styles>
                            <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FCA977"></FocusedRow>
                            <AlternatingRow Enabled="True"></AlternatingRow>
                        </Styles>

                        <Templates>
                            <EditForm>
                                <table border="1">
                                    <tr>
                                        <td>
                                            SlipNumber
                                        </td>
                                        <td>
                                            <dxe:aspxlabel id="lblslipno" runat="server" text='<%# Bind("SlipNumber") %>' Font-Size="X-Small">
                                            </dxe:aspxlabel>
                                        </td>
                                        <td>
                                            ClientId</td>
                                        <td nowrap="nowrap">
                                            <dxe:aspxlabel id="lblclient" clientinstancename="clblclient" runat="server" text='<%# Bind("BenIDName") %>' Font-Size="X-Small">
                                            </dxe:aspxlabel>
                                        </td>
                                        <tr>
                                        <td>
                                            TransactionType
                                        </td>
                                        <td>
                                            <dxe:aspxcombobox id="ComboTranType" runat="server" clientinstancename="cComboTranType" Font-Size="X-Small">
                                                <clientsideevents selectedindexchanged="OnTransSelectedIndexChanged" />
                                            </dxe:aspxcombobox>
                                        </td>
                                        <td>
                                            RecordEnterBy
                                        </td>
                                        <td>
                                            <asp:Label Width="200px" runat="server" ID="lblentryuserrole" Text='<%# Bind("EntryUserRole") %>' Font-Size="X-Small"> </asp:Label>
                                        </td>
                                        </tr>
                                    </tr>
                                    <tr>
                                        <td id="tdMarketTypeName">
                                            SourceMktType
                                        </td>
                                        <td id="tdMarketTypeValue">
                                            <dxe:aspxcombobox id="ComboMktfrm" runat="server" clientinstancename="cComboMktfrm" Width="200px" Font-Size="X-Small">
                                            </dxe:aspxcombobox>
                                        </td>
                                        <td id="tdSettlementNumberName">
                                            SourceSett.No.
                                        </td>
                                        <td id="tdSettlementNumberValue">
                                            <asp:TextBox runat="server" ID="txtsettfrm" Text='<%# Bind("SettlementNumber") %>' Width="200px" Font-Size="X-Small"> </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="tdOtherDPIDName">
                                            OtherDPId
                                        </td>
                                        <td id="tdOtherDPIDValue">
                                            <asp:TextBox runat="server" ID="txtdpid" Text='<%# Bind("OtherDPID") %>' Width="200px" Font-Size="X-Small"> </asp:TextBox>
                                        </td>
                                        <td id="tdOtherClientIDName">
                                            OtherClientID
                                        </td>
                                        <td id="tdOtherClientIDValue">
                                            <asp:TextBox runat="server" ID="txtclientid" Text='<%# Bind("OtherBenIDName") %>' Width="200px" Font-Size="X-Small"> </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="tdOtherCMBPIDName">
                                            OtherCMID
                                        </td>
                                        <td id="tdOtherCMBPIDValue">
                                            <asp:TextBox runat="server" ID="txtcmbpid" Text='<%# Bind("OtherCMBPID") %>' Width="200px" Font-Size="X-Small"> </asp:TextBox>
                                        </td>
                                        <td id="tdCCCMIDName">
                                            CounterExch.Desc
                                        </td>
                                        <td id="tdCCCMIDValue">
                                            <dxe:aspxtextbox runat="server" id="txtExchange" clientinstancename="ctxtExchange"
                                                text='<%# Bind("CCCMID") %>' autoresizewithcontainer="true" Width="200px"  Font-Size="X-Small">
                                            </dxe:aspxtextbox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="tdOtherMarketTypeName">
                                            OtherMktType
                                        </td>
                                        <td id="tdOtherMarketTypeValue">
                                            <dxe:aspxcombobox id="ComboMarketTypeTo" runat="server" clientinstancename="cComboMarketTypeTo"
                                                oncallback="ComboMarketTypeTo_Callback" Width="200px" Font-Size="X-Small">
                                            </dxe:aspxcombobox>
                                        </td>
                                        <td id="tdOtherSettlementNumberName">
                                            OtherSett.No
                                        </td>
                                        <td id="tdOtherSettlementNumberValue">
                                            <asp:TextBox runat="server" ID="txtSettlementto" Text='<%# Bind("OtherSettlementNumber") %>' Width="98%"  Font-Size="X-Small"> </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            ISIN
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtisin" runat="server" Text='<%# Bind("ISIN") %>' Width="200px"  Font-Size="X-Small"></asp:TextBox>
                                        </td>
                                        <td>
                                            Qty
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtqty" Text='<%# Bind("Quantity") %>' Width="200px"  Font-Size="X-Small"> </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Tran.Date
                                        </td>
                                        <td>
                                            <dxe:aspxdateedit id="dttran" runat="server" clientinstancename="cdttran" dateonerror="Today"
                                                editformat="Custom" editformatstring="dd-MM-yyyy" usemaskbehavior="True" Width="200px"
                                                ReadOnly="True" Font-Size="X-Small">
                                                <dropdownbutton text="Tran.Date">
                                    </dropdownbutton>
                                            </dxe:aspxdateedit>
                                        </td>
                                        <td>
                                            Exec.Date
                                        </td>
                                        <td>
                                            <dxe:aspxdateedit id="dtexec" runat="server" clientinstancename="cdtexec" dateonerror="Today"
                                                editformat="Custom" editformatstring="dd-MM-yyyy" usemaskbehavior="True" Width="200px" Font-Size="X-Small">
                                                <dropdownbutton text="Exec.Date">
                                    </dropdownbutton>
                                            </dxe:aspxdateedit>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                     <td>
                                            AcceptRejectRecord
                                        </td>
                                    <td>
                                            <dxe:aspxtextbox runat="server" id="txtAcceptReject" clientinstancename="ctxtAcceptReject"
                                                text='<%# Bind("AcceptReject") %>' autoresizewithcontainer="true" Width="200px"  Font-Size="X-Small">
                                             <ClientSideEvents KeyUp="function(s, e) { GridViewDataTextColumnOnKeyPress(s); }" /> 
                                              </dxe:aspxtextbox>
                                        </td>
                                        <td>
                                        Rejected Reason
                                        </td>
                                        <td id="tdRejectReason" style="display:none">
                                            <asp:TextBox ID="TxtRejectReason" runat="server" Text='<%# Bind("AcceptRejectReason") %>' TextMode="MultiLine" Width="200px"  Font-Size="X-Small"></asp:TextBox> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="display: none">
                                            <dxe:aspxtextbox runat="server" id="txtSourceCCCMID" clientinstancename="ctxtSourceCCCMID"
                                                text='<%# Bind("SourceCCCMID") %>' Width="200px" autoresizewithcontainer="true">
                                            </dxe:aspxtextbox>
                                        </td>
                                        <td style="display: none">
                                            <dxe:aspxtextbox runat="server" id="txtCCCMID" clientinstancename="ctxtCCCMID" text='<%# Bind("NsdlOffline_CCCMID") %>'
                                                Width="200px" autoresizewithcontainer="true">
                                            </dxe:aspxtextbox>
                                        </td>
                                        <td style="display: none">
                                            <dxe:aspxtextbox runat="server" id="txtOtherDPID" clientinstancename="ctxtOtherDPID"
                                                text='<%# Bind("NsdlOffline_OtherDPID") %>' Width="200px" autoresizewithcontainer="true">
                                            </dxe:aspxtextbox>
                                        </td>
                                        <td style="display: none">
                                            <dxe:aspxtextbox runat="server" id="txtOtherBenID" clientinstancename="ctxtOtherBenID"
                                                text='<%# Bind("NsdlOffline_OtherClientID") %>' Width="200px" autoresizewithcontainer="true">
                                            </dxe:aspxtextbox>
                                        </td>
                                        <td style="display: none">
                                            <dxe:aspxtextbox runat="server" id="txtid" clientinstancename="ctxtid" text='<%# Bind("id") %>'
                                                Width="200px" autoresizewithcontainer="true">
                                            </dxe:aspxtextbox>
                                        </td>
                                        <td style="display: none">
                                            <dxe:aspxtextbox runat="server" id="txtEnteredby" clientinstancename="ctxtEnteredby"
                                                text='<%# Bind("NsdlOffline_Enteredby") %>' Width="200px" autoresizewithcontainer="true">
                                            </dxe:aspxtextbox>
                                        </td>
                                        <td style="display: none">
                                            <dxe:aspxtextbox runat="server" id="txtEntryUserRole" clientinstancename="ctxtEntryUserRole"
                                                text='<%# Bind("NsdlOffline_EntryUserRole") %>' Width="200px" autoresizewithcontainer="true">
                                            </dxe:aspxtextbox>
                                        </td>
                                        <td style="display: none">
                                            <dxe:aspxtextbox runat="server" id="txtCHID" clientinstancename="ctxtCHID"
                                                text='<%# Bind("CHID") %>' Width="200px" autoresizewithcontainer="true">
                                            </dxe:aspxtextbox>
                                        </td>
                                        <td>
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                runat="server">
                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                        </td>
                                        <td>
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                runat="server">
                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                        </td>
                                    </tr>
                                </table>
                            </EditForm>
                        </Templates>
                    </dxwgv:ASPxGridView>
                                                                                       
                  </ContentTemplate>
                  
                </asp:UpdatePanel>  
                                           
                    </td>
                </tr>
            </table>
             <asp:HiddenField ID="hdnajaxotherdpid" runat="server" />
        <asp:HiddenField ID="hdnotherddpid" runat="server" />
        <asp:HiddenField ID="hdnbplistcode" runat="server" />
        <asp:HiddenField ID="hdnCHID" runat="server" />
        <asp:HiddenField ID="hdnCMID" runat="server" />
        <asp:HiddenField ID="hdnDPSessionValue" runat="server" />
        <asp:HiddenField ID="hdnExportValue" runat="server" />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" BackColor="#DDECFE" BorderStyle="None"  />
        <asp:HiddenField ID="hiddensettleto" runat="server" />
        </form>
</body>
</html>

