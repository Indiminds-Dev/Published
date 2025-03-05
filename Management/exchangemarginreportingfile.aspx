<%@ page language="C#" autoeventwireup="true" inherits="management_exchangemarginreportingfile, App_Web_nhjs8cfd" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
 <title>Exchange Margin Reporting Files</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    
     <script language="javascript" type="text/javascript">
    function Page_Load()
    {
        document.getElementById('btn_show').style.display='inline';
        document.getElementById('btngenerate').style.display='none';
        document.getElementById('tr_grd').style.display='none';
        document.getElementById('tr_export').style.display='none';
        //txtUnApproved.SetValue('100.00');
        height();
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
     function dateassign(s)
         {
        
                 var date1 = dtdate.GetDate();
                 if(date1 != null) 
                 {
                  var date2 =parseInt(date1.getMonth()+1)+'-'+date1.getDate()+'-'+ date1.getFullYear();
                  var prevdate2=parseInt(date1.getMonth()+1)+'-'+(date1.getDate()-1)+'-'+ date1.getFullYear();
                  
                   dtcdate.SetDate(new Date(prevdate2));
                   dthdate.SetDate(new Date(date2));
                   dttbdate.SetDate(new Date(prevdate2));
                   dtmcdate.SetDate(new Date(date2));
                 }
                document.getElementById('btnhide').click();
         }
     function norecord()
     {
        document.getElementById('tr_grd').style.display='none';
        document.getElementById('tr_export').style.display='none';
        document.getElementById('btngenerate').style.display='none';
        alert('No Record Found');
        height();
        
     }
     function display()
     {
        document.getElementById('btn_show').style.display='none';
        document.getElementById('btngenerate').style.display='inline';
        document.getElementById('tr_export').style.display='inline';
        document.getElementById('tr_grd').style.display='inline';
       height();
        
     }
        function ChangeRowColor(rowID) 
        {
            var gridview = document.getElementById('grdmarginreporting'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1; 
            for (rowIndex; rowIndex<=rCount-2; rowIndex++) 
            { 
                var rowElement = gridview.rows[rowIndex]; 
                rowElement.style.backgroundColor='#FFFFFF'
            }
            var color = document.getElementById(rowID).style.backgroundColor;
            if(color != '#ffe1ac') 
            {
                oldColor = color;
            }
            if(color == '#ffe1ac') 
            {
                document.getElementById(rowID).style.backgroundColor = oldColor;
            }
            else 
                document.getElementById(rowID).style.backgroundColor = '#ffe1ac'; 

            
        }
     function fnchkUnApprovedShares(obj)
      {
        if(obj.checked==true)
        {
            document.getElementById('txtUnApprovedShares_I').disabled=false;
        }
        else
        {
            document.getElementById('txtUnApprovedShares_I').disabled=true;
        }
      }
     function fnchktxtchk(obj)
     {
       if(obj>100.00)
       {
            txtUnApproved.SetValue('100.00');
       }
     }
 	function selecttion()
    {
        Page_Load();
    } 
        </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form2" runat="server"  autocomplete="off">
    <div>
     <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
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
         document.getElementById('btn_show').disabled=true;
   } 

   function EndRequest(sender, args) 
   { 
        $get('UpdateProgress1').style.display = 'none'; 
          document.getElementById('btn_show').disabled=false;
   } 


   </script>

    <div>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;" colspan="2">
                    <strong><span style="color: #000099">Exchange Margin Reporting Files</span></strong>
                </td>
                <td class="EHEADER" width="15%" id="tr_export" style="height: 22px">

                <asp:DropDownList ID="ddlExport" Font-Size="Smaller" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged" >
                            <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>
                            <asp:ListItem Value="P">PDF</asp:ListItem>
                        </asp:DropDownList> 

             </td>
            </tr>
        </table>
             
        <table >
            <tr>
                <td>
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                For :</td>
                            <td>
                                <dxe:ASPxDateEdit ID="dtdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dtdate">
                                    <DropDownButton Text="For">
                                    </DropDownButton>
                                    <ClientSideEvents ValueChanged="function(s, e) {dateassign(s);}" />
                                </dxe:ASPxDateEdit>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Collateral Valuation Date :</td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <dxe:ASPxDateEdit ID="dtcdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="108px" ClientInstanceName="dtcdate">
                                                <DropDownButton Text="For">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div id="display" runat="server" style="border: solid 1px black">
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
       <tr>
                <td>
                   <table><tr><td><table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Collateral Holding Date :</td>
                            <td>
                                <dxe:ASPxDateEdit ID="dthdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dthdate">
                                    <DropDownButton Text="For">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                    </table></td><td> <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Trading Account Balance Date :</td>
                            <td>
                                <dxe:ASPxDateEdit ID="dttbdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dttbdate">
                                    <DropDownButton Text="For">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                    </table></td><td><table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Margin and FDR Account Balance Date :</td>
                            <td>
                                <dxe:ASPxDateEdit ID="dtmcdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dtmcdate">
                                    <DropDownButton Text="For">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                    </table></td></tr></table>
                </td>
            </tr>
              <tr>
                <td>
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr valign="top">
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                <asp:CheckBox ID="chkhaicut"  runat="server" />
                                Do Not Apply Haircut
                            </td>
                             <td class="gridcellleft" bgcolor="#B7CEEC">
                                <asp:CheckBox ID="chkcmsegment" runat="server"  />
                                Consider CM Segment Trading A/c Balance
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Export Type</td>
                                        <td>
                                            <asp:DropDownList ID="DdlmarginType" runat="server" Width="150px" Font-Size="10px">
                                                <asp:ListItem Value="EOD">EOD Report</asp:ListItem>
						<asp:ListItem Value="i01">IntraDay SnapShot1</asp:ListItem>
						<asp:ListItem Value="i02">IntraDay SnapShot2</asp:ListItem>
						<asp:ListItem Value="i03">IntraDay SnapShot3</asp:ListItem>
						<asp:ListItem Value="i04">IntraDay SnapShot4</asp:ListItem>
						<asp:ListItem Value="i05">Provisional EOD</asp:ListItem>
                                            </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table  border="10" cellpadding="1" cellspacing="1">
                        <tr id="tr_UnApprovedShares">
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                <asp:CheckBox ID="chkUnApprovedShares"  Checked="true" runat="server" onclick="fnchkUnApprovedShares(this)" />
                                Haircut for Unapproved Shares</td>
                            <td>
                                <dxe:ASPxTextBox ID="txtUnApprovedShares" ClientInstanceName="txtUnApproved" runat="server"
                                    HorizontalAlign="Right" Width="100px" Text="100">
                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                    <MaskSettings Mask="&lt;0..199g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                    <ClientSideEvents LostFocus="function(s, e) {
	                            fnchktxtchk(s.GetValue())
                            }" />
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">                               
                                Applicable Haircut Rate
                            </td>
                            <td>
                                <asp:RadioButton ID="rdbVarmarginElm" runat="server" Checked="True" GroupName="ae"/>
                                Var Margin+ELM                           
                                <asp:RadioButton ID="rdbVarmargin" runat="server" GroupName="ae" />Var Margin
                            </td>
                        </tr>
                       
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn_show" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                    Width="101px" OnClick="btn_show_Click" OnClientClick="selecttion()"/></td>
                            <td>
                                <asp:Button ID="btngenerate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                                    Width="101px" OnClick="btngenerate_Click" OnClientClick="selecttion()"/></td>
                        </tr>
                    </table>
                </td>
            </tr>
         
           
        </table>
        <table>
            <tr id="tr_grd">
                <td colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="grdmarginreporting" runat="server" BorderColor="CornflowerBlue"
                                AutoGenerateColumns="false" ShowFooter="true" BorderStyle="Solid" BorderWidth="2px"
                                CellPadding="4" ForeColor="#0000C0" AllowSorting="true" OnRowCreated="grdmarginreporting_RowCreated"
                                OnSorting="grdmarginreporting_Sorting" OnRowDataBound="grdmarginreporting_RowDataBound">
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                <Columns>
                                    <asp:TemplateField HeaderText="Client Name">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="UCC" SortExpression="UCC">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblUCC" runat="server" Text='<%# Eval("UCC")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Branch" SortExpression="branchname">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="left"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblbranchname" runat="server" Text='<%# Eval("branchname")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total.Margin">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblappmargin" runat="server" Text='<%# Eval("appmargin")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="EOD Margin">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSpanMargin" runat="server" Text='<%# Eval("SpanMargin")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
 						 <asp:TemplateField HeaderText="Peak Margin">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblInitialMargin" runat="server" Text='<%# Eval("InitialMargin")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Leadger Balnc.">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbltrdac" runat="server" Text='<%# Eval("trdac")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Margin Dep.">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblmrgdep" runat="server" Text='<%# Eval("mrgdep")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Collaterals Val.">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblColeteralVal" runat="server" Text='<%# Eval("ColeteralVal")%>'
                                                CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="EOD Deposit">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbleffective" runat="server" Text='<%# Eval("effective")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Peak Deposit">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPeakDeposit" runat="server" Text='<%# Eval("PeakDeposit")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EOD Excess/Short" SortExpression="excessshortage">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblexcessshortage" runat="server" Text='<%# Eval("excessshortage")%>'
                                                CssClass="gridstyleheight1"></asp:Label>
                                                <asp:Label ID="lblexcessshortageformat" Visible="false" runat="server" Text='<%# Eval("excessshortageformat")%>'
                                                CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Peak Excess/Short" SortExpression="peakexcessshortage">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblpeakexcessshortage" runat="server" Text='<%# Eval("peakexcessshortage")%>'
                                                CssClass="gridstyleheight1"></asp:Label>
                                                <asp:Label ID="lblpeakexcessshortageformat" Visible="false" runat="server" Text='<%# Eval("peakexcessshortageformat")%>'
                                                CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="EOD Short (%)" SortExpression="sortpercent">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblsortpercent" runat="server" Text='<%# Eval("sortpercent")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                </Columns>
                                <RowStyle BackColor="#FFFFFF" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                    BorderWidth="1px"></RowStyle>
                              
                               
                               
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_show" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                top: 50%; background-color: white; layer-background-color: white; height: 80;
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
        <table>
            <tr>
                <td style="display: none;">
                 
                            <asp:Button ID="btnhide" runat="server" Text="Button" OnClientClick="selecttion()"
                                OnClick="btnhide_Click" />
                              
</td> </tr></table>
    </div>
    </form>
</body>
</html>
