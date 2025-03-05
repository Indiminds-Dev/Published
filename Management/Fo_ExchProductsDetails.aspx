<%@ page language="C#" autoeventwireup="true" inherits="management_Fo_ExchProductsDetails, App_Web_s3wzohpw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exchange Products Details</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    
    function Validate()
    {
        alert("Aready Exists!..");
        return false;
    
    }
    function ValidateTcode()
        {
            //document.getElementById('lblMsg').innerHTML="Ticker Code Aready Exists";
            alert("Ticker Code Aready Exists!..");
            return false;
        }
   function ShowHideFilter(obj)
    {
           grid.PerformCallback(obj);
     }
        
     
   function DeleteRow(keyValue)
    {
             doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   grid.PerformCallback('Delete~'+ keyValue);
                   height();
                }
            else{
                  
                }

   
    }
 
        
        
    function OnAddEditClick(e,obj)
    {
    
       
        Filter='N';
        RowID='';
        var data=obj.split('~');
        if(data.length>1)
            RowID=data[1];
        popup.Show();
        popPanel.PerformCallback(obj);
    }
    
       
       
     function OnDeleteClick(e,obj)
    {
        if(confirm('Are You Sure you want to Delete This Transaction?')==true)
        {
            grid.PerformCallback(obj);
        }
    }
    function btnSave_Click()
    {
        var tsval=document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtTickerSysmbol').value;
        
        if(tsval=='')
            {
                alert('Please Enter Ticker Symbol');
                return false;
             }
           else
               {
              Filter='Y';
                
                if(RowID=='')
                {
                        var obj='SaveNew';
                        popPanel.PerformCallback(obj);
                     
                }
                else
                {
                    var obj='SaveOld~'+RowID;
                    popPanel.PerformCallback(obj);
                }
        }
       
    }
     function btnCancel_Click()
    {
        popup.Hide();
    }
    function EndCallBack(obj,obj1)
    {
    
    
    
        if(obj1=='Y')
        {
          if(obj='N')
              {
               document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtStrike").style.display="none";
              }   
              alert("Already Exists!..");      
             return false;
        }
        else if (obj1=='N')
        {
        btnCancel_Click();
        }
        
       if(obj1=='N')
        {
         grid.PerformCallback(obj1)
        }
        
   

     
    }

        
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
        </asp:ScriptManager>
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" align="center">
                        <span style="color: #000099;">Derivaties</span></td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="text-align: left; vertical-align: top">
                                    <table>
                                        <tr>
                                            <td id="ShowFilter">
                                                <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                    Show Filter</span></a>
                                            </td>
                                            <td id="Td1">
                                                <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                                    All Records</span></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="grdExchDetails" ClientInstanceName="grid" KeyFieldName="Equity_SeriesID"
                            runat="server" Width="100%" AutoGenerateColumns="False" OnCustomCallback="grdExchDetails_CustomCallback">
                            <Styles>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <FocusedRow BackColor="#FEC6AB">
                                </FocusedRow>
                            </Styles>
                            <Settings ShowStatusBar="Visible" />
                            <SettingsPager NumericButtonCount="20" PageSize="15" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <Columns>
                                <dxwgv:GridViewDataComboBoxColumn Caption="Exch Name" FieldName="Exchange_ShortName"
                                    VisibleIndex="0" Visible="false">
                                </dxwgv:GridViewDataComboBoxColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Ticker Symbol" FieldName="Equity_TickerSymbol"
                                    VisibleIndex="1">
                                    <EditFormCaptionStyle Wrap="False">
                                    </EditFormCaptionStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataComboBoxColumn Caption="Series" FieldName="Equity_Series" Visible="False"
                                    VisibleIndex="2">
                                </dxwgv:GridViewDataComboBoxColumn>
                                <dxwgv:GridViewDataComboBoxColumn Caption="FOIdentifier" FieldName="Equity_FOIdentifier"
                                    Visible="False" VisibleIndex="3">
                                </dxwgv:GridViewDataComboBoxColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Strike Price" FieldName="Equity_StrikePrice"
                                    VisibleIndex="3">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataDateColumn Caption="Exp. Date" FieldName="Equity_EffectUntil"
                                    VisibleIndex="4">
                                </dxwgv:GridViewDataDateColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Trading Lot" FieldName="Equity_TradingLot"
                                    VisibleIndex="5">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataComboBoxColumn Caption="Trading UOM" FieldName="Equity_TradingUOM"
                                    VisibleIndex="6" Visible="False">
                                </dxwgv:GridViewDataComboBoxColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Delivery Lot" FieldName="Equity_DeliveryLot"
                                    VisibleIndex="7">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataComboBoxColumn Caption="Delivary UOM" FieldName="Equity_DeliveryUOM"
                                    VisibleIndex="8" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataComboBoxColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Price Units" FieldName="Equity_PriceUnits"
                                    VisibleIndex="9">
                                    <EditFormSettings CaptionLocation="Near" VisibleIndex="10" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataComboBoxColumn Caption="Price UOM" FieldName="Equity_PriceUOM"
                                    VisibleIndex="10" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataComboBoxColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Face Value" FieldName="ISIN_FaceValue" Visible="False"
                                    VisibleIndex="11">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <%--    <dxwgv:GridViewCommandColumn VisibleIndex="7">
                                    <ClearFilterButton Visible="True">
                                    </ClearFilterButton>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="grdExchDetails.AddNewRow()"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                    <EditButton Visible="True">
                                    </EditButton>
                                </dxwgv:GridViewCommandColumn>--%>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="12">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddEditClick(this,'Edit~'+'<%# Container.KeyValue %>')">
                                            <u>Edit</u> </a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="OnDeleteClick(this,'Delete~'+'<%# Container.KeyValue %>')">
                                                <u>Delete</u> </a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddEditClick(this,'AddNew')"><u>Add New</u>
                                        </a>
                                    </HeaderTemplate>
                                    <HeaderStyle Wrap="False" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="4" />
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                            <Templates>
                            </Templates>
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
                <tr>
                    <td>
                       <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="popup" runat="server"
                                    AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Exchange Details"
                                    EnableHotTrack="False" BackColor="#DDECFE" Width="520px" CloseAction="CloseButton">
                                    <contentcollection>
                                        <dxpc:PopupControlContentControl runat="server">
                                            <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="520px" ClientInstanceName="popPanel"
                                                OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
                                                <PanelCollection>
                                                    <dxp:PanelContent runat="server">
                <table>
                <tr id="txtStrike" runat="server">
                <td  class="gridcellleft">
                Strike Price
                </td>
                <td  class="gridcellleft">
                <asp:TextBox Width="200px" ID="txtStrikePrice" runat="server"></asp:TextBox>
                </td>
                </tr>
                <tr>
                <td  class="gridcellleft"> Expiry Date
                </td>
                <td  class="gridcellleft">
                 <dxe:ASPxDateEdit ID="txtExpDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        TabIndex="20" Width="204px">
                                        <buttonstyle width="13px">
                                            </buttonstyle>
                                    </dxe:ASPxDateEdit>
                </td>
                </tr>
                 <tr>
                <td  class="gridcellleft"> Trading Lot
                
                </td>
                <td  class="gridcellleft">
                 <asp:TextBox Width="200px" ID="txtLOT" runat="server"></asp:TextBox>
                </td>
                </tr>
                
                 <tr>
                <td  class="gridcellleft"> Ticker Symbol
                
                </td>
                <td  class="gridcellleft">
                 <asp:TextBox Width="200px" ID="txtTickerSysmbol"  runat="server"></asp:TextBox>
                 
                </td>
                </tr>
                
                 <tr>
                <td  class="gridcellleft"> Ticker Code
                
                </td>
                <td  class="gridcellleft">
                 <asp:TextBox Width="200px" ID="txtTickerCode" MaxLength="50" runat="server"></asp:TextBox>
                </td>
                </tr>
                <tr>
                
                                                                <td>
                                                                </td>
                                                                <td colspan="2" class="gridcellleft">
                                                                    <input id="Button1" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                        style="width: 60px" tabindex="41" />
                                                                    <input id="Button2" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                                                        style="width: 60px" tabindex="42" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="lblErrMsg" ForeColor="red" runat="Server"></asp:Label>
                            <label id="lblMsg"></label>
                                                                </td>
                                                            </tr>
                </table>
                
                 </dxp:PanelContent>
                                                </PanelCollection>
                                               <ClientSideEvents EndCallback="function(s, e) {
	                                                    EndCallBack(s.cpLast,s.cpfast);
                                                    }" />
                                            </dxcp:ASPxCallbackPanel>
                                        </dxpc:PopupControlContentControl>
                                    </contentcollection>
                                    <headerstyle horizontalalign="Left">
                                        <Paddings PaddingRight="6px" />
                                    </headerstyle>
                                    <sizegripimage height="16px" width="16px" />
                                    <closebuttonimage height="12px" width="13px" />
                                    <clientsideevents closebuttonclick="function(s, e) {
	 popup.Hide();
}" />
                                </dxpc:ASPxPopupControl>
                                
                               
                   </ContentTemplate>
                            <Triggers>
                               
                            </Triggers>
                            
                        </asp:UpdatePanel>
            </table>
        </div>
    </form>
</body>
</html>
