<%@ page language="C#" autoeventwireup="true" inherits="management_InterAccountTransfer, App_Web_lgnajdkn" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>InterAccount Transfer</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    
     <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>

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
     groupvalue="";
        function Show(obj)
        {
            document.getElementById(obj).style.display='inline';
        }
        function Hide(obj)
        {
            document.getElementById(obj).style.display='none';
        }
        function AfterShow(obj)
        {  
            if(obj=='a')
            {
                Show('TrShow');
                Hide('TrShowAll');
                Show('TrFilter');
            }
//            New Work 02/12/2024
            else if(obj=='c')
                {
                    alert('Enter % of Source Account To Transfer can not be greater than 100%.');
                    Hide('TrShow');
                }
            else if(obj=='d')
                {
                    alert('Enter % of Source Account To Transfer can not be in decimal.');
                    Hide('TrShow');
                }
            else if(obj=='e')
                {
                    alert('Target A/C and Residual Balance Trasnfer A/C can not be same.');
                    Hide('TrShow');
                }
            else if(obj=='f')
                {
                    alert('Select any Residual Balance Transfer Account.');
                    document.getElementById('cmbResidualTargetAc').focus();
                    Hide('TrShow');
                }
            else if(obj=='g')
                {
                    alert('Source and Target Account can not be same.');
                    document.getElementById('cmbTargetAc').focus();
                    Hide('TrShow');
                }
//            End of New Work 02/12/2024
            else
                Hide('TrShow');
            height();
        }
        function ForFilter()
        {
            Hide('TrFilter');
            Show('TrShowAll');
            height();
        }
        function Page_Load()
        {
//            height();
//          //  SourceToTargetAc();
//            Hide('TdFilter');
//            Hide('TrShow');
//            Hide('TrFilter');
//            Hide('TdTarget');
//         
//           var FYE='<%=Session["FinYearEnd"]%>';
//           var FYS='<%=Session["FinYearStart"]%>';
//           cdtDate.SetDate(new Date(FYE));
//           cdtTransferDate.SetDate(new Date());
////           DevE_CompareDateToMax(cdtTransferDate,FYS,'Transfer Date Is Outside Of Financial Year !!');
//           
//           DevE_CompareDateToMax(cdtTransferDate,FYS);
//           
           
           height();
          //  SourceToTargetAc();
           Hide('TdFilter');
           Hide('TrShow');
           Hide('TrFilter');
           Hide('TdTarget');
//           New Work 02/12/2024
           document.getElementById('cmbResidualTargetAc').disabled = true;
           document.getElementById('cmbResidualTargetAc').value="O";
//           End of New Work 02/12/2024
           var FYE='<%=Session["FinYearEnd"]%>';
           var FYS='<%=Session["FinYearStart"]%>';
           var SDate='<%=Session["ServerDate"]%>';
           if(new Date(SDate)<new Date(FYS))        
                cdtTransferDate.SetDate(new Date(FYS));
           else if(new Date(SDate)>new Date(FYE))
                cdtTransferDate.SetDate(new Date(FYE));
        }
        function height()
        {
        
            if(document.body.scrollHeight>=500)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '500px';
            window.frameElement.Width = document.body.scrollWidth;
        }
        function SourceToTargetAc(valTarget)
        {
            var valSource=document.getElementById('cmbSourceAc').value;
//            New Work 02/12/2024            
//            if(valTarget==valSource)            
            var WhichTargetCurrency = document.getElementById('hdnTargetCurrency').value;
            var valTargetCurrency=document.getElementById('cmbTargetCurrency').value;
            if(valTargetCurrency==WhichTargetCurrency && valTarget==valSource)
//            End of New Work 02/12/2024
            {
                alert('You Can not Select Same Account !');
                document.getElementById('cmbTargetAc').value="0";
                Hide('TdTarget');
            }
            else if(valTarget=="O")
                Show('TdTarget');
            else
                Hide('TdTarget');
        }
