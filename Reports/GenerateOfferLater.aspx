<%@ page language="C#" autoeventwireup="true" inherits="management_GenerateOfferLater, App_Web_krnt_rtp" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    
    function callheight(obj)
    {
        height();
        parent.CallMessage();
    }
    
    function ShowHideFilter(obj)
    {
        var showrecord='Show~'+obj
        grid.PerformCallback(showrecord);
          height();
    } 
    
        function DeleteRow(keyValue)
        {
            doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   grid.PerformCallback('Delete~'+keyValue);
                   height();
                }
            else{
                  
                }

   
        }    
        function PageLoadFirst()
        {

        counter = 'n';
        FieldName = "drp_accesslevel";

        }
        function ReceiveServerData(rValue)
        {
        var DATA = rValue.split('~'); 
            if(DATA[0]=="read")
            {
                if(DATA[1]=="Y")
                {
                alert('Read Successfully!');
                grid.PerformCallback('read');
                grid.UnselectAllRowsOnPage();
                }
                else if(DATA[1]=="S")
                alert('Please Select a message!');
            }
        } 
       function callback()
        {
            grid.PerformCallback();
        } 
    
        function OnGridSelectionChanged() 
        {
        grid.GetSelectedFieldValues('rde_id', OnGridSelectionComplete);
        }
    
       function OnGridSelectionComplete(values) 
         {
         counter = 'n';
        
         for(var i = 0; i < values.length; i ++) {
            if(counter != 'n')
                counter += ',' + values[i];
             
            else
                counter = values[i];
              
          }
        
          var ReadIDs= 'read~' + counter;
            CallServer(ReadIDs,"");
        //alert(counter+'test');
      }
    
    
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
   
        if(document.body.scrollHeight>=600)
            window.frameElement.height = document.body.scrollHeight+600;
        else
            window.frameElement.height = '600px';
        window.frameElement.Width = document.body.scrollWidth+100;
    }
   function OnAddButtonClick() 
    {
          var url='AddCandidateForOLetter.aspx?id=ADD&mode=new';
         parent.OnMoreInfoClick(url,"Add Candidates",'960px','550px',"Y");
    }
   function OnMoreInfoClick(keyValue)
    {
    
       var url='AddCandidateForOLetter.aspx?id='+ keyValue+'&mode=edit' ;
       parent.OnMoreInfoClick(url,"Edit Candidate",'960px','550px',"Y");
   
    }
   
   function OnMoreShowButtonClick(keyValue)
   {
   
       var url='AddCandidateForOLetter.aspx?id='+ keyValue+'&mode=show' ;
       parent.OnMoreInfoClick(url,"Edit Candidate",'960px','550px',"Y");
   }
   
    
   function OnMoreAccessCick(keyValue)
    {
     grid.PerformCallback('Access~'+keyValue);
                   height();
//       var url='AddCandidateForOLetter.aspx?id='+ keyValue+'&mode=edit' ;
//       parent.OnMoreInfoClick(url,"Edit Candidate",'960px','550px',"Y");
   
    }
    
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Generate Offer Letter</span></strong>
                    </td>
                </tr>
                <tr><td>
                                                <table cellspacing="0px">
                                    <tr>
                                        <td>
                                            <dxe:ASPxDateEdit ID="dtDate" ClientInstanceName="dtDate" runat="server" EditFormat="Custom"
                                                UseMaskBehavior="True" TabIndex="1" Width="135px">
                                                <DropDownButton Text="From ">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td class="gridcellleft">
                                            <dxe:ASPxDateEdit ID="dtToDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                TabIndex="2" Width="135px">
                                                <DropDownButton Text="To">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td>
                                   <asp:Button ID="Button1" runat="server" Text="Show" OnClick="Button1_Click" CssClass="btnUpdate"
                                    Height="19px" Width="101px" TabIndex="12" />
                                
                                </td>
                                <td class="gridcellright">
                                
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                        Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                        ValueType="System.Int32" Width="130px">
                                        <Items>
                                            <dxe:ListEditItem Text="Select" Value="0" />
                                            <dxe:ListEditItem Text="PDF" Value="1" />
                                            <dxe:ListEditItem Text="XLS" Value="2" />
                                            <dxe:ListEditItem Text="RTF" Value="3" />
                                            <dxe:ListEditItem Text="CSV" Value="4" />
                                        </Items>
                                        <ButtonStyle BackColor="#C0C0FF" ForeColor="Black">
                                        </ButtonStyle>
                                        <ItemStyle BackColor="Navy" ForeColor="White">
                                            <HoverStyle BackColor="#8080FF" ForeColor="White">
                                            </HoverStyle>
                                        </ItemStyle>
                                        <Border BorderColor="White" />
                                        <DropDownButton Text="Export">
                                        </DropDownButton>
                                    </dxe:ASPxComboBox>
                               
                                
                                </td>
                                    </tr>
                                </table></td>
                                
                
                </tr>
                
                <tr>
                    <td style="text-align: left; vertical-align: top">
                        <table width="100%">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnGenerate" Text="Generate" runat="server" CssClass="btnUpdate"
                                                    OnClick="btnGenerate_Click1" /></td>
                                            <td>
                                                Confirm Joining Date:
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="txtJD" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    TabIndex="20" Width="204px">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td>
                                                <asp:Button ID="BtnJoin" runat="server" Text="Confirm Join" CssClass="btnUpdate"
                                                    OnClick="BtnJoin_Click" /></td>
                                            <td>
                                                <asp:Button ID="btnAdd" runat="server" Text="Add Employee" CssClass="btnUpdate" OnClick="btnAdd_Click"
                                                    Visible="false" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            
                            <tr>
                                <td id="Td1" align="left">
                                    <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a> || <a href="javascript:ShowHideFilter('All');"><span style="color: #000099;
                                            text-decoration: underline">All Records</span></a>
                                </td>
                                <td>
                                    <span id="spanshow2" style="color: Blue; font-weight: bold"></span>&nbsp;&nbsp;<span
                                        id="spanshow3"></span>
                                </td>
                                <td align="right" style="text-align: left">
                                    <span id="spanfltr" style="display: none"><a href="#" style="font-weight: bold; color: Blue"
                                        onclick="javascript:ForFilterOn();">Filter</a></span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                       <%-- <div style="border: 1px solid black; width: 1000px; height: 650px; overflow: auto"
                            id="panecontainer">--%>
                            <dxwgv:ASPxGridView ID="GridMessage" ClientInstanceName="grid" runat="server" Width="100%"
                                KeyFieldName="rde_id" OnCustomCallback="GridMessage_CustomCallback" AutoGenerateColumns="False" OnHtmlDataCellPrepared="GridMessage_HtmlDataCellPrepared">
                                <ClientSideEvents SelectionChanged="function(s, e) { OnGridSelectionChanged(); }"
                                    BeginCallback="function(s, e) {
	callheight(s.cpHeight);
}" />
                                <SettingsBehavior AllowMultiSelection="True" />
                                <Styles>
