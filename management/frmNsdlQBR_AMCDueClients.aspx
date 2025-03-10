<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlQBR_AMCDueClients, App_Web__yen2upk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
    <%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
    <%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
      <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script language="javascript" type="text/javascript">
        function PageLoad()
       {    
            FieldName='any';
            dttran1.SetDate(new Date()); 
//            document.getElementById('imgloading').style.display='none';
       
       } 
      function height()
        {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '700px';
        window.frameElement.Width = document.body.scrollWidth;
        }
    
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
            
            function DateChangeForFrom()
           {
                var currentTime = new Date()
                s.SetDate(currentTime);  
           }
           
            function dormant_showholding_pop(s)
        {
         if(document.getElementById('hiddenSegment').value=='n' )
         {
            
           var dpid=s;
           var url='FrmNsdl_ShowClientHolding_popup.aspx?BenAccNo='+dpid;
           parent.OnMoreInfoClick(url,'Free Holding','940px','460px','Y');
         } 
         else
         {
        
           var dpid=s;
           //alert(dpid);
           var url='FrmCdsl_ShowClientHolding_popup.aspx?BOID='+document.getElementById('hiddendpid').value+dpid;
           parent.OnMoreInfoClick(url,'Free Holding','940px','460px','Y'); 
         }
        }
        
        function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
    </script>
</head>
<body style="margin: 0px 0px 0px 10px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
     <div>
        <table style="width: 932px">
                <tr>
                    <td class="EHEADER" colspan="9" style="text-align: right">
                        <strong></strong>&nbsp;<asp:DropDownList ID="ddlExport" runat="server" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged1">
                                    <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                                    <asp:ListItem Value="E">Excel</asp:ListItem>
                                    <asp:ListItem Value="P">PDF</asp:ListItem>
                                    <asp:ListItem Value="PM">PDF DIFF PAGES</asp:ListItem>
                                </asp:DropDownList></td>
                </tr>
            </table>
            
              <table>
                        <tr>
                            <td style="width: 100px; vertical-align: top; height: 16px;">
                        <table>
                            <tr>
                                <td style="width: 100px" valign="top">
                        QueryType</td>
                                <td style="width: 100px">
                        <dxe:ASPxComboBox id="ddlSlipType" runat="server" ClientInstanceName="SlipType" EnableIncrementalFiltering="True"
                            EnableSynchronization="False" SelectedIndex="3" tabIndex="4" ValueType="System.String"
                            Width="140px" AutoPostBack="True" OnSelectedIndexChanged="ddlSlipType_SelectedIndexChanged">
                            <items>
