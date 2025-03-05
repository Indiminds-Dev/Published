<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_EmailLogReports, App_Web_tuwtz_6w" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <%-- <meta http-equiv="refresh" content="2" />--%>
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
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

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

    function Callheight()
        {
            height();
        } 
    function OnMoreInfoClick(keyValue) {
        
       var url='frmReport_EmailLogReportsDetails.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Email Details",'980px','520px',"Y");
   
    }

    function ShowHideFilter(obj)
    {
   // alert(obj);

        if(obj=="Delivered")
        {
          document.getElementById("lblDelivered").style.color="#FF0000";
          document.getElementById("lblPending").style.color="#00008B";
          document.getElementById("lblBounced").style.color="#00008B"; 
          document.getElementById("lblFailed").style.color="#00008B";
          
            document.getElementById("lblDeliveredT").style.color="#FF0000";
          document.getElementById("lblPendingT").style.color="#00008B";
          document.getElementById("lblBouncedT").style.color="#00008B"; 
          document.getElementById("lblFailedT").style.color="#00008B";
        }
        else if(obj=="Pending")
        {
        document.getElementById("lblDelivered").style.color="#00008B";
          document.getElementById("lblPending").style.color="#FF0000";
          document.getElementById("lblBounced").style.color="#00008B"; 
          document.getElementById("lblFailed").style.color="#00008B";
          
           document.getElementById("lblDeliveredT").style.color="#00008B";
          document.getElementById("lblPendingT").style.color="#FF0000";
          document.getElementById("lblBouncedT").style.color="#00008B"; 
          document.getElementById("lblFailedT").style.color="#00008B";
        }
        else if(obj=="Bounced")
        {
       document.getElementById("lblDelivered").style.color="#00008B";
          document.getElementById("lblPending").style.color="#00008B";
          document.getElementById("lblBounced").style.color="#FF0000"; 
          document.getElementById("lblFailed").style.color="#00008B";
          
            document.getElementById("lblDeliveredT").style.color="#00008B";
          document.getElementById("lblPendingT").style.color="#00008B";
          document.getElementById("lblBouncedT").style.color="#FF0000"; 
          document.getElementById("lblFailedT").style.color="#00008B";
        }
        else if(obj=="Failed")
        {
          document.getElementById("lblDelivered").style.color="#00008B";
          document.getElementById("lblPending").style.color="#00008B";
          document.getElementById("lblBounced").style.color="#00008B"; 
          document.getElementById("lblFailed").style.color="#FF0000";
          
          document.getElementById("lblDeliveredT").style.color="#00008B";
          document.getElementById("lblPendingT").style.color="#00008B";
          document.getElementById("lblBouncedT").style.color="#00008B"; 
          document.getElementById("lblFailedT").style.color="#FF0000";
        }
        else
        {
          document.getElementById("lblDelivered").style.color="#00008B";
          document.getElementById("lblPending").style.color="#00008B";
          document.getElementById("lblBounced").style.color="#00008B"; 
          document.getElementById("lblFailed").style.color="#00008B";
          
           document.getElementById("lblDelivered").style.color="#00008B";
          document.getElementById("lblPending").style.color="#00008B";
          document.getElementById("lblBounced").style.color="#00008B"; 
          document.getElementById("lblFailed").style.color="#00008B";
        }
         grid.PerformCallback(obj);
       
       
    } 
