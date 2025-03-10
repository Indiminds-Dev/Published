<%@ page language="C#" autoeventwireup="true" inherits="Reports_report_sms_email, App_Web_wt4jql-z" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata.js"></script>

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

//    function OnMoreInfoClick(keyValue) {
//        
//       var url='frmReport_EmailLogReportsDetails.aspx?id='+keyValue;
//        parent.OnMoreInfoClick(url,"Email Details",'980px','520px',"Y");
//   
//    }

    function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    } 
    function callback()
    {
        grid.PerformCallback();
    } 
    function callheight(obj)
    {
        height();
        parent.CallMessage();
    }
//    function OnContactInfoClick(keyValue,CompName)
//    {
//        var url='insurance_contactPerson.aspx?id='+keyValue;
//        parent.OnMoreInfoClick(url,"Lead Name : "+CompName,'940px','450px','Y');
//    } 
    function CallAjax(obj1,obj2,obj3)
    {
        FieldName='cmbExport'; 
        var seg=cSegment.GetValue();
        //alert(seg);
        ajax_showOptions(obj1,obj2,obj3,seg);
    } 
    FieldName='cmbExport';
      
    function ShowEmployeeFilterForm(obj)
    {
        document.getElementById('txtName_hidden').value="";
        if(obj=='A')
        {
            document.getElementById('tdName').style.display="none";
            document.getElementById('txtName_hidden').style.display="none";
            document.getElementById('txtName').style.display="none";
            document.getElementById('txtName').value="";
            document.getElementById('txtName_hidden').value="";
          
        }
        if(obj=='S')
        {
            document.getElementById('txtName_hidden').style.display="inline";
            document.getElementById('txtName').style.display="inline";
            document.getElementById('tdName').style.display="inline";
        }
    }
////    function ShowEmployeeFilterForm1(obj)
////    {
////            document.getElementById('txtName_hidden').value="";       
////            document.getElementById('tdName').style.display="none";
////            document.getElementById('txtName_hidden').style.display="none";
////            document.getElementById('txtName').style.display="none";
////            document.getElementById('txtName').value="";
////            //document.getElementById('txtName_hidden').value="";
////    }
    function PageLoad()
    {
        ShowEmployeeFilterForm('A');
    } 
//-->
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center; height: 20px;">
                        <strong><span style="color: #000099">Email Log Reports</span></strong>
                    </td>
                </tr>
                <tr>
                    <td style="height: 63px">
                        <table>
                            <tr>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="txtFromDate" runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                        <buttonstyle width="13px">
                                        </buttonstyle>
                                        <dropdownbutton text="From Date">
                                        </dropdownbutton>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="txtToDate" runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                        <buttonstyle width="13px">
                                        </buttonstyle>
                                        <dropdownbutton text="To Date">
                                        </dropdownbutton>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td>
                                    Recipient:</td>
                                <td valign="bottom">
                                    <dxe:ASPxRadioButtonList id="rbsegment" clientinstancename="cSegment" runat="server"
                                        Font-Size="10px" ItemSpacing="10px" RepeatDirection="Horizontal" SelectedIndex="0"
                                        TextWrap="False">
                                        <border borderwidth="0px"></border>
                                        <clientsideevents valuechanged="function(s, e) {ShowEmployeeFilterForm(s.GetValue());}"></clientsideevents>
                                        <items>
<dxe:ListEditItem Text="Customer" Value="C"></dxe:ListEditItem>
<dxe:ListEditItem Text="Dpclients" Value="D"></dxe:ListEditItem>
</items>
                                    </dxe:ASPxRadioButtonList>
                                    <dxe:ASPxRadioButtonList ID="rbUser" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                        RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px">
                                        <items>
                                            <dxe:ListEditItem Text="All" Value="A" />
                                            <dxe:ListEditItem Text="Specific" Value="S" />
                                        </items>
                                        <clientsideevents valuechanged="function(s, e) {ShowEmployeeFilterForm(s.GetValue());}" />
                                        <border borderwidth="0px" />
                                    </dxe:ASPxRadioButtonList></td>
                                <td id="tdName">
                                    &nbsp;Name:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" Width="220px" Font-Size="11px" Height="20px"></asp:TextBox>
                                </td>
                                <td style="display: none;">
                                    <asp:TextBox ID="txtName_hidden" runat="server" Width="0px" Visible="true"></asp:TextBox>
                                </td>
                                <td class="gridcellleft">
                                    <asp:Button ID="btnGetReport" runat="server" Text="Get Report" CssClass="btnUpdate"
                                        Height="19px" Font-Size="10px" OnClick="btnGetReport_Click" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="TableMain100">
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
                                <td class="gridcellright">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                        Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                        ValueType="System.Int32" Width="130px" Visible="False">
                                        <items>
<dxe:ListEditItem Text="Select" Value="0"></dxe:ListEditItem>
<dxe:ListEditItem Text="PDF" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="XLS" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="RTF" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="CSV" Value="4"></dxe:ListEditItem>
</items>
                                        <buttonstyle backcolor="#C0C0FF" forecolor="Black"></buttonstyle>
                                        <border bordercolor="White" />
                                        <itemstyle backcolor="Navy" forecolor="White">
<HoverStyle BackColor="#8080FF" ForeColor="White"></HoverStyle>
</itemstyle>
                                        <dropdownbutton text="Export"></dropdownbutton>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="LeadGrid" runat="server"  AutoGenerateColumns="False" KeyFieldName="NotificationRequest_ID"
                            Width="100%" ClientInstanceName="grid" OnCustomCallback="LeadGrid_CustomCallback1"
                            OnCustomJSProperties="LeadGrid_CustomJSProperties">
                            <settingsbehavior allowfocusedrow="True" columnresizemode="NextColumn" />
                            <styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</styles>
                            <settingspager numericbuttoncount="20" pagesize="20" showseparators="True" alwaysshowpager="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</settingspager>
                            <clientsideevents endcallback="function(s, e) {
	callheight(s.cpHeight);
}" />
                            <columns>
<dxwgv:GridViewDataTextColumn FieldName="NotificationRequest_phoneemail" Caption="PhoneEmail" VisibleIndex="0"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="name" ReadOnly="True" Caption="Name" VisibleIndex="1">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Left"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NotificationRequest_accesscode" ReadOnly="True" Caption="Subject Line" VisibleIndex="2">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Left"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="topics_description" Caption="Topic Description" VisibleIndex="3">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Left"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NotificationRequest_deliverystatus" ReadOnly="True" Caption="DeliveryStatus" VisibleIndex="4">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Left"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NotificationRequest_rejectreason" ReadOnly="True" Caption="RejectReason" VisibleIndex="5">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Left"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NotificationRequest_phoneemail" ReadOnly="True" Caption="PhonEmail" Visible="False" VisibleIndex="3">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Left"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NotificationRequest_receivedatetime" ReadOnly="True" Caption="ReceiveDatetime" Visible="False" VisibleIndex="3">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Left"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NotificationRequest_deliverydatetime" ReadOnly="True" Caption="DeliveryDatetime" VisibleIndex="6">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Left"></CellStyle>
</dxwgv:GridViewDataTextColumn>
</columns>
                            <settings showgrouppanel="True" />
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="LeadGridDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="">
                <SelectParameters>
                    <asp:SessionParameter Name="userlist" SessionField="userchildHierarchy" Type="string" />
                </SelectParameters>
            </asp:SqlDataSource>
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
        </div>
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
