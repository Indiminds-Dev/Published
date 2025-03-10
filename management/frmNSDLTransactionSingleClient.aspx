<%@ page language="C#" autoeventwireup="true" inherits="management_frmNSDLTransactionSingleClient, App_Web_ko_nrypx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
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
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
      <div>

            <script language="javascript" type="text/javascript">
       function ForFilterOff()
        {
            hide('filter');  
           show('btnfilter');
        
//            document.getElementById("TrAll").style.display='none';
//            document.getElementById("TdAll1").style.display='none';
//            document.getElementById("TrBtn").style.display='none';
//            document.getElementById('spanBtn').style.display='none';
            height();
        }
   function MailsendT()
    {
    alert("Mail Sent Successfully");
    }
   function MailsendF()
    {
    alert("Error on sending!Try again..");
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
    function PageLoad()
    {
             
              
        ShowEmployeeFilterForm('A');
        ShowISINFilterForm('A');
        ShowSettlementFilterForm('A');
    }
    
  function ShowISINFilterForm(obj)
    {        
        
               
        if(obj=='A')
        {
           
          
           
//             document.getElementById('txtISIN').value="";
//             document.getElementById('txtISIN_hidden').value="";
        }
        if(obj=='S')
        {
           
            
            
           
        }
    }
     
    
    function ShowEmployeeFilterForm(obj)
    {
       
       
        if(obj=='A')
        {
            hide('txttdname');
            
           
        }
        if(obj=='S')
        {
            show('txttdname');
            
            
           
        }
    }
    function NoOfRows(obj)
    {
        Noofrows=obj;
        
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
   
     
      
      function hidesearch()
      {
       hide('t1');
        hide('t2');
         hide('t3');
         show('f');
      }
      
      function test()
      {
     
       show('t1');
        show('t2');
         show('t3');
         hide('f');
      }
      
       function OnClientTypeChanged(s,e)
        {
       
        
        
        var item=s.GetSelectedItem();
       
        if (item.text=='Clearing Members' || item.text=='All')
            {
               
                
                ShowSettlementFilterForm('A');
            }
        else
            {         
                
                                
                hide('tdSettlement');
            }
           
        }
        
         function ShowSettlementFilterForm(obj)
    {
    
        
     
//        show('tdSettlementLabel');
        if(obj=='A')
        {
            
            hide('tdSettlement');           
             
           
//            document.getElementById('txtSettlement').value="";
            
        }
        if(obj=='S')
        {
            
            show('tdSettlement');
            
            
        }
    }
        
function ShowHideButton(obj)
    {
   
    
            
    }
       function fullScreen()
    {
     if (this.name!='fullscreen')
     { 
      window.open(location.href,'fullscreen','fullscreen,scrollbars') 
     }
     
    }
     
      	        
	 
            
      function ReceiveSvrData(rValue)
        {
            var Data=rValue.split('~');
            if(Data[0]=='Clients')
            {
            }
        }
        
      function selecttion()
        {            
            var combo=document.getElementById('ddlExport');
            combo.value='Ex';
        }
    
            </script>

            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" align="center">
                        <strong><span style="color: #000099;">NSDL Transaction Report </span></strong>
                        <asp:ScriptManager runat="server" ID="ScriptManager1">
                        </asp:ScriptManager>
                    </td>
                    <td class="EHEADER" width="25%" id="f">
                                        <asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged1" >
                                                    <asp:ListItem Value="Ex" Selected="True">Export</asp:ListItem>
                                                    <asp:ListItem Value="E">Excel</asp:ListItem>
                                                    <asp:ListItem Value="P">PDF</asp:ListItem>
                                                </asp:DropDownList>
                       
                        ||
                        <asp:LinkButton ID="btnEmail" runat="server" Font-Bold="True" Font-Underline="True"
                            ForeColor="Blue" OnClick="btnEmail_Click">SendEmail</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <table border="0" class="TableMain100" cellpadding="0" cellspacing="0" style="width: 100%;
                padding-right: 0px; padding-left: 0px; padding-bottom: 0px; padding-top: 0px;">
                <tr>
                    <td style="vertical-align: top; text-align: left;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="gridcellleft">
                            <tr id="t1" style="display: none;">
                                <td colspan="2" style="">
                                    <table>
                                        <tr>
                                            <td>
                                                <span class="Ecoheadtxt" style="color: blue"><strong>From:</strong></span></td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="txtstartDate" runat="server" ClientInstanceName="e1" Width="130px"
                                                    EditFormat="Custom" EditFormatString="dd MMMM yyyy" UseMaskBehavior="True" AllowNull="False"
                                                    Height="25px">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                    <ClientSideEvents ValueChanged="OnValueChanged" />
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td>
                                                <span class="Ecoheadtxt" style="color: blue"><strong>To:</strong></span></td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="txtendDate" runat="server" ClientInstanceName="e2" Width="130px"
                                                    EditFormat="Custom" EditFormatString="dd MMMM yyyy" UseMaskBehavior="True" AllowNull="False"
                                                    Height="25px">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                    <ClientSideEvents ValueChanged="OnValueChanged" />
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="">
                                   
                                </td>
                                <td style="">
                                    </td>
                                <td style="">
                                   
                                </td>

                            </tr>
                            <tr id="t2" style="display: none;">
                                <td colspan="2" style="text-align: center">
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validateDates"
                                        ErrorMessage="Please Enter Valid Date Range."></asp:CustomValidator></td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr id="txttdname">
                              <td style="">
                                   
                                </td>
                            
                            </tr>
                            <tr id="t3" style="display: none;">
                                <td colspan="6">
                                  
                                </td>
                            </tr>
                            <tr style="text-align: center">
                                <td colspan="6">
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                        <ProgressTemplate>
                                            <%--<asp:Label ID="lblProgress" runat="server" Text="Progress..." ></asp:Label>--%>
                                            <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                                top: 50%; = background-color: white; layer-background-color: white; height: 80;
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
                            <tr id="found" runat="server">
                                <td colspan="6">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" width="100%">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <span style="color: red; text-align: center" id="norecord" class="Ecoheadtxt" runat="server">
                                                <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No
                                                    Transaction Found</strong></span>
                                            <table id="tblpage" cellspacing="0" cellpadding="0" runat="server">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                            
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                            
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                            
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                            
                                                        </td>
                                                        <td align="center" width="600">
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                                                            <asp:Label ID="listRecord" runat="server" Font-Bold="True"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <table style="background-color: white" id="list" bordercolor="blue" cellspacing="0"
                                                cellpadding="0" width="100%" border="1" runat="server">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <table cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                    <tr style="font-size: 12px; font-family: Calibri">
                                                                        <td>
                                                                            Client Id :
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblClientId" runat="server" Font-Bold="True"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            Category:
                                                                        </td>
                                                                        <td colspan="3">
                                                                            <asp:Label ID="category" runat="server" Font-Bold="True"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            Status:
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="status" runat="server" Font-Bold="True"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Name of Holders:
                                                                        </td>
                                                                        <td colspan="7">
                                                                            <asp:Label ID="holders" runat="server" Font-Bold="True"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="transRow" runat="server">
                                                                        <td style="font-size: 12px; font-family: Calibri">
                                                                        </td>
                                                                        <td align="right" colspan="7">
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            <asp:Label ID="lblTransction" runat="server" Text="0"></asp:Label>
                                                                            of
                                                                            <asp:Label ID="lblTotalTransction" runat="server" Text="0"></asp:Label>
                                                                            Transactions&nbsp;
                                                                            <asp:LinkButton ID="btnTransPrevious" runat="server" Font-Bold="True" ForeColor="Blue"
                                                                                OnClick="btnTransPrevious_Click">Previous</asp:LinkButton>&nbsp;
                                                                            <asp:LinkButton ID="btnTransnNext" runat="server" Font-Bold="True" ForeColor="Blue"
                                                                                OnClick="btnTransnNext_Click">Next</asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="9">
                                                            <div id="display" runat="server" width="100%">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="lblTransction1" runat="server" Text="0"></asp:Label>
                                                            of
                                                            <asp:Label ID="lblTotalTransction1" runat="server" Text="0"></asp:Label>
                                                            Transactions&nbsp;
                                                            <asp:LinkButton ID="btnTransPrevious1" OnClick="btnTransPrevious_Click" runat="server"
                                                                Font-Bold="True" ForeColor="Blue" OnClientClick="javascript:selecttion();">Previous</asp:LinkButton>&nbsp;
                                                            <asp:LinkButton ID="btnTransnNext1" OnClick="btnTransnNext_Click" runat="server"
                                                                Font-Bold="True" ForeColor="Blue" OnClientClick="javascript:selecttion();">Next</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </ContentTemplate>
                                        
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
