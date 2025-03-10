<%@ page language="C#" autoeventwireup="true" inherits="management_frm_DoubleCapture_UnMatchedRecord, App_Web_itibbj7j" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

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
	
	</style>

     <script language="javascript" type="text/javascript">
//    function diffpage()
//    {
//     '<%=Session["transactiontype"] %>'='<%=Session["transactiontype"] %>'+'~'+'bind';
//    }
      
       function PageLoad()
       {   
        InitialEditFormEnableDisable();
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
             if(trantype=='11')
            {
                EarlyOrNormal='N';
                trantype='1';
            }
            if(trantype=='12')
            {
                EarlyOrNormal='E';
                trantype='1';
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
           var clientname=clblclient.GetValue();                                  
           clientname=clientname.split('[')[1].toString().split(']')[0];
            clientname=trim(clientname);
           clientname=clientname.substring(8);                                     
           ajax_showOptions(obj1,obj2,obj3,' ~ ~'+trantype+'~'+clientname ,'Main');
           
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
            function OnRsnSelectedIndexChanged(pSelectedValue)
            {
//             alert(cComboTransRsn.GetValue()+'***'+cComboTransRsn.GetText());
                if(cComboTransRsn.GetValue()=="1")
                {
                  TdShowHide(tdConsideration,'e');
                  TdShowHide(tdConsiderationTxt,'e');
                  TdShowHide(tdRsn,'d');
                  TdShowHide(tdRsnTxt,'d');
                }
                else if(cComboTransRsn.GetValue()=="99")
                {
                  TdShowHide(tdConsideration,'d');
                  TdShowHide(tdConsiderationTxt,'d');
                  TdShowHide(tdRsn,'e');
                  TdShowHide(tdRsnTxt,'e');
                }
                else
                {
                  TdShowHide(tdConsideration,'d');
                  TdShowHide(tdConsiderationTxt,'d');
                  TdShowHide(tdRsn,'d');
                  TdShowHide(tdRsnTxt,'d');
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
            function ddlExport_OnChange()
            {
              var ddlExport=document.getElementById("<%=ddlExport.ClientID%>");  
              var ddlvalue = document.getElementById("<%=ddlExport.ClientID%>").value;
//               alert(ddlvalue);
              document.getElementById("hdnExportValue").value= ddlvalue;
              document.getElementById('Button1').click();                                
              ddlExport.options[0].selected=true; 
             
            }
             function ShowDetailPopup(RecordID) {
                popup.SetContentUrl('frm_DoubleCapture_UnMatchedRecord_Popup.aspx?Recordid=' + RecordID);
                popup.Show();
            }
            function OnEndCallback(s, e) {

               if(s.cpIsLastRow!=null)
               {
                    if(s.cpIsLastRow.split('~')[0]!="EndUpdate" || s.cpIsLastRow.split('~')[0]!='undefined')
                    {
                        var truefalse=s.cpIsLastRow.split('~')[0];
                        var RecordID=s.cpIsLastRow.split('~')[1];
                        var DPID=s.cpIsLastRow.split('~')[2];
                        var SlipType=s.cpIsLastRow.split('~')[3];
                        var BenAcc=s.cpIsLastRow.split('~')[4];
                        var slipNo=s.cpIsLastRow.split('~')[5];
                        var EntryUser=s.cpIsLastRow.split('~')[6];
                        //alert(RecordID+ "~" + DPID + "~" + BenAcc + "~" + slipNo + "~" + EntryUser);
                        //alert(RecordID);
			            if (truefalse == "true") {
			               var data='Make Entry Again For This Slip Or Cancel Slip'
			               var answer = confirm(data)
				           if (answer)
                           {
                                cGvUnMatchedRecord.PerformCallback("ReEnterSlip~undefined~"+RecordID+ "~" + DPID + "~" +SlipType+ "~" + BenAcc + "~" + slipNo + "~" + EntryUser);
                           }
                           else
                           {
                                cGvUnMatchedRecord.PerformCallback("CancelSlip~undefined~"+RecordID+ "~" + DPID + "~" +SlipType+ "~" + BenAcc + "~" + slipNo + "~" + EntryUser);
                           }
			            }
			            else if(truefalse == "false")
			            {
			               var data='Store this Instrunction in Memory For ReEntry'
			               var answer = confirm(data)
                           if (answer)
                           {
                                cGvUnMatchedRecord.PerformCallback("Restore~undefined~"+RecordID+ "~" + DPID + "~" + SlipType + "~" + BenAcc + "~" + slipNo + "~" + EntryUser);
                           }
                           else
                           {
                                cGvUnMatchedRecord.PerformCallback("Exclude~undefined~"+RecordID+ "~" + DPID + "~" +SlipType+ "~" + BenAcc + "~" + slipNo + "~" + EntryUser);
                           }
			            }
			            else
			            {
        			        
			            }
			        }
			     }
		    }
		   

		    function OnExcludeClick(s, e) {
		      if(e.buttonID == 'CustomBtnExclue') {
		            cGvUnMatchedRecord.PerformCallback("CustomBtnExcludeClick~"+e.visibleIndex);
		      }
		      if(e.buttonID == 'CustomBtnInclude') {
		            cGvUnMatchedRecord.PerformCallback("CustomBtnIncludeClick~"+e.visibleIndex);
		      }
            }
            
            function trim(stringToTrim) {
	            return stringToTrim.replace(/^\s+|\s+$/g,"");
             }
    </script>

</head>

<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
         <table class="TableMain100">
             <tr>
                 <td>
                    <div style="float:left">
                        &nbsp;</div>
                     <div >
                         &nbsp;<table width="95%">
                             <tr>
                                 <td colspan="3">
                                     <div class="EHEADER" style="text-align: center">
                                         <strong><span id="SpanHeader" style="color: #000099">Verify Delivery Instruction (UnMatched)</span></strong>&nbsp;</div>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="width: 5%; height: 11px; background-color: #b7ceec; text-align: left">
                     <dxe:ASPxDateEdit ID="dtentrydate" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                         EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="200px" OnValueChanged="dtentrydate_ValueChanged">
                         <dropdownbutton text="Enter Date">
                         </dropdownbutton>
                     </dxe:ASPxDateEdit>
                                 </td>
                                 <td style="vertical-align: top; width: 20%; height: 11px; background-color: #b7ceec;
                                     text-align: left">
                 <asp:Button ID="btnshow" Text="Show" runat="server" OnClick="btnshow_Click" CssClass="btn" /></td>
                                 <td style="vertical-align: top; width: 20%; height: 11px; background-color: #b7ceec;
                                     text-align: left">
                                             <asp:DropDownList ID="ddlExport" runat="server" Onchange="ddlExport_OnChange()" Width="100px">
                                                 <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                                                 <asp:ListItem Value="R">PDF</asp:ListItem>
                                             </asp:DropDownList></td>
                             </tr>
                         </table>
                 </div>
                 </td>
                
             </tr>
             <tr>
                 <td>
                     <dxtc:ASPxPageControl runat="server" ID="pageControl" ActiveTabIndex="1" ClientInstanceName="page" BackColor="#B7CEEC" Width="95%">
                         <ContentStyle>
                             <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px"></Border>
                         </ContentStyle>
                         <TabPages>
                             <dxtc:TabPage Text="Matched Entries">
                                 <ContentCollection>
                                     <dxw:ContentControl runat="server">
                                     </dxw:ContentControl>
                                 </ContentCollection>
                             </dxtc:TabPage>
                             <dxtc:TabPage Text="UnMatched Entries">
                                 <ContentCollection>
                                     <dxw:ContentControl runat="server">
                                         <div style="vertical-align: top;text-align:right;width:950px">
                                             &nbsp;</div>
                                           
                                         <dxwgv:ASPxGridView ID="GvUnMatchedRecord" ClientInstanceName="cGvUnMatchedRecord"
                                             runat="server" Width="1076px" KeyFieldName="id" OnHtmlEditFormCreated="GvUnMatchedRecord_HtmlEditFormCreated"
                                             OnRowUpdating="GvUnMatchedRecord_RowUpdating" AutoGenerateColumns="False" OnCancelRowEditing="GvUnMatchedRecord_CancelRowEditing" OnHtmlCommandCellPrepared="GvUnMatchedRecord_HtmlCommandCellPrepared" OnHtmlRowCreated="GvUnMatchedRecord_HtmlRowCreated" OnCustomCallback="GvUnMatchedRecord_CustomCallback">
                                             <ClientSideEvents CustomButtonClick="OnExcludeClick"  EndCallback="OnEndCallback" />
                                              <Styles>
                                                 <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FCA977">
                                                 </FocusedRow>
                                             </Styles>
                                             <Columns>
                                               <dxwgv:GridViewDataHyperLinkColumn FieldName="id" ReadOnly="True" VisibleIndex="0" FixedStyle="Left" Width="20px" Caption="#">
                                                    <PropertiesHyperLinkEdit NavigateUrlFormatString="javascript:ShowDetailPopup('{0}');"
                                                        ImageUrl="../images/popuparrow.jpg" Text="Popup">
                                                    </PropertiesHyperLinkEdit>
                                                </dxwgv:GridViewDataHyperLinkColumn> 
                                                 <dxwgv:GridViewCommandColumn VisibleIndex="1" FixedStyle="Left" Width="150px">
                                                     <EditButton Visible="True" />
                                                     <CellStyle BackColor="Salmon">
                                                     </CellStyle>
                                                       <CustomButtons>
                                                            <dxwgv:GridViewCommandColumnCustomButton ID="CustomBtnInclude" Text="Include">
                                                            </dxwgv:GridViewCommandColumnCustomButton>
                                                            <dxwgv:GridViewCommandColumnCustomButton ID="CustomBtnExclue" Text="Exclude">
                                                            
                                                            </dxwgv:GridViewCommandColumnCustomButton>
                                                      </CustomButtons>
                                                 </dxwgv:GridViewCommandColumn>
                                                 <dxwgv:GridViewDataTextColumn FieldName="AcceptReject" VisibleIndex="1" FixedStyle="Left"
                                                     Visible="False" Width="75px">
                                                 </dxwgv:GridViewDataTextColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="SlipNumber" VisibleIndex="2" FixedStyle="Left"
                                                     Width="50px" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                                                     <CellStyle BackColor="#FFFFD6">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="BenIDName" VisibleIndex="3" FixedStyle="Left"
                                                     Width="200px">
                                                     <CellStyle Wrap="False" BackColor="#FFFFD6">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="TransactionType" VisibleIndex="4" FixedStyle="Left"
                                                     Width="150px" GroupIndex="1" SortIndex="1" SortOrder="Ascending">
                                                     <CellStyle Wrap="False" BackColor="#FFFFD6">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="MarketType" VisibleIndex="5" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="SettlementNumber" VisibleIndex="6" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="OtherDPID" VisibleIndex="7" Width="350px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="OtherBenIDName" VisibleIndex="8" Width="200px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="OtherCMBPID" VisibleIndex="9" Width="200px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="CCCMID" VisibleIndex="10" Width="250px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="OtherMarketType" VisibleIndex="11" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="OtherSettlementNumber" VisibleIndex="12" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="ISIN" VisibleIndex="13" Width="200px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="Quantity" VisibleIndex="14" Width="50px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="Consideration" VisibleIndex="15" Width="50px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="TransactionDate" VisibleIndex="16" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="ExecutionDate" VisibleIndex="17" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="EntryUserRole" VisibleIndex="18" Width="200px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="CCCMID" VisibleIndex="19" Visible="False" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="ClientID" VisibleIndex="20" Visible="False"
                                                     Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="NsdlOffline_MarketType" VisibleIndex="21" Visible="False"
                                                     Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="NsdlOffline_OtherMarketType" VisibleIndex="22"
                                                     Visible="False" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="NsdlOffline_TransactionType" VisibleIndex="23"
                                                     Visible="False" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="SourceCCCMID" VisibleIndex="24" Visible="False"
                                                     Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="id" VisibleIndex="25" Visible="False" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="TransferReasonCode" VisibleIndex="26" Visible="False" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn FieldName="TransferReasonPurpose" VisibleIndex="27" Visible="False" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                                 <dxwgv:GridViewDataColumn VisibleIndex="28" Visible="False" Width="100px">
                                                     <CellStyle Wrap="False">
                                                     </CellStyle>
                                                 </dxwgv:GridViewDataColumn>
                                             </Columns>
                                             <Settings ShowGroupPanel="True" ShowHorizontalScrollBar="True" />
                                            <SettingsBehavior AllowFocusedRow="True" />
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
                                        <td>
                                           Trans. Reason
                                        </td>
                                        <td>
                                            <dxe:aspxcombobox id="ComboTransRsn" runat="server" clientinstancename="cComboTransRsn" Font-Size="X-Small" >
                                                <clientsideevents  selectedindexchanged="OnRsnSelectedIndexChanged" />
                                            </dxe:aspxcombobox>
                                            <%-- oncallback="ComboTransRsn_Callback" <asp:TextBox ID="TxtTransRsn" runat="server" Text='<%# Bind("TransferReasonCode") %>' Width="200px"  Font-Size="X-Small"></asp:TextBox>--%>
                                        </td>
                                        <td id="tdConsideration">
                                            Consideration
                                        </td>
                                        <td id="tdConsiderationTxt">
                                            <asp:TextBox runat="server" ID="TxtConsideration" Text='<%# Bind("Consideration") %>' Width="200px"  Font-Size="X-Small"> </asp:TextBox>
                                        </td>
                                        <td id="tdRsn">
                                            Reason
                                        </td>
                                        <td id="tdRsnTxt">
                                            <asp:TextBox runat="server" ID="TxtTransRsnPrps" Text='<%# Bind("TransferReasonPurpose") %>' Width="200px"  Font-Size="X-Small"> </asp:TextBox>
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
                                             <SettingsEditing Mode="EditForm" />
                                         </dxwgv:ASPxGridView>
                                     </dxw:ContentControl>
                                 </ContentCollection>
                             </dxtc:TabPage>
                         </TabPages>
                         <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                           
	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                           
	                                            }"></ClientSideEvents>
                         <LoadingPanelStyle ImageSpacing="6px">
                         </LoadingPanelStyle>
                         
                     </dxtc:ASPxPageControl>
                      <dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="popup" Width="392px"
                        Height="289px" AllowDragging="True" AllowResize="True" PopupHorizontalAlign="RightSides" PopupHorizontalOffset="100" PopupVerticalAlign="Below" PopupVerticalOffset="100" ShowSizeGrip="True" CloseAction="CloseButton" HeaderText="Screen 2">
                        <ContentCollection>
                            <dxpc:PopupControlContentControl runat="server">
                            </dxpc:PopupControlContentControl>
                        </ContentCollection>
                    </dxpc:ASPxPopupControl>
                    
                 </td>
             </tr>
                <tr>
                    <td>
                        <dxpc:ASPxPopupControl ID="ExcludePopUp" runat="server" HeaderText="Confirmation" ClientInstanceName="cExcludePopUp">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                    <table class="style1">
                                        <tr>
                                            <td colspan="2">
                                                Are you sure?
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dxe:ASPxButton ID="btnYes" runat="server" AutoPostBack="False" Text="Yes">
                                                    <ClientSideEvents Click="function (s, e) { cGvUnMatchedRecord.UpdateEdit(); ExcludePopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td>
                                                <dxe:ASPxButton ID="btnNo" runat="server" AutoPostBack="False" Text="No">
                                                    <ClientSideEvents Click="function (s, e) { cGvUnMatchedRecord.CancelEdit(); ExcludePopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </dxpc:PopupControlContentControl>
                            </ContentCollection>
                        </dxpc:ASPxPopupControl>
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
        <asp:HiddenField ID="hiddensettleto" runat="server" />
        <asp:Button ID="Button1" runat="server" BackColor="#DDECFE" BorderStyle="None" OnClick="Button1_Click" />
        </form>
</body>
</html>

