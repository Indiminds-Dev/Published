<%@ page language="C#" autoeventwireup="true" inherits="management_testProjectMainPage_FirstPage, App_Web_-k9nslwd" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script language="javascript" type="text/javascript">
    FieldName='ctl00_ContentPlaceHolder3_btnFilter';
    //function is called on changing focused row
    function OnGridFocusedRowChanged() {
        // Query the server for the Row ID "Rid" fields from the focused row 
        // The values will be returned to the OnGetRowValues() function     
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'Rid', OnGetRowValues);
        //alert();
    }
    //Value array contains Row ID "Rid" field values returned from the server 
    function OnGetRowValues(values) {
        RowID = values;
        //alert(RowID);
        //GridForR = document.getElementById("ctl00_ContentPlaceHolder3_GridReminder");
    }
    //________End here on changing focused row
    function OnGridSelectionChanged() 
    {
//        var noofrow=grid.GetSelectedRowCount().toString();
//        alert(noofrow);
        gridM.GetSelectedFieldValues('Mid', OnGridSelectionComplete);
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
        //alert(counter+'test');
    }
    function frmOpenNewWindow1(location,v_height,v_weight)
    { 
        var cmb = document.getElementById("ctl00_ContentPlaceHolder3_cmbTemplate");
        if(cmb.value != '')
        {
            var x=(screen.availHeight-v_height)/2;
            var y=(screen.availWidth-v_weight)/2
            window.open(location,"template","height="+ v_height +",width="+ v_weight +",top="+ x +",left="+ y +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=yes,resizable=no,dependent=no'");       
        }
    }
    function height()
        {
            window.frameElement.height = document.body.scrollHeight;
            window.frameElement.widht = document.body.scrollWidht;
        } 
    </script>

    <script type="text/ecmascript">
    function btnPending_click()
    {
        document.getElementById("FormId").style.display = 'none';
        document.getElementById("filterForm").style.display = 'none';
        document.getElementById("btnAttend").style.visibility='visible';
        document.getElementById("FormGrid").style.display = 'inline';
        grid.PerformCallback('Pending');
    }
    function btnToday_click()
    {
        document.getElementById("filterForm").style.display = 'none';
        document.getElementById("FormId").style.display = 'none';
        document.getElementById("btnAttend").style.visibility='visible';
        document.getElementById("FormGrid").style.display = 'inline';
        grid.PerformCallback('Today');
        counter='n';
        document.getElementById("trRepluForm").style.display = 'none';
        FieldName='ctl00_ContentPlaceHolder3_btnFilter';
    }
    function btnAttended_click()
    {
        document.getElementById("filterForm").style.display = 'inline';
        document.getElementById("FormId").style.display = 'none';
        document.getElementById("btnAttend").style.visibility='hidden';
        document.getElementById("FormGrid").style.display = 'inline';
        grid.PerformCallback('Attended');
    }
    function btnFilter_click()
    {
        var startFilterdate=document.getElementById("ctl00_ContentPlaceHolder3_txtStart");
        var endFilaterdate=document.getElementById("ctl00_ContentPlaceHolder3_txtEnd");
        var stdate = startFilterdate.value;
        var enddate = endFilaterdate.value;
        
        if(stdate!="" && enddate!="")
        {
            //alert(stdate + '--' + enddate);
            grid.PerformCallback('Filter');
        }
        else   
        {
            alert('Please Select Appropriate Date !!');
        }
        //CallServer('Today', "");
        //alert(RowID);
        //hidden-
    }
    function btnAttend_click()
    {
        document.getElementById("filterForm").style.display = 'none';
        document.getElementById("FormId").style.display = 'none';
        document.getElementById("FormGrid").style.display = 'inline';
        CallServer('Attend' + '~' + RowID, "");
        //alert('btnAttend_click');
        //document.getElementById('iFrmReminder').setAttribute('src','frmShowReminder.aspx');
    }
    function btnCreate_click()
    {
        document.getElementById("filterForm").style.display = 'none';
        document.getElementById("FormId").style.display = 'inline';
        document.getElementById("FormGrid").style.display = 'none';
        var combo = document.getElementById("ctl00_ContentPlaceHolder3_cmbCreatedFor")  ;
            combo.value=0;
            combo = document.getElementById("ctl00_ContentPlaceHolder3_cmbTicker")  ;
            combo.value=1;
            combo = document.getElementById("ctl00_ContentPlaceHolder3_txtStartDate")  ;
            combo.value="";
            combo = document.getElementById("ctl00_ContentPlaceHolder3_txtEndDate")  ;
            combo.value="";
            combo = document.getElementById("ctl00_ContentPlaceHolder3_txtcontent")  ;
            combo.value="";
            combo = document.getElementById("hdID")  ;
            combo.value="";
            //alert(data);
    }
    function btnEdit_click()
    {
        //__serverCall____//
        CallServer('Edit' + '~' + RowID, "");
    }
    function btnDelete_click()
    {
        //alert('d');
        document.getElementById("FormId").style.display = 'none';
        document.getElementById("FormGrid").style.display = 'inline';
        var con = confirm('Are you sure to Delete this record?');
        if(con)
        {
            CallServer('Delete' + '~' + RowID, "");
        }
        
    }
    function btnSave_click()
    {
        //alert('s');
        var data = 'Save';
        var combo = document.getElementById("ctl00_ContentPlaceHolder3_cmbCreatedFor")  ;
            if(combo.value != "")
            {
                data += '~' + combo.value;
            }
            else
            {
                alert('Select Target User!');
                return false;
            }
            combo = document.getElementById("ctl00_ContentPlaceHolder3_cmbTicker")  ;
            if(combo.value != "")
            {
                data += '~' + combo.value;
            }
            else
            {
                alert('Select Tricker!');
                return false;
            }
            combo = document.getElementById("ctl00_ContentPlaceHolder3_txtStartDate")  ;
            if(combo.value != "")
            {
                data += '~' + combo.value;
            }
            else
            {
                alert('Fill Start Date!');
                return false;
            }
            combo = document.getElementById("ctl00_ContentPlaceHolder3_txtEndDate")  ;
            if(combo.value != "")
            {
                data += '~' + combo.value;
            }
            else
            {
                alert('Fill End Date!');
                return false;
            }
            combo = document.getElementById("ctl00_ContentPlaceHolder3_txtcontent")  ;
            if(combo.value != "")
            {
                data += '~' + combo.value;
            }
            else
            {
                alert('Fill Content Data!');
                return false;
            }
            combo = document.getElementById("hdID")  ;
            data += '~' + combo.value;
            //alert(data);
        //__serverCall____//
        CallServer(data, "");    
        
    }
    function btnCancel_click()
    {
        //alert('Ca');
        document.getElementById("FormId").style.display = 'none';
        document.getElementById("FormGrid").style.display = 'inline';
    }
    function btnInbox_Click()
    {
        gridM.PerformCallback('inBox');
        //document.getElementById("FormCreate").style.display = 'none';
        document.getElementById("FormGridM").style.display = 'inline';
        document.getElementById("trRepluForm").style.display = 'none';
        gridM.UnselectAllRowsOnPage();
    }
    function btnRead_click()
    { 
        if(counter != 'n')
        {
            //document.getElementById("FormCreate").style.display = 'none';
            var ReadIDs= 'read~' + counter;
            CallServer(ReadIDs,"");
        }
        else
            alert('Plase Select a message!');
        
    }
    function btnReply_Click()
    {
        if(counter != 'n')
        {
            var ReadIDs= 'reply~' + counter;
            CallServer(ReadIDs,"");
        }
        else
            alert('Plase Select a message!');
    }
    function btnShowTemplate_click()
    {
        document.getElementById("TDtemplate").style.display = 'inline';
        document.getElementById("TDshow").style.display = 'none';
    }
    function btnHideTemplate_click()
    {
        document.getElementById("TDtemplate").style.display = 'none';
        document.getElementById("TDshow").style.display = 'inline';
    }
    function btnCancelM_click()
    {
        document.getElementById("trRepluForm").style.display = 'none';
        document.getElementById("FormGridM").style.display = 'inline';
        gridM.UnselectAllRowsOnPage();
        counter = 'n';
    }
    function btnSend_click()
    {
        var replyText = document.getElementById("ctl00_ContentPlaceHolder3_txtContentM");
        var ReadIDs = "send~" + counter + '~' + replyText.value;
        CallServer(ReadIDs,"");
    }
    function ReceiveServerData(rValue)
    {   
        //alert(rValue);
        var DATA=rValue.split('~');  
        if(DATA[0]=="Edit")
        {
            if(DATA[1]!="nauth")
            {  
                document.getElementById("FormId").style.display = 'inline';
                var combo = document.getElementById("ctl00_ContentPlaceHolder3_cmbCreatedFor")  ;
                combo.value=DATA[1];
                combo = document.getElementById("ctl00_ContentPlaceHolder3_cmbTicker")  ;
                combo.value=DATA[2];
                combo = document.getElementById("ctl00_ContentPlaceHolder3_txtStartDate")  ;
                combo.value=DATA[3];
                combo = document.getElementById("ctl00_ContentPlaceHolder3_txtEndDate")  ;
                combo.value=DATA[4];
                combo = document.getElementById("ctl00_ContentPlaceHolder3_txtcontent")  ;
                combo.value=DATA[5];
                combo = document.getElementById("hdID")  ;
                combo.value=DATA[6];
            }
            else
            {
                alert('You are not Authorise to Change data!!');
                document.getElementById("FormId").style.display = 'none';
            }
        }
        if(DATA[0]=="Save")
        {
            if(DATA[1]!="Y")
                alert('Update Unsuccessful!');
            else
            {
                grid.PerformCallback(DATA[2]);
                alert('Update Successful!');
                document.getElementById("FormId").style.display = 'none';
                //_____Getting latest data in iframe by calling function of reminder page without refreshing page___//
                x = top.frames['iFrmReminder'].ParentCall('Parent');
            }
        }
        if(DATA[0]=="Delete")
        {
            if(DATA[1]!="Y")
                alert('You are not Authorise to Change data!!');
            else
            {
                grid.PerformCallback(DATA[2]);
                alert('Deleted Successfully!');
                //x = top.frames['iFrmReminder'].location = "frmShowReminder.aspx";
                x = top.frames['iFrmReminder'].ParentCall('Parent');
            }
        }
        if(DATA[0]=="Attend")
        {
            if(DATA[1]!="Y")
                alert('You are not Authorise to Change data!!');
            else
            {
                grid.PerformCallback(DATA[2]);
                alert('Attended Successfully!');
                x = top.frames['iFrmReminder'].ParentCall('Parent');
            }
        }
        if(DATA[0]=="read")
        {
            if(DATA[1]=="Y")
            {
                alert('Read Successfully!');
                gridM.PerformCallback('read');
                gridM.UnselectAllRowsOnPage();
            }
            else if(DATA[1]=="S")
                alert('Please Select a message!');
        }
        if(DATA[0]=="reply")
        {
            if(DATA[1] != "M")
            {
                if(DATA[1]!="")
                {
                    document.getElementById("trRepluForm").style.display = 'inline';
                    document.getElementById("FormGridM").style.display = 'none';
                    var replyText = document.getElementById("ctl00_ContentPlaceHolder3_txtContentM");
                    replyText.value='';
                    
                    var txtUserNameId = document.getElementById("ctl00_ContentPlaceHolder3_txtRelplyUser");
                    txtUserNameId.value = DATA[1] + '[' + DATA[6] + ']';
                    document.getElementById("ctl00_ContentPlaceHolder3_txtRelplyUser").disabled=true;
                    
                    var replyText = document.getElementById("ctl00_ContentPlaceHolder3_txtReply");
                    replyText.value = 'On ' + DATA[2] + ', \" ' + DATA[1] + ' \" Wrote: \n\t' + DATA[3];
                }
                else
                    alert('You Can not Reply System Generated message!');
            }
            else
                alert('You Can not reply more than one message at a time!');
        }
        if(DATA[0]=="send")
        {
            if(DATA[1]=="Y")
            {
                alert('Message sended Successfully!');
                document.getElementById("trRepluForm").style.display = 'none';
                document.getElementById("FormGridM").style.display = 'inline';
                gridM.PerformCallback('inBox');
                gridM.UnselectAllRowsOnPage();
                counter = 'n';
                var replyText = document.getElementById("ctl00_ContentPlaceHolder3_txtContentM");
                replyText.value='';
            }
        }
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td style="text-align: left; vertical-align: top; text-align: left; width: 100%">
                    <table class="TableMain100">
                        <tr>
                            <td class="EHEADER" style="text-align: center">
                                <strong><span style="color: #F96410; font-size: 10pt;">Reminders</span></strong></td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; text-align: left;">
                                <table>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">
                                            <input id="Today" type="button" value="Today`s" class="btnUpdate" onclick="btnToday_click();"
                                                style="width: 80px; height: 19px;" runat="server" />
                                        </td>
                                        <td style="vertical-align: top; text-align: left;">
                                            <input id="Pending" type="button" value="Pending" class="btnUpdate" onclick="btnPending_click();"
                                                style="width: 80px; height: 19px;" />
                                        </td>
                                        <td style="vertical-align: top; text-align: left;">
                                            <input id="Attended" type="button" value="Attended" class="btnUpdate" onclick="btnAttended_click();"
                                                style="width: 80px; height: 19px;" />
                                        </td>
                                        <td style="vertical-align: top; text-align: left;">
                                            <input id="btnAttend" type="button" value="Attend" class="btnUpdate" onclick="btnAttend_click();"
                                                style="width: 80px; height: 19px;" />
                                        </td>
                                        <td style="vertical-align: top; text-align: left;">
                                            <input id="btnCreate" type="button" value="Create" class="btnUpdate" onclick="btnCreate_click();"
                                                style="width: 80px; height: 19px;" />
                                        </td>
                                        <td style="vertical-align: top; text-align: left;">
                                            <input id="btnEdit" type="button" value="Edit" class="btnUpdate" onclick="btnEdit_click();"
                                                style="width: 80px; height: 19px;" />
                                        </td>
                                        <td style="vertical-align: top; text-align: left;">
                                            <input id="btnDelete" type="button" value="Delete" class="btnUpdate" onclick="btnDelete_click();"
                                                style="width: 80px; height: 19px;" />
                                        </td>
                                        <td style="width: 137px;">
                                            &nbsp;<asp:HiddenField ID="hdUserList" runat="server" />
                                        </td>
                                        <td style="vertical-align: top; text-align: left;">
                                            <asp:TextBox ID="Text1" runat="server" Visible="false" Width="10px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100%; vertical-align: top;">
                                <table style="width: 100%; vertical-align: top">
                                    <tr id="FormID" style="display: none">
                                        <td colspan="2" style="background-color: #D1E1F8;">
                                            <asp:Panel ID="pnlForm" runat="server" Width="100%" BorderColor="blue" BorderWidth="1px"
                                                BackColor="#D1E1F8">
                                                <table style="height: 9px">
                                                    <tr>
                                                        <td style="text-align: right; width: 98px;">
                                                            <span id="Span2" class="Ecoheadtxt">Created For:</span>
                                                        </td>
                                                        <td class="gridcellleft">
                                                            <asp:DropDownList ID="cmbCreatedFor" runat="server" Width="178px" TabIndex="1" Font-Size="10px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; width: 98px;">
                                                            <span id="Span3" class="Ecoheadtxt">Display as Ticker:</span>
                                                        </td>
                                                        <td class="gridcellleft">
                                                            <asp:DropDownList ID="cmbTicker" runat="server" Width="178px" TabIndex="2" Font-Size="10px">
                                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                <asp:ListItem Value="0">No</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; width: 98px;">
                                                            <span id="spHoldUntillDate" class="Ecoheadtxt">Start date:</span>
                                                        </td>
                                                        <td class="gridcellleft" style="width: 198px;">
                                                            <asp:TextBox ID="txtStartDate" runat="server" Font-Size="10px" TabIndex="3" Width="154px"></asp:TextBox>
                                                            <asp:Image ID="ImgStartDate" runat="server" ImageUrl="~/images/calendar.jpg" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; width: 98px;">
                                                            <span id="Span1" class="Ecoheadtxt">End date:</span>
                                                        </td>
                                                        <td class="gridcellleft" style="width: 198px;">
                                                            <asp:TextBox ID="txtEndDate" runat="server" Font-Size="10px" TabIndex="4" Width="154px"></asp:TextBox>
                                                            <asp:Image ID="imgEndDate" runat="server" ImageUrl="~/images/calendar.jpg" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; width: 98px;">
                                                            <span id="Span4" class="Ecoheadtxt">Content:</span>
                                                        </td>
                                                        <td class="gridcellleft" style="width: 198px;">
                                                            <asp:TextBox ID="txtcontent" runat="server" Font-Size="12px" TabIndex="5" Height="30px"
                                                                TextMode="MultiLine" Width="603px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 98px">
                                                        </td>
                                                        <td class="gridcellleft">
                                                            <input id="btnSave" type="button" value="Save" class="btnUpdate" onclick="btnSave_click();"
                                                                style="width: 80px; height: 18px;" />
                                                            &nbsp;&nbsp;
                                                            <input id="btnCancel" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_click();"
                                                                style="width: 80px; height: 18px;" />
                                                            <input id="hdID" type="hidden" style="width: 151px; height: 7px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr style="width: 100%">
                                        <td style="vertical-align: top; text-align: left; width: 80px;" id="filterForm">
                                            <table style="width: 182px">
                                                <tr>
                                                    <td class="Ecoheadtxt" style="width: 29%">
                                                        <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Start Date:" Font-Size="10px">
                                                        </dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align: left; width: 63%;">
                                                        <asp:TextBox ID="txtStart" runat="server" TabIndex="1" Width="88px" ValidationGroup="d"
                                                            Font-Size="10px"></asp:TextBox>
                                                        <asp:Image ID="imgStart" runat="server" ImageUrl="~/images/calendar.jpg" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Ecoheadtxt" style="width: 29%">
                                                        <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="End Date:" Font-Size="10px">
                                                        </dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align: left; width: 63%;">
                                                        <asp:TextBox ID="txtEnd" runat="server" TabIndex="2" Width="87px" ValidationGroup="d"
                                                            Font-Size="10px"></asp:TextBox>
                                                        <asp:Image ID="imgEnd" runat="server" ImageUrl="~/images/calendar.jpg" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="text-align: right;">
                                                        <input id="Filter" type="button" value="Filter" class="btnUpdate" onclick="btnFilter_click();"
                                                            style="width: 80px" runat="server" validationgroup="d" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align: left; width: 100%; vertical-align: top;" id="FormGrid">
                                            <dxwgv:ASPxGridView ID="GridReminder" ClientInstanceName="grid" runat="server"  KeyFieldName="Rid" AutoGenerateColumns="False" OnCustomCallback="GridReminder_CustomCallback"
                                                Width="100%">
                                                <Styles >
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                </Styles>
                                                <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True">
                                                    <FirstPageButton Visible="True">
                                                    </FirstPageButton>
                                                    <LastPageButton Visible="True">
                                                    </LastPageButton>
                                                </SettingsPager>
                                                <SettingsBehavior AllowFocusedRow="True" AllowSort="False" />
                                                <ClientSideEvents FocusedRowChanged="function(s, e) { OnGridFocusedRowChanged(); }" />
                                                
                                                <Columns>
                                                    <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Visible="False">
                                                        <ClearFilterButton Visible="True">
                                                        </ClearFilterButton>
                                                    </dxwgv:GridViewCommandColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Created By" FieldName="CreateBy" ReadOnly="True"
                                                        VisibleIndex="0">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Created For" FieldName="Target" ReadOnly="True"
                                                        VisibleIndex="1">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Content" FieldName="Content" ReadOnly="True"
                                                        VisibleIndex="2">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Status" ReadOnly="True"
                                                        VisibleIndex="3">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                            </dxwgv:ASPxGridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="EHEADER" style="text-align: center">
                                <strong><span style="color: #F96410; font-size: 10pt;">Messages</span></strong></td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <input id="btnInbox" type="button" value="Inbox" class="btnUpdate" onclick="btnInbox_Click();"
                                    style="width: 80px; height: 19px" tabindex="4" />
                                <input id="btnRead" type="button" value="Read" class="btnUpdate" onclick="btnRead_click();"
                                    style="width: 80px; height: 19px" tabindex="1" />&nbsp;
                                <input id="btnReply" type="button" value="Reply" class="btnUpdate" onclick="btnReply_Click();"
                                    style="width: 80px; height: 19px" tabindex="1" />&nbsp;
                            </td>
                        </tr>
                        <tr id="FormGridM">
                            <td>
                                <dxwgv:ASPxGridView ID="GridMessage" ClientInstanceName="gridM" runat="server"  Width="100%" KeyFieldName="Mid" OnCustomCallback="GridMessage_CustomCallback"
                                    AutoGenerateColumns="False">
                                    <Styles >
                                        <LoadingPanel ImageSpacing="10px">
                                        </LoadingPanel>
                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                        </Header>
                                    </Styles>
                                    <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True">
                                        <FirstPageButton Visible="True">
                                        </FirstPageButton>
                                        <LastPageButton Visible="True">
                                        </LastPageButton>
                                    </SettingsPager>
                                    <SettingsBehavior AllowMultiSelection="True" />
                                    <ClientSideEvents SelectionChanged="function(s, e) { OnGridSelectionChanged(); }" />
                                    
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width="3%">
                                            <HeaderTemplate>
                                                <input type="checkbox" onclick="gridM.SelectAllRowsOnPage(this.checked);" style="vertical-align: middle;"
                                                    title="Select/Unselect all rows on the page"></input>
                                            </HeaderTemplate>
                                            <HeaderStyle HorizontalAlign="Center">
                                                <Paddings PaddingBottom="1px" PaddingTop="1px" />
                                            </HeaderStyle>
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Created By" FieldName="CreateBy" ReadOnly="True"
                                            VisibleIndex="1">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Created For" FieldName="Target" ReadOnly="True"
                                            VisibleIndex="2">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Content" FieldName="content" ReadOnly="True"
                                            VisibleIndex="3">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Status" ReadOnly="True"
                                            VisibleIndex="4">
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                        <tr id="trRepluForm">
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellright" style="width: 15%">
                                            <span style="font-size: 10px; color: #000099">Use Templates:</span></td>
                                        <td style="display: none;" id="TDtemplate" class="gridcellleft">
                                            <asp:DropDownList ID="cmbTemplate" runat="server" Width="151px" Font-Size="10px">
                                            </asp:DropDownList>
                                            <a id="btnHideTemplate" href="javascript:void(0);" onclick="btnHideTemplate_click()">
                                                <span style="color: #000099; text-decoration: underline">Hide</span></a>&nbsp;&nbsp;
                                        </td>
                                        <td class="gridcellleft" id="TDshow">
                                            <a id="btnShowTemplate" href="javascript:void(0);" onclick="btnShowTemplate_click()">
                                                <span style="color: #000099; text-decoration: underline">Show</span></a>
                                        </td>
                                    </tr>
                                    <tr id="ReplyUserName">
                                        <td class="gridcellright" style="width: 15%">
                                            <span style="font-size: 10px; color: #000099">Created For:</span></td>
                                        <td colspan="2" class="gridcellleft">
                                            <asp:TextBox ID="txtRelplyUser" runat="server" Width="269px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr id="TRcontent">
                                        <td class="gridcellright" style="width: 15%">
                                            <span style="font-size: 10px; color: #000099">Content:</span></td>
                                        <td colspan="2" class="gridcellleft">
                                            <asp:TextBox ID="txtContentM" runat="server" TextMode="MultiLine" Width="700px" Height="48px"
                                                Font-Size="12px"></asp:TextBox></td>
                                    </tr>
                                    <tr id="TRreplied">
                                        <td>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txtReply" runat="server" TextMode="MultiLine" Width="700px" Font-Size="12px"
                                                ReadOnly="true" Height="48px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr id="TRbutton">
                                        <td>
                                        </td>
                                        <td colspan="2" class="gridcellleft">
                                            <input id="btnReplydata" type="button" value="Send" class="btnUpdate" onclick="btnSend_click();"
                                                style="width: 66px; height: 19px" tabindex="4" />
                                            <input id="Button1" type="button" value="Cancel" class="btnUpdate" onclick="btnCancelM_click();"
                                                style="width: 66px; height: 19px" tabindex="4" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
