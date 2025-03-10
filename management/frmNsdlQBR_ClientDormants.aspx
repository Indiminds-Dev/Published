<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlQBR_ClientDormants, App_Web_0jwcfgzk" %>

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
//       document.getElementById('spanrecord').innerHTML='Record to display: ';
      // document.getElementById('tdsegtext').style.visibility='hidden';
      //document.getElementById('tdsegtext').style.display='none';

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
//          alert(s);
           var dpid=s;
           var url='FrmNsdl_ShowClientHolding_popup.aspx?BenAccNo='+dpid;
           parent.OnMoreInfoClick(url,'Free Holding','940px','460px','Y');
         } 
         else
         {
//         alert(s);
//         alert(document.getElementById('hiddendpid').value);
         
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
        function segmenttextall()
        {
             document.getElementById('spanrecord').innerHTML='Record in each segment: ';
              
        }
         function segmenttext()
        {
             document.getElementById('spanrecord').innerHTML='Record to display: ';
        }
    </script>
</head>
<body style="margin: 0px 0px 0px 10px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
        <table style="width: 932px">
                <tr>
                    <td class="EHEADER" colspan="9" style="text-align: right">
                        <strong></strong>&nbsp;<asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged1">
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
                            EnableSynchronization="False" SelectedIndex="1" tabIndex="4" ValueType="System.String"
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
                                        As On</td>
                                    <td valign="top" >
                                       <dxe:ASPxDateEdit ID="dtexec" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" 
                            UseMaskBehavior="True" Width="120px" TabIndex="5">
                            <ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtexec1);}"></ClientSideEvents>
                        </dxe:ASPxDateEdit>
                                        </td>
                                   <td valign="top" >
                                        Dormant For</td>
                                    <td valign="top"  >
                                        <asp:TextBox ID="txtdormant" runat="server" Width="40px" CssClass="rightAlign" >3</asp:TextBox>months</td>
                                   
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
                                            <asp:RadioButton ID="rdbSegAll" runat="server" GroupName="e" onclick="segmenttextall()" />
                                            CDSL & NSDL
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbSegSelected" runat="server" Checked="True" GroupName="e"
                                                onclick="segmenttext()" />
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
                                       <table>
                                            <tr>
                                           
                                                <td ><span id="spanrecord" enableviewstate="true" runat="Server"></span>
                                                    <asp:TextBox ID="PageSizeTxt" runat="server" Columns="2" Font-Bold="True" Text="10"></asp:TextBox>
                                                    <asp:ImageButton ID="PageSizeImb" runat="server" ImageAlign="AbsBottom" ImageUrl="~/images/PageSize.gif"
                                                        OnClick="PageSizeImb_Click" ToolTip="Set page size" /></td>
                                                <td >
                                                    ||<asp:ImageButton ID="FirstPage" runat="server" CommandName="First" ImageAlign="AbsBottom"
                                                        ImageUrl="~/images/pFirst.png" OnCommand="NavigationLink_Click" ToolTip="First" />
                                                    <asp:ImageButton ID="PreviousPage" runat="server" CommandName="Prev" ImageAlign="AbsBottom"
                                                        ImageUrl="~/images/pPrev.png" OnCommand="NavigationLink_Click" ToolTip="Previous" /></td>
                                                <td >
                                                    ||<asp:TextBox ID="GoToPageTxt" runat="server" Font-Bold="True" Text="1" Width="30px"></asp:TextBox>
                                                    <asp:ImageButton ID="GoToPageImb" runat="server" ImageAlign="AbsBottom" ImageUrl="~/images/ok.jpg"
                                                        OnClick="GoToPageImb_Click" ToolTip="Go to page number" /></td>
                                                <td >
                                                    ||<asp:ImageButton ID="NextPage" runat="server" CommandName="Next" ImageAlign="AbsBottom"
                                                        ImageUrl="~/images/pNext.png" OnCommand="NavigationLink_Click" ToolTip="Next" />
                                                    <asp:ImageButton ID="LastPage" runat="server" CommandName="Last" ImageAlign="AbsBottom"
                                                        ImageUrl="~/images/pLast.png" OnCommand="NavigationLink_Click" ToolTip="Last" /></td>
                                                <td >
                                                    ||<asp:Label ID="CurrentPage" runat="server" Font-Bold="True" Text="1"></asp:Label>
                                                    <asp:Label ID="SepLbl" runat="server" CssClass="pageLinks" Enabled="False" Font-Size="X-Small">/</asp:Label>
                                                    <asp:Label ID="TotalPages" runat="server" Font-Bold="True">1</asp:Label></td>
                                            </tr>
                                        </table>
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
                            <SettingsPager PageSize="500000" visible="False"></SettingsPager>
                                
                                <columns>
<dxwgv:GridViewDataTextColumn Visible="false" FieldName="Srl. No" Caption="Srl. No" VisibleIndex="0">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Ben ID" UnboundType="String" Caption="Ben ID" VisibleIndex="1"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="First Holder Name" Width="200px" Caption="First Holder Name" VisibleIndex="2">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="First Holder PAN" Caption="First Holder Pan" VisibleIndex="3">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Group" Width="200px" Caption="Group" VisibleIndex="4"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Branch Name" Width="200px" Caption="Branch Name" VisibleIndex="5"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="ledger Bal." Width="200px" Caption="ledger Bal." VisibleIndex="6">
<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Next AMC" Width="200px" Caption="Next AMC" VisibleIndex="7"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Last Tran. Date" Caption="Last Tran. Date" VisibleIndex="8">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn UnboundType="Integer" Caption="Holding Value" VisibleIndex="9">
<PropertiesTextEdit DisplayFormatString="#.###"></PropertiesTextEdit>

<Settings AllowAutoFilter="False"></Settings>
<DataItemTemplate>
<a href="javascript:void(0);" onclick="dormant_showholding_pop('<%# Container.KeyValue %>')">
                                            <asp:Label id="Label1" runat="server" Text='<%# Eval("Holding Value") %>' ></asp:Label>
                                               
                                        </a>
                                        
</DataItemTemplate>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
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