//        New Work 02/12/2024
        function TargetCurrencyToTargetAc(valTargetCurrency)
        {
            var WhichTargetCurrency = document.getElementById('hdnTargetCurrency').value;
            var valTargetCurrency=document.getElementById('cmbTargetCurrency').value
            if(valTargetCurrency==WhichTargetCurrency)
            {
                document.getElementById('<%= txtSourceAmount.ClientID %>').disabled = false;
                document.getElementById('<%= txtSourceAmount.ClientID %>').value="100";
            }
            else
            {
                document.getElementById('<%= txtSourceAmount.ClientID %>').disabled = true;
                document.getElementById('<%= txtSourceAmount.ClientID %>').value="0";
                document.getElementById('cmbResidualTargetAc').disabled = true;
                document.getElementById('cmbResidualTargetAc').value="O";
            }
        }
        function checktxtSourceAmountValue() 
        {
            var SourceAmount = document.getElementById('<%= txtSourceAmount.ClientID %>');

            // Disable DropDownList if the TextBox is empty
            if (SourceAmount.value.trim() == "100") {
                document.getElementById('cmbResidualTargetAc').disabled = true;
                document.getElementById('cmbResidualTargetAc').value="O";
            } 
            else 
            {
//                alert('Select any Residual Balance Transfer Account.');
                document.getElementById('cmbResidualTargetAc').disabled = false;
//                document.getElementById('cmbResidualTargetAc').focus();
                document.getElementById('<%= txtSourceAmount.ClientID %>').focus();
            }
        }
