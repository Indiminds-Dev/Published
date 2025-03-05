<%@ page language="C#" autoeventwireup="true" inherits="management_frmSebi, App_Web_yxggcryg" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%--<link type="text/css" href="../CSS/style.css" rel="Stylesheet" />--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
//        alert('Hi');
        if(document.body.scrollHeight>=350)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '350px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    
    function SebiDetail(objID)
    {
        
        var url="frmSebiDetail.aspx?id="+objID;
        parent.OnMoreInfoClick(url,'Details For','940px','500px','N');
        
    }
    
    function ShowProgress()
    {
//        alert('Process Started!');
//        
//        document.getElementById('Div1').style.display='inline';
        
        
    }
    function HideProgress()
    {
        alert('Process End!');
//        document.getElementById('Div1').style.display='none';
        
    }
    function ButtonStart()
    {
        alert('Process End!');
        //document.getElementById('btnStart').disabled=true;
    }
    
    function Start()
{
	//Trigger AJAX callback with "start" parameter
	eo_Callback("<%=CallbackPanel1.ClientID%>", "start");
}

function AfterCallbackUpate(callback, extraData)
{
	if (extraData == "start")
	{
		//Now start the progress bar
		var progressBar = eo_GetObject("<%=ProgressBar1.ClientID%>");
		progressBar.startTask();
	}
	
}

function AfterCallbackExecute(callback, extraData)
{
//    alert(extraData);
    if (extraData == "done")
	{
		//Now start the progress bar
		var progressBar = eo_GetObject("<%=ProgressBar1.ClientID%>");
		progressBar.endTask();
		
	}
}
function open()
{
    
    window.open("www.nseindia.com/content/press/prs_ra_sebi.xls");
    
}

function OnProgress(progressBar)
{
//    alert(progressBar);
	var extraData = progressBar.getExtraData();
//	alert(extraData);
	if (extraData=="Updated Completed.....")
	{
		//The following code demonstrates how to update
		//client side DHTML element based on the value
		//RunTask passed to us with e.UpdateProgress
//		var div = document.getElementById("divStatus");
//		div.innerHTML = extraData;	
		//eo_Callback("<%=CallbackPanel1.ClientID%>", "done");
	
//		if (extraData == "Updated Completed.....")
//		{
			//Trigger an AJAX callback using the CallbackPanel
            //control. This will trigger the server side
            //CallbackPanel1_Execute event handler. See the 
            //documentation for more details on how to use the 
            //CallbackPanel control. Note we must use setTimeout 
            //here to make sure our code is run after the progress
            //bar has finished updating its internal states
			window.setTimeout(
				"eo_Callback('<%=CallbackPanel1.ClientID%>', 'done')",
				10);
//            
			
//		}
	}
}

   
    </script>

