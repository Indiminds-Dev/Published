<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_ExEmployeeDetails, App_Web_aaw4c9up" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <%--   <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>--%>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

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
		z-index:30000;
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
		z-index:5000;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script language="javascript" type="text/javascript">
    //Global Variable
        FieldName = 'none';
    //End
    
      function OnEditButtonClick(keyValue)
    {
      var url='../management/Employee_EmployeeCTC.aspx?id='+ keyValue;
      parent.OnMoreInfoClick(url,"Add New CTC Details",'980px','500px',"Y");
    }
    
       function SignOff()
            {
            window.parent.SignOff()
            }
        function height()
        {
           
           if(document.body.scrollHeight>=650)
                {
                    window.frameElement.height = document.body.scrollHeight;
                }
           else
                {
                    window.frameElement.height = '650px';
                }
                window.frameElement.widht = document.body.scrollWidht;
           
        }
        
        function OnMoreInfoClick(keyValue) 
        {
             var url='../management/employee_general.aspx?id='+keyValue;
             parent.OnMoreInfoClick(url,"Modify Employee Details",'980px','500px',"Y");
        }
        
         function Show(keyValue) 
            {
              var url = "../management/frmEmployeeCTC.aspx?link=../Reports/frmReport_ExEmployeeDetails.aspx&id=ADD&ContID="+keyValue;
             // var url="frmEmployeeCTC.aspx?id=ADD";
              popup.SetContentUrl(url);
              popup.Show();

            }
         function OnPageNo_Click(obj)
         {
            var i=document.getElementById(obj).innerText;
            grid.PerformCallback("SearchByNavigation~"+i+"~All");
            //alert(i);
         }
         function OnLeftNav_Click()
         {
           var i=document.getElementById("A1").innerText;
           if(parseInt(i)>1)
            {   
                i=parseInt(i)-10;
                for(l=1;l<11;l++)
                {
                    var obj="A"+l;
                    document.getElementById(obj).innerText=i++;
                }
                grid.PerformCallback("SearchByNavigation~"+document.getElementById("A1").innerText+"~All");
            }
            else
            {
                alert('You are on the Beginning');
            }
         }
         function OnRightNav_Click()
         {
            var TestEnd=document.getElementById("A10").innerText;
            var TotalPage=document.getElementById("B_TotalPage").innerText;
            if(TestEnd=="" || TestEnd==TotalPage)
            {
                 alert('You are at the End');
                 return;
            }
            var i=document.getElementById("A1").innerText;
            if(parseInt(i)<TotalPage)
            {   
                i=parseInt(i)+10;
                var n=parseInt(TotalPage)-parseInt(i)>10?parseInt(11):parseInt(TotalPage)-parseInt(i)+2;
                for(r=1;r<n;r++)
                {
                    var obj="A"+r;
                    document.getElementById(obj).innerText=i++;
                }
                for(r=n;r<11;r++)
                {
                     var obj="A"+r;
                    document.getElementById(obj).innerText="";
                }
                grid.PerformCallback("SearchByNavigation~"+document.getElementById("A1").innerText+"~All");
            }
            else
            {
                alert('You are at the End');
            }
         }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">

        <script type="text/javascript" language="javascript">
      
   function CallList(obj1,obj2,obj3)
    {
        var obj5='';
        ajax_showOptions(obj1,obj2,obj3,obj5);
     }
  
    FieldName='Headermain1_cmbSegment'; 
    function ShowHidebtn()
    {
        FieldName='Headermain1_cmbSegment';
        grid.PerformCallback("SearchByNavigation~1~All");
        
    }
    
    
    function ShowHideFilter(obj)
    {
        FieldName='Headermain1_cmbSegment';
        grid.PerformCallback("SearchByNavigation~1~"+obj);
//        grid.PerformCallback(obj);
    }
    function OnRejoinClick(e,obj)
    {
        FieldName='Headermain1_cmbSegment';
        RowID=obj;
        popup.ShowAtElement(e);
        popup.Show();
    }
    function btnRejoinClick()
    {
        if(RejoinDate.GetDate() !=null)
        {
            //alert(RejoinDate.GetDate());
            popPanel.PerformCallback(RowID);
        }
        else
            alert('Please Select Join Date!');
    }
    
    function pageload()
    {
        FieldName='Headermain1_cmbSegment';
    }
    function EndCallBack()
    {
        popup.Hide();
        grid.PerformCallback();
    }
    
    function aspxExEmpGrid_EndCallback()
    {
      var strUndefined=new String(grid.cpIsEmptyDsSearch);
            if(strUndefined!="undefined" && strUndefined!="NoRecord")
            {
               document.getElementById("B_PageNo").innerText=strUndefined.split('~')[1];
               document.getElementById("B_TotalPage").innerText=strUndefined.split('~')[2];
               document.getElementById("B_TotalRows").innerText=strUndefined.split('~')[3];
              // document.getElementById("B_SearchBy").innerText=strUndefined.split('~')[4];
                var i=document.getElementById("A1").innerText;
                var TotalPage=strUndefined.split('~')[2];
                if(parseInt(i)<=TotalPage && parseInt(i)==1)
                {   
                    n=(parseInt(TotalPage)-parseInt(i)>10) ?parseInt(11):parseInt(TotalPage)-parseInt(i)+2;
                    for(a=1;a<n;a++)
                    {
                        var obj="A"+a;
                        document.getElementById(obj).innerText=a;
                    }
                    for(a=n;a<11;a++)
                    {
                        var obj="A"+a;
                        document.getElementById(obj).innerText="";
                    }
                }
               
               
            }
            else if (strUndefined=="NoRecord")
            {
                alert('No Record Found');
            }
            
    }
    
   function keyVal(obj)
    {
    alert("123");
     popup.Show();
    }
    
       
        </script>

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center;">
                    <strong><span style="color: #000099">Ex-Employee's Details Report</span></strong>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft" colspan="0">
                    <table border="1">
                        <tr>
                            <td class="gridcellleft" valign="top" style=" background-color: #b7ceec;">
                                <dxe:ASPxDateEdit ID="fromDate" runat="server" DropDownButton-Width="100%" Font-Size="10px"
                                    Width="150px" EditFormat="Custom" UseMaskBehavior="True">
                                    <buttonstyle width="13px">
                                </buttonstyle>
                                    <dropdownbutton text="FromDate" width="50px">
                                </dropdownbutton>
                                    <validationsettings display="Dynamic" errortextposition="Bottom">
                                    <RequiredField ErrorText="Invalid Date" IsRequired="True" />
                                </validationsettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td class="gridcellleft" valign="top" style=" background-color: #b7ceec;">
                                <dxe:ASPxDateEdit ID="toDate" runat="server" DropDownButton-Width="100%" Font-Size="10px"
                                    Width="150px" EditFormat="Custom" UseMaskBehavior="True">
                                    <buttonstyle width="13px">
                                </buttonstyle>
                                    <dropdownbutton text="ToDate" width="50px">
                                </dropdownbutton>
                                    <validationsettings display="Dynamic" errortextposition="Bottom">
                                    <RequiredField ErrorText="Invalid Date" IsRequired="True" />
                                </validationsettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td class="gridcellleft" valign="top" style=" background-color: #b7ceec;">
                                <dxe:ASPxComboBox ID="cmbCompany" runat="server" EnableIncrementalFiltering="true"
                                    ValueType="System.String" DropDownButton-Text="Company" Font-Size="10px" Width="150px">
                                    <buttonstyle width="13px">
                                </buttonstyle>
                                    <dropdownbutton text="Company" width="50px">
                                </dropdownbutton>
                                </dxe:ASPxComboBox>
                            </td>
                            <td class="gridcellleft" valign="top" style="background-color: #b7ceec;">
                                <dxe:ASPxComboBox ID="cmbBranch" runat="server" EnableIncrementalFiltering="true"
                                    ValueType="System.String" DropDownButton-Text="Branch" Font-Size="10px" Width="150px">
                                    <buttonstyle width="13px">
                                </buttonstyle>
                                    <dropdownbutton text="Branch" width="50px">
                                </dropdownbutton>
                                </dxe:ASPxComboBox>
                            </td>
                            <td class="gridcellleft" valign="top" style="background-color: #b7ceec;">
                                <dxe:ASPxComboBox ID="cmbDepartment" runat="server" EnableIncrementalFiltering="true"
                                    ValueType="System.String" DropDownButton-Text="Department" Font-Size="10px" Width="150px">
                                    <buttonstyle width="13px">
                                </buttonstyle>
                                    <dropdownbutton text="Department" width="50px">
                                </dropdownbutton>
                                </dxe:ASPxComboBox>
                                <asp:SqlDataSource ID="Department" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                    SelectCommand="Select cost_id,cost_description from tbl_master_costCenter where cost_costCenterType = 'department' ORDER BY [cost_description]">
                                </asp:SqlDataSource>
                            </td>
                            <td class="gridcellleft" valign="top" style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;">
                                <input id="bnSubmit" type="button" value="GO" style="width:118%; height: 18px;" class="btnUpdate" onclick="ShowHidebtn();" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="text-align: left; vertical-align: top">
                    <table>
                        <tr>
                            <td id="Td2">
                                <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                    Show Filter</span></a>
                            </td>
                            <td id="Td3">
                                <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                    All Records</span></a>
                            </td>
                        </tr>
                    </table>
                    <b style="font-weight: normal; background: #b7ceec"></b> 
                    <table border="1" style="width: 60%">
                        <tr>
                            <td style="vertical-align: top; width: 34px; background-color: #b7ceec; text-align: left;"
                                valign="top">
                                &nbsp;Page</td>
                            <td style="width: 4px" valign="top">
                                <b id="B_PageNo" runat="server" style="text-align: right"></b>
                            </td>
                            <td style="vertical-align: top; background-color: #b7ceec; text-align: left; width: 15px;" valign="top">
                                Of
                            </td>
                            <td valign="top">
                                <b id="B_TotalPage" runat="server" style="text-align: right"></b>
                            </td>
                            <td style="vertical-align: top; background-color: #b7ceec; text-align: left;" valign="top">
                                ( <b id="B_TotalRows" runat="server" style="text-align: right"></b>&nbsp;Records
                                )
                            </td>
                            <td valign="top" style="padding-top: 8px; width: 341px;">
                                <table width="100%">
                                    <tr>
                                        <%-- <td valign="top">
                                <a id="A_StartNav" runat="server" href="javascript:void(0);" onclick="OnStartNav_Click()">
                                    <img src="../images/LeftNav.gif" width="10"/>
                                  </a>
                               </td>--%>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left"
                                            valign="top">
                                            <a id="A_LeftNav" runat="server" href="javascript:void(0);" onclick="OnLeftNav_Click()">
                                                <img src="../images/LeftNav.gif" width="10" />
                                            </a>
                                        </td>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left"
                                            valign="top">
                                            <a id="A1" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A1')">
                                                1</a>
                                        </td>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left"
                                            valign="top">
                                            <a id="A2" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A2')">
                                                2</a>
                                        </td>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left"
                                            valign="top">
                                            <a id="A3" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A3')">
                                                3</a>
                                        </td>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left"
                                            valign="top">
                                            <a id="A4" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A4')">
                                                4</a>
                                        </td>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left"
                                            valign="top">
                                            <a id="A5" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A5')">
                                                5</a>
                                        </td>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left"
                                            valign="top">
                                            <a id="A6" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A6')">
                                                6</a>
                                        </td>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left"
                                            valign="top">
                                            <a id="A7" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A7')">
                                                7</a>
                                        </td>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left"
                                            valign="top">
                                            <a id="A8" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A8')">
                                                8</a>
                                        </td>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left"
                                            valign="top">
                                            <a id="A9" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A9')">
                                                9</a>
                                        </td>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left"
                                            valign="top">
                                            <a id="A10" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A10')">
                                                10</a>
                                        </td>
                                        <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: right"
                                            valign="top">
                                            <a id="A_RightNav" runat="server" href="javascript:void(0);" onclick="OnRightNav_Click()">
                                                <img src="../images/RightNav.gif" width="10" />
                                            </a>
                                        </td>
                                        
                                        <%--<td style="text-align: right" valign="top">
                               <a id="A_LastNav" runat="server" href="javascript:void(0);" onclick="OnLastNav_Click()">
                                    <img src="../images/LeftNav.gif" width="10"/>
                                  </a>
                               </td>--%>
                                    </tr>
                                </table>
                            </td>
                          
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="aspxExEmpGrid" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False"
                        Width="925px" OnCustomCallback="aspxExEmpGrid_CustomCallback" KeyFieldName="emp_id"
                        Settings-ShowHorizontalScrollBar="true">
                        <Styles>
                            <Header SortingImageSpacing="5px" ImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <ClientSideEvents EndCallback="aspxExEmpGrid_EndCallback" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Width="50px" VisibleIndex="0">
                                <EditFormSettings Visible="False"></EditFormSettings>
                                <DataItemTemplate>
                                    <%--<a href="javascript:void(0);" onclick="OnRejoinClick(this,'<%# Container.KeyValue %>')">
                                        <u>Rejoin</u> </a>--%>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                        More Info</a>
                                </DataItemTemplate>
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Width="50px" VisibleIndex="1">
                                <EditFormSettings Visible="False"></EditFormSettings>
                                <DataItemTemplate>
                                    <%--<a href="javascript:void(0);" onclick="OnRejoinClick(this,'<%# Container.KeyValue %>')">
                                        <u>Rejoin</u> </a>--%>
                                    <a href="javascript:void(0);" onclick="Show('<%# Container.KeyValue %>')">Rejoin</a>
                                </DataItemTemplate>
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn FieldName="joindate" UnboundType="DateTime" Width="150px"
                                Caption="Joining Date" VisibleIndex="2">
                                <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}">
                                </PropertiesDateEdit>
                                <Settings SortMode="Value"></Settings>
                                <CellStyle HorizontalAlign="Left" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn FieldName="Leavedate" UnboundType="DateTime" Width="150px"
                                Caption="Leaving Date" VisibleIndex="3">
                                <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}">
                                </PropertiesDateEdit>
                                <Settings SortMode="Value"></Settings>
                                <CellStyle HorizontalAlign="Left" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Name" Width="50px" Caption="EmpName[code]"
                                VisibleIndex="4">
                                <CellStyle HorizontalAlign="Left" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="designation" Width="50px" Caption="Designation"
                                VisibleIndex="5">
                                <CellStyle HorizontalAlign="Left" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="company" Width="50px" Caption="Company"
                                VisibleIndex="6">
                                <CellStyle HorizontalAlign="Left" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="branch" Width="50px" Caption="Branch" VisibleIndex="7">
                                <CellStyle HorizontalAlign="Left" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="department" Width="50px" Caption="Department"
                                VisibleIndex="8">
                                <CellStyle HorizontalAlign="Left" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="reportTo" Width="50px" Caption="Reporting Head"
                                VisibleIndex="9">
                                <CellStyle HorizontalAlign="Left" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <Settings ShowHorizontalScrollBar="True"></Settings>
                    </dxwgv:ASPxGridView>
                    &nbsp;
                        
                <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" 
                    CloseAction="CloseButton" Top="100" Left="400" ClientInstanceName="popup" Height="530px"
                    Width="930px" HeaderText="Add Employee CTC">
                    <ContentCollection>
                        <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                        </dxpc:PopupControlContentControl>
                    </ContentCollection>
                </dxpc:ASPxPopupControl>
                    <asp:SqlDataSource ID="SqlExEmployeeDetails" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