//        End of New Work 02/12/2024
        function CallSubAccount(obj1,obj2,obj3)
        {               
            ajax_showOptions(obj1,obj2,obj3,null,'Main');
        }
         function FunClientScrip(objID,objListFun,objEvent)
        {
              var cmbVal;
//          if(groupvalue=="")
//          {
//               cmbVal=document.getElementById('cmbsearchOption').value;
//               cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
//          }
//          else
//          {
            if(document.getElementById('cmbsearchOption').value=="Clients")
            {
                if(document.getElementById('ddlGroup').value=="0")//////////////Group By  selected are branch
                {
                    if(document.getElementById('rdbranchAll').checked==true)
                       {
                           cmbVal=document.getElementById('cmbsearchOption').value+'Branch';
                           cmbVal=cmbVal+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value;
                           cmbVal=cmbVal+"SelectedSegmentID,"+'<%=Session["UserSegID"]%>';
                       }
                   else
                       {
                           cmbVal=document.getElementById('cmbsearchOption').value+'Branch';
                           cmbVal=cmbVal+'~'+'Selected'+'~'+groupvalue;
                       }
                }
               else //////////////Group By selected are Group
                {
                   if(document.getElementById('rdddlgrouptypeAll').checked==true)
                       {
                           cmbVal=document.getElementById('cmbsearchOption').value+'Group';
                           cmbVal=cmbVal+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value;
                           cmbVal=cmbVal+"SelectedSegmentID,"+'<%=Session["UserSegID"]%>';
                       }
                   else
                       {
                           cmbVal=document.getElementById('cmbsearchOption').value+'Group';
                           cmbVal=cmbVal+'~'+'Selected'+'~'+groupvalue;
                       }
               }
            }
            else
            {
                cmbVal=document.getElementById('cmbsearchOption').value;
                cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
            }
//          }         
          ajax_showOptions(objID,objListFun,objEvent,cmbVal);
        }
        function btnAddsubscriptionlist_click()
        {
            var userid = document.getElementById('txtsegselected');
            if(userid.value != '')
            {
                var ids = document.getElementById('txtsegselected_hidden');
                var listBox = document.getElementById('lstSuscriptions');
                var tLength = listBox.length;
                var no = new Option();
                no.value = ids.value;
                no.text = userid.value;
                listBox[tLength]=no;
                var recipient = document.getElementById('txtsegselected');
                recipient.value='';
            }
            else
                alert('Please search name and then Add!')
            var s=document.getElementById('txtsegselected');
            s.focus();
            s.select();
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
           for(i=listBoxSubs.options.length-1;i>=0;i--)
            {
                listBoxSubs.remove(i);
            }
            Hide('TdFilter');
	    }
	    function  fnddlGroup(obj)
       {
            if(obj=="0")
            {
                Hide('td_group');
                Show('td_branch');
            }
            else
            {
                Show('td_group');
                Hide('td_branch');
                var btn = document.getElementById('btnhide');
                btn.click();
            }
       }
       function AllSelct(obj,obj1)
          {
            var FilTer=document.getElementById('cmbsearchOption');
            if(obj!='a')
            {
                if(obj1=='C')
                    FilTer.value='Clients';
                else if(obj1=='B')    
                    FilTer.value='Branch';
                else if(obj1=='G')    
                    FilTer.value='Group';
                Show('TdFilter');
            }
            else
                Hide('TdFilter');
          }
          function fngrouptype(obj)
           {
               if(obj=="0")
               {
               Hide('td_allselect');
                alert('Please Select Group Type !');
               }
               else
               {
               Show('td_allselect');
               }
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
            function DeliverableValue(objVal,StockPrevVal)
            {
                if(parseFloat(StockPrevVal)<parseFloat(objVal.value))
                {
                    alert('You Can Transfer Maximum '+StockPrevVal+' Amount');
                    objVal.value=StockPrevVal;
                }
            }
            function SelectAll(id) 
            {
                var frm = document.forms[0];
                var val;
                for (i=0;i<frm.elements.length;i++) 
                {
                    if(frm.elements[i].type == "text")
                    {
                        val='';
                        val=frm.elements[i].value
                    }
                    if (frm.elements[i].type == "checkbox") 
                    {  
                        if(val!='')
                            frm.elements[i].checked = document.getElementById(id).checked;
                    }
                }
                SelectSingle(); 
            }
            function SelectSingle() 
            {
                 var gridview = document.getElementById('grdDematProcessing'); 
                var rCount = gridview.rows.length; 
                var SumAmt=0;
                for (i=2;i<rCount;i++) 
                {
                    var leni;                    
                    var a=new String(i)
                    if(a.length==1)
                       leni="0"+i;
                    else
                        leni=i;
                     var obj='grdDematProcessing'+'_ctl'+leni+'_'+'ChkDelivery';
                     var txtVal='grdDematProcessing'+'_ctl'+leni+'_'+'txtStock';
                     if(document.getElementById(obj).checked==true)
                     {
                        SumAmt = parseFloat(SumAmt)+parseFloat(document.getElementById(txtVal).value);
                     }                    
                }
                var footerLab;
                var a=new String(rCount)
                if(a.length==1)
                    footerLab="0"+rCount;
                else   
                    footerLab=rCount
                var FooterValue='grdDematProcessing'+'_ctl'+footerLab+'_'+'lbTransFerTotal'; 
                var NumberFor=intToFormat(SumAmt.toFixed(2));
                document.getElementById(FooterValue).innerText=NumberFor;        
            }
            //////////////For US Format////////
            function addCommas(nStr)
            {
	            nStr += '';
	            x = nStr.split('.');
	            x1 = x[0];
	            x2 = x.length > 1 ? '.' + x[1] : '';
	            var rgx = /(\d+)(\d{3})/;
	            while (rgx.test(x1)) {
		            x1 = x1.replace(rgx, '$1' + ',' + '$2');
	            }
	            return x1 + x2;
            }
            ////////////////End/////////
            /////////////For Indian Format///////////
            function intToFormat(nStr)
            {
             nStr += '';
             x = nStr.split('.');
             x1 = x[0];
             x2 = x.length > 1 ? '.' + x[1] : '';
             var rgx = /(\d+)(\d{3})/;
             var z = 0;
             var len = String(x1).length;
             var num = parseInt((len/2)-1);
         
              while (rgx.test(x1))
              {
                if(z > 0)
                {
                  x1 = x1.replace(rgx, '$1' + ',' + '$2');
                }
                else
                {
                  x1 = x1.replace(rgx, '$1' + ',' + '$2');
                  rgx = /(\d+)(\d{2})/;
                }
                z++;
                num--;
                if(num == 0)
                {
                  break;
                }
              }
             return x1 + x2;
            }
            ////////////End//////////

         FieldName='lstSuscriptions'
    </script>

    <script type="text/ecmascript">
        function ReceiveServerData(rValue)
        {
                 var j=rValue.split('~');
               
                if(j[0]=='Group')
                {
                   groupvalue=j[1];
                }
                if(j[0]=='Branch')
                {
                   groupvalue=j[1];
                }
                var btn = document.getElementById('btnhide');
                btn.click();
        }
        
        function DateChange(positionDate)
        {
            var FYS='<%=Session["FinYearStart"]%>';
            var FYE='<%=Session["FinYearEnd"]%>';
            var LFY='<%=Session["LastFinYear"]%>';
            DevE_CheckForFinYear(positionDate,FYS,FYE,LFY);
        
        
        }
        
        function PageLoad()
        {
//        alert('ss');
//           var FYE='<%=Session["FinYearEnd"]%>';
//           var FYS='<%=Session["FinYearStart"]%>';
//           cdtDate.SetDate(new Date(FYE));
////           cdtTransferdate.SetDate(new Date());
//           DevE_CompareDateToMax(cdtTransferdate,FYS,'Transfer Date Is Outside Of Financial Year !!');
//        
        
        
        }
        
        
        
        
        
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
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
                         
                   } 
                   function EndRequest(sender, args) 
                   {
                     $get('UpdateProgress1').style.display = 'none';                         
                   } 
        </script>

        <div id='Div1' style="position: absolute; left: 650px; top: 150px; visibility: hidden">
            <table border="1" class="TableMain100" style="width: 100; height: 35; border: 1;" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table border="1">
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
        <%--New Work 02/12/2024--%>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Inter-Account Transfers</span></strong>
                </td>
            </tr>
        </table>
        <%--End of New Work 02/12/2024--%>
        <table border="1" class="TableMain100">
            <tr id="TrShowAll">
                <td>
                    <table border="1">
                        <tr>
                            <td colspan="4">
                                <table border="1">
                                    <tr>
                                        <td class="gridcellleft">
                                            Source A/C:
                                        </td>
                                        <td>
                                            <%--New Work 02/12/2024--%>
                                            <%--<asp:DropDownList ID="cmbSourceAc" runat="server" Font-Size="10px" Width="188px">
                                            </asp:DropDownList>--%>
                                            <asp:DropDownList ID="cmbSourceAc" runat="server" Font-Size="10px" Width="188px" AutoPostBack="true" DataTextField="MainAccount_Name" DataValueField="MainAccount_AccountCode" AppendDataBoundItems="true" 
                                             OnSelectedIndexChanged="cmbSourceAc_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <%--End of New Work 02/12/2024--%>
                                        </td>
                                        <%--New Work 02/12/2024--%>
                                       <td class="gridcellleft">
                                            Target A/C:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmbTargetAc" runat="server" Font-Size="10px" Width="188px"
                                                onchange="SourceToTargetAc(this.value)">
                                            </asp:DropDownList>
                                        </td>
                                        <td id="TdTarget">
                                            <asp:TextBox ID="txtTargetAc" runat="server" Font-Size="10px" Width="184px" onkeyup="CallSubAccount(this,'InterAccountTransferOtherAccount',event)"></asp:TextBox>
                                            <asp:HiddenField ID="txtTargetAc_hidden" runat="server" />
                                        </td>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                            &nbsp;Target Currency</td>
                                        <td style="width: 218px;">
                                            <asp:DropDownList ID="cmbTargetCurrency" runat="server" Font-Size="10px" Width="188px"
                                                onchange="TargetCurrencyToTargetAc(this.value)">
                                            </asp:DropDownList>
                                        </td>
                                        
                                        <%--End of New Work 02/12/2024--%>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <table border="1">
                                    <tr>
                                        <td class="gridcellleft">
                                            Balance As On:
                                        </td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="dtDate" runat="server" ClientInstanceName="cdtDate" Font-Size="10px" UseMaskBehavior="True"
                                                EditFormat="Custom" EditFormatString="dd-MM-yyyy">
                                            <ClientSideEvents DateChanged="function(s,e){DateChange(cdtDate);}"></ClientSideEvents>    
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td class="gridcellleft">
                                            Transfer Date:
                                        </td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="dtTransferDate" runat="server" ClientInstanceName="cdtTransferDate" Font-Size="10px" UseMaskBehavior="True"
                                                EditFormat="Custom" EditFormatString="dd-MM-yyyy">
                                             <ClientSideEvents DateChanged="function(s,e){DateChange(cdtTransferDate);}"></ClientSideEvents>    
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            
                        </tr>
                        <tr>
                            <td colspan="4">
                                <table border="1">
                                    <tr>
                                        <td class="gridcellleft">
                                            Group By</td>
                                        <td>
                                            <asp:DropDownList ID="ddlGroup" runat="server" Width="80px" Font-Size="10px" onchange="fnddlGroup(this.value)">
                                                <asp:ListItem Value="0">Branch</asp:ListItem>
                                                <asp:ListItem Value="1">Group</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td colspan="2" id="td_branch">
                                            <table border="1">
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdbranchAll" runat="server" Checked="True" GroupName="a" onclick="AllSelct('a','B')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbranchSelected" runat="server" GroupName="a" onclick="AllSelct('b','B')" />Selected
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td id="td_group" style="display: none;" colspan="2">
                                            <table border="1">
                                                <tr>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="ddlgrouptype" runat="server" Font-Size="10px" onchange="fngrouptype(this.value)">
                                                                </asp:DropDownList>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click"></asp:AsyncPostBackTrigger>
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td id="td_allselect" style="display: none;">
                                                        <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="b"
                                                            onclick="AllSelct('a','G')" />
                                                        All
                                                        <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="b" onclick="AllSelct('b','G')" />Selected
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
                                Client :</td>
                            <td>
                                <table border="1">
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="c" onclick="AllSelct('a','C')" /></td>
                                        <td>
                                            All Client</td>
                                        <td>
                                            <asp:RadioButton ID="radPOAClient" runat="server" GroupName="c" onclick="AllSelct('a','C')" />
                                        </td>
                                        <td>
                                            POA Client</td>
                                        <td>
                                            <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="c" onclick="AllSelct('b','C')" /></td>
                                        <td>
                                            Selected Client</td>
                                    </tr>
                                </table>
                            </td>
                            <td style="display: none">
                                <span id="litSegment" runat="server" style="color: Maroon" visible="true"></span>
                            </td>
                            <td style="width: 100px">
                                <span id="litSegment112" runat="server" style="color: Maroon" visible="true"></span>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <table border="1">
                                <tr>
                                    <td class="gridcellleft">
                                        Transfer : 
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="radDebit" runat="server" GroupName="rD" />
                                    </td>
                                    <td class="gridcellleft">
                                        Debit
                                    </td>
                                     <td>
                                        <asp:RadioButton ID="radCredit" runat="server" GroupName="rD" Checked="true" />
                                    </td>
                                    <td class="gridcellleft">
                                        Credit
                                    </td>
                                </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <table border="1">
                                    <tr>
                                        <td class="gridcellleft">
                                            Consider Amount Greater Than Or Equal To :
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtStartAmount" Font-Size="10px" Width="130px" runat="server" Onkeypress="javascript:return isNumberKey(event);"></asp:TextBox>
                                        </td>
                                        <%--New Work 02/12/2024--%>
                                        <td class="gridcellleft">
                                            % Of Source Account Balance To Transfer :
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtSourceAmount" MaxLength="3" Text="100" Font-Size="10px" Width="130px" runat="server"
                                            onkeyup="checktxtSourceAmountValue()" Onkeypress="javascript:return isNumberKey(event);">
                                            </asp:TextBox>
                                        </td>
                                        <%--End of New Work 02/12/2024--%>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <%--New Work 02/12/2024--%>
                        <tr>
                            <td colspan="4">
                                <table border="1">
                                    <tr>
                                        <td class="gridcellleft">
                                            Residual Balance Trasnfer A/C :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmbResidualTargetAc" runat="server" Font-Size="10px" Width="188px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <%--End of New Work 02/12/2024--%>
                        <tr>
                            <td colspan="4">
                                <table border="1">
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnShow" runat="server" Text="Show" CssClass="btnUpdate" Height="24px"
                                                OnClick="btnShow_Click" Width="115px" />
                                        </td>
                                        <td style="text-align: center">
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                <ProgressTemplate>
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
                                                                                <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top" id="TdFilter">
                    <table border="1">
                        <tr>
                            <td>
                                <asp:TextBox ID="txtsegselected" runat="server" Width="128px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox><asp:HiddenField
                                    ID="txtsegselected_hidden" runat="server" />
                            </td>
                            <td id="TdFilter1" style="height: 23px">
                                <asp:DropDownList ID="cmbsearchOption" runat="server" Width="85px" Font-Size="11px"
                                    Enabled="false">
                                    <asp:ListItem>Clients</asp:ListItem>
                                    <asp:ListItem>Branch</asp:ListItem>
                                    <asp:ListItem>Group</asp:ListItem>
                                </asp:DropDownList>
                                <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                    style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a></td>
                        </tr>
                    </table>
                    <table border="1" cellpadding="0" cellspacing="0" id="TdSelect">
                        <tr>
                            <td>
                                <asp:ListBox ID="lstSuscriptions" runat="server" Font-Size="10px" Height="90px" Width="253px">
                                </asp:ListBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <table border="1" cellpadding="0" cellspacing="0">
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
                        <tr>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td id="TrFilter" colspan="4" style="text-align: right">
                    <span style="font-weight: bold; color: Blue; cursor: pointer" onclick="javascript:ForFilter();">
                        Filter </span>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="grdDematProcessing" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                ShowFooter="True" AllowSorting="true" AutoGenerateColumns="false" BorderStyle="Solid"
                                BorderWidth="2px" CellPadding="4" ForeColor="#0000C0" OnRowDataBound="grdDematProcessing_RowDataBound"
                                OnSorting="grdDematProcessing_Sorting" OnRowCreated="grdDematProcessing_RowCreated">
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                <Columns>
                                    <asp:TemplateField Visible="False">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSubAccID" runat="server" Text='<%# Eval("SubAccID")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Client Name" SortExpression="ClientName">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("ClientName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCredit1" runat="server" Text='<%# Eval("Credit1")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDebit" runat="server" Text='<%# Eval("Debit1")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transfer">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtStock" Font-Size="10px" Width="130px" runat="server" Text='<%# Eval("Credit") %>'
                                                Onkeypress="javascript:return isNumberKey(event);"></asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                             <asp:Label ID="lbTransFerTotal" runat="server"></asp:Label>                                            
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="False">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblBranchID" runat="server" Text='<%# Eval("BranchID")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="False">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCredit" runat="server" Text='<%# Eval("Credit")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="False">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDRCR" runat="server" Text='<%# Eval("DRCR")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ChkDelivery" runat="server" onclick="SelectSingle()" />
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="cbSelectAll" runat="server" />
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <%--Addition for Currency--%>
                                    <asp:TemplateField Visible="False">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbltBalance" runat="server" Text='<%# Eval("tBalance")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="False">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblrAccount" runat="server" Text='<%# Eval("rAccount")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="False">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblrBalance" runat="server" Text='<%# Eval("rBalance")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="False">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbltnarr" runat="server" Text='<%# Eval("tnarr")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                    BorderWidth="1px"></RowStyle>
                                <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                    Font-Bold="False"></HeaderStyle>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr id="TrShow">
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Transfer" CssClass="btnUpdate" Height="25px"
                        OnClick="btnSave_Click" Width="120px" />
                </td>
            </tr>
            <tr>
                <td style="display: none">
                    <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
                </td>
            </tr>
        </table>
        <%--New Work 02/12/2024--%>
        <asp:HiddenField ID="hdnTargetCurrency" runat="server" />
        <%--End of New Work 02/12/2024--%>
    </form>
</body>
</html>
