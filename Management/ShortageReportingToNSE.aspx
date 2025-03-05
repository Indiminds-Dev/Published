<%@ page language="C#" autoeventwireup="true" inherits="Management_ShortageReportingToNSE, App_Web_psdiigfa" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Securities PayIN/PayOut Shortage File</title>
    <!--External Styles-->
    <link href="../CentralData/CSS/GenericCss.css" rel="stylesheet" type="text/css" />
    <!--InLine Styles-->
    <style type="text/css">      
         #Container1 { width: 1200px; padding:5px}
        .LableWidth { width:110px;}
        .ContentWidth { width:200px; height:21px;}
        .btnRight { margin-right:200px; } 
    </style>
    
    <!--External Scripts file-->
        <!--Other Script-->
    
    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    
    <!--inline JSCRIPT -->

    <script type="text/javascript" language="javascript">
        function Page_Load()
        {  
           Height('300','300');   
        }
        function DateChange(DateObj)
        { 
            // alert(DateObj.GetText());
            var Lck ='<%=Session["LCKBNK"] %>';
            var FYS ='<%=Session["FinYearStart"]%>';
            var FYE ='<%=Session["FinYearEnd"]%>'; 
            var LFY ='<%=Session["LastFinYear"]%>';
            var GetDate='<%=Session["ServerDate"]%>';
            DevE_CheckForLockDate(DateObj,Lck);
            DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
            cgridBatch.PerformCallback("BindGrid~");
        }
        function ExoprtFetchGrid()
        {
            cgridBatch.PerformCallback("ExportFetch~");
            Height('350','350'); 
        }
        function gridBatch_EndCallBack()
        {
            //alert(cgridBatch.cpBatchData);
            if(cgridBatch.cpBatchData!=undefined)
            {
                GetObjectID('btnHideExport').click();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="Header" class="Header">
                Securities PayIn/PayOut Shortage File</div>
            <div id="Container1" class="container">
                <div id="Row1" class="Row">
                    <div id="Row1_Col1" class="LFloat_Lable LableWidth">
                        PayOut Date :
                    </div>
                    <div id="Row1_Col2" class="LFloat_Content ContentWidth">
                        <dxe:ASPxDateEdit ID="DtPayOut" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                            Font-Size="10px" Width="108px" ClientInstanceName="cDtPayOut" EditFormatString="dd-MM-yyyy">
                            <DropDownButton Text="Select">
                            </DropDownButton>
                            <ClientSideEvents DateChanged="function(s,e){DateChange(cDtPayOut);}" />
                        </dxe:ASPxDateEdit>
                    </div>
                    <div id="Row1_Col3" class="LFloat_Content LableWidth">
                    <dxe:ASPxButton ID="BtnExport" runat="server" AutoPostBack="False" ClientInstanceName="cBtnExport"
                        Text="Export">
                        <ClientSideEvents Click="function(s,e){ExoprtFetchGrid();}" />
                    </dxe:ASPxButton>
                </div>
                    <br class="clear" />
                </div>
                <br /><br />
                <dxwgv:ASPxGridView ID="gridBatch" runat="server" AutoGenerateColumns="true" ClientInstanceName="cgridBatch"
                    KeyFieldName="ExportFiles_ID" Width="1200px" OnCustomCallback="gridBatch_CustomCallback"
                    OnRowDeleting="gridBatch_RowDeleting" OnCommandButtonInitialize="gridBatch_CommandButtonInitialize">
                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                    <Styles>
                        <FocusedGroupRow CssClass="gridselectrow">
                        </FocusedGroupRow>
                        <FocusedRow CssClass="gridselectrow">
                        </FocusedRow>
                    </Styles>
                    <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                    </SettingsPager>
                    <Columns>
                        <dxwgv:GridViewCommandColumn VisibleIndex="0">
                            <ClearFilterButton Visible="True">
                            </ClearFilterButton>
                            <DeleteButton Visible="True">
                            </DeleteButton>
                        </dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="ExportFiles_Type" Caption="Type" VisibleIndex="1"
                            Width="50px">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="ExportFiles_Name" Caption="FileName" VisibleIndex="2"
                            Width="50px">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="ExportFiles_Path" Caption="FilePath" VisibleIndex="3"
                            Width="50px">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="ExportFiles_BatchNumber" Caption="BatchNo"
                            VisibleIndex="4" Width="50px">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="ExportFiles_CreateUser" Caption="CreateUser"
                            VisibleIndex="5" Width="50px">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="ExportFiles_CreateDateTime" Caption="CreateDateTime"
                            VisibleIndex="6" Width="50px">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="ExportFiles_BatchStatus" Caption="BatchStatus"
                            VisibleIndex="7" Width="50px">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="ExportFiles_ModifyUser" Caption="ModifyUser"
                            VisibleIndex="8" Width="50px">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="ExportFiles_ModifyDateTime" Caption="ModifyDateTime"
                            VisibleIndex="9" Width="50px">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowStatusBar="Visible" ShowHorizontalScrollBar="true" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <ClientSideEvents EndCallback="function (s, e) {gridBatch_EndCallBack();}" />
                </dxwgv:ASPxGridView>
            </div>
            <div style="display: none">
                <asp:Button ID="btnHideExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                    OnClick="btnHideExport_Click" />
            </div>
        </div>
    </form>
</body>
</html>
