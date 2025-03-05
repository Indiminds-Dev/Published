<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="Reports_GSTReports, App_Web_dwbygqb3" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <%--<script type="text/javascript" src="../JSFUNCTION/loaddata.js"></script>--%>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/GenericJscript.js"></script>

    <script type="text/javascript"> 
        $(document).ready(function() { 

            $(".water").each(function() { 
                if ($(this).val() == this.title) { 
                    $(this).addClass("opaque"); 
                } 
            }); 

            $(".water").focus(function() { 
                if ($(this).val() == this.title) { 
                    $(this).val(""); 
                    $(this).removeClass("opaque"); 
                }                 
            }); 

            $(".water").blur(function() { 
                if ($.trim($(this).val()) == "") { 
                    $(this).val(this.title); 
                    $(this).addClass("opaque"); 
                } 
                else { 
                    $(this).removeClass("opaque"); 
                } 
            }); 
        });       

    </script>

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
     
//     $(document).ready(

//    function () {
//        document.getElementById("<%=btnExExport.ClientID%>").disabled = false;
//    });
    
       function SignOff()
        {
            window.parent.SignOff();
        }
//         FieldName='btnShow';
        
        function height()
        {
            if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '350px';
            }
            window.frameElement.widht = document.body.scrollWidht;
        }
                
        function Page_Load()
        {        
//            document.getElementById('filter').style.display='none';
//            document.getElementById('btnShow').style.display='inline';
//            document.getElementById('btnExExport').style.display='none';
//            document.getElementById('btnExExport').disabled=true;
            dtDate.Focus();
            height();
        }
        
        function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
        function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
        
//        function line()
//           {
//             Show('tblDisplay');
//             Show('filter');
//             Hide('TrAll');
//             height();
//           }

//        function filter()
//        {
//            document.getElementById("filter").style.display='none';
//            document.getElementById("TrAll").style.display='inline';
//            Hide('tblDisplay');
//            height();
//        }
        
        //function fn_ddllistType(obj) {
//        function ChangeViewType(){
//            var ViewType = document.getElementById('ddllistType').value;
//            if(ViewType=='0')
//                {
//                    document.getElementById('btnShow').style.display='inline';
//                    document.getElementById('btnExExport').style.display='none';
////                      document.getElementById('btnShow').disabled=false;
////                      document.getElementById('btnExExport').disabled=true;                      
//                }
//            if(ViewType=='1')
//                {
////                    document.getElementById('btnShow').disabled=true;
////                    document.getElementById('btnExExport').disabled=false;
//                    document.getElementById('btnShow').style.display='none';
//                    document.getElementById('btnExExport').style.display='inline';
//                    Hide('tblDisplay');
//                }
//        }
        
        function NORECORD(obj)
          {
              if(obj=='1')
                {
                  alert('No Record Found!!');
//                  ChangeViewType(document.getElementById('ddllistType').value);
                 }
//              else if (obj=='2')
//                  alert('Please Select Type!!');
              height();
          }
                        
