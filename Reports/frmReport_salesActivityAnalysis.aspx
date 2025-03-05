<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_salesActivityAnalysis, App_Web__-dtd0z2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList.Export" TagPrefix="dxwtl" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
       <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
    function SignOff()
    {
    window.parent.SignOff()
    }
      function height()
        {
           
            if(document.body.scrollHeight>=350)
        {
            window.frameElement.height = document.body.scrollHeight;
        }
        else
        {
            window.frameElement.height = '350px';
        }
        window.frameElement.widht = document.body.scrollWidht;
           
           
//            window.frameElement.height = document.body.scrollHeight;
//            window.frameElement.widht = document.body.scrollWidht;
        }
</script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
    <script language="javascript" type="text/javascript">
    FieldName='TxtStartDate';
    function frmOpenNewWindow1(location,v_height,v_weight)
    {
        var y=(screen.availHeight-v_height)/2;
        var x=(screen.availWidth-v_weight)/2;
        window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=no,resizable=no,dependent=no");       
    }
    function loadNotes(Obj)
    {
        var str = "../management/ShowHistory_Phonecall.aspx?id1="+Obj;
        frmOpenNewWindow1(str,400,900)
    }
</script>
<table class="TableMain100">
     <tr>
            <td class="EHEADER" style="text-align:center;" colspan="4">
                <strong><span style="color: #000099">Sales Activity Analysis</span></strong>
            </td>
        </tr> 
    <tr>
        <td>
            <table width="100%">
                <tr>
                        <td>
                            <asp:Panel ID="Panel2" BorderColor="white" BorderWidth="1px" runat="server" Width="100%">
                           
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                         <table>
                                <tr>
                                    <td class="gridcellleft">
                                        <dxe:ASPxDateEdit ID="TxtStartDate" runat="server" UseMaskBehavior="True" EditFormat="Custom" EditFormatString="dd MMMM yyyy">
                                                        <ButtonStyle Width="13px">
                                                        </ButtonStyle>
                                            <DropDownButton Text="From Date">
                                            </DropDownButton>
                                                    </dxe:ASPxDateEdit>
                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtStartDate"
                                            Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="gridcellleft" >
                                        <dxe:ASPxDateEdit ID="TxtEndDate" runat="server" UseMaskBehavior="True" EditFormat="Custom"  EditFormatString="dd MMMM yyyy">
                                                        <ButtonStyle Width="13px">
                                                        </ButtonStyle>
                                            <DropDownButton Text="To Date">
                                            </DropDownButton>
                                                    </dxe:ASPxDateEdit>
                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtEndDate"
                                            Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="gridcellright">
                                        <span style="color: #000099">Report Type:</span></td>
                                    <td class="gridcellleft">
                                        <dxe:ASPxRadioButtonList ID="RBReportType" runat="server" CssPostfix="BlackGlass" RepeatDirection="Horizontal" Height="2px" SelectedIndex="0" TextSpacing="3px">
                                            <Items>
                                                    <dxe:ListEditItem Text="Screen" Value="Screen" />
                                                    <dxe:ListEditItem Text="Print" Value="Print" />
                                            </Items>
                                            <ValidationSettings ErrorText="Error has occurred">
                                                <ErrorImage Height="14px" Width="14px" />
                                            </ValidationSettings>
                                            </dxe:ASPxRadioButtonList>
                                        </td>
                                        <td>
                                            <dxe:ASPxButton ID="btnShowReport" runat="server" Text="Show" Height="5px" Width="82px" OnClick="BtnReport_Click">
                                            </dxe:ASPxButton>
                                        </td>
                                </tr>
                               
                            </table>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                </tr>
                <tr id="CollapseAll" runat="server">
                     <td style="text-align: right; vertical-align:bottom">
                        <table id="tblExport" runat="server">
                             <tr>
                                <td style="text-align: right; vertical-align:bottom">
                                    <dxe:ASPxButton ID="btnExpandAll" runat="server" Text="Expand All" Height="20px" AutoPostBack="false" Font-Size="10px">
                                         <ClientSideEvents Click="function(s, e) {
                                                                  List.ExpandAll();
                                                                  }" />
                                    </dxe:ASPxButton>
                               </td>
                               <td style="text-align: center vertical-align:bottom">
                                    <dxe:ASPxButton ID="btnCollapsAll" runat="server" Text="Collaps All" Height="11px" AutoPostBack="false" Font-Size="10px">
                                         <ClientSideEvents Click="function(s, e) {
                                                                  List.CollapseAll();
                                                                  }" />
                                    </dxe:ASPxButton>
                               </td>
                               <td style=" vertical-align:bottom">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" ValueType="System.String" Height="17px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged" SelectedIndex="0" AutoPostBack="true" Font-Overline="False" Font-Size="10px">
                                         <ButtonStyle Width="13px">
                                         </ButtonStyle>
                                         <Items>
                                              <dxe:ListEditItem Text="Select" Value="" />
                                              <dxe:ListEditItem Text="Pdf" Value="Pdf" />
                                              <dxe:ListEditItem Text="Xls" Value="Xls" />
                                              <dxe:ListEditItem Text="Rtf" Value="Rtf" />
                                         </Items>
                                         <DropDownButton Text="Export" ToolTip="Export File">
                                         </DropDownButton>
                                    </dxe:ASPxComboBox>
                               </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="GridTree" runat="server">
                    <td>
                        <asp:Panel ID="Panel1" runat="server" Width="100%">                        
                        <dxwtl:ASPxTreeList ID="TvSalesActivityAnalyst" runat="server" ClientInstanceName="List" Width="100%" KeyFieldName="ID" ParentFieldName="ParentID">
                            <Styles>
                            </Styles>
                            <Settings SuppressOuterGridLines="True" GridLines="Both" ShowFooter="false" ShowGroupFooter="false" />
                            <Images>
                                <ExpandedButton Height="11px" Width="11px" />
                                <CustomizationWindowClose  Width="13px" />
                                <CollapsedButton  Width="11px" />
                            </Images>
                            <Columns>
                                <dxwtl:TreeListTextColumn Caption="Name" FieldName="LeadName" VisibleIndex="0">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="PhoneNo" FieldName="PhoneNo" VisibleIndex="1">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Visited" FieldName="Visited" VisibleIndex="2">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Phone FollowUp" FieldName="Phone FollowUp" VisibleIndex="3">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="Outcome" FieldName="Outcome" VisibleIndex="4">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="LeadId" FieldName="LeadId" VisibleIndex="5" Visible="false">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwtl:TreeListTextColumn>
                                <dxwtl:TreeListTextColumn Caption="History" VisibleIndex="6">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                     <DataCellTemplate >
                                         <a href="#" onclick="loadNotes('<%# Eval("LeadId") %>')">History</a>
                                     </DataCellTemplate>
                                </dxwtl:TreeListTextColumn>
                            </Columns>
                        </dxwtl:ASPxTreeList>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dxwtl:ASPxTreeListExporter ID="ASPxTreeListExporter1" runat="server">
            </dxwtl:ASPxTreeListExporter>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Start Date Required" ControlToValidate="TxtStartDate" Display="None" ValidationGroup="a"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="End Date Required" ControlToValidate="TxtEndDate" Display="None" ValidationGroup="a"></asp:RequiredFieldValidator>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="a" />
        </td>
    </tr>
</table>
    </div>
    </form>
</body>
</html>
