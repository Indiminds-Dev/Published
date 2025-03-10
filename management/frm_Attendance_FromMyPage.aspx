<%@ page language="C#" autoeventwireup="true" inherits="Reports_frm_Attendance_FromMyPage, App_Web_itibbj7j" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Attendance</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:32767;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:3000;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script language="javascript" type="text/javascript">
     function SignOff()
        {
        window.parent.SignOff()
        }
     function height()
        {
            window.frameElement.height = document.body.scrollHeight;
            window.frameElement.widht = document.body.scrollWidht;
        }
    
    function validation()
    {
       ASPx_EmployeeAtdd.PerformCallback();
    }
    function PageLoad()
    {
        FieldName='btnShow';
        document.getElementById('txtName_hidden').style.display="none";
        ShowEmployeeFilterForm('A');
        height();
    }
    function ShowEmployeeFilterForm(obj)
    {//alert(obj);
        document.getElementById('txtName_hidden').value="";
        if(obj=='A')
        {
            hide('tdtxtname');
            hide('tdname');
            document.getElementById('txtName_hidden').style.display="none";
        }
        if(obj=='S')
        {
            show('tdtxtname');
            show('tdname');
            document.getElementById('txtName_hidden').style.display="none";
        }
        height();
    }
    function NoOfRows(obj)
    {
        //alert(obj);
        Noofrows=obj;
        document.getElementById('txtName_hidden').style.display="none";
    }
    function show(obj1)
    {
        //alert(obj1);
         document.getElementById(obj1).style.display='inline';
    }
    function hide(obj1)
    {
        //alert(obj1);
         document.getElementById(obj1).style.display='none';
    }
     FieldName='btnShow'
