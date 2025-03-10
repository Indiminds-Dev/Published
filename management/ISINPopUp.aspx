<%@ page language="C#" autoeventwireup="true" inherits="management_ISINPopUp, App_Web_0jwcfgzk" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
   <title>Untitled Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
   <script type="text/javascript" src="../JSFUNCTION/loaddata1.js">
   
   </script>
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />
    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />
    
    <script type="text/javascript" src="../modalfiles/modal.js"></script>

   <%-- <script src="../CentralData/JSScript/jquery.min.js" type="text/javascript"></script>--%>
    
    
    
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

    function AddUserDetails() 
    {
       // document.location.href="RootUserDetails.aspx?id=Add"
       var middle=document.getElementById('HiddenField1').value;

       var url = 'Add_ISINPopUp.aspx?id=' + middle;
      // OnMoreInfoClickPop(url, "Add Member", 540, 350, 'Y')
       frmOpenNewWindow1(url, 540, 350);

      // AddPopForm(url, 540, 350);

      
        
       // alert (middle);
        //parent.OnMoreInfoClick(url,"Add Member",'440px','300px',"Y");
        // editwin=dhtmlmodal.open("Editbox", "iframe", url,"Add Member","width=540px,height=350px,center=1,resize=1,top=500", "recal");


      


    }

    function AddPopForm(location, v_height, v_weight) {

        var y = (screen.availHeight - v_height) / 2;
        var x = (screen.availWidth - v_weight) / 2;
        window.open(location, "Search_Conformation_Box", "height=" + v_height + ",width=" + v_weight + ",top=" + y + ",left=" + x + ",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=yes,resizable=no,dependent=no");

    }
    
     function frmOpenNewWindow1(location,v_height,v_weight)
    {
        var y=(screen.availHeight-v_height)/2;
        var x=(screen.availWidth-v_weight)/2;
        editwin=dhtmlmodal.open("Editbox", "iframe", location, "ISIN Details", "width=800px,height=400px,center=1,resize=1,top=0", "recal");

        editwin.onclose = function() {

            parent.grid.PerformCallback();

      

//                      var isInIFrame = (window.location != window.parent.location);

//                    alert(isInIFrame);

            //            if (isInIFrame == true) {
            //                // iframe
            //            }
            //            else {
            //                // no iframe
            //            }

            //            var isInIframe1 = window.frameElement && window.frameElement.nodeName == "IFRAME";

            //            alert(isInIframe1);

          


//            $(document).ready(function() {
//                $.ajax({
//                    type: "POST",
//                    url: "ISINPopUp.aspx/fillGridAfterAdd",
//                    data: "",
//                    contentType: "application/json; charset=utf-8",
//                    dataType: "json",
//                    success: function(result) {
//                        alert('Method Called Sucess fully');
//                    },
//                    error: function(result) {
//                        alert("error " + result);
//                    }
//                });
//            });



            // PageMethods.fillGridAfterAdd();
            //  grid.PerformCallback();



            // fillGrid();
        }
    }
    function CallingServerSideFunction() {
        alert('hi');
        PageMethods.fillGrid();
    }
    
    function OnMoreInfoClick1(url,HeaderText,Width,Height,anyKey) //AnyKey will help to call back event to child page, if u have to fire more that one function 
        {
             editwin=dhtmlmodal.open("Editbox", "iframe", url,HeaderText , "width="+Width+",height="+Height+",center=1,resize=1,scrolling=2,top=500", "recal")
             editwin.onclose=function()
             {
                 if(anyKey=='Y')
                 {
                    document.getElementById('IFRAME_ForAllPages').contentWindow.callback();
                 }
             }
        }


        function OnMoreInfoClickPop(url, HeaderText, Width, Height, anyKey) //AnyKey will help to call back event to child page, if u have to fire more that one function 
        {
            editwin = dhtmlmodal.open("Editbox", "iframe", url, HeaderText, "width=" + Width + ",height=" + Height + ",center=1,resize=1,scrolling=2,top=500", "recal")
            editwin.onclose = function() {

            document.getElementById('IFRAME_ForAllPages').contentWindow.callback();

//            grid.PerformCallback();


            var isInIFrame = (window.location != window.parent.location);

            alert(isInIFrame);
            }
        }
    
      
    
    
    FieldName='Headermain1_cmbSegment';
    function ShowHideFilter(obj)
    {
       grid.PerformCallback(obj);
    }
    function callback()
    {
       grid.PerformCallback('All');
      // grid.PerformCallback();
    } 
    function EndCall(obj)
    {
        height();
    }
   </script>
 <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:100;
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
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">User List</span></strong>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%">
                        <tr>
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                         <asp:HiddenField ID="HiddenField2" runat="server" />
                            <%--<td style="text-align: left; vertical-align: top">
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
                            </td>--%>
                            <td>
                            </td>
                            <%--<td class="gridcellright">
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
                            </td>--%>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="userGrid" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False"
                         KeyFieldName="ISIN_ID" Width="100%" OnCustomCallback="userGrid_CustomCallback" OnCustomJSProperties="userGrid_CustomJSProperties"
                          OnRowCommand="userGrid_RowCommand">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="0" FieldName="GroupId"
                                Visible="False">
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="0" FieldName="ISINNumber"
                                Caption="ISIN Number" Width="40%">
                                <PropertiesTextEdit>
                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                        <RequiredField ErrorText="Please Enter ISIN Name" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormSettings Caption="User Name:" Visible="True" />
                            </dxwgv:GridViewDataTextColumn>
                            <%--<dxwgv:GridViewDataTextColumn VisibleIndex="1" Caption="Designation" FieldName="designation">
                            </dxwgv:GridViewDataTextColumn>--%>
                            <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="2" FieldName="ShortName"
                                Caption="ISIN Short Name">
                                <PropertiesTextEdit>
                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                        <RequiredField ErrorText="Please Enter Short Name" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormSettings Caption="Login Id:" Visible="True" />
                            </dxwgv:GridViewDataTextColumn>
                            
                            
                              
                                                         <dxwgv:GridViewDataTextColumn VisibleIndex="4">
                                                        <HeaderTemplate>
                                    
                                    <a style="color: Blue; text-decoration: underline" href="javascript:void(0);" onclick="AddUserDetails()">Add New </a>
                                   
                                </HeaderTemplate>
                                                         <DataItemTemplate>
                                                         <asp:LinkButton ID="btn_show" runat="server" Text="Remove" CommandArgument='<%# Container.KeyValue %>' CommandName="res"> </asp:LinkButton>
                                                         </DataItemTemplate>
                                                         </dxwgv:GridViewDataTextColumn>
                                                         
                        </Columns>
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <Cell CssClass="gridcellleft">
                            </Cell>
                        </Styles>
                        <Settings ShowStatusBar="Visible" />
                        <SettingsPager NumericButtonCount="20" PageSize="10" AlwaysShowPager="True" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior ConfirmDelete="True" />
                        <ClientSideEvents EndCallback="function(s, e) {
	EndCall(s.cpHeight);
}" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
    
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