</head>
<body onload="ShowProgress();">
    <form id="form1" runat="server">
        <div style="text-align: center; font-weight: bold; text-transform: none; color: black;">
            Please Select the SEBI File<br />
            <br />
            <asp:FileUpload ID="flpImport" runat="server" Width="283px" />
            
            
            
            <br />
                <%--<asp:Label ID="lblMessage" runat="server"></asp:Label>--%>
                <%--<asp:LinkButton ID="lblMessage" runat="server" OnClientClick="open();"></asp:LinkButton>--%>
                <asp:HyperLink ID="lblMessage" runat="server"  Text="www.nseindia.com/content/press/prs_ra_sebi.xls"  NavigateUrl="http://nseindia.com/content/press/prs_ra_sebi.xls" Target="_blank"></asp:HyperLink>
                
            <br />
            <br />
            <br />
            <eo:ScriptManager ID="ScriptManager1" runat="server" ClientSideOnLoad="ButtonStart();">
            </eo:ScriptManager>
         <%--   <asp:Panel ID="Progress" runat="server">--%>
                <%--<div id='Div1' style="position: absolute; font-family: arial; font-size: 30; left: 47%;
                    top: 19%; background-color: white; layer-background-color: white; height: 80;
                    width: 150;">
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
                </div>--%>
           <%-- </asp:Panel>--%>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <eo:ProgressBar runat="server" ID="ProgressBar1" ShowPercentage="True" IndicatorImage="00060104"
                BackgroundImageRight="00060103" ControlSkinID="None" BackgroundImage="00060101"
                IndicatorIncrement="7" BackgroundImageLeft="00060102" Width="300px" StartTaskButton="btnStart"
                ClientSideOnValueChanged="OnProgress" OnRunTask="ProgressBar1_RunTask">
            </eo:ProgressBar>
            <br />
            <a href="javascript:Start()">Start Update.....</a> &nbsp;
            <%--<asp:LinkButton ID="btnStop" runat="server">Stop</asp:LinkButton>--%>
            <div id="divStatus">
            </div>
            <eo:CallbackPanel runat="server" ID="CallbackPanel1" ClientSideAfterUpdate="AfterCallbackUpate"
                OnExecute="CallbackPanel1_Execute" ClientSideAfterExecute="AfterCallbackExecute"  
                Height="94px">
                <asp:Label ID="Label2" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Arial"></asp:Label>
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Arial"></asp:Label>&nbsp;<br />
                <br />
                <br />
                <br />
                  <asp:GridView ID="GridView1" DataKeyNames="BannedEntity_ID" runat="server" Width="100%" 
                  BorderColor="CornflowerBlue" OnPageIndexChanging="GridView1_PageIndexChanging"
                  OnPageIndexChanged="GridView1_PageIndexChanged"
                ShowFooter="True" AutoGenerateColumns="false" AllowPaging="True" BorderStyle="Solid"
                 BorderWidth="2px" CellPadding="4" ForeColor="#0000C0">
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                <Columns>
                    <asp:TemplateField HeaderText="BannedEntity_ID" Visible="false">
                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Customer Name">
                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("CNAME")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UCC">
                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblUcc" runat="server" Text='<%# Eval("UCC")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Banned OrderDate">
                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblBannedOrderDate" runat="server" Text='<%# Eval("BannedOrderDate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="Particulars">
                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblParticulars" runat="server" Text='<%# Eval("Particulars")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="BanPeriod">
                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblBanPeriod" runat="server" Text='<%# Eval("BanPeriod")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#">
                    <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <a href="javascript:SebiDetail('<%# Eval("BannedEntity_ID")%>')">More Info....</a>
                        </ItemTemplate>
                    </asp:TemplateField>
               </Columns>
                <RowStyle BackColor="#FFFFFF" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                    BorderWidth="1px"></RowStyle>
                <EditRowStyle BackColor="#E59930"></EditRowStyle>
                <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                    Font-Bold="False"></HeaderStyle>
                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
            </asp:GridView>
                
       
                <asp:Button id="btnFire" runat="server"  Visible="false"/>
                <asp:Button ID="btnShow" runat="server" Text="Show" Visible="False" />
            </eo:CallbackPanel>
            
            
            
          
            <%--<asp:Panel ID="Panelmain" runat="server" Visible="true">
        <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
            <tbody>
                <tr>
                    <td class="lt1" style="height: 22px">
                        <h5>
                            Imports SEBI &nbsp;Files
                        </h5>
                    </td>
                </tr>
                
                 
                <tr>
                    <td class="lt brdr" style="height: 280px">
                        <table cellspacing="0" cellpadding="0" align="center">
                            <tbody>
                                <tr>
                                    <td class="lt">
                                        <table class="width100per" cellspacing="12" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <td class="lt" style="height: 22px">
                                                    </td>
                                                    <td class="lt" style="width: 278px; height: 22px;">
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="Red" />
                                                    </td>
                                                </tr>
                                                 
                                                  <tr>
                                                    <td style="height: 22px">
                                                        &nbsp;&nbsp;&nbsp;<br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                    </td>
                                                    <td class="lt" style="width: 278px; height: 22px;">
                                                        
                                                       
                                                        <table>
                                                        
                                                            <tr>
                                                                <td style="width: 6px">
                                                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                                    </asp:ScriptManager> 
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">                                         
                                                            <ContentTemplate>
                                                            <br />
                                                         <asp:Label id="lblMessage" runat="server" Width="270px"></asp:Label>
                                                         <asp:Button id="btnDownload" onclick="btnDownload_Click" runat="server" Text="Download File" Width="84px" CssClass="btn"></asp:Button>
                                                            </ContentTemplate>
                                                            
                                                       </asp:UpdatePanel>
                                                        
                                                               </td>
                                                            </tr>
                                                           
                                                            <tr>
                                                                <td style="width: 6px; height: 18px;">
                                                        <asp:FileUpload ID="OFDSelectFile" runat="server" Width="272px" Height="23px"/>
                                                        </td>
                                                        
                                                   
                                                            </tr>
                                                       <tr>
                                                       <td></td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click" Width="84px" />
                                                            </td>
                                                      </tr>
                                                        </table>
                                                         
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lt" style="height: 22px">
                                                    </td>
                                                    <td class="lt" style="width: 278px; height: 22px;">
                                                        <br />
                                                        &nbsp;</td>
                                                </tr>
                                                 <tr>
                                                    <td class="lt" style="height: 22px">
                                                    </td>
                                                    <td class="lt" style="width: 278px; height: 22px;">
                                                        <asp:RadioButton ID="rdBtnmemcodetxt" runat="server" GroupName="imp" Visible="False" />
                                                        <asp:RadioButton ID="rdBtnmemcodeptxt" runat="server" GroupName="imp" Visible="False" Width="38px" />
                                                    </td>
                                                </tr>
                                                     <tr>
                                                    <td class="lt" style="height: 22px">
                                                    </td>
                                                    <td class="lt" style="width: 278px; height: 22px;">
                                                        <asp:RadioButton ID="rdBtntxt" runat="server" GroupName="imp" Visible="False" />
                                                        <asp:RadioButton ID="rdBtnmencodecsv" runat="server" GroupName="imp" Visible="False" Width="75px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lt" style="height: 22px">
                                                    </td>
                                                    <td align="right" style="width: 278px; height: 22px;">
                                                        <asp:HiddenField ID="hdnDate" runat="server" />
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="middle" colspan="2">
                                                    </td>
                                                </tr>
                                                <tr style="display: none">
                                                    <td>
                                                        <asp:TextBox ID="txtTableName" runat="server" Width="272px">TempTable</asp:TextBox></td>
                                                    <td style="width: 278px">
                                                        <asp:TextBox ID="txtCSVDir" runat="server" Width="272px">Import/Table</asp:TextBox></td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    <asp:Timer ID="Timer1" runat="server">
                                                    </asp:Timer>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </asp:Panel>--%>
            <asp:HiddenField ID="hdnPath" runat="server" />
            <asp:HiddenField ID="hdnLink" runat="server" />
            <asp:HiddenField ID="hdnStatus" runat="server" />
            <asp:HiddenField ID="hdnfilepath" runat="server" />
        </div>
    </form>
</body>
</html>