//        function selecttion()
//        {
//            var combo=document.getElementById('ddlExport');
//            combo.value='Ex';
//        }
         function DateChange(DateObj)
        {
            var Lck ='<%=Session["LCKBNK"] %>';
            var FYS ='<%=Session["FinYearStart"]%>';
            var FYE ='<%=Session["FinYearEnd"]%>'; 
            var LFY ='<%=Session["LastFinYear"]%>';
            var GetDate='<%=Session["ServerDate"]%>';
            var ExpDate='<%=Session["ExpireDate"]%>';
            //DevE_CheckForLockDate(DateObj,Lck);
            DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
            DevE_CompareDateForMin(dtDate,dtToDate,'From Date Must Be Less than To Date!!!');
        }       
    </script>
    
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">GST Reports</span></strong>
                    </td>
                </tr>
            </table>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
            </asp:ScriptManager>

            <script language="javascript" type="text/javascript">
                  var prm = Sys.WebForms.PageRequestManager.getInstance(); 
                   prm.add_initializeRequest(InitializeRequest); 
                   prm.add_endRequest(EndRequest); 
                   var postBackElement; 
                   function InitializeRequest(sender, args) 
                   { 
                      if (prm.get_isInAsyncPostBack()) 

                      args.set_cancel(true); 
                      postBackElement = args.get_postBackElement(); 
                      $get('UpdateProgress1').style.display = 'block'; 
                         
                   } 
                   function EndRequest(sender, args) 
                   {
                     $get('UpdateProgress1').style.display = 'none';                         
                   } 
            </script>

            <table class="TableMain100">
                <%--<tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                        <strong><span id="SpanHeader" style="color: #000099"></span></strong></td>
                        
                    <td class="EHEADER" width="25%" id="filter">
                        <a href="javascript:void(0);" onclick="filter();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a> || <asp:DropDownList
                                ID="ddlExport" Font-Size="Smaller" runat="server" AutoPostBack="True" 
                                Height="16px" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                                <asp:ListItem Value="E">Excel</asp:ListItem>
                                </asp:DropDownList>
                        </td>
                </tr>--%>
                <tr id="TrAll">
                    <td colspan="2">
                        <table width="100%">
                            <tr>
                                <td>
                                    <table cellspacing="1" cellpadding="2" style="background-color: #B7CEEC; border: solid 1px  #ffffff"
                                        border="1">
                                        <tr>
                                            <td class="gridcellleft" style="width: 100px">
                                                Date Range:
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="width: 196px">
                                                            <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" ClientInstanceName="dtDate"
                                                                UseMaskBehavior="True">
                                                                <dropdownbutton text="From "></dropdownbutton>
                                                                <clientsideevents datechanged="function(s,e){DateChange(dtDate);}" />
                                                            </dxe:ASPxDateEdit>
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxDateEdit ID="dtToDate" runat="server" EditFormat="Custom" ClientInstanceName="dtToDate"
                                                                UseMaskBehavior="True">
                                                                <dropdownbutton text="To"></dropdownbutton>
                                                                <clientsideevents datechanged="function(s,e){DateChange(dtToDate);}" />
                                                            </dxe:ASPxDateEdit>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 58px">
                                                Consider:
                                            </td>
                                            <td style="text-align: left; width: 148px;padding:7px">
                                                <asp:DropDownList ID="cmbConsider" runat="server" Width="180px" Font-Size="10px">
                                                    <asp:ListItem Text="Trade Date" Value="T" />
                                                    <asp:ListItem Text="Bill Date" Value="B" />
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 100px">
                                                Report Type:
                                            </td>
                                            <td style="text-align: left; width: 148px;padding:7px">
                                                <asp:DropDownList ID="cmbRptType" runat="server" Width="180px" Font-Size="10px">
                                                    <asp:ListItem Text="B2B" Value="A" />
                                                    <asp:ListItem Text="B2CL" Value="B" />
                                                    <asp:ListItem Text="B2CS" Value="C" />
                                                    <asp:ListItem Text="Detail Report" Value="D" />
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <%--<tr>
                                            <td class="gridcellleft" style="width: 100px">
                                                View By:
                                            </td>--%>
                                            <%--onchange="fn_ddllistType(this.value)"--%>
                                            <%--<td style="text-align: left; width: 148px;padding:7px">
                                                <asp:DropDownList ID="ddllistType" runat="server" Width="180px" TabIndex="5" Font-Size="10px">
                                                    <asp:ListItem Value="0">Screen</asp:ListItem>
                                                    <asp:ListItem Value="1">Excel</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>--%>
                                            <tr id="TrBtn">
                                                <td>
                                                <%--<asp:Button ID="btnExExport" runat="Server" Text="Export to Excel" OnClick="btnExExport_Click" UseSubmitBehavior="false"
                                                         OnClientClick="this.disabled='true'; this.value='Please wait...';" CssClass="btnUpdate" Width="100px" /> --%>
                                                    <%--<asp:Button ID="btnShow" runat="server" Text="Show" CssClass="btnUpdate" Width="100px" 
                                                         OnClick="btnShow_Click" />--%>
                                                    <asp:Button ID="btnExExport" runat="Server" Text="Export to Excel" OnClick="btnExExport_Click"
                                                         CssClass="btnUpdate" Width="100px" />
                                                </td>
                                            </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table>
                            <tr>
                                <td>
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
                                            <div id='Div2' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                                top: 5%; background-color: white; layer-background-color: white; height: 80;
                                                width: 150;'>
                                                <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                                    <tr>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td height='25' align='center' bgcolor='#FFFFFF'>
                                                                        <img src='../images/progress.gif' width='18' height='18'></td>
                                                                    <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                                        <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
             </table>
                <div id="tblDisplay" style="display: none;" width="100%">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table width="100%" border="1">
                                <tr style="display: none;">
                                    <td>
                                        <asp:HiddenField ID="hiddencount" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="displayALL" runat="server">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <%--<asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click"></asp:AsyncPostBackTrigger>--%>
                            <%--<asp:AsyncPostBackTrigger ControlID="btnExExport" EventName="Click"></asp:AsyncPostBackTrigger>--%>
                        </Triggers>
                    </asp:UpdatePanel>
              </div>
        </div>
    </form>
</body>
</html>
