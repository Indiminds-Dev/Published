<%@ page language="C#" autoeventwireup="true" inherits="management_batch_cancel, App_Web_sjbhlkdr" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

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
      
        function PageLoad()
        {        
           if('<%= dp %>'=='CDSL')
            { 
                document.getElementById('hide3').style.display='none';  
                document.getElementById('hide4').style.display='none';    
            } 
            //document.getElementById('hide').style.display='none';               
            
            if(dtexec1.GetDate()!=null)
            {
              if(dtexec1.GetDate()!=new Date())
             {
             }              
            }
            else
            {
              dtexec1.SetDate(new Date()); 
            }
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
            window.frameElement.width = document.body.scrollWidth;
        }
        
         function DateChangeForFrom(s)
           {
                //alert('jj');    
                //document.getElementById('Button1').click();
           }
       
 </script>	
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
     <table>
             <tr>
                 <td align="left" style="width: 100px">
                 </td>
                 <td align="left" colspan="2">
                     <asp:ScriptManager ID="ScriptManager1" runat="server">
                     </asp:ScriptManager>
                 </td>
                 <td style="width: 100px">
                 </td>
                 <td style="width: 100px">
                 </td>
             </tr>
         <tr>
             <td align="left" style="width: 100px">
             </td>
             <td align="left" colspan="2" style="font-weight: bold; font-size: 10pt">
                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                 &nbsp; &nbsp;&nbsp; Batch Cancel</td>
             <td style="width: 100px">
             </td>
             <td style="width: 100px">
             </td>
         </tr>
         <tr>
             <td align="left" style="width: 100px">
                     Transaction Date</td>
             <td align="left" colspan="2">
                     <dxe:ASPxDateEdit ID="dtexec" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                         EditFormat="Custom" EditFormatString="dd-MM-yyyy" TabIndex="1" UseMaskBehavior="True"
                         Width="150px">                        
                         <clientsideevents LostFocus="function(s, e){ DateChangeForFrom(dtexec1);}"></clientsideevents>
                     </dxe:ASPxDateEdit>
             </td>
             <td align="left">
                     <asp:Button ID="Button1" runat="server" Text="Show" OnClick="Button1_Click" /></td>
             <td style="width: 100px">
             </td>
         </tr>
         <tr id="hide3">
             <td align="left" style="width: 100px">
                 Select OUT File: </td>
             <td align="left" colspan="2">
                 <asp:FileUpload ID="flout" runat="server" /></td>
             <td style="width: 100px">
             </td>
             <td style="width: 100px">
             </td>
         </tr>
         <tr id="hide4">
             <td align="left" style="width: 100px">
                 Select TXT file: </td>
             <td align="left" colspan="2">
                 <asp:FileUpload ID="fltext" runat="server" /></td>
             <td style="width: 100px">
             </td>
             <td style="width: 100px">
             </td>
         </tr>
             <tr>
                 <td align="left" style="width: 100px">
                     </td>
                 <td align="left" colspan="2">
                     &nbsp;</td>
                 <td style="width: 100px">
                     </td>
                 <td style="width: 100px">
                 </td>
             </tr>
             <tr>
                 <td colspan="4" rowspan="3">
                     <%--nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                         <ContentTemplate>--%>
                     <asp:GridView ID="gridSummary" runat="server" AutoGenerateColumns="False" BackColor="PeachPuff"
                         BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" EmptyDataText="No Record Found." Width="500px" OnRowCommand="gridSummary_RowCommand">
                         <Columns>
                             <asp:TemplateField HeaderText="Select Batch To Cancel">
                                 <ItemTemplate>
                                     <asp:CheckBox ID="chb1" runat="server" />
                                 </ItemTemplate>
                                 <ControlStyle Width="10%" />
                                 <ItemStyle HorizontalAlign="Center" Width="10%" />
                             </asp:TemplateField>
                             <asp:BoundField DataField="batchno" HeaderText="Batch Number" />
                             <asp:BoundField DataField="detail" HeaderText="Number of Instructions" />
                             <asp:BoundField DataField="UploadDateTime" HeaderText="Batch Export DateTime" />
                             <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnPrint" Text="Print" ForeColor="blue" runat="server" 
                                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  
                                            CommandName="Print" />
                                        </ItemTemplate>
                                       <ItemStyle HorizontalAlign="Center" Width="10%" />
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDownload" Text="Download" ForeColor="blue" runat="server" 
                                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  
                                            CommandName="Download" />
                                        </ItemTemplate>
                                       <ItemStyle HorizontalAlign="Center" Width="10%" />
                             </asp:TemplateField>
                         </Columns>
                     </asp:GridView>
                       <%--  </ContentTemplate>
                         <Triggers>
                             <asp:AsyncPostBackTrigger ControlID="dtexec" EventName="ValueChanged" />
                         </Triggers>
                     </asp:UpdatePanel>--%>
                 </td>
                 <td style="width: 100px">
                 </td>
             </tr>
             <tr>
                 <td style="width: 100px; height: 16px">
                 </td>
             </tr>
             <tr>
                 <td style="width: 100px">
                 </td>
             </tr>
         <tr>
             <td align="left" style="width: 100px">
                 <asp:Label ID="Label1" runat="server" Text="Rejection Reason" Visible="False"></asp:Label></td>
             <td colspan="2">
                 <asp:TextBox ID="txtreason" runat="server" TextMode="MultiLine" Visible="False" Width="249px"></asp:TextBox></td>
             <td style="width: 100px">
             </td>
             <td style="width: 100px">
             </td>
         </tr>
             <tr>
                 <td style="width: 100px">
                     <asp:Button ID="cmdcancel" runat="server" Text="Cancel Batch" OnClick="cmdcancel_Click" Visible="False" /></td>
                 <td style="width: 100px">
                 </td>
                 <td style="width: 100px">
                 </td>
                 <td style="width: 100px">
                 </td>
                 <td style="width: 100px" id="hide">
                     </td>
             </tr>
         </table> 
     </div>
    </form>
</body>
</html>
