<%@ page language="C#" autoeventwireup="true" inherits="management_InterSettlementNSECM, App_Web_rtil2eyr" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inter Settlement</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

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
        function Page_Load_ForMrkt()
        {
            document.getElementById('tdMrktIncomingSAccount').style.display='none';
            document.getElementById('tdMrktIncomingSAccount1').style.display='none';
            document.getElementById('tdMrktIncomingSAccount2').style.display='none';
            document.getElementById('tdMrktOutgoingTarget').style.display='none';
            document.getElementById('tdMrktOutgoingTarget1').style.display='none';
            document.getElementById('tdMrktOutgoingTarget2').style.display='none';
        }
        function InterSettlementFunc(objID,objListFun,objEvent,ObjType)
        {
            if(document.getElementById('DDlTranType').value=='C')
                ajax_showOptions(objID,objListFun,objEvent,ObjType,'Main');
            else
                ajax_showOptions(objID,objListFun,objEvent,ObjType,'Sub');
        }
        function InterSettlementFuncForExchWise(objID,objListFun,objEvent,objType)
        {
            var ExchID=document.getElementById('HdnExchID').value;
            ajax_showOptions(objID,objListFun,objEvent,ExchID+'~'+objType,'Sub');
        }
        function InterSettlement(objID,objListFun,objEvent,ObjType)
        {
            var Scrip=document.getElementById('txtAdjScrip_hidden').value;
            ObjType=ObjType+'~'+Scrip
            ajax_showOptions(objID,objListFun,objEvent,ObjType,'Sub');
        }
        function InterSettlementFuncOnlyAcc(objID,objListFun,objEvent,ObjType)
        {
            ajax_showOptions(objID,objListFun,objEvent,ObjType,'Main');
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
        function CalcKeyCode(aChar) 
        {
          var character = aChar.substring(0,1);
          var code = aChar.charCodeAt(0);
          return code;
        }
        function checkNumber(val) 
        {          
          var strPass = val.value;
          var strLength = strPass.length;
          var lchar = val.value.charAt((strLength) - 1);
          var cCode = CalcKeyCode(lchar);

          /* Check if the keyed in character is a number
             do you want alphabetic UPPERCASE only ?
             or lower case only just check their respective
             codes and replace the 48 and 57 */

          if (cCode < 48 || cCode > 57 ) {
            var myNumber = val.value.substring(0, (strLength) - 1);
            val.value = myNumber;
          }
          return false;
        }
        function TransactionType(objValue)
        {
            if(objValue=="IS")
            {
                Show("TabInterSett");
                Hide("TabInComingOut");
                Hide("TabOutGoing");
                Hide("IdInterAccountTrans");
                Hide("IdActionAdjustment");
                Hide("tabInterExchange");
            }
            else if(objValue=="I")
            {
                Hide("TabInterSett");
                Show("TabInComingOut");
                Hide("TabOutGoing");
                Hide("IdInterAccountTrans");
                Hide("IdActionAdjustment");
                Hide("tabInterExchange");
            }
            else if(objValue=="O")
            {
                Hide("TabInterSett");
                Hide("TabInComingOut");
                Show("TabOutGoing");
                Hide("IdInterAccountTrans");
                Hide("IdActionAdjustment");
                Hide("tabInterExchange");
            }
            else if(objValue=="C")
            {
                Hide("TabInterSett");
                Hide("TabInComingOut");
                Hide("TabOutGoing");
                Show("IdInterAccountTrans");
                Hide("IdActionAdjustment");
                Hide("tabInterExchange");
            }
            else if(objValue=="ACAdj")
            {
                Hide("TabInterSett");
                Hide("TabInComingOut");
                Hide("TabOutGoing");
                Hide("IdInterAccountTrans");
                Show("IdActionAdjustment");
                Hide("tabInterExchange");
            }
            else if(objValue=="IExch")
            {
                Hide("TabInterSett");
                Hide("TabInComingOut");
                Hide("TabOutGoing");
                Hide("IdInterAccountTrans");
                Hide("IdActionAdjustment");
                Show("tabInterExchange");
            }
        }
        function Show(obj)
        {
            document.getElementById(obj).style.display="inline";
        }
        function Hide(obj)
        {
            document.getElementById(obj).style.display="none";
        }
        function Page_Load()
        {
            TransactionType('I');
            TargetAcc(document.getElementById('ddlTargetAc').value);
            TargetAccOut(document.getElementById('ddlSourceAcc').value);
            document.getElementById('txtISINID').disabled=true;
            document.getElementById('txtISINOutGoing').disabled=true;
        }
        function Page_Load1()
        {
            TransactionType(document.getElementById('DDlTranType').value);
            document.getElementById('txtISINID').disabled=true;
            document.getElementById('txtISINOutGoing').disabled=true;
        }
        function TargetAcc(obj)
        {
            var MarginPool=obj.split('~');
            if(MarginPool[3]=="[POOL]" || MarginPool[3]=="[PLPAYIN]" || MarginPool[3]=="[PLCUSA]" || MarginPool[3]=="[PLPAYOUT]" || MarginPool[3]=="[DUMMYADJ]" || MarginPool[3]=="[PLEPAY]")
            {
                Show('TrSett1');
                Show('TrSett2');
            }
            else
            {
                Hide('TrSett1');
                Hide('TrSett2');
            }
        }
        function TargetAccOut(obj)
        {
            var MarginPool=obj.split('~');
            if(MarginPool[3]=="[POOL]" || MarginPool[3]=="[PLPAYIN]" || MarginPool[3]=="[PLCUSA]" || MarginPool[3]=="[PLPAYOUT]" || MarginPool[3]=="[DUMMYADJ]" || MarginPool[3]=="[PLEPAY]")
            {
                Show('TdSettNo1');
                Show('TdSettNo2');
            }
            else
            {
                Hide('TdSettNo1');
                Hide('TdSettNo2');
            }
        }
        function ISINFunc(objID,objListFun,objEvent)
        {
            var ObjType=document.getElementById("txtScrip_hidden").value;
            ajax_showOptions(objID,objListFun,objEvent,ObjType,'Sub');
        }
        function ISINOutFunc(objID,objListFun,objEvent)
        {
            var ObjType=document.getElementById("txtScripOutGoing_hidden").value;
            ajax_showOptions(objID,objListFun,objEvent,ObjType,'Sub');
        }
        function InterSettlementScripFunc(objID,objListFun,objEvent,ObjType)
        {
            ajax_showOptions(objID,objListFun,objEvent,ObjType,'Main');
        }
        function keyVal(obj) {

          //  alert(obj);
        
		if(document.getElementById('DDlTranType').value=='C' && obj.substr(0,2).toUpperCase()=='CL')
              {
                 document.getElementById('btnCheckClientType').click();    
              }
  
            var Val=obj.split('~')
            if(Val[1].substr(0,2).toUpperCase()=='IN')
            {
                document.getElementById('txtScripOutGoing_hidden').value=Val[0];
                document.getElementById('txtScrip_hidden').value=Val[0];
                document.getElementById('txtISINID_hidden').value=Val[1];
                document.getElementById('txtISINOutGoing_hidden').value=Val[1];
                document.getElementById('txtISINID').value=Val[1];
                document.getElementById('txtISINOutGoing').value=Val[1];              
                document.getElementById('txtScripInterAcc_hidden').value=Val[0];      
                document.getElementById('txtAdjScrip_hidden').value=Val[0];   
                document.getElementById('txtInterExchangeProduct_hidden').value=Val[0];
                document.getElementById('txtInterExchangeISIN_hidden').value=Val[1];   
                document.getElementById('txtInterExchangeISIN').value=Val[1];   
                 document.getElementById('txtProduct_hidden').value=Val[0]; 
                 document.getElementById('txtISIN').value=Val[1];    
             }    
            if(Val[1]=='[POOL]' || Val[1]=='[PLPAYIN]' || Val[1]=='[PLCUSA]' || Val[1]=='[PLPAYOUT]'  || Val[1]=='[DUMMYADJ]' ||  Val[1]=='[PLEPAY]')
            {
                Show('TdAcAdjSett');
                Show('TdAcAdjSett1');
                document.getElementById('txtSelectedAccount_hidden').value=Val[0];
                document.getElementById('SettNumType').value=Val[1];
            }
            else
            {
                Hide('TdAcAdjSett');
                Hide('TdAcAdjSett1');
                document.getElementById('txtSelectedAccount_hidden').value=Val[0];
                document.getElementById('SettNumType').value=Val[1];
            }
            if(Val[2]=='Customer')
            {
                document.getElementById('txtAdjCustomerID_hidden').value=Val[0];
                document.getElementById('branchid').value=Val[1];
            }
        }        
        function afterInsert()
        {
            alert('Insert Successfully !!');
            parent.editwin.close();
        }
        function SourceInterAcc(obj)
        {
            var MarginPool=obj.split('~');
            if(MarginPool[3]=="[POOL]" || MarginPool[3]=="[PLPAYIN]" || MarginPool[3]=="[PLCUSA]" || MarginPool[3]=="[PLPAYOUT]" || MarginPool[3]=="[DUMMYADJ]" || MarginPool[3]=="[PLEPAY]")
            {
                Show('TdIntSSett');
                Show('TdIntSSett1');
            }
            else
            {
                Hide('TdIntSSett');
                Hide('TdIntSSett1');
            }
        }
        function TargetInterAcc(obj)
        {
            var MarginPool=obj.split('~');
            if(MarginPool[3]=="[POOL]" || MarginPool[3]=="[PLPAYIN]" || MarginPool[3]=="[PLCUSA]" || MarginPool[3]=="[PLPAYOUT]" || MarginPool[3]=="[DUMMYADJ]" || MarginPool[3]=="[PLEPAY]")
            {
                Show('TdIntTSett');
                Show('TdIntTSett1');
            }
            else
            {
                Hide('TdIntTSett');
                Hide('TdIntTSett1');
            }
        }
        function Validation()
        {
            var SettSource=document.getElementById('txtInterExchangeTargetSettlement').value;
            var SettTarget=document.getElementById('txtInterExchangeSourceSettlement').value;
            if(SettSource=='' || SettTarget=='')
            {
                alert('Settlement Number Required !!');
                return false;
            }
            else
                return true;
        }
        function ValidationInterSett()
        {
            var SettSource=document.getElementById('txtSettSource').value;
            var SettTarget=document.getElementById('txtSettTarget').value;
            if(SettSource=='' || SettTarget=='')
            {
                alert('Settlement Number Required !!');
                return false;
            }
            else
                return true;
        }
        function isNumberKey(e)      
            {         
                var keynum
                var keychar
                var numcheck
                if(window.event)//IE
                {
                    keynum = e.keyCode 
                    if(keynum>=48 && keynum<=57 || keynum==46)
                       {
                          return true;
                       }
                    else
                        {
                         alert("Please Insert Numeric Only");
                         return false;
                        }
                 } 
             
             else if(e.which) // Netscape/Firefox/Opera
               {
                   keynum = e.which  
                   if(keynum>=48 && keynum<=57 || keynum==46)
                         {
                          return true;
                         }
                         else
                         {
                         alert("Please Insert Numeric Only");
                         return false;
                         }     
                    }
            }
        FieldName='txtSave'
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
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
                      $get('UpdateProgress2').style.display = 'block'; 
                      $get('UpdateProgress3').style.display = 'block'; 
                      $get('UpdateProgress4').style.display = 'block'; 
                      $get('UpdateProgress5').style.display = 'block'; 
                      $get('UpdateProgress6').style.display = 'block'; 
                         
                   } 
                   function EndRequest(sender, args) 
                   {
                     $get('UpdateProgress1').style.display = 'none';   
                     $get('UpdateProgress2').style.display = 'none';
                     $get('UpdateProgress3').style.display = 'none';
                     $get('UpdateProgress4').style.display = 'none';
                     $get('UpdateProgress5').style.display = 'none';
                     $get('UpdateProgress6').style.display = 'none';                      
                   } 
            </script>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Transaction</span></strong>
                    </td>
                </tr>
            </table>
            <table class="TableMain100">
                <tr>
                    <td class="gridcellleft" style="text-align: right">
                        Transaction Type :
                    </td>
                    <td>
                        <asp:DropDownList ID="DDlTranType" runat="server" onchange="TransactionType(this.value)"
                            Width="184px">
                            <asp:ListItem Value="I">Client InComing</asp:ListItem>
                            <asp:ListItem Value="O">Client OutGoing</asp:ListItem>
                            <asp:ListItem Value="IS">Inter Settlement</asp:ListItem>
                            <asp:ListItem Value="C">Inter-Account Transfer</asp:ListItem>
                            <asp:ListItem Value="ACAdj">Corporate Action - SPLIT</asp:ListItem>
                           <%-- <asp:ListItem Value="ACAdj">Action Adjustment</asp:ListItem>--%>
                            <asp:ListItem Value="IExch">Inter Exchange</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="gridcellleft" style="width: 106px">
                        Transaction Date :
                    </td>
                    <td>
                        <dxe:ASPxDateEdit ID="dtTransaction" runat="server" Font-Size="10px" Width="206px"
                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True">
                            <ButtonStyle Width="13px">
                            </ButtonStyle>
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
            </table>
            <table class="TableMain100" id="TabInterSett" style="border: solid 1px blue">
                <tr>
                    <td class="gridcellleft">
                        Client :
                    </td>
                    <td>
                        <asp:TextBox ID="TxtClient" runat="server" Font-Size="10px" onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'Client')"
                            Width="211px"></asp:TextBox></td>
                    <td class="gridcellleft" style="width: 123px">
                        Product :
                    </td>
                    <td>
                        <asp:TextBox ID="txtProduct" runat="server" Font-Size="10px" onkeyup="InterSettlementScripFunc(this,'InterSettlementForDeliveryPosition',event,'Product')"
                            Width="140px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft" style="width: 106px">
                        ISIN :
                    </td>
                    <td>
                        <asp:TextBox ID="txtISIN" runat="server" Font-Size="10px" onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'ISIN')"
                            Width="140px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Account :
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSAccountInterSettlement" runat="server" Font-Size="10px"
                            Width="215px">
                        </asp:DropDownList>
                    </td>
                    <td class="gridcellleft">
                        Settlement Source :
                    </td>
                    <td>
                        <asp:TextBox ID="txtSettSource" runat="server" Font-Size="10px" onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'SettSource')"
                            Width="140px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft" style="width: 123px">
                        Settlement Target :
                    </td>
                    <td style="width: 234px">
                        <asp:TextBox ID="txtSettTarget" runat="server" Font-Size="10px" onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'SettSource')"
                            Width="140px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Quantity :
                    </td>
                    <td>
                        <asp:TextBox ID="txtQuantity" runat="server" Font-Size="10px" onKeyUp="javascript:checkNumber(this);"
                            Width="211px"></asp:TextBox>
                    </td>   
                    <td colspan="4">
                    </td>                 
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Remarks :
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="txtInterSettRemarks" runat="server" Font-Size="10px" TextMode="MultiLine" Width="804px" Height="85px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="txtSave" runat="server" Text="Save" Font-Size="10px" CssClass="btnUpdate"
                            Height="25px" Width="110px" OnClick="txtSave_Click" OnClientClick="javascript:return ValidationInterSett();" />
                    </td>
                    <td style="display: none" colspan="2">
                        <asp:HiddenField ID="TxtClient_hidden" runat="server" />
                        <asp:HiddenField ID="txtISIN_hidden" runat="server" />
                        <asp:HiddenField ID="txtProduct_hidden" runat="server" />
                        <asp:HiddenField ID="txtSettSource_hidden" runat="server" />
                        <asp:HiddenField ID="txtSettTarget_hidden" runat="server" />
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="txtSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <progresstemplate>
                                <div id='Div6' style='position: absolute; font-family: arial; font-size: 30; background-color: white;
                                    layer-background-color: white;'>
                                    <table border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Wait.While Processing....</strong></font></td>
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
            <table class="TableMain100" id="TabInComingOut" style="border: solid 1px blue">
                <tr>
                    <td class="gridcellleft">
                        Client :
                    </td>
                    <td style="width: 234px">
                        <asp:TextBox ID="txtClientID" runat="server" Font-Size="10px" Width="218px" onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'Client')"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Scrip :
                    </td>
                    <td style="width: 208px">
                        <asp:TextBox ID="txtScrip" runat="server" Font-Size="10px" Width="155px" onkeyup="InterSettlementScripFunc(this,'InterSettlementForDeliveryPosition',event,'Product')"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        ISIN :
                    </td>
                    <td>
                        <asp:TextBox ID="txtISINID" runat="server" Font-Size="10px" Width="155px" onkeyup="ISINFunc(this,'ISIN',event)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" id="tdMrktIncomingSAccount">
                        Source Account :
                    </td>
                    <td style="width: 234px"  id="tdMrktIncomingSAccount1">
                        <asp:DropDownList ID="ddlSourceAccount" runat="server" Font-Size="10px" Width="155px"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlSourceAccount_SelectedIndexChanged">
                            <asp:ListItem Value="MH">Margin/Holdback A/C</asp:ListItem>
                            <asp:ListItem Value="C">Client A/C</asp:ListItem>
                            <asp:ListItem Value="Own">Own A/C</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td colspan="2"  id="tdMrktIncomingSAccount2">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlSAccount" runat="server" Font-Size="10px" Width="275px">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlSourceAccount" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                    <td class="gridcellleft">
                        Quantity :
                    </td>
                    <td>
                        <asp:TextBox ID="txtQuantityIn" runat="server" Font-Size="10px" Width="155px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Target Account :
                    </td>
                    <td style="width: 234px">
                        <asp:DropDownList ID="ddlTargetAc" runat="server" Font-Size="10px" onchange="TargetAcc(this.value)"
                            Width="218px">
                        </asp:DropDownList>
                    </td>
                    <td class="gridcellleft">
                        Slip Number :
                    </td>
                    <td style="width: 208px">
                        <asp:TextBox ID="txtSlipNumber" runat="server" Font-Size="10px" Width="155px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft" style="width: 106px" id="TrSett1">
                        Settlement Number :
                    </td>
                    <td id="TrSett2">
                        <asp:TextBox ID="txtSettNumber" runat="server" Font-Size="10px" Width="155px" onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'SettSource')"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="width: 106px">
                        Remarks :
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="txtRemarks" runat="server" Font-Size="12px" Width="804px" Height="85px"
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 118px">
                        <asp:Button ID="btnSave" runat="server" Text="Save" Font-Size="10px" CssClass="btnUpdate"
                            Height="25px" Width="110px" OnClick="btnSave_Click" />
                    </td>
                    <td style="display: none" colspan="2">
                        <asp:HiddenField ID="txtClientID_hidden" runat="server" />
                        <asp:HiddenField ID="txtScrip_hidden" runat="server" />
                        <asp:HiddenField ID="txtISINID_hidden" runat="server" />
                        <asp:HiddenField ID="txtSettNumber_hidden" runat="server" />
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                            <triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                            </triggers>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <progresstemplate>
                                <div id='Div2' style='position: absolute; font-family: arial; font-size: 30; background-color: white;
                                    layer-background-color: white;'>
                                    <table border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Wait.While Processing....</strong></font></td>
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
            <table class="TableMain100" id="TabOutGoing" style="border: solid 1px blue">
                <tr>
                    <td class="gridcellleft">
                        Client :
                    </td>
                    <td style="width: 234px">
                        <asp:TextBox ID="txtClientOutGoing" runat="server" Font-Size="10px" Width="218px"
                            onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'Client')"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Scrip :
                    </td>
                    <td style="width: 208px">
                        <asp:TextBox ID="txtScripOutGoing" runat="server" Font-Size="10px" Width="155px"
                            onkeyup="InterSettlementScripFunc(this,'InterSettlementForDeliveryPosition',event,'Product')"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        ISIN :
                    </td>
                    <td>
                        <asp:TextBox ID="txtISINOutGoing" runat="server" Font-Size="10px" Width="155px" onkeyup="ISINOutFunc(this,'ISIN',event)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Source Account :
                    </td>
                    <td style="width: 234px">
                        <asp:DropDownList ID="ddlSourceAcc" runat="server" Font-Size="10px" onchange="TargetAccOut(this.value)"
                            Width="218px">
                        </asp:DropDownList>
                    </td>
                    <td class="gridcellleft">
                        Slip Number :
                    </td>
                    <td style="width: 208px">
                        <asp:TextBox ID="txtSlipNo" runat="server" Font-Size="10px" Width="155px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft" style="width: 106px" id="TdSettNo1">
                        Settlement Number :
                    </td>
                    <td id="TdSettNo2">
                        <asp:TextBox ID="txtSettNo" runat="server" Font-Size="10px" Width="155px" onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'SettSource')"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" id="tdMrktOutgoingTarget">
                        Target Account :
                    </td>
                    <td style="width: 234px" id="tdMrktOutgoingTarget1">
                        <asp:DropDownList ID="ddlTargetAcc" runat="server" Font-Size="10px" Width="155px"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlTargetAcc_SelectedIndexChanged">
                            <asp:ListItem Value="MH">Margin/Holdback A/C</asp:ListItem>
                            <asp:ListItem Value="C">Client A/C</asp:ListItem>
                            <asp:ListItem Value="Own">Own A/C</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td colspan="2" id="tdMrktOutgoingTarget2">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddltarget" runat="server" Font-Size="10px" Width="275px">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlTargetAcc" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                    <td class="gridcellleft">
                        Quantity :
                    </td>
                    <td>
                        <asp:TextBox ID="txtOutgoingQuantity" runat="server" Font-Size="10px" Width="155px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="width: 106px">
                        Remarks :
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="txtOutgoingRemarks" runat="server" Font-Size="12px" Width="804px"
                            Height="85px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 118px">
                        <asp:Button ID="btnSaveOutgoing" runat="server" Text="Save" Font-Size="10px" CssClass="btnUpdate"
                            Height="25px" Width="110px" OnClick="btnSaveOutgoing_Click" />
                    </td>
                    <td style="display: none" colspan="2">
                        <asp:HiddenField ID="txtClientOutGoing_hidden" runat="server" />
                        <asp:HiddenField ID="txtScripOutGoing_hidden" runat="server" />
                        <asp:HiddenField ID="txtISINOutGoing_hidden" runat="server" />
                        <asp:HiddenField ID="txtSettNo_hidden" runat="server" />
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSaveOutgoing" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <progresstemplate>
                                <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; background-color: white;
                                    layer-background-color: white;'>
                                    <table border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Wait.While Processing....</strong></font></td>
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
            <table class="TableMain100" id="IdInterAccountTrans" style="border: solid 1px blue">
                <tr>
                    <td class="gridcellleft">
                        Client :
                    </td>
                    <td style="width: 234px">
                        <asp:TextBox ID="txtClientInterAcc" runat="server" Font-Size="10px" Width="218px"
                            onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'Client')"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Scrip :
                    </td>
                    <td style="width: 208px">
                        <asp:TextBox ID="txtScripInterAcc" runat="server" Font-Size="10px" Width="155px"
                            onkeyup="InterSettlementScripFunc(this,'InterSettlementForDeliveryPosition',event,'Product')"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        ISIN :
                    </td>
                    <td>
                        <asp:TextBox ID="txtISINInterAcc" runat="server" Font-Size="10px" Width="155px" onkeyup="ISINFunc(this,'ISIN',event)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Source Account :
                    </td>
                   <td style="width: 234px">
                        <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlSourceAccountInterAcc" runat="server" Font-Size="10px" onchange="SourceInterAcc(this.value)"
                                    Width="218px">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnCheckClientType" EventName="Click"></asp:AsyncPostBackTrigger>
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                    <td class="gridcellleft" id="TdIntSSett">
                        Settl. Number(S) :
                    </td>
                    <td id="TdIntSSett1">
                        <asp:TextBox ID="txtInterAccSourceSettNum" runat="server" Font-Size="10px" Width="155px"
                            onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'SettSource')"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Quantity :
                    </td>
                    <td>
                        <asp:TextBox ID="txtQuantityInterAcc" runat="server" Font-Size="10px" Width="155px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Target Account :
                    </td>
                   <td>
                      <asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                 <asp:DropDownList ID="ddlTargetAccountInterAcc" runat="server" Font-Size="10px" onchange="TargetInterAcc(this.value)"
                            Width="218px">
                        </asp:DropDownList>
                                
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnCheckClientType" EventName="Click"></asp:AsyncPostBackTrigger>
                            </Triggers>
                        </asp:UpdatePanel>
                      
                    </td>
                    <td class="gridcellleft" id="TdIntTSett">
                        Settl. Number(T) :
                    </td>
                    <td id="TdIntTSett1">
                        <asp:TextBox ID="txtInterAccTargetSettNum" runat="server" Font-Size="10px" Width="155px"
                            onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'SettSource')"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Slip Number :
                    </td>
                    <td style="width: 208px">
                        <asp:TextBox ID="txtSlipNumberIntAcc" runat="server" Font-Size="10px" Width="155px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="width: 106px">
                        Remarks :
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="txtRemarksIntAcc" runat="server" Font-Size="12px" Width="804px"
                            Height="85px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 118px">
                        <asp:Button ID="btnIntAcc" runat="server" Text="Save" Font-Size="10px" CssClass="btnUpdate"
                            Height="25px" Width="110px" OnClick="btnIntAcc_Click" />
                    </td>
                    <td style="display: none" colspan="2">
 <asp:HiddenField ID="txtClientType" runat="server" />
                        <asp:HiddenField ID="txtClientInterAcc_hidden" runat="server" />
                        <asp:HiddenField ID="txtScripInterAcc_hidden" runat="server" />
                        <asp:HiddenField ID="txtISINInterAcc_hidden" runat="server" />
                        <asp:HiddenField ID="txtInterAccSourceSettNum_hidden" runat="server" />
                        <asp:HiddenField ID="txtInterAccTargetSettNum_hidden" runat="server" />
 <asp:Button ID="btnCheckClientType" runat="server" Text="btnCheckClientType" OnClick="btnCheckClientType_Click" />
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnIntAcc" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="UpdateProgress4" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <progresstemplate>
                                <div id='Div3' style='position: absolute; font-family: arial; font-size: 30; background-color: white;
                                    layer-background-color: white;'>
                                    <table border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Wait.While Processing....</strong></font></td>
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
            <table class="TableMain100" id="IdActionAdjustment" style="border: solid 1px blue">
                <tr>
                    <td class="gridcellleft">
                        Customer Name :
                    </td>
                    <td>
                        <asp:TextBox ID="txtAdjCustomerID" runat="server" Font-Size="10px" onkeyup="InterSettlementFuncOnlyAcc(this,'InterSettlementForISINAccounts',event,'ClientAdj')"
                            Width="143px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Scrip :
                    </td>
                    <td>
                        <asp:TextBox ID="txtAdjScrip" runat="server" Font-Size="10px" onkeyup="InterSettlementFunc(this,'InterSettlementForISINAccounts',event,'Product')"
                            Width="143px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Old ISIN :
                    </td>
                    <td>
                        <asp:TextBox ID="txtOldISIN" runat="server" Font-Size="10px" onkeyup="InterSettlement(this,'InterSettlementForISINAccounts',event,'ISINOld')"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        New ISIN :
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewISIN" runat="server" Font-Size="10px" onkeyup="InterSettlement(this,'InterSettlementForISINAccounts',event,'ISINNew')"
                            Width="142px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Record Date :
                    </td>
                    <td>
                        <dxe:ASPxDateEdit ID="dtRecordDate" runat="server" Font-Size="10px" UseMaskBehavior="True"
                            EditFormat="Custom" Width="150px">
                        </dxe:ASPxDateEdit>
                    </td>
                    <td class="gridcellleft">
                        Conversion Rate :
                    </td>
                    <td>
                        <asp:TextBox ID="txtRate1" runat="server" Font-Size="10px" Width="28px" Onkeypress="javascript:return isNumberKey(event);"></asp:TextBox>
                        :
                        <asp:TextBox ID="txtRate2" runat="server" Font-Size="10px" Width="28px" Onkeypress="javascript:return isNumberKey(event);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Selected Account :
                    </td>
                    <td>
                        <asp:TextBox ID="txtSelectedAccount" runat="server" Font-Size="10px" onkeyup="InterSettlementFuncOnlyAcc(this,'InterSettlementForISINAccounts',event,'AccountNameCheck')"
                            Width="228px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft" id="TdAcAdjSett">
                        Settlement :
                    </td>
                    <td id="TdAcAdjSett1">
                        <asp:TextBox ID="txtAcAdjSettNumber" runat="server" Font-Size="10px" onkeyup="InterSettlement(this,'InterSettlementForISINAccounts',event,'SettNumber')"
                            Width="142px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft" id="Td1">
                        Quantity :
                    </td>
                    <td>
                        <asp:TextBox ID="txtAcAdjQuantity" runat="server" Font-Size="10px" Width="101px"
                            Onkeypress="javascript:return isNumberKey(event);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Transfer Date :
                    </td>
                    <td colspan="5">
                        <dxe:ASPxDateEdit ID="CorporateAcTranDate" runat="server" Font-Size="10px" UseMaskBehavior="True"
                            EditFormat="Custom" Width="150px">
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Remarks :
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="txtAcAdjRemarks" runat="server" Font-Size="10px" Width="801px" Height="90px"
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnGenerate" runat="server" Text="Save" CssClass="btnUpdate" Height="25px"
                            Width="94px" OnClick="btnGenerate_Click" />
                        <asp:UpdatePanel ID="UpdatePanel40" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnGenerate" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="UpdateProgress5" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <progresstemplate>
                                <div id='Div4' style='position: absolute; font-family: arial; font-size: 30; background-color: white;
                                    layer-background-color: white;'>
                                    <table border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Wait.While Processing....</strong></font></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </progresstemplate>
                        </asp:UpdateProgress>
                    </td>
                    <td colspan="5">
                        <asp:HiddenField ID="txtAdjScrip_hidden" runat="server" />
                        <asp:HiddenField ID="txtOldISIN_hidden" runat="server" />
                        <asp:HiddenField ID="txtNewISIN_hidden" runat="server" />
                        <asp:HiddenField ID="txtSelectedAccount_hidden" runat="server" />
                        <asp:HiddenField ID="txtAdjCustomerID_hidden" runat="server" />
                        <asp:HiddenField ID="SettNumType" runat="server" />
                        <asp:HiddenField ID="branchid" runat="server" />
                    </td>
                </tr>
            </table>
            <table class="TableMain100" id="tabInterExchange" style="border: solid 1px blue">
                <tr>
                    <td class="gridcellleft">
                        Client :
                    </td>
                    <td>
                        <asp:TextBox ID="txtInterExchangeClient" runat="server" Font-Size="10px" onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'Client')"
                            Width="211px"></asp:TextBox></td>
                    <td class="gridcellleft" style="width: 123px">
                        Product :
                    </td>
                    <td>
                        <asp:TextBox ID="txtInterExchangeProduct" runat="server" Font-Size="10px" onkeyup="InterSettlementScripFunc(this,'InterSettlementForDeliveryPosition',event,'Product')"
                            Width="140px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft" style="width: 106px">
                        ISIN :
                    </td>
                    <td>
                        <asp:TextBox ID="txtInterExchangeISIN" runat="server" Font-Size="10px" onkeyup="InterSettlementFunc(this,'InterSettlementForDeliveryPosition',event,'ISIN')"
                            Width="140px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Source Segment :
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlInterExchangeSourceSegment" runat="server" Font-Size="10px"
                            Width="215px" AutoPostBack="True" OnSelectedIndexChanged="ddlInterExchangeSourceSegment_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="gridcellleft">
                        Source Account:
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlInterSegmentSourceAccount" runat="server" Font-Size="10px"
                                    Width="215px">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlInterExchangeSourceSegment" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                    <td class="gridcellleft" style="width: 123px">
                        Settlement :
                    </td>
                    <td style="width: 234px">
                        <asp:TextBox ID="txtInterExchangeSourceSettlement" runat="server" Font-Size="10px"
                            onkeyup="InterSettlementFuncForExchWise(this,'SettlementForExchSegmentWise',event,'S')"
                            Width="140px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Target Account:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlInterExchangeTargetAccount" runat="server" Font-Size="10px"
                            Width="215px">
                        </asp:DropDownList>
                    </td>
                    <td class="gridcellleft" style="width: 123px">
                        Settlement :
                    </td>
                    <td style="width: 234px">
                        <asp:TextBox ID="txtInterExchangeTargetSettlement" runat="server" Font-Size="10px"
                            onkeyup="InterSettlementFuncForExchWise(this,'SettlementForExchSegmentWise',event,'T')"
                            Width="140px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Quantity :
                    </td>
                    <td>
                        <asp:TextBox ID="txtInterExchangeQuantity" runat="server" Font-Size="10px" onKeyUp="javascript:checkNumber(this);"
                            Width="139px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Remarks:
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="txtInterExchangeRemarks" TextMode="MultiLine" runat="server" Height="76px" Width="802px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnInterExchange" runat="server" Text="Save" Font-Size="10px" CssClass="btnUpdate"
                            Height="25px" Width="110px" OnClientClick="javascript:return Validation();" OnClick="btnInterExchange_Click" />
                            
                    </td>
                    <td style="display: none" colspan="2">
                        <asp:HiddenField ID="txtInterExchangeClient_hidden" runat="server" />
                        <asp:HiddenField ID="txtInterExchangeProduct_hidden" runat="server" />
                        <asp:HiddenField ID="txtInterExchangeISIN_hidden" runat="server" />
                        <asp:HiddenField ID="txtInterExchangeSourceSettlement_hidden" runat="server" />
                        <asp:HiddenField ID="txtInterExchangeTargetSettlement_hidden" runat="server" />
                        <asp:HiddenField ID="HdnExchID" runat="server" />
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnInterExchange" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="UpdateProgress6" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <progresstemplate>
                                <div id='Div5' style='position: absolute; font-family: arial; font-size: 30; background-color: white;
                                    layer-background-color: white;'>
                                    <table border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Wait.While Processing....</strong></font></td>
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
