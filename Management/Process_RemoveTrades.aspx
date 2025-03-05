<%@ page language="C#" autoeventwireup="true" inherits="management_Process_RemoveTrades, App_Web_bfdn6hbr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>  
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Remove Trades</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/loaddata.js"></script>

    <script type="text/javascript" language="javascript">
        function DateChange(DateObj)
        {
            var Lck ='<%=Session["LCKBNK"] %>';
            var FYS ='<%=Session["FinYearStart"]%>';
            var FYE ='<%=Session["FinYearEnd"]%>'; 
            var LFY ='<%=Session["LastFinYear"]%>';
            DevE_CheckForLockDate(DateObj,Lck);
            DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
        }
        function DateCompare(DateobjFrm,DateobjTo)
        {
            var Msg="To Date Can Not Be Less Than From Date!!!";
            DevE_CompareDateForMin(DateobjFrm,DateobjTo,Msg);
        }
        function SignOff()
        {
           window.parent.SignOff();
        }
        function height()
        {
            if(document.body.scrollHeight>=500)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '500px';
            window.frameElement.Width = document.body.scrollWidth;
        } 
        function OnTypeChange()
        {
            if (cForGenOrDel.GetValue()=="G")
            {
                cBtnGnDl.SetText("Remove Unidentified");
            }
            if (cForGenOrDel.GetValue() == "P") {
                cBtnGnDl.SetText("Remove Unprocessed");
            }              
            if (cForGenOrDel.GetValue() == "O") {
                cBtnGnDl.SetText("Remove Processed Trades");
            }              
            if (cForGenOrDel.GetValue() == "F") {
                cBtnGnDl.SetText("Remove Expiry Trades");
            }              
            if(cForGenOrDel.GetValue()=="D")
            {
               cBtnGnDl.SetText("Remove All");
               divGvwDateDtl.style.display="none";               
            }             
        }
        function ShowButtonClick()
        {
            ShowLoading();
            var ComboValue = $.trim(cForGenOrDel.GetValue());            
            cGvDateDtl.PerformCallback('Show~'+ComboValue); 
        }
       function GvDateDtl_EndCallBack()
        {
            if(cGvDateDtl.cpDivShowHide!=null)
            {
                if(cGvDateDtl.cpDivShowHide=="T")
                {
                    divGvwDateDtl.style.display="inline";                   
                }
            else
            {
                divGvwDateDtl.style.display="none";              
            }            
        }        
        if(cGvDateDtl.cpShowUpdateDeleteStatus!=null)
        {
            if(cGvDateDtl.cpShowUpdateDeleteStatus =="U")
            {
                alert("Successfully Removed All Unidentified Trades!!");
            }
            else if(cGvDateDtl.cpShowUpdateDeleteStatus =="D")
            {
                alert("Successfully Removed All Trades!!");
            }
            else if(cGvDateDtl.cpShowUpdateDeleteStatus =="P")
            {
                alert("Successfully Removed All Un-Processed Trades!!");
            }
            else if(cGvDateDtl.cpShowUpdateDeleteStatus =="O")
            {
                alert("Successfully Removed All Processed Trades. Please Run Trade Processing Again To Get back the Processed Trades!!");
            }
            else if(cGvDateDtl.cpShowUpdateDeleteStatus =="F")
            {
                alert("Successfully Removed All Expiry Trades!!");
            }
            else if(cGvDateDtl.cpShowUpdateDeleteStatus =="E")
            {
               alert("No Data To Process..") ;
            }
            else
            {
                alert("No Data Exists..");
            }
        }        
        HideLoading();
   }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <div class="TableMain100">
                <div class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Remove All/Unidentified/Unprocess Trades For a Given Date Range</span></strong>
                </div>
            </div>
            <div class="pageContent">
                <center>
                    <br class="clear" />
                    <div style="width: 62%; padding: 2px" class="frmContent">
                        <div id="forDate" class="left">
                            <div class="frmleftContent" style="width: 80px; line-height: 20px">
                                <asp:Label ID="lblFromDate" runat="server" Text="From Date : "></asp:Label>
                            </div>
                            <div class="frmleftContent">
                                <dxe:ASPxDateEdit ID="DtFrom" runat="server" ClientInstanceName="cDtFrom" DateOnError="Today"
                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="115px">
                                    <ClientSideEvents DateChanged="function(s,e){DateChange(cDtFrom);}" />
                                    <ButtonStyle Width="3px">
                                    </ButtonStyle>
                                </dxe:ASPxDateEdit>
                            </div>
                        </div>
                        <div id="toDate" class="left">
                            <div class="frmleftContent" style="width: 80px; line-height: 20px">
                                <asp:Label ID="lblToDate" runat="server" Text="To Date : "></asp:Label>
                            </div>
                            <div class="frmleftContent">
                                <dxe:ASPxDateEdit ID="DtTo" runat="server" ClientInstanceName="cDtTo" DateOnError="Today"
                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="115px">
                                    <ClientSideEvents DateChanged="function(s,e){DateCompare(cDtFrom,cDtTo);}" />
                                    <ButtonStyle Width="3px">
                                    </ButtonStyle>
                                </dxe:ASPxDateEdit>
                            </div>
                        </div>
                        <div id="ddlGenerate" class="frmleftContent">
                            <dxe:ASPxComboBox runat="server" ID="ForGenOrDel" ClientInstanceName="cForGenOrDel"
                                DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                ValueType="System.String" SelectedIndex="0" Font-Size="Small" Width="150px">
                                <ClientSideEvents SelectedIndexChanged="OnTypeChange"></ClientSideEvents>
                                <Items>
                                    <dxe:ListEditItem Text="Remove Unidentified" Value="G"></dxe:ListEditItem>
                                     <dxe:ListEditItem Text="Remove Unprocess" Value="P"></dxe:ListEditItem>
                                     <dxe:ListEditItem Text="Remove Processed Trades" Value="O"></dxe:ListEditItem>
                                    <dxe:ListEditItem Text="Remove Expiry Trades" Value="F"></dxe:ListEditItem>
                                    <dxe:ListEditItem Text="Remove All" Value="D"></dxe:ListEditItem>
                                </Items>
                            </dxe:ASPxComboBox>
                        </div>
                        <div class="left" style="margin: 4px">
                            <dxe:ASPxButton ID="BtnGnDl" runat="server" Text="Remove Unidentified" TabIndex="0" ClientInstanceName="cBtnGnDl"
                                AutoPostBack="False" Font-Size="Small">
                                <ClientSideEvents Click="function (s, e) {ShowButtonClick();}" />
                            </dxe:ASPxButton>
                        </div>
                    </div>
                    <br class="clear" />
                    <div id="divGvwDateDtl" style="display: none; text-align: center">
                        <dxwgv:ASPxGridView ID="GvDateDtl" runat="server" AutoGenerateColumns="False" KeyFieldName="ID"
                            ClientInstanceName="cGvDateDtl" OnCustomCallback="GvDateDtl_CustomCallback" Width="20%">
                            <ClientSideEvents EndCallback="function (s, e) {GvDateDtl_EndCallBack();}" />
                            <Templates>
                                <TitlePanel>
                                    <table style="width: 100%">
                                        <tr>
                                            <td align="right">
                                                <table width="200px">
                                                    <tr>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </TitlePanel>
                                <EditForm>
                                </EditForm>
                            </Templates>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                            <Styles>
                                <Header CssClass="gridheader" ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <FocusedGroupRow CssClass="gridselectrow">
                                </FocusedGroupRow>
                                <FocusedRow CssClass="gridselectrow">
                                </FocusedRow>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                            </Styles>
                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Records Deleted" FieldName="Id" VisibleIndex="0" Width="30%">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="For The Period" FieldName="PositionDate" VisibleIndex="1"
                                    Width="65%">
                               
                                <PropertiesTextEdit DisplayFormatString="dd-MM-yyyy" >
                                </PropertiesTextEdit>                                
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <SettingsText EmptyDataRow="No Data To Display" />
                        </dxwgv:ASPxGridView>
                    </div>
                </center>
            </div>
        </div>
    </form>
</body>
</html>