<dxe:ListEditItem Text="Account Information" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Dormant Accounts" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="No Holding Clients" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="AMC Due Clients" Value="4"></dxe:ListEditItem>
<dxe:ListEditItem Text="Banned Entities" Value="5"></dxe:ListEditItem>
<dxe:ListEditItem Text="Active Clients" Value="6"></dxe:ListEditItem>
</items>
       
                        </dxe:ASPxComboBox></td>
                            </tr>
                        </table>
                            </td>
                            <td valign="top" style="height: 16px" >
                       
                            </td>
                            <td valign="top" style="height: 16px" >
                        <asp:Panel ID="paneldormant" runat="server"  Width="310px"  Wrap="False">
                            <table width="100%">
                                <tr>
                                    <td valign="top" >
                                        From</td>
                                    <td valign="top" >
                                       <dxe:ASPxDateEdit ID="dtexec" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" 
                            UseMaskBehavior="True" Width="120px" TabIndex="5">
                            <ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtexec1);}"></ClientSideEvents>
                        </dxe:ASPxDateEdit>
                                        </td>
                                   <td valign="top" >
                                        To</td>
                                    <td valign="top"  >
                                        <dxe:ASPxDateEdit ID="dtexecTo" runat="server" ClientInstanceName="dtexecTo1" DateOnError="Today"
                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" 
                            UseMaskBehavior="True" Width="120px" TabIndex="5">
                            <ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtexecTo);}"></ClientSideEvents>
                        </dxe:ASPxDateEdit>
                                        
                                        
                                   </td>
                                   
                                </tr>
                               
                            </table>
                        </asp:Panel>
                            </td>
                            <td valign="top" style="width: 50px; height: 16px;">
                                <table>
                                    <tr>
                                        <td style="width: 100px">
                                            &nbsp;<asp:Button ID="Button2" runat="server" CssClass="btnUpdate" OnClick="Button1_Click"
                                                OnClientClick="javascript:selecttion();" Text="Show" /></td>
                                        <td style="width: 100px; vertical-align: top;">
                                </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 3px; height: 16px;" valign="top">
                                
                                </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <table>
                                    <tr>
                                        <td>
                                            <strong>Segment :</strong></td>
                                        <td>
                                            <asp:RadioButton ID="rdbSegAll" runat="server" GroupName="e" onclick="fn_Segment('a')" />
                                            CDSL & NSDL
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbSegSelected" runat="server" Checked="True" GroupName="e"
                                                onclick="fn_Segment('b')" />
                                            Current
                                        </td>
                                        <td>
                                            [ <span id="litSegment" runat="server" style="color: Maroon"></span>]
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                     <asp:Panel ID="UpdatePanel3" runat="server" Height="50px" Width="125px">
                            <table width="930" style="border-right: gray thin solid; border-top: gray thin solid; border-left: gray thin solid; border-bottom: gray thin solid; height: 24px">
                                <tr>
                                    <td>
                                       
                                        <table class="TableMain100">
                                            <tbody>
                                                <tr>
                                                    <td id="ShowFilter" width="7%">
                                                        <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                            Show Filter</span></a>
                                                    </td>
                                                    <td id="Td1" width="7%">
                                                        <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                                            All Records</span></a>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                            <dxwgv:ASPxGridView ID="gridHolding" runat="server" Width="100%" ClientInstanceName="grid"
                            AutoGenerateColumns="False" KeyFieldName="Ben ID" OnCustomCallback="gridHolding_CustomCallback"  OnSelectionChanged="gridHolding_SelectionChanged">
                            <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedGroupRow BackColor="#FCA977"></FocusedGroupRow>

<FocusedRow BackColor="#FCA977"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
                            <SettingsPager PageSize="20" ></SettingsPager>
                                
                                <columns>
<dxwgv:GridViewDataTextColumn FieldName="Ben ID" Caption="Ben ID" VisibleIndex="0">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="First Holder Name" CellStyle-Wrap="False" UnboundType="String" Caption="First Holder Name" VisibleIndex="1"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="address1" CellStyle-Wrap="False" Width="200px" Caption="Address1" VisibleIndex="2">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="address2" CellStyle-Wrap="False" Caption="Address2" VisibleIndex="3">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="address3" CellStyle-Wrap="False" Width="200px" Caption="Address3" VisibleIndex="4"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="address4" Width="200px" CellStyle-Wrap="False" Caption="Address4" VisibleIndex="5"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="phone" Width="200px" CellStyle-Wrap="False" Caption="Phone" VisibleIndex="6">
<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="email" Width="200px" CellStyle-Wrap="False" Caption="Email" VisibleIndex="7"></dxwgv:GridViewDataTextColumn>

</columns>
                                <settings showfooter="True" showstatusbar="Visible" showtitlepanel="True"></settings>
                                <styleseditors>
<ProgressBar Height="25px"></ProgressBar>
</styleseditors>
                            </dxwgv:ASPxGridView></td>
                                </tr>
                            </table>
                    </asp:Panel>
                    
            
    </div>
    <asp:HiddenField ID="hiddendpid" runat="server" />
        <asp:HiddenField ID="hiddenbenaccno" runat="server" />
        <asp:HiddenField ID="hiddenaccholder" runat="server" />
        <asp:HiddenField ID="hiddenholdingdate" runat="server" />
        <asp:HiddenField ID="hiddenSegment" runat="server" />
        <asp:HiddenField ID="hiddenclientdpid" runat="server" />
    </form>
</body>
</html>
