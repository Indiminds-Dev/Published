<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmreport_daily, App_Web_wttsrqio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList.Export" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>

            <script language="javascript" type="text/javascript">
    
       function SignOff()
        {
        window.parent.SignOff()
        }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function client_OnTreeNodeChecked()
        {
            var obj = window.event.srcElement;
            var treeNodeFound = false;
            var checkedState;
            if (obj.tagName == "INPUT" && obj.type == "checkbox") 
            {
                var treeNode = obj;
                checkedState = treeNode.checked;
                do
                {
                    obj = obj.parentElement;
                } while (obj.tagName != "TABLE")
                var parentTreeLevel = obj.rows[0].cells.length;
                var parentTreeNode = obj.rows[0].cells[0];
                var tables = obj.parentElement.getElementsByTagName("TABLE");
                var numTables = tables.length
                if (numTables >= 1)
                {
                    for (i=0; i < numTables; i++)
                        {
                        if (tables[i] == obj)
                        {
                            treeNodeFound = true;
                            i++;
                            if (i == numTables)
                            {
                            return;
                            }
                        }
                        if (treeNodeFound == true)
                        {
                            var childTreeLevel = tables[i].rows[0].cells.length;
                            if (childTreeLevel > parentTreeLevel)
                            {
                                var cell = tables[i].rows[0].cells[childTreeLevel - 1];
                                var inputs = cell.getElementsByTagName("INPUT");
                                inputs[0].checked = checkedState;
                            }
                            else
                            {
                            return;
                            }
                        }
                    }
                }
            }
        }
        function All_CheckedChanged()
        {
            document.getElementById("TrTreeExport").style.display = 'inline';
            document.getElementById("TdTree").style.display = 'none';
            document.getElementById("TdGrid").style.display = 'none';
            document.getElementById("TdExport").style.display = 'none';
            document.getElementById("TdButtonShow").style.display = 'inline';
        }
        function Specific_CheckedChanged()
        {
            document.getElementById("TrTreeExport").style.display = 'inline';
            document.getElementById("TdTree").style.display = 'inline';
            document.getElementById("TdGrid").style.display = 'none';
            document.getElementById("TdExport").style.display = 'none';
            document.getElementById("TdButtonShow").style.display = 'none';
        }
        function page_load()
        {
            document.getElementById("TrTreeExport").style.display = 'none';
            document.getElementById("TdGrid").style.display = 'none';
            document.getElementById("TdExport").style.display = 'none';
        }
        FieldName = 'TxtStartDate';
            </script>

            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Daily Activity</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td style="vertical-align: top">
                                                <asp:Panel ID="PnlDate" runat="server" BorderWidth="1px" BorderColor="white" Width="100%">
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="gridcellleft" style="">
                                                                <dxe:ASPxDateEdit ID="TxtStartDate" runat="server" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" NullText="To Date">
                                                                    <ButtonStyle Width="13px">
                                                                   </ButtonStyle>
                                                                      <DropDownButton Text="From Date">
                                                            </DropDownButton>
                                                        </dxe:ASPxDateEdit>
                                                                <%--<asp:TextBox id="TxtStartDate" tabIndex="19" runat="server" Width="100px" Font-Size="10px"></asp:TextBox>&nbsp;<asp:Image id="ImgStartDate" runat="server" ImageUrl="~/images/calendar.jpg"></asp:Image>--%>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtStartDate"
                                                                    Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="gridcellright" style="">
                                                                <span style="color: #000099">Select User:</span></td>
                                                            <td class="gridcellleft" style="text-align: left;">
                                                                <asp:RadioButton ID="All" runat="server" GroupName="a" Width="21px" Checked="True" /><asp:Label
                                                                    ID="lblAll" runat="server" Text="All"></asp:Label>
                                                                <asp:RadioButton ID="Specific" runat="server" GroupName="a" Width="18px" /><asp:Label
                                                                    ID="lblSelected" runat="server" Text="Specific"></asp:Label>
                                                            </td>
                                                            <td class="gridcellright" style="">
                                                                <span style="color: #000099">Report Type:</span></td>
                                                            <td class="gridcellleft" style="">
                                                                <dxe:ASPxRadioButtonList ID="RBReportType" runat="server" CssPostfix="BlackGlass"
                                                                    RepeatDirection="Horizontal" Height="2px" SelectedIndex="0" TextSpacing="3px">
                                                                    <Items>
                                                                        <dxe:ListEditItem Text="Screen" Value="Screen" />
                                                                        <dxe:ListEditItem Text="Print" Value="Print" />
                                                                    </Items>
                                                                    <ValidationSettings ErrorText="Error has occurred">
                                                                        <ErrorImage Height="14px" Width="14px" />
                                                                    </ValidationSettings>
                                                                </dxe:ASPxRadioButtonList>
                                                            </td>
                                                            <td class="gridcellleft" id="TdButtonShow">
                                                                <dxe:ASPxButton ID="btnShowReport" runat="server" Text="Show" Height="5px" Width="82px"
                                                                    OnClick="btnShowReport_Click" ValidationGroup="a">
                                                                    <Border BorderColor="White" />
                                                                </dxe:ASPxButton>
                                                            </td>
                                                            <td class="gridcellleft">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="vertical-align: bottom;">
                    <td style="text-align: right; padding: 0px">
            <table>
                <tr>
                    <td style="text-align: right; vertical-align:bottom;" id="TdExport">
                        <table id="Table1" runat="server" style="">
                            <tr style="vertical-align:bottom;">
                                
                                        <td style=" vertical-align:bottom">
                                            <table>
                                                <tr id="TrExpndCollapse">
                                                    <td style="text-align: right; ">
                                                       <dxe:ASPxButton ID="btnExpandAll" runat="server" Text="Expand All"   Height="20px" AutoPostBack="false" Font-Size="10px">
                                                           <ClientSideEvents Click="function(s, e) {
                                                                                    List.ExpandAll();
                                                                                    }" />
                                                      </dxe:ASPxButton>
                                                    </td>
                                                    <td style="text-align: center; ">
                                                        <dxe:ASPxButton ID="btnCollapsAll" runat="server" Text="Collaps All" Height="11px" AutoPostBack="false" Font-Size="10px">
                                                            <ClientSideEvents Click="function(s, e) {
                                                                                     List.CollapseAll();
                                                                                     }" />
                                                        </dxe:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="vertical-align:middle" >
                                            <dxe:ASPxComboBox ID="cmbExport" runat="server"  ValueType="System.String" Height="17px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged" SelectedIndex="0" AutoPostBack="true" Font-Overline="False" Font-Size="10px" Width="91px">
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
            </table>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top">
                        <table width="100%">
                            <tr>
                                <td style="vertical-align: top">
                                    <asp:Panel ID="PnlGrid" runat="server" BorderColor="blue" BorderWidth="0px" Width="100%">
                                        <table width="100%">
                                            <tr id="TrTreeExport">
                                               <td style="vertical-align: top; text-align: left;" id="TdTree">
                                                    
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <strong><span style="color: blue">Select User : </span></strong>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                <asp:Panel ID="pnlTree" runat="server" BorderColor="white" BorderWidth="1px" Height="300px" ScrollBars="Vertical"  >
                                                                    <asp:TreeView ID="TreeAccessebility" runat="server" onclick="client_OnTreeNodeChecked();"
                                                                        NodeIndent="3" ExpandDepth="1" EnableTheming="True" ShowLines="True">
                                                                    </asp:TreeView>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <dxe:ASPxButton ID="BtnShowSelectReport" runat="server" Text="Show" Height="5px"
                                                                        Width="82px" OnClick="btnShowReport_Click" ValidationGroup="a">
                                                                        <Border BorderColor="White" />
                                                                    </dxe:ASPxButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" id="TdGrid">
                                                    <dxwtl:ASPxTreeList ID="GridDailyActivity" runat="server" ClientInstanceName="List"
                                                        Width="100%" KeyFieldName="ID" ParentFieldName="ParentID">
                                                        <Columns>
                                                            <dxwtl:TreeListTextColumn Caption="Assign To" FieldName="Assign To" VisibleIndex="0">
                                                                <CellStyle CssClass="gridcellleft">
                                                                </CellStyle>
                                                            </dxwtl:TreeListTextColumn>
                                                            <dxwtl:TreeListTextColumn Caption="Total Calls" FieldName="Total Calls" VisibleIndex="1">
                                                                <CellStyle CssClass="gridcellleft">
                                                                </CellStyle>
                                                            </dxwtl:TreeListTextColumn>
                                                            <dxwtl:TreeListTextColumn Caption="Call Back" FieldName="Call Back" VisibleIndex="2">
                                                                <CellStyle CssClass="gridcellleft">
                                                                </CellStyle>
                                                            </dxwtl:TreeListTextColumn>
                                                            <dxwtl:TreeListTextColumn Caption="Non Contactable" FieldName="Non Contactable" VisibleIndex="4">
                                                                <CellStyle CssClass="gridcellleft">
                                                                </CellStyle>
                                                                <HeaderStyle Wrap="True" />
                                                            </dxwtl:TreeListTextColumn>
                                                            <dxwtl:TreeListTextColumn Caption="Non Usable" FieldName="Non Usable" VisibleIndex="5">
                                                                <CellStyle CssClass="gridcellleft">
                                                                </CellStyle>
                                                            </dxwtl:TreeListTextColumn>
                                                            <dxwtl:TreeListTextColumn Caption="Lost Calls" FieldName="Lost Calls" VisibleIndex="6">
                                                                <CellStyle CssClass="gridcellleft">
                                                                </CellStyle>
                                                            </dxwtl:TreeListTextColumn>
                                                            <dxwtl:TreeListTextColumn Caption="Confirm Sale" FieldName="Confirm Sale" VisibleIndex="7">
                                                                <CellStyle CssClass="gridcellleft">
                                                                </CellStyle>
                                                            </dxwtl:TreeListTextColumn>
                                                            <dxwtl:TreeListTextColumn Caption="Sales Visit" FieldName="Sales Visit" VisibleIndex="8">
                                                                <CellStyle CssClass="gridcellleft">
                                                                </CellStyle>
                                                                <HeaderStyle Wrap="True" />
                                                            </dxwtl:TreeListTextColumn>
                                                            <dxwtl:TreeListTextColumn Caption="Pending Calls" FieldName="Pending Calls" VisibleIndex="9">
                                                                <CellStyle CssClass="gridcellleft">
                                                                </CellStyle>
                                                            </dxwtl:TreeListTextColumn>
                                                            <dxwtl:TreeListTextColumn Caption="Performance(%)" FieldName="Performance(%)" VisibleIndex="10">
                                                                <CellStyle CssClass="gridcellleft">
                                                                </CellStyle>
                                                                <HeaderStyle Wrap="True" />
                                                            </dxwtl:TreeListTextColumn>
                                                        </Columns>
                                                        <Styles>
                                                        </Styles>
                                                        <Settings SuppressOuterGridLines="True" GridLines="Both" />
                                                    </dxwtl:ASPxTreeList>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <dxwtl:ASPxTreeListExporter ID="ASPxTreeListExporter1" runat="server">
                                    </dxwtl:ASPxTreeListExporter>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