//    function callback()
//        {
//        var obj='R';
//        alert(obj);
//            grid.PerformCallback(obj);
//        } 
    function callheight(obj)
    {
        height();
        parent.CallMessage();
    }
    function OnContactInfoClick(keyValue,CompName)
    {
        var url='insurance_contactPerson.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Lead Name : "+CompName+"",'940px','450px',"Y");
    } 
       function CallAjax(obj1,obj2,obj3)
    { 
        var obj4=document.getElementById("ContctType").value;
        ajax_showOptions(obj1,obj2,obj3,obj4);
    } 
      FieldName=document.getElementById("btnGetReport")
      
    function ShowEmployeeFilterForm(obj)
    {
       // document.getElementById('txtName_hidden').value="";
        if(obj=='A')
        {
            document.getElementById('tdName').style.display="none";
            document.getElementById('txtName_hidden').style.display="none";
            document.getElementById('txtName').style.display="none";
            document.getElementById('txtName').value="";
            document.getElementById('txtName_hidden').value="";
            document.getElementById('Type').style.display="none";
            document.getElementById('TypeN').style.display="none";
          
        }
        if(obj=='S')
        {
            
            document.getElementById('txtName_hidden').style.display="inline";
            document.getElementById('txtName').style.display="inline";
            document.getElementById('tdName').style.display="inline";
             document.getElementById('Type').style.display="inline";
            document.getElementById('TypeN').style.display="inline";
        }
        
    }
    

    function CustomButtonClick(s, e) {
		      if(e.buttonID == 'CustomBtnsend') {
		        VisibleIndexE=e.visibleIndex;
		        alert (VisibleIndexE);
		       // s.GetRowValues(e.visibleIndex, 'ValueDate;TransactionDate;MaxLockDate', OnGetRowValuesOnEdit);
		      }
		      
            }
    
      function PageLoad()
    {
     
      //  document.getElementById('txtName_hidden').style.display="none";
     //   document.getElementById('txtName').style.display="none";
        ShowEmployeeFilterForm('A');
        
    } 
    
    function ChkSignature()
    {
          var checkbox=document.getElementById('chk_segment')
          
          if(checkbox.checked)
            {
             document.getElementById('tr_show').style.display="none";
             
            }
          else
            {
             
             document.getElementById('tr_show').style.display="inline";
             
            }
       }
    function OnGridFocusedRowChanged() 
    {
       // var noofrow=grid.GetSelectedRowCount().toString();
        
        grid.GetSelectedFieldValues('Emails_ID', OnGetRowValues);
        
    }
    function OnGetRowValues(values) 
    {
    //RowID = values;
   
        RowID = 'n';
        for(var j = 0; j < values.length; j ++) {
            if(RowID != 'n')
                RowID += ',' + values[j];
            else
                RowID = values[j];
        }
      
        document.getElementById('hdnfrequency1').value=RowID;
        
    }
    function OnAllCheckedChanged(s, e) {

  if (s.GetChecked())

     grid.SelectRows();

  else

     grid.UnselectRows();

}
//-->
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
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
                         
                   } 
                   function EndRequest(sender, args) 
                   {
                     $get('UpdateProgress1').style.display = 'none';                         
                   } 
            </script>

            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center; height: 20px;">
                        <strong><span style="color: #000099">Email Log Reports</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellspacing="1" cellpadding="2" style="background-color: #B7CEEC; border: solid 1px  #ffffff"
                            border="1">
                            <tr>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="txtFromDate" runat="server" EditFormat="Custom" Width="105px"
                                        UseMaskBehavior="True">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                        <DropDownButton Text="From">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="txtToDate" runat="server" Width="105px" EditFormat="Custom"
                                        UseMaskBehavior="True">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                        <DropDownButton Text="To">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td>
                                    Recipient:</td>
                                <td valign="bottom">
                                    <dxe:ASPxRadioButtonList ID="rbUser" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                        RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px">
                                        <Items>
                                            <dxe:ListEditItem Text="All" Value="A" />
                                            <dxe:ListEditItem Text="Specific" Value="S" />
                                        </Items>
                                        <ClientSideEvents ValueChanged="function(s, e) {ShowEmployeeFilterForm(s.GetValue());}" />
                                        <Border BorderWidth="0px" />
                                    </dxe:ASPxRadioButtonList>
                                </td>
                                <td class="gridcellleft">
                                    <asp:Button ID="btnGetReport" runat="server" Text="Show" CssClass="btnUpdate" Height="19px"
                                        Font-Size="10px" OnClick="btnGetReport_Click" />
                                    <asp:HiddenField ID="txtName_hidden" runat="server" />
                                    <asp:HiddenField ID="hdnfrequency1" runat="server" />
                                </td>
                                <td>
                                    <asp:Button ID="btnExport" runat="server" Text="Export" CssClass="btnUpdate" Height="19px"
                                        Font-Size="10px" OnClick="btnExport_Click" />
                                </td>
                                <td class="gridcellleft">
                                    <asp:Button ID="btnresend" runat="server" Text="Resend Selected Record(s)" CssClass="btnUpdate" Height="19px"
                                        Font-Size="10px" OnClick="btnresend_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete Selected Record(s)" CssClass="btnUpdate" Height="19px"
                                        Font-Size="10px" OnClick="btnDelete_Click" />
                                </td>
                                <td id="td_check" runat="server">
                                    All Segments :
                                    <%--<asp:CheckBox ID="chk_segment" runat="server" Checked="false" onclick="ChkSignature()"/>--%>
                                    <input id="chk_segment" type="checkbox" onclick="ChkSignature()" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="tr_show">
                    <td>
                        <table cellspacing="1" cellpadding="2" style="background-color: #B7CEEC; border: solid 1px  #ffffff"
                            border="1">
                            <tr id="Show" runat="server">
                                <td>
                                   
                                </td>
                                <td valign="bottom">
                                    <dxe:ASPxRadioButtonList ID="rdbsubscription" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                        RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px">
                                        <Items>
                                            <dxe:ListEditItem Text="Show All Mails" Value="A" />
                                            <dxe:ListEditItem Text="Show Only Systm Mails" Value="S" />
                                            <dxe:ListEditItem Text="Show All Except Systm Mails" Value="E" />
                                        </Items>
                                        <%--<ClientSideEvents ValueChanged="function(s, e) {ShowEmployeeFilterForm(s.GetValue());}" />
                                        <Border BorderWidth="0px" />--%>
                                    </dxe:ASPxRadioButtonList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td id="Type">
                                    Type:
                                </td>
                                <td id="TypeN">
                                    <asp:DropDownList ID="ContctType" runat="server" Width="120px">
                                        <asp:ListItem Text="Customer" Value="CL"></asp:ListItem>
                                        <asp:ListItem Text="NSDL Client" Value="ND"></asp:ListItem>
                                        <asp:ListItem Text="CDSL Client" Value="CD"></asp:ListItem>
                                        <asp:ListItem Text="Employee" Value="EM"></asp:ListItem>
                                        <asp:ListItem Text="Relationship Partner" Value="RA"></asp:ListItem>
                                        <asp:ListItem Text="Sub Broker" Value="SB"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td id="tdName" runat="server">
                                    &nbsp;Name:
                                </td>
                                <td id="tdName2" runat="server">
                                    <asp:TextBox ID="txtName" runat="server" Width="220px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="TrOnlySub1">
                    <td colspan="2">
                        <table>
                            <tr>
                                <td>
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
                                            <div id='Div2' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                                top: 10%; background-color: white; layer-background-color: white; height: 80;
                                                width: 150;'>
                                                <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
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
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <table class="TableMain100">
                                                <tr>
                                                    <td style="text-align: left; vertical-align: top">
                                                        <table>
                                                            <tr>
                                                                <td id="ShowFilter">
                                                                    <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                                        Show Filter</span></a>
                                                                </td>
                                                                <td id="Td1">
                                                                    <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                                                        All Records</span></a>
                                                                </td>
                                                                <td style="width: 200px;">
                                                                </td>
                                                                <td style="font-weight: bold; color: #000099;">
                                                                    [<a href="javascript:ShowHideFilter('Delivered');">
                                                                        <asp:Label ID="lblDeliveredT" runat="server" ForeColor="#00008B" Text="Delivered:"></asp:Label>
                                                                        <asp:Label ID="lblDelivered" runat="server" ForeColor="#00008B" Text="Label"></asp:Label></a>]
                                                                </td>
                                                                <td style="font-weight: bold; color: #000099;">
                                                                    [<a href="javascript:ShowHideFilter('Pending');">
                                                                        <asp:Label ID="lblPendingT" runat="server" ForeColor="#00008B" Text="Pending:"></asp:Label>
                                                                        <asp:Label ID="lblPending" runat="server" ForeColor="#00008B" Text="Label"></asp:Label></a>]
                                                                </td>
                                                                <td style="font-weight: bold; color: #000099;">
                                                                    [<a href="javascript:ShowHideFilter('Bounced');">
                                                                        <asp:Label ID="lblBouncedT" runat="server" ForeColor="#00008B" Text="Bounced:"></asp:Label>
                                                                        <asp:Label ID="lblBounced" runat="server" ForeColor="#00008B" Text="Label"></asp:Label></a>]
                                                                </td>
                                                                <td style="font-weight: bold; color: #000099;">
                                                                    [<a href="javascript:ShowHideFilter('Failed');"><asp:Label ID="lblFailedT" runat="server"
                                                                        ForeColor="#00008B" Text="Failed:"></asp:Label>
                                                                        <asp:Label ID="lblFailed" runat="server" ForeColor="#00008B" Text="Label"></asp:Label></a>]
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dxwgv:ASPxGridView ID="LeadGrid" runat="server" AutoGenerateColumns="False" KeyFieldName="Emails_ID"
                                                Width="100%" ClientInstanceName="grid" OnCustomCallback="LeadGrid_CustomCallback1"
                                                OnCustomJSProperties="LeadGrid_CustomJSProperties" OnCommandButtonInitialize="LeadGrid_CommandButtonInitialize"
                                                OnRowDeleting="LeadGrid_RowDeleting">
                                                <%--OnRowCommand="LeadGrid_RowCommand">--%>
                                                <ClientSideEvents CustomButtonClick="CustomButtonClick" ColumnResizing="function(s, e) {
	                                                        Callheight();
                                                        }" />
                                                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" ColumnResizeMode="NextColumn" />
                                                <Settings ShowGroupPanel="True" />
                                                <ClientSideEvents SelectionChanged="function(s, e) { OnGridFocusedRowChanged(); }" />
                                                <Columns>
                                                    <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" Width="50px" VisibleIndex="0">
                                                        <HeaderTemplate>
                                                            <dxe:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select all rows"
                                                                BackColor="White" OnInit="cbAll_Init">
                                                                <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                                                            </dxe:ASPxCheckBox>
                                                            <%-- <dxe:ASPxCheckBox ID="cbPage" runat="server" ClientInstanceName="cbPage" ToolTip="Select all rows within the page"
                                                        OnInit="cbPage_Init">
                                                        <ClientSideEvents CheckedChanged="OnPageCheckedChanged" />
                                                    </dxe:ASPxCheckBox>--%>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewCommandColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Emails_ID" ReadOnly="True" VisibleIndex="0"
                                                        Visible="False">
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="sendFrom" Caption="Sender Name" ReadOnly="True"
                                                        VisibleIndex="0">
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="RecepientsName" VisibleIndex="1">
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="RecipientsEmailID" ReadOnly="True" VisibleIndex="2">
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Subject" ReadOnly="True" VisibleIndex="3">
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Content" ReadOnly="True" VisibleIndex="3"
                                                        Visible="False">
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="RecipientType" ReadOnly="True" VisibleIndex="3"
                                                        Visible="False">
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Emails_CreateDateTime" Caption="Create Date"
                                                        ReadOnly="True" VisibleIndex="4">
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="SentDate" ReadOnly="True" VisibleIndex="5">
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Status" ReadOnly="True" VisibleIndex="6">
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <%-- <dxwgv:GridViewDataTextColumn FieldName="AttempNo" ReadOnly="True" VisibleIndex="3"
                                    Visible="False">
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>--%>
                                                    <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="7">
                                                        <DataItemTemplate>
                                                            <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                                                More Info...</a>
                                                        </DataItemTemplate>
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <HeaderTemplate>
                                                            More Info
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewCommandColumn VisibleIndex="8">
                                                        <DeleteButton Visible="True">
                                                        </DeleteButton>
                                                        <HeaderTemplate>
                                                            <span style="color: #000099; text-align: center;">Delete</span>
                                                        </HeaderTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewCommandColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Segment" FieldName="emails_segment" ReadOnly="True"
                                                        VisibleIndex="9">
                                                        <CellStyle HorizontalAlign="Left">
                                                        </CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <%--<dxwgv:GridViewDataTextColumn VisibleIndex="8">
                                                         <DataItemTemplate>
                                                         <asp:LinkButton ID="btn_show" runat="server" Text="Resend" CommandArgument='<%# Container.KeyValue %>' CommandName="res"> </asp:LinkButton>
                                                         </DataItemTemplate>
                                                         </dxwgv:GridViewDataTextColumn>--%>
                                                </Columns>
                                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                                                <Styles>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                    <FocusedGroupRow CssClass="gridselectrow">
                                                    </FocusedGroupRow>
                                                    <FocusedRow CssClass="gridselectrow">
                                                    </FocusedRow>
                                                </Styles>
                                                <SettingsPager NumericButtonCount="20" PageSize="10" ShowSeparators="True" AlwaysShowPager="True">
                                                    <FirstPageButton Visible="True">
                                                    </FirstPageButton>
                                                    <LastPageButton Visible="True">
                                                    </LastPageButton>
                                                </SettingsPager>
                                                <ClientSideEvents EndCallback="function(s, e) {
	callheight(s.cpHeight);
}" />
                                            </dxwgv:ASPxGridView>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnGetReport" EventName="Click"></asp:AsyncPostBackTrigger>
                            </Triggers>
                        </asp:UpdatePanel>
                </tr>
            </table>
            <asp:SqlDataSource ID="LeadGridDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="">
                <SelectParameters>
                    <asp:SessionParameter Name="userlist" SessionField="userchildHierarchy" Type="string" />
                </SelectParameters>
            </asp:SqlDataSource>
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
        </div>
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
