<%@ page language="C#" autoeventwireup="true" inherits="Reports_Report_CusaHolding, App_Web_x3w6ygwt" enableeventvalidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Cusa Account Holding</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    
    <link type="text/css" href="../CSS/GenericCss.css" rel="Stylesheet" />

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
	
	<script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

    <script language="javascript" type="text/javascript" src="../CentralData/JSScript/timeSolver.min.js"></script>

    <script language="javascript" type="text/javascript">
  
    function Page_Load()///Call Into Page Load
        {
             Show('td_btnshow');
             Hide('Td_Export');
             Hide('tr_filter');
             if(document.getElementById("rbScreen").checked)
                {
                    Show('td_btnshow');
                    Hide('Td_Export');
                }
             if(document.getElementById("rbExcel").checked)
                {
                    Hide('td_btnshow');
                    Show('Td_Export');
                }
             height();
        }
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
            window.frameElement.Width = document.body.scrollWidth;
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }

    function RecordDisplay()
    {
        height();        
    }
    
    function fnNoRecord(obj)
    {
        Hide('tr_filter');
        Show('tab1');
        alert('No Record Found!!');
        height();
    }
    
  function selecttion()
  {
     var combo=document.getElementById('cmbExport');
//     combo.value='Ex';
  } 
  
function GnrcCallBackPanel_Methods(WhichCall)
{
    Show("divLoading");
    cBtnExcel.SetEnabled(false);
    cGnrcCallBackPanel.PerformCallback(WhichCall+'~');
}
function GnrcCallBackPanel_EndCallBack()
{
    if(cGnrcCallBackPanel.cpIsSpData!=undefined)
    {
        if(cGnrcCallBackPanel.cpIsSpData=="Export")
            GetObjectID('btnExcelExport').click();
    }
    Hide("divLoading");
    cBtnExcel.SetEnabled(true);
    Height('350','350'); 
}
    
function isNumberKey(e)      
{         
    var keynum
    var keychar
    var numcheck
    if(window.event)//IE
    {
        keynum = e.keyCode 
        if(keynum>=48 && keynum<=57 || keynum==46)
           {
              return true;
           }
        else
            {
             alert("Please Insert Numeric Only");
             return false;
            }
     }  
 else if(e.which) // Netscape/Firefox/Opera
   {
       keynum = e.which  
       if(keynum>=48 && keynum<=57 || keynum==46)
             {
              return true;
             }
             else
             {
             alert("Please Insert Numeric Only");
             return false;
             }     
        }
}
        
function RBShowHide(obj)
{
     if(obj=='rbScreen')
         {
             Show('td_btnshow');
             Hide('Td_Export');
         }
     else
         {
             Hide('td_btnshow');
             Show('Td_Export');
         }
         height();
         selecttion();
} 

function Display()
{
    Show('tr_filter');
    Show('displayAll');
    Hide('tab1');
    document.getElementById('display').className="grid_scroll";
    height();
}

function Filter()
{
    Hide('tr_filter');
    Show('tab1');
    Hide('displayAll');
    height();
}

    FieldName='lstSlection';
    </script>  

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">  
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

        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                        <strong><span id="SpanHeader" style="color: #000099">Cusa Account Holding</span></strong></td>
                    <%--New Work 07/08/2022--%>
                    <td class="EHEADER" width="15%" id="tr_filter" style="height: 20px">
                        <a href="javascript:void(0);" onclick="Filter();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a>
                    </td>
                    <%--End of New Work 07/08/2022--%>
                </tr>
            </table>
            <table id="tab1" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td>
                        <table>
                            <tr>
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td>
                                                <span id="span1" style="color: Red; font-weight: bold">Generate Client wise holding in CUSA Account</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Date
                                            </td>
                                            <td class="gridcellleft">
                                                <dxe:ASPxDateEdit ID="DtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="DtTo">
                                                    <dropdownbutton text="To">
                                                </dropdownbutton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="tr_RadioScreenExcel">
                                <td class="gridcellleft">
                                    <table>
                                        <tr>
                                            <td id="Td_RadioBtnScreen" class="gridcellleft">
                                                <asp:RadioButton ID="rbScreen" runat="server" GroupName="f" Checked="True" onclick="RBShowHide(this.value)" />Screen
                                            </td>
                                             <td id="Td_RadioBtnExcel" class="gridcellleft">
                                                <asp:RadioButton ID="rbExcel" runat="server" GroupName="f"  onclick="RBShowHide(this.value)" />Excel
                                            </td>
                                        </tr>
                                    </table>
                                 </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    <table>
                                        <tr>
                                            <td id="td_btnshow" class="gridcellleft">
                                                <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Show" AccessKey="S"
                                                    ToolTip="Press Alt+S to Generate the Report." Width="101px" OnClientClick="selecttion()" OnClick="btnshow_Click" />
                                            </td>
                                            <td id="Td_Export" class="gridcellleft">                                                
                                                <dxe:ASPxButton ID="aBtnExcel" runat="server" AutoPostBack="False" ClientInstanceName="cBtnExcel" AccessKey="E"
                                                    Text="Export To Excel" ToolTip="Press Alt+E to Generate the Excel." >
                                                    <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('Export');}" />
                                                </dxe:ASPxButton>
                                            </td>       
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                    top: 50%; background-color: white; layer-background-color: white; height: 80;
                                    width: 150;'>
                                    <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='1' face='Tahoma'><strong align='center'>Please Wait..</strong></font></td>
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
            
            <div id="displayAll" style="display: none;">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <table width="100%" border="1">
                            <tr style="display: none;">
                                <td>
                                    <asp:DropDownList ID="cmbclient" runat="server" Font-Size="10px" Width="300px" AutoPostBack="True">
                                    </asp:DropDownList><asp:HiddenField ID="hiddencount" runat="server" />
                                </td>
                            </tr>
                            <tr id="tr_DIVdisplayPERIOD">
                                <td>
                                    <div id="DIVdisplayPERIOD" runat="server">
                                    </div>
                                </td>
                            </tr>
                           
                            
                            <tr>
                                <td>
                                    <div id="display" runat="server">
                                    </div>
                                </td>
                            </tr>
                            <asp:HiddenField ID="TotalGrp" runat="server" />
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        
            <div id="divLoading">
                <dxcp:ASPxCallbackPanel ID="GnrcCallBackPanel" runat="server" ClientInstanceName="cGnrcCallBackPanel"
                    BackColor="White" OnCallback="GnrcCallBackPanel_Callback" LoadingPanelText="Generating File...Please Wait..." LoadingPanelStyle-Font-Size="Medium">
                    <PanelCollection>
                        <dxp:panelcontent>
                        </dxp:panelcontent>
                    </PanelCollection>
                    <ClientSideEvents EndCallback="function(s, e) {
	                                                            GnrcCallBackPanel_EndCallBack(); }" />
                </dxcp:ASPxCallbackPanel>
            </div>            
            <div style="display: none">
                <asp:Button ID="btnExcelExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                    OnClick="btnExcelExport_Click" />
            </div>
        </div>
    </form>
</body>
</html>
