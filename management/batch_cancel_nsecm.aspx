<%@ page language="C#" autoeventwireup="true" inherits="management_batch_cancel_nsecm, App_Web_alid8jfz" %>

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
<head runat="server">
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
<script language="javascript" type="text/javascript">
       var FieldName='a';
      
        function PageLoad()
        {        

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
            
            
            
            if(ASPxDtDate1.GetDate()!=null)
            {
              if(ASPxDtDate1.GetDate()!=new Date())
             {
             }              
            }
            else
            {
              ASPxDtDate1.SetDate(new Date()); 
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
         function ShowDateOption()
            {
               
                document.getElementById('tddate').style.display='inline';
                return false;
            }
             function ConfDelete()
                {
                resp = window.confirm ('Are you sure, you want to Approve this Record?');
                document.form1['JSApprResp'].value = resp;
                }
                function test()
                {
                    alert('aa');
                }
             function DeleteConf()
                {
                
                     resp = window.confirm ('Some transactions cannot be deleted.Do you want to delete the others?');
                     if(resp==true)
                        {
                           document.getElementById('btnDelete').click();
                        }
                }
                function HideCanDate()
                    {
                          document.getElementById('tddate').style.display='none';
                    
                    }
                    
               function ConfirmDelete(Batchno)
                    {
                                               
                        var conf=window.confirm('Are you sure to delete the batches of batch no ' + Batchno + ' ?');
                        if(conf==true)
                           return true;
                        else
                           return false;
                        
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
                     &nbsp;
                     <asp:GridView ID="gridSummary" runat="server" AutoGenerateColumns="False" BackColor="PeachPuff"
                         BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" EmptyDataText="No Record Found." Width="600px">
                         <Columns>
                             <asp:TemplateField HeaderText="Select Batch To Cancel">
                                 <ItemTemplate>
                                     <asp:CheckBox ID="chb1" runat="server" />
                                 </ItemTemplate>
                                 <ControlStyle Width="10%" />
                                 <ItemStyle HorizontalAlign="Center" Width="10%" />
                             </asp:TemplateField>
                             <asp:BoundField DataField="DematTransactions_BatchNumber" HeaderText="Batch Number" />
                             <asp:BoundField DataField="NumberOfInstructions" HeaderText="Number of Instructions" />
                             
                   <asp:TemplateField HeaderText="Batch Export Time" >
                    <ItemTemplate>
                        <asp:Label ID="lblTime" Text ='<%# ReturnTime(Convert.ToString(Eval("DematTransactions_BatchExportDate"))) %>' runat="server"></asp:Label>
                        <asp:Label ID="lblOwnAccount" Visible="false" runat="Server" Text='<%# Bind("OwnAccount") %>'></asp:Label>
                    </ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="DPAccounts_Shortname" HeaderText="Account Name" />
                   <asp:BoundField DataField="BatchType" HeaderText="Batch Type" />
                   <asp:TemplateField HeaderText="#">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkSaveFile" CommandArgument='<%# Bind("DematTransactions_BatchNumber") %>'  runat="Server" OnClick="lnkSaveFile_Click" ForeColor="blue" Font-Underline="true" Text="Download"></asp:LinkButton>
                        </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="#">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%# Bind("DematTransactions_BatchNumber") %>' 
OnClientClick='<%#Eval("DematTransactions_BatchNumber","javascript:return ConfirmDelete({0});")%>' ForeColor="blue"  OnClick="lnkDelete_Click" Font-Underline="true" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                   </asp:TemplateField>
                 
                         </Columns>
                     </asp:GridView>
                        
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
            <td colspan="5" style="height:15px"></td>
        
        </tr>
             <tr>
                 <td style="width: 100px">
                     <asp:Button ID="cmdcancel" runat="server" Text="Cancel Batch" OnClick="cmdcancel_Click" Visible="False" /></td>
                 <td align="left" colspan="2" >
                    <asp:Button ID="btnCancelNDate" OnClientClick="return ShowDateOption()" Text="Cancel and change date" runat="Server" />
                 </td>
                
                 <td align="left" colspan="2" style="width: 100px">
                    
                 </td>
                
             </tr>
             <tr>
                 <td></td>
                 <td colspan="4" id="tddate" align="left" >
                    <table>
                        <tr>
                               <td style="width:165px">
                                    <dxe:ASPxDateEdit ID="ASPxDtDate" runat="server" ClientInstanceName="ASPxDtDate1" DateOnError="Today"
                         EditFormat="Custom" EditFormatString="dd-MM-yyyy"  UseMaskBehavior="True"
                         Width="150px">                        
                        
                     </dxe:ASPxDateEdit>
                               </td>
                               <td>
                                    <asp:Button ID="btnSaveDate" Width="50px" Text="Save" runat="server" OnClick="btnSaveDate_Click" /><input id="JSApprResp" type="hidden" name="JSApprResp" />
                                    <div style="display:none">
                                        <asp:Button ID="btnDelete" OnClick="btnDelete_Click" runat="server" />
                                    </div>
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