<Header SortingImageSpacing="5px" BackColor="LightSteelBlue" ImageSpacing="5px"></Header>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow BackColor="#FFC080"></FocusedGroupRow>
</Styles>
                                <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
                                <Columns>
<dxwgv:GridViewCommandColumn VisibleIndex="0" Width="3%" ShowSelectCheckbox="True">
<HeaderStyle HorizontalAlign="Center">
<Paddings PaddingTop="1px" PaddingBottom="1px"></Paddings>
</HeaderStyle>
<HeaderTemplate>
                                            <input type="checkbox" onclick="grid.SelectAllRowsOnPage(this.checked);" style="vertical-align: middle;"
                                                title="Select/Unselect all rows on the page"></input>
                                        
</HeaderTemplate>
</dxwgv:GridViewCommandColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="1" FieldName="rde_Name" Caption="Cand. Name">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="2" FieldName="rde_ResidenceLocation" Caption="Address">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="2" FieldName="company" Caption="Candt. Company">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="3" FieldName="Branch" Caption="Candt. Branch">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="4" FieldName="Designation" Caption="Candt. Designation">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="6" FieldName="rde_ApprovedCTC" Caption="Approved CTC">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="5" FieldName="CreateUserName" Caption="Created By">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="6" FieldName="CreateDate1" Caption="Create Date">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="7" FieldName="Status" Caption="Status">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="8" FieldName="rde_NoofDepedent" Caption="PAN No.">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="9" FieldName="GenerateDate" Caption="Generate Date">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="9" FieldName="JoiningDate" Caption="Joining Date">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="10" FieldName="rde_IsConfirmJoin" Caption="Join Status">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="11" Width="60px" Caption="Details">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<DataItemTemplate>
                                            <a href="javascript:void(0);" onclick="OnMoreShowButtonClick('<%# Container.KeyValue %>')">
                                                More Info</a>
                                        
</DataItemTemplate>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
                                            <a href="javascript:void(0);" onclick="javascript:OnAddButtonClick();"><span style="color: #000099;
                                                text-decoration: underline">Add New</span> </a>
                                        
</HeaderTemplate>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="12" Width="60px" Caption="Details">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<DataItemTemplate>
                                            <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                   { %>
                                            <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                                Edit</a> &nbsp;&nbsp; <a href="javascript:void(0);" onclick="DeleteRow('<%# Container.KeyValue %>')">
                                                    Delete</a> <a href="javascript:void(0);" onclick="OnMoreAccessCick('<%# Container.KeyValue %>')">
                                                        Allow</a> &nbsp;&nbsp;
                                            <%} %>
                                        
</DataItemTemplate>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
                                            <span style="color: #000099; text-decoration: underline">Access </span>
                                        
</HeaderTemplate>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>

</Columns>
                                <Settings ShowGroupPanel="True" />
                            </dxwgv:ASPxGridView>
                              <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
                      <%--  </div>--%>
                        <%--    <input id="btnRead" type="button" value="Read" class="btnUpdate" onclick="btnRead_click();"
                            style="width: 66px; height: 19px" tabindex="1" />--%>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
