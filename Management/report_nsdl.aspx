<%@ page language="C#" autoeventwireup="true" inherits="management_report_nsdl, App_Web_8qixh_8w" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" >
    <title></title>
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
<script language="javascript" type="text/javascript">
        var FieldName='a';
        function SignOff()
        {
            window.parent.SignOff();
        }
         function PageLoad()
        {           
            dtexec1.SetDate(new Date()); 
        } 
        function validate()
         {
              var a=new Number(document.getElementById('txtbatch').value);
              if (document.getElementById('txtbatch').value=='')
              {
               //alert('Batch no. can not be blank');
               document.getElementById('txtbatch').value='<%=batchno+1 %>'; 
               return false;
              }
              else if (isNaN( a ))
              {
                alert('Not valid Batch no.');
                document.getElementById('txtbatch').value='<%=batchno+1 %>'; 
                return false;
              }
              else if (a < '<%=batchno+1 %>')
              {
                alert('Not valid Batch no.');
                document.getElementById('txtbatch').value='<%=batchno+1 %>'; 
                return false;
              }
          
         }
         function height()
        {
            //alert('svsafvgase');
            if(document.body.scrollHeight>=500)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '500px';
            }
            window.frameElement.width = document.body.scrollWidth;
        }
//        function makeblank()
//        {
//          document.getElementById('txtbatch').value=' ';
//        }
 </script>	
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
        <asp:Panel ID="Panel1" runat="server" Width="520px">
        <table border="1">
            <tr>
                <td align="left" style="width: 100px">
                </td>
                <td style="width: 100px">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td align="left" colspan="3">
                <div class="EHEADER" style="text-align: center">
                                         <strong><span id="Span1" style="color: #000099">Batch Generate</span></strong>&nbsp;</div>
                    </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%; vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                    Version</td>
                <td style="width: 100px">
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="200px">
                        <asp:ListItem>E-DPM (New Version)</asp:ListItem>
                        <asp:ListItem>DPM (Old Version)</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%; vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                    Transaction Type</td>
                <td style="width: 100px">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="200px">
                        <asp:ListItem>Transaction</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%; vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                    Transaction Date</td>
                <td style="width: 100px">
                    <dxe:ASPxDateEdit ID="txtExecDate" runat="server" AllowNull="False" ClientInstanceName="dtexec1"
                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" Height="6px" UseMaskBehavior="True"
                        Width="195px">
                        <ButtonStyle Width="13px">
                        </ButtonStyle>
                    </dxe:ASPxDateEdit>
                </td>
                <td style="width: 100px" valign="bottom">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="left" colspan="3">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gridSummary" runat="server" AutoGenerateColumns="False" BackColor="PeachPuff"
                                BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" EmptyDataText="No Record Found."
                                OnRowCommand="gridSummary_RowCommand" Width="500px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Select Batch To Generate">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chb1" runat="server" Checked="True" />
                                        </ItemTemplate>
                                        <ControlStyle Width="10%" />
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="nsdloffline_batchnumber" HeaderText="Batch Number" />
                                    <asp:BoundField DataField="nsdloffline_transactiontype" HeaderText="Transactions Type" />
                                    <asp:BoundField DataField="count" HeaderText="Number of Instructions" />
                                    <asp:BoundField DataField="nsdloffline_batchgenerationdatetime" HeaderText="Batch Export DateTime" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btncreate" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td align="left" style="height: 11px; vertical-align: top; width: 20%; background-color: #b7ceec; text-align: left;">
                    Batch No.</td>
                <td align="left" style="height: 16px">
                    <asp:TextBox ID="txtbatch" runat="server" Width="181px" MaxLength="5"></asp:TextBox></td>
                <td style="height: 16px">
                    </td>
            </tr>
            <tr>
                <td style="text-align: left;" valign="top">
                    <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" OnClick="btnshow_Click" 
                        Text="Show" Width="100px" /></td>
                <td align="left" valign="top">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                    <asp:Button ID="btncreate" runat="server" CssClass="btnUpdate" OnClientClick="return validate();" OnClick="btncreate_Click" Text="Create" ValidationGroup="a" Height="20px" Width="100px" /></td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td style="text-align: left;" valign="top">
                    <asp:Button ID="Download" runat="server" CssClass="btnUpdate" Height="20px"
                        Text="Download File" Width="100px" OnClick="Download_Click" /></td>
            </tr>
        </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
