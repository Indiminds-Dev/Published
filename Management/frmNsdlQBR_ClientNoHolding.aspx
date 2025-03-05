<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlQBR_ClientNoHolding, App_Web_8qixh_8w" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
 
    
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
     
     <script language="javascript" type="text/javascript">
         function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
        function PageLoad()
       {    
              dtexec1.SetEnabled(false);

       
       } 
      function height()
        {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '700px';
        window.frameElement.Width = document.body.scrollWidth;
        }
        function chkdate(objchk)
        {
        
        if(objchk.checked==true)
            {
                dtexec1.SetEnabled(true);
            }
            else
            {
                 dtexec1.SetEnabled(false);
            }
        
        }
     
     </script>
</head>
<body style="margin: 0px 0px 0px 10px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
       
   <table>
                        <tr>
                            <td style="width: 100px; vertical-align: top; height: 16px;">
                        <table>
                            <tr>
                                <td style="width: 100px" valign="top">
                        QueryType</td>
                                <td style="width: 100px">
                        <dxe:ASPxComboBox id="ddlSlipType" runat="server" ClientInstanceName="SlipType" EnableIncrementalFiltering="True"
                            EnableSynchronization="False" SelectedIndex="2" tabIndex="4" ValueType="System.String"
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
                            <td valign="top" style="padding-top:4px">
                                Select any date
                            </td>
                            <td valign="top" style="padding-top:3px">
                                <asp:CheckBox ID="chkSelectDate" onclick="chkdate(this)"  runat="server"  />
                            </td>
                            <td valign="top" style="height: 16px" >
                          
                        <asp:Panel ID="paneldormant" runat="server"  Width="260px"  Wrap="False">
                            <table width="100%">
                                <tr>
                                    <td valign="top" align="right"  >
                                        Date</td>
                                    <td valign="top" >
                                        
                                    
                                       <dxe:ASPxDateEdit ID="dtexec" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" OnDateChanged="dtexec_DateChanged"
                            UseMaskBehavior="True" Width="120px" TabIndex="5">
                           
                        </dxe:ASPxDateEdit>
                        
                       
                                        </td>
                                   
                                   
                                </tr>
                               
                            </table>
                        </asp:Panel>
                        
                            </td>
                            <td valign="top" style="width: 50px; height: 16px;">
                                <asp:Button ID="btnShow" runat="server" CssClass="btnUpdate" OnClick="btnShow_Click"
                                                 Text="Show" />
                            </td>
                            <td style="width: 3px; height: 16px;" valign="top">
                                
                                </td>
                        </tr>
                        <tr>
                            <td colspan="7">
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
            
    
        <table cellpadding="0" cellspacing="0" >
                       
            <tr>
                <td >
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
                    <dxwgv:ASPxGridView ID="gridHolding" runat="server" Width="950px" ClientInstanceName="grid"
                            AutoGenerateColumns="False" KeyFieldName="benacc" OnCustomCallback="gridHolding_CustomCallback" OnRowCommand="gridHolding_RowCommand" OnSelectionChanged="gridHolding_SelectionChanged"> 
                            <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedGroupRow BackColor="#FCA977"></FocusedGroupRow>

<FocusedRow BackColor="#FCA977"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
                            <SettingsPager PageSize="20" visible="True"></SettingsPager>
                                
                                <columns>
<dxwgv:GridViewDataTextColumn FieldName="benacc" Caption="BenAccount No" VisibleIndex="0">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="status" UnboundType="String" Caption="Account Status" VisibleIndex="1"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="holdername" Width="200px" Caption="First Holder Name" VisibleIndex="2">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="addres1" CellStyle-Wrap="False" Caption="Address 1" VisibleIndex="3">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="addres2" CellStyle-Wrap="False" Width="200px" Caption="Address 2" VisibleIndex="4"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="addres3" CellStyle-Wrap="False" Width="200px" Caption="Address 3" VisibleIndex="5"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="citypin" CellStyle-Wrap="False" Width="200px" Caption="Address 4" VisibleIndex="6">
<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="phone" Width="200px" Caption="Phone No" VisibleIndex="7"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="email" Caption="Email" VisibleIndex="8">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

</columns>
                                <settings showfooter="True" ShowHorizontalScrollBar="true"  showstatusbar="Visible" showtitlepanel="True"></settings>
                                <styleseditors>
<ProgressBar Height="25px"></ProgressBar>
</styleseditors>
                            </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
