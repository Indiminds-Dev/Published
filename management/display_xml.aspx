<%@ page language="C#" autoeventwireup="true" inherits="management_display_xml, App_Web_fbvamflg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

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
		position:absolute;
		z-index:5;
	}
	
	form{
		display:inline;
	}
	
	</style>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <script language="javascript" type="text/javascript">

           function DateChangeForFrom(s)
           {
                var currentTime = new Date()
                if(currentTime<s.GetValue())
                {           
               
                }
                else
                {                 
                s.SetDate(currentTime);  
                                    
                }
            
            }
             function PageLoad()
        {
            
//            FieldName='btnSave';
            //dtexec1.SetDate(new Date()); 
            
            
        } 
    </script>
    <form id="form1" runat="server">
    <div>
        &nbsp;<table>
            <tr>
                <td style="width: 100px; height: 251px;">
                </td>
                <td style="width: 710px; height: 251px;" align="center">
                    &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Red"
                        Text="No Unsaved records"></asp:Label>
                    <asp:Panel ID="Panel1" runat="server" Height="300px" ScrollBars="Vertical">
                        &nbsp;<table style="width: 754px">
                            <tr>
                                <td colspan="2">
        <asp:GridView ID="DetailsGrid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnRowCommand="DetailsGrid_RowCommand" OnRowDataBound="DetailsGrid_RowDataBound">
            <Columns>
                <asp:BoundField HeaderText="Slip" DataField="slipno" />
                <asp:BoundField HeaderText="ISIN" DataField="isin" />
                <asp:BoundField HeaderText="Quantity" DataField="quantity" />
                <asp:BoundField HeaderText="DPID" DataField="dpid" />
                <asp:BoundField HeaderText="ClientID" DataField="clientid" />
                <asp:BoundField HeaderText="TranDate" DataField="transactiondate" />
                <asp:BoundField DataField="executiondate" HeaderText="ExecutionDate" />
                <asp:BoundField HeaderText="Counterid" DataField="counterclientid" />
                <asp:TemplateField HeaderText="Change ExchangeDate">
                    <ItemTemplate>
                        <dxe:ASPxDateEdit ID="dtexec" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" OnDateChanged="dtexec_DateChanged"
                            TabIndex="5" UseMaskBehavior="True" Width="120px">
                            <ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtexec1);}" />
                        </dxe:ASPxDateEdit>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Change">
                    <ItemTemplate>
                        <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" Text="Save" CommandArgument='<%# Eval("id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; height: 26px">
                    <asp:Button ID="btnsaveset" runat="server" OnClick="btnsaveset_Click" TabIndex="7"
                        Text="Save" /></td>
                                <td style="width: 100px; height: 26px">
                    <asp:Button ID="btncan" runat="server" OnClick="btncan_Click" TabIndex="8" Text="Cancel" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px; height: 26px">
                                </td>
                                <td style="width: 100px; height: 26px">
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td style="width: 337px; height: 251px;">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    </td>
                <td style="width: 710px">
                    </td>
                <td style="width: 337px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 710px">
                </td>
                <td style="width: 337px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