//      function CallAjax(obj1,obj2,obj3)
//    {
//        var cmbcompany=document.getElementById('cmbCompany_VI');
//        var cmbbranch=document.getElementById('cmbBranch_VI');
//        var obj4=cmbcompany.value+'~'+cmbbranch.value
//        //alert(obj4);
//        ajax_showOptions(obj1,obj2,obj3,obj4);
//    }
    function openLegendPage()
    {
        window.open('frmLegendReport_popup.aspx','50','resizable=1,height=250px,width=100px');
    }
    function height()
    {
        if(document.body.scrollHeight>300)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '300px';
//        alert(window.frameElement.width);
//        alert(document.documentElement.clientWidth);
        window.frameElement.width = document.documentElement.clientWidth;
//        alert(window.frameElement.width);
    }
    function LastCall(obj)
    {
        height();
    }
    function btnShowClick()
    {
        if(ReportType.GetValue()=='Screen')
        {
            ASPx_EmployeeAtdd.PerformCallback();
        }
        else
        {
            var user='';
            if(User.GetValue()=='A')
                user='All';
            else
            {
                var a=document.getElementById("txtName_hidden");
                user=a.value;
            }
            var url='frmReport_Attendance_Print.aspx?id='+Year.GetValue()+'~'+Month.GetValue()+'~'+Company.GetValue()+'~'+Branch.GetValue()+'~'+user;
            //alert(url)
            parent.OnMoreInfoClick(url,"Employee Attendance Details",'940px','450px',"N");
        }
    }
    </script>

    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100" cellpadding="opx" cellspacing="0px">
            <tr>
                <td class="EHEADER" style="text-align: center">
                    <strong><span style="color: #000099">Employee's Attendance Report</span></strong>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="0" class="TableMain" cellpadding="0" cellspacing="0" style="width: 100%;
                        padding-right: 0px; padding-left: 0px; padding-bottom: 0px; padding-top: 0px;">
                        <tr>
                            <td valign="bottom" class="gridcellleft">
                                <table>
                                    <tr>
                                        <td style="text-align: left" valign="top">
                                            <a href="#" onclick="javascript:openLegendPage();"><span class="Ecoheadtxt" style="color: Blue">
                                                <strong>Legends</strong></span></a>
                                        </td>
                                        <td class="gridcellleft" style="width: 50px;" valign="top">
                                            <dxe:ASPxComboBox ID="cmbYear" Width="120px" runat="server" Font-Size="10px" ValueType="System.String"
                                                Font-Bold="False" ClientInstanceName="Year">
                                                <buttonstyle width="13px">
                                                </buttonstyle>
                                                <dropdownbutton text="Year">
                                                </dropdownbutton>
                                            </dxe:ASPxComboBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="cmbYear"
                                                runat="server" ErrorMessage="Invalid Year" Width="117px"></asp:RequiredFieldValidator></td>
                                        <td class="gridcellleft" style="width: 50px;" valign="top">
                                            <dxe:ASPxComboBox ID="cmbMonth" Width="120px" runat="server" Font-Size="10px" ValueType="System.String"
                                                Font-Bold="False" ClientInstanceName="Month">
                                                <items>
                                                    <dxe:ListEditItem Text="January" Value="1" />
                                                    <dxe:ListEditItem Text="February" Value="2" />
                                                    <dxe:ListEditItem Text="March" Value="3" />
                                                    <dxe:ListEditItem Text="April" Value="4" />
                                                    <dxe:ListEditItem Text="May" Value="5" />
                                                    <dxe:ListEditItem Text="June" Value="6" />
                                                    <dxe:ListEditItem Text="July" Value="7" />
                                                    <dxe:ListEditItem Text="August" Value="8" />
                                                    <dxe:ListEditItem Text="September" Value="9" />
                                                    <dxe:ListEditItem Text="October" Value="10" />
                                                    <dxe:ListEditItem Text="November" Value="11" />
                                                    <dxe:ListEditItem Text="December" Value="12" />
                                                </items>
                                                <buttonstyle width="13px">
                                                </buttonstyle>
                                                <dropdownbutton text="Month">
                                                </dropdownbutton>
                                            </dxe:ASPxComboBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="cmbMonth"
                                                runat="server" ErrorMessage="Invalid Month" Width="118px"></asp:RequiredFieldValidator></td>
                                        <td class="gridcellleft"  valign="top">
                                            <dxe:ASPxComboBox ID="cmbCompany" Width="160px" runat="server" Font-Size="10px" ValueType="System.String"
                                                Font-Bold="False" ClientInstanceName="Company">
                                                <buttonstyle width="13px"></buttonstyle>
                                                <dropdownbutton text="Company"></dropdownbutton>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td class="gridcellleft"  valign="top">
                                            <dxe:ASPxComboBox ID="cmbBranch" Width="160px" runat="server" ValueType="System.String"
                                                Font-Size="10px" ClientInstanceName="Branch" EnableIncrementalFiltering="True"
                                                EnableTheming="False" Font-Overline="False">
                                                <buttonstyle width="13px"></buttonstyle>
                                                <dropdownbutton text="Branch" width="40px"></dropdownbutton>
                                            </dxe:ASPxComboBox>
                                        </td>
                                     
                                        <td valign="top" >
                                            <dxe:ASPxButton id="btnShow" runat="server" AutoPostBack="false" Text="Show">
                                                <clientsideevents click="function(s,e){btnShowClick();}"></clientsideevents>
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="visibility: hidden">
                            <td style="vertical-align: top; text-align: left;">
                                <table>
                                    <tr>
                                        <td class="gridcellleft" valign="top">
                                            <span class="Ecoheadtxt" style="color: Blue"><strong>User:</strong></span></td>
                                        <td class="gridcellleft" valign="top">
                                            <dxe:ASPxRadioButtonList ID="rbUser" runat="server" SelectedIndex="1" ItemSpacing="10px"
                                                RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px" ClientInstanceName="User">
                                                <items>
                                                    <dxe:ListEditItem Text="All" Value="A" />
                                                    <dxe:ListEditItem Text="Specific" Value="S"  />
                                                </items>
                                                <clientsideevents valuechanged="function(s, e) {ShowEmployeeFilterForm(s.GetValue());}" />
                                                <disabledstyle>
                                                    <Border BorderStyle="None" BorderWidth="0px" />
                                                </disabledstyle>
                                                <paddings padding="0px" />
                                                <border borderstyle="None" borderwidth="0px" />
                                            </dxe:ASPxRadioButtonList>
                                        </td>
                                        <td class="gridcellleft" id="tdname" valign="top">
                                            <span class="Ecoheadtxt" style="color: Blue"><strong>Name:</strong></span></td>
                                        <td class="gridcellleft" id="tdtxtname" style="vertical-align: top">
                                            <asp:TextBox ID="txtName" runat="server" Width="252px" Font-Size="11px"></asp:TextBox>
                                            <asp:TextBox ID="txtName_hidden" runat="server" Width="14px"></asp:TextBox></td>
                                        
                                    <td class="gridcellleft" valign="top">
                                            <span style="color: Blue"><strong>Report Type:</strong></span></td>
                                               <td class="gridcellleft" valign="top">
                                            <dxe:ASPxRadioButtonList ID="RBReportType" runat="server" RepeatDirection="Horizontal"
                                                SelectedIndex="0" TextSpacing="3px" ItemSpacing="1px" ClientInstanceName="ReportType">
                                                <items>
                                                    <dxe:ListEditItem Text="Screen" Value="Screen" />
                                                    <dxe:ListEditItem Text="Print" Value="Print" />
                                                </items>
                                                <validationsettings errortext="Error has occurred">
                                                    <ErrorImage Width="14px" />
                                                </validationsettings>
                                                <border borderwidth="0px" />
                                                <paddings padding="0px" />
                                            </dxe:ASPxRadioButtonList>
                                        </td>
                                        <td class="gridcellleft" valign="top" style="width: 61px">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="TableMain100" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="gridcellcenter">
                                <dxwgv:ASPxGridView ID="ASPx_EmployeeAtdd" ClientInstanceName="ASPx_EmployeeAtdd"
                                    runat="server" AutoGenerateColumns="False" DataSourceID="SDSAttdMain" OnCustomCallback="ASPx_EmployeeAtdd_CustomCallback"
                                    Width="950px" OnHtmlDataCellPrepared="ASPx_EmployeeAtdd_HtmlDataCellPrepared"
                                    Font-Size="10px" OnCustomJSProperties="ASPx_EmployeeAtdd_CustomJSProperties">
                                    <Styles>
                                        <Header ImageSpacing="8px" SortingImageSpacing="8px">
                                        </Header>
                                        <LoadingPanel ImageSpacing="10px">
                                        </LoadingPanel>
                                    </Styles>
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Employee Name" FieldName="empName" Width="200px"
                                            VisibleIndex="0" FixedStyle="Left">
                                            <CellStyle Wrap="False" CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Emp. Code" FieldName="code" Width="50px" VisibleIndex="1"
                                            FixedStyle="Left">
                                            <CellStyle Wrap="False" CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Company Name" FieldName="cmp_Name" Width="300px"
                                            VisibleIndex="2">
                                            <CellStyle Wrap="False" CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Branch" FieldName="branch_description" Width="200px"
                                            VisibleIndex="3">
                                            <CellStyle Wrap="False" CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="1" FieldName="day1" Width="10px" VisibleIndex="4">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="2" FieldName="day2" Width="10px" VisibleIndex="5">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="3" FieldName="day3" Width="10px" VisibleIndex="6">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="4" FieldName="day4" Width="10px" VisibleIndex="7">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="5" FieldName="day5" Width="10px" VisibleIndex="8">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="6" FieldName="day6" Width="10px" VisibleIndex="9">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="7" FieldName="day7" Width="10px" VisibleIndex="10">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="8" FieldName="day8" Width="10px" VisibleIndex="11">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="9" FieldName="day9" Width="10px" VisibleIndex="12">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="10" FieldName="day10" Width="10px" VisibleIndex="13">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="11" FieldName="day11" Width="10px" VisibleIndex="14">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="12" FieldName="day12" Width="10px" VisibleIndex="15">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="13" FieldName="day13" Width="10px" VisibleIndex="16">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="14" FieldName="day14" Width="10px" VisibleIndex="17">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="15" FieldName="day15" Width="10px" VisibleIndex="18">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="16" FieldName="day16" Width="10px" VisibleIndex="19">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="17" FieldName="day17" Width="10px" VisibleIndex="20">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="18" FieldName="day18" Width="10px" VisibleIndex="21">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="19" FieldName="day19" Width="10px" VisibleIndex="22">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="20" FieldName="day20" Width="10px" VisibleIndex="23">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="21" FieldName="day21" Width="10px" VisibleIndex="24">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="22" FieldName="day22" Width="10px" VisibleIndex="25">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="23" FieldName="day23" Width="10px" VisibleIndex="26">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="24" FieldName="day24" Width="10px" VisibleIndex="27">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="25" FieldName="day25" Width="10px" VisibleIndex="28">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="26" FieldName="day26" Width="10px" VisibleIndex="29">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="27" FieldName="day27" Width="10px" VisibleIndex="30">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="28" FieldName="day28" Width="10px" VisibleIndex="31">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="29" FieldName="day29" Width="10px" VisibleIndex="32">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="30" FieldName="day30" Width="10px" VisibleIndex="33">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="31" FieldName="day31" VisibleIndex="34">
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsPager PageSize="20" ShowSeparators="True">
                                        <FirstPageButton Visible="True">
                                        </FirstPageButton>
                                        <LastPageButton Visible="True">
                                        </LastPageButton>
                                    </SettingsPager>
                                    <ClientSideEvents EndCallback="function(s, e) {
	                                        LastCall(s.cpHeight);
                                        }" />
                                    <Settings ShowHorizontalScrollBar="True" />
                                    <SettingsBehavior ColumnResizeMode="NextColumn" />
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 22px">
                                <%--<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
                                    DisplayGroupTree="False" />--%>
                                <%--<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
                                    DisplayGroupTree="False" />
                                <CR:CrystalReportPartsViewer ID="CrystalReportPartsViewer1" runat="server" AutoDataBind="True"
                                    ReportSourceID="CrystalReportSource1" />
                                <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                                    <Report FileName="Reports\AttendenceRport.rpt">
                                    </Report>
                                </CR:CrystalReportSource>--%>
                                <asp:SqlDataSource ID="SDSAttdMain" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
