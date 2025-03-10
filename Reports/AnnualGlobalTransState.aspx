<%@ page language="C#" autoeventwireup="true" inherits="Reports_AnnualGlobalTransState, App_Web_w8tpuxyq" %>

<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- Area 1 : Client,Branch,Group Control -->
<!-- Area 2 : Client,Branch,Group Selection List Control -->
<!-- Area 3 : After 1,2 Selection Value Return and Assigned into hidden Field -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Annual Global Transaction Statement</title>
    <!--External Script-->
    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    <!--Ajax List Section-->
    <script type="text/javascript" src="../CentralData/JSScript/init.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <link type="text/css" href="../CentralData/CSS/GenericAjaxStyle.css" rel="Stylesheet" />
    <!--End Ajax List Section-->
    
    <!--Styles --> 
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    
    <!-- Inline Scripting Start-->
    <script language="javascript" type="text/javascript">
    FieldName='lstSlection'; ///For Ajax List Purpose
    //Area 1
    function Page_Load()///Call Into Page Load
    {
         HideShow('showFilter','H');
         fnddlGroup('1');
         Height(350,350);
    }
    function  fnddlGroup(obj)
   {
        if(isSelectFree())
        {
            if(obj=="2" || obj=="4")
            {
                HideShow('Td_Group','H');
                HideShow('Td_Branch','S');
                HideShow('Td_Clients','H');
            }
            else if(obj=="1")
            {
                HideShow('Td_Group','H');
                HideShow('Td_Branch','H');
                HideShow('Td_Clients','S');
            }

            else
            {
                HideShow('Td_Group','S');
                HideShow('Td_Branch','H');
                HideShow('Td_Clients','H');
                document.getElementById('btnhide').click();
            }
        }
        else
        {
            var cmb=document.getElementById('cmbsearchOption');
            var dd = document.getElementById('ddlGroup');
            for (var i = 0; i < dd.options.length; i++) {
                if (dd.options[i].text === cmb.value) {
                    dd.selectedIndex = i;
                    break;
                }
            }
            return false;
        }
   }
   function fngrouptype(obj)
   {
       if(obj=="0")
       {
         HideShow('td_allselect','H');
         alert('Please Select Group Type !');
       }
       else
       {
         HideShow('td_allselect','S');
       }
      
   }
   function fnClient(obj)
    {
         var cmb=document.getElementById('cmbsearchOption');
         var poa=document.getElementById('RdbClientPOA');
         if(obj=="a")
         {
            if(!poa.checked) HideShow("TrAcType","S"); else HideShow("TrAcType","H");
            setSelectFree();
         }
         else
         {  
            HideShow("TrAcType","H");
            if(cmb.value!="Clients")
            {
                if(!isSelectFree()) {
                document.getElementById('rdbClientALL').checked=true;
                HideShow("TrAcType","S");
                return false;  
            }
          }
          cmb.value='Clients';
          HideShow('showFilter');
         }
    }
    function fnBranch(obj)
      {
        if(obj=="a")
                setSelectFree();
             else
             {
                  if(!isSelectFree()) {
                  document.getElementById('RdbBranchAll').checked=true;
                  return false;  
             }
               if(document.getElementById('ddlGroup').value=="2")
               {
                document.getElementById('cmbsearchOption').value='Branch';
               }
               if(document.getElementById('ddlGroup').value=="4")
               {
                document.getElementById('cmbsearchOption').value='BranchGroup';
               }

              HideShow('showFilter');
         }
      }
     function fnGroup(obj)
      {
        if(obj=="a")
                setSelectFree();
             else
             {
                  if(!isSelectFree()) {
                  document.getElementById('RdbGroupAll').checked=true;
                  return false; 
              } 
              var cmb=document.getElementById('cmbsearchOption');
              cmb.value='Group';
              HideShow('showFilter');
         }
      }
      function isSelectFree()
        {
            var cmb=document.getElementById('cmbsearchOption');
            if(cmb.value!="None") {
	                alert("Please Select "+cmb.value+" First!!!");
	                return false;
	        } 
	      return true;
        }
        function setSelectFree(){
            var cmb=document.getElementById('cmbsearchOption');
            cmb.value='None';
            HideShow('showFilter','H');
        }
        
      // *Area 1////////////////////////////////////////////////////
      
      //Area 2
      function FunClientScrip(objID,objListFun,objEvent)
        {
          var cmbVal;
         
            if(document.getElementById('cmbsearchOption').value=="Clients")
            {
                if(document.getElementById('ddlGroup').value=="2" || document.getElementById('ddlGroup').value=="4")//////////////Group By  selected are branch
                {
                    if(document.getElementById('ddlGroup').value=="2")
                    {
                        if(document.getElementById('RdbBranchAll').checked==true)
                           {
                               cmbVal='ClientsBranch'+'~'+'ALL';
                           }
                       else
                           {
                               cmbVal='ClientsBranch'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Branch').value;
                           }
                    }
                    if(document.getElementById('ddlGroup').value=="4")
                    {
                       if(document.getElementById('RdbBranchAll').checked==true)
                           {
                               cmbVal='ClientsBranchGroup'+'~'+'ALL';
                           }
                       else
                           {
                               cmbVal='ClientsBranchGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_BranchGroup').value;
                           }
                    }
                }
                else if(document.getElementById('ddlGroup').value=="3")//////////////Group By selected are Group
                {
                   if(document.getElementById('RdbGroupAll').checked==true)
                       {
                           cmbVal='ClientsGroup'+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value;
                       }
                   else
                       {
                           cmbVal='ClientsGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Group').value;
                       }
               }
               else
               {
                    cmbVal='ClientsBranch'+'~'+'ALL';
               }
            }
            else 
            {
                cmbVal=document.getElementById('cmbsearchOption').value;
                cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
            }
          
            ajax_showOptions(objID,objListFun,objEvent,cmbVal);

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
            
                setSelectFree();
               
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
    
      //*Area 2//////////////////////////////////////////////////
      
      //Area 3
       function ReceiveServerData(rValue)
       {
            var j=rValue.split('~');
            if(j[0]=='Branch')
                document.getElementById('HiddenField_Branch').value = j[1];
            if(j[0]=='Group')
                document.getElementById('HiddenField_Group').value = j[1];
            if(j[0]=='Clients')
                document.getElementById('HiddenField_Client').value = j[1];
            if(j[0]=='BranchGroup')
                document.getElementById('HiddenField_BranchGroup').value = j[1];
        }
     //*Area 3////////////////////////////////////////////////////
        function btnPrint_Click()
        {
            HideShow("msgRpt","H");
            HideShow("LoadingDiv",'S');
            cCbpExportPanel.PerformCallback('PRINT');
        }
        function btnSend_Click()
        {
            HideShow("msgRpt","H");
            HideShow("LoadingDiv",'S');
            cCbpExportPanel.PerformCallback('MAIL');
        }
        function cCbpExportPanel_EndCallBack()
        {
           if(cCbpExportPanel.cpPrint!=null)
           {
               HideShow("LoadingDiv","H");
               HideShow("msgRpt","S");
               if(cCbpExportPanel.cpPrint=="PRINT")
                document.getElementById("btnExportPrint").click();
               else if(cCbpExportPanel.cpPrint=="MAIL")
                document.getElementById("btnExportMail").click();
               else if(cCbpExportPanel.cpPrint=="NOSIGN")
               {
                alert("Please Select Signature First!!!");
                HideShow("msgRpt","H");
               }
               else if(cCbpExportPanel.cpPrint=="NOREC")
               {
                    alert("No RECORD FOUND!!!");
                    HideShow("msgRpt","H");
               }
           }
        } 
        Page_Reset()
        {
            window.location="../Reports/AnnualGlobalTransState.aspx";
        }
   
   
    </script>

    <!-- Scripting End-->
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                        <strong><span id="SpanHeader" style="color: #000099">Annual Global Transaction Statement</span></strong></td>
                </tr>
            </table>
            <table style="float:left">
                <tr valign="top">
                    <!-- Area 1 -->
                    <td>
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Group By</td>
                                            <td>
                                                <asp:DropDownList ID="ddlGroup" runat="server" Width="100px" Font-Size="10px" onchange="fnddlGroup(this.value)">
                                                    <asp:ListItem Value="1">Clients</asp:ListItem>
                                                    <asp:ListItem Value="2">Branch</asp:ListItem>
                                                    <asp:ListItem Value="3">Group</asp:ListItem>
                                                    <asp:ListItem Value="4">BranchGroup</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td id="Td_Clients">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="RdbClientAll" runat="server" Checked="True" GroupName="a" onclick="fnClient('a')" />
                                                All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="RdbClientPOA" runat="server" GroupName="a" onclick="fnClient('a')" />
                                                POA
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="RdbClientSelected" runat="server" GroupName="a" onclick="fnClient('b')" />Selected
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="RdbClientAllBtSelected" runat="server" GroupName="a" onclick="fnClient('b')" />
                                                All But Selected
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td id="Td_Branch">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="RdbBranchAll" runat="server" Checked="True" GroupName="b" onclick="fnBranch('a')" />
                                                All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="RdbBranchSelected" runat="server" GroupName="b" onclick="fnBranch('b')" />Selected
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td id="Td_Group">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
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
                                                <asp:RadioButton ID="RdbGroupAll" runat="server" Checked="True" GroupName="c" onclick="fnGroup('a')" />
                                                All
                                                <asp:RadioButton ID="RdbGroupSelected" runat="server" GroupName="c" onclick="fnGroup('b')" />Selected
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="TrAcType">
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Account Type</td>
                                <td>
                                    <asp:DropDownList ID="ddlAcType" runat="server" Width="100px" Font-Size="10px">
                                        <asp:ListItem Value="R">Retail Accounts </asp:ListItem>
                                        <asp:ListItem Value="I">INST Accounts</asp:ListItem>
                                        <asp:ListItem Value="P">Pro Accounts</asp:ListItem>
                                        <asp:ListItem Value="A">ALL Accounts</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td style="display: none">
                                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                                    <asp:Button ID="btnhide" runat="server" Text="btnhide" OnClick="btnhide_Click" />
                                    <asp:HiddenField ID="txtHeader_hidden" runat="server" />
                                    <asp:HiddenField ID="txtFooter_hidden" runat="server" />
                                    <asp:HiddenField ID="HiddenField_Group" runat="server" />
                                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                                    <asp:HiddenField ID="HiddenField_BranchGroup" runat="server" />
                                    <asp:TextBox ID="txtdigitalName_hidden" runat="server" Width="300px"></asp:TextBox>
                                    <asp:Button ID="btnExportPrint" runat="server" Text="Button" OnClick="btnPrintRPT_Click" />
                                    <asp:Button ID="btnExportMail" runat="server" Text="Button" OnClick="btnExportMail_Click" />
                                    <dxcp:ASPxCallbackPanel ID="CbpExportPanel" runat="server" ClientInstanceName="cCbpExportPanel"
                                        OnCallback="CbpExportPanel_Callback">
                                        <PanelCollection>
                                            <dxp:panelcontent runat="server">
                                            </dxp:panelcontent>
                                        </PanelCollection>
                                        <ClientSideEvents EndCallback="cCbpExportPanel_EndCallBack" />
                                    </dxcp:ASPxCallbackPanel>
                                </td>
                            </tr>
                            <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="ChkIncFunds" Checked="true" runat="server"/>
                                            Include Funds/Charges/Other Adjustments
                                        </td>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="ChkIncChrgs" runat="server"/>
                                            Print Total Brokerage
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Use Header
                                        </td>
                                         <td>
                                            <asp:TextBox ID="txtHeader" runat="server" Width="279px" Font-Size="10px" onkeyup="ajax_showOptions(this,'GetHeaderFooter',event,'H')"></asp:TextBox>
                                        </td>
                                       
                                    </tr>
                                </table>
                            </td>
                        </tr>
                          <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Use Footer
                                        </td>
                                        <td >
                                           <asp:TextBox ID="txtFooter" runat="server" Width="279px" Font-Size="10px" onkeyup="ajax_showOptions(this,'GetHeaderFooter',event,'F')"></asp:TextBox>

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="ChkBothSidePrint" runat="server"/>
                                            Both Side Print
                                        </td>
                                         <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="ChkCompanyLogo" runat="server" Checked="true"/>
                                            Use Company Logo
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                         <%--<tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Add Signatory
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSignature" runat="server" Width="279px" Font-Size="10px" onkeyup="ajax_showOptions(this,'SearchByEmployeesWithSignature',event)"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>--%>
                          <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Print Date
                                        </td>
                                        <td class="gridcellleft">
                                            <dxe:ASPxDateEdit ID="DtPrintDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="120px" ClientInstanceName="DtPrintDate">
                                                <dropdownbutton text="Print Date">
                                                </dropdownbutton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                       
                                    </tr>
                                </table>
                            </td>
                            <tr>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblSigname" runat="server" Text="Signature : "></asp:Label>
                                        </td>
                                        <td id="C3_Row1_Col2">
                                            <asp:TextBox ID="txtdigitalName" runat="server" Width="300px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </tr>
                            <tr id="td_msg" runat="server">
                                <td>
                                    <asp:Label ID="Location" runat="server" Text="You Dont have Permission to send Report!!!"
                                        ForeColor="red" Font-Bold="true"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="float: left;padding-right:5px">
                                        <dxe:ASPxButton ID="btnPrint" runat="server" CssClass="btnUpdate" AutoPostBack="False"
                                            Height="5px" Text="Print" Width="110px" ClientInstanceName="cbtnPrint">
                                            <ClientSideEvents Click="function (s, e) {btnPrint_Click();}" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div>
                                        <dxe:ASPxButton ID="btnSend" runat="server" CssClass="btnUpdate" AutoPostBack="False"
                                            Height="5px" Text="Send Digitaly Signed Email" ClientInstanceName="cbtnSend">
                                            <ClientSideEvents Click="function (s, e) {btnSend_Click();}" />
                                        </dxe:ASPxButton>
                                    </div>
                                </td>
                            </tr>
                        
                        </table>
                    </td>
                    <!--*Area 1-->
                    
                    
                </tr>
            </table>
            <!-- Area 2 -->
            <table border="10" cellpadding="1" cellspacing="1" id="showFilter">
                <tr>
                    <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                        id="TdFilter">
                        <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
                        <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                            Enabled="false">
                            <asp:ListItem Selected="True">None</asp:ListItem>
                            <asp:ListItem>Clients</asp:ListItem>
                            <asp:ListItem>Branch</asp:ListItem>
                            <asp:ListItem>Group</asp:ListItem>
                            <asp:ListItem>BranchGroup</asp:ListItem>
                        </asp:DropDownList>
                        <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                            style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                style="color: #009900; font-size: 8pt;"> </span>
                    </td>
                </tr>
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
            </table>
            <!-- *Area 2 -->
        </div>
        
        <div id='LoadingDiv' style='display:none;position: absolute; font-family: arial; font-size: 30; left: 50%; top: 20%; background-color: white; layer-background-color: white; height: 80; width: 150;'>
            <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td height='25' align='center' bgcolor='#FFFFFF'>
                                    <img src='../images/progress.gif' width='18' height='18'></td>
                                <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                    <font size='1' face='Tahoma'><strong align='center'>Please Wait..</strong></font></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div id='msgRpt' style="display:none;position: absolute; font-family: arial; font-size: 30; left: 50%; top: 20%; background-color: white; 
        height: 80; width: 150;">
            Please Wait For PDF Generation.....
        </div>
        
    </form>
</body>
</html>
