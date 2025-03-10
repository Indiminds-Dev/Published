<%@ page language="C#" autoeventwireup="true" inherits="management_frm_selectCompFinYrSett, App_Web_-k9nslwd" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Select Company, Fin.Year and Sett.No.</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

<%--    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>--%>
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" language="javascript">
        function BtnCancel_Click()
        {
            parent.editwinS.close();
        }
        function visibility()
        {
            document.getElementById("setid").style.display ='none'
        }
        function showlist(obj1,obj2,obj3,obj4)
        {
            FieldName='BtnCancel';
            var comp=document.getElementById("cmbCompany");
            var finy=document.getElementById("cmbFinYear");
            var obj5=obj4+'~'+finy.value;
            ajax_showOptions(obj1,obj2,obj3,obj5,'Main');
        }
        function BtnSave_Click()
        {
      // txtSettNo_hidden
        
            FieldName='BtnCancel';
            var sett;
            var comp=document.getElementById("cmbCompany");
            var selectedOption = comp.options[comp.selectedIndex]; 
            var finy=document.getElementById("cmbFinYear");
           // sett =document.getElementById("txtSettNo");
            sett =document.getElementById("txtSettNo_hidden");
            if(sett.value=="No Record Found")
            {
            alert("Please Select Sett. No.!.")
            }
            else
            {
            var data='Save~'+comp.value+'~'+finy.value+'~'+selectedOption.text+'~'+sett.value;
            //alert(data);
            CallServer(data, "");
            }
        }
        function keyVal(obj)
         {
            if(obj !='')
            {
                    if(document.getElementById('txtSettNo_hidden').value !='' && 
                        document.getElementById('txtSettNo_hidden').value=="No Record Found")
                    {
                    
                       document.getElementById('btnSave').disabled=true;
                       ShowOpenSettlement(); 
    //                    Tr_OpenSettlement.style.display="none";
                    }
                    else
                    {
                
                        document.getElementById('btnSave').disabled=false;
                   
//                   Tr_OpenSettlement.style.display="inline";
                    }

                }
                else
                {
                document.getElementById('btnSave').disabled=true;
                }
         }
          function PageLoadForButton()
          {
           document.getElementById('btnSave').disabled=true;
          }  
          
          function PageLoadForButtonV()
          {
           document.getElementById('btnSave').disabled=false;
          }
          function ShowOpenSettlement() {
          
          document.getElementById('txtSettNo').value = '';
            var SelectedFinYear=document.getElementById('cmbFinYear').value;
            
            var url="calendar.aspx?id=ADD/"+'<%=Session["CmbSegmentValue"]%>'+'&OpenSettlementForYear='+SelectedFinYear;
            //parent.editwinS.close();
            //window.showModalDialog(url,"Dialog Box Arguments # 2","dialogHeight: 350px; dialogWidth: 700px; dialogTop: 250px; dialogLeft: 300px; edge: Raised; center: Yes; resizable: No; status: No;");
            
                if('<%=Session["ExchangeSegmentID"]%>'=='1' || '<%=Session["ExchangeSegmentID"]%>'=='4' || '<%=Session["ExchangeSegmentID"]%>'=='15' || '<%=Session["ExchangeSegmentID"]%>'=='19' )
                {
                    
                    window.open(url,'name','height=350,width=700,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no ,modal=yes');
                }
                else
                {
              
                    CallServer("CreateSettlement~"+SelectedFinYear, "");
                }
            }
             
            
        function height()
        {
            if(document.body.scrollHeight>=500)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '500px';
            window.frameElement.Width = document.body.scrollWidth;
        }
        function blinkIt() 
        {
            if (!document.all) return;
            else 
            {
              for(i=0;i<document.all.tags('blink').length;i++)
              {
                s=document.all.tags('blink')[i];
                s.style.visibility=(s.style.visibility=='visible') ?'hidden':'visible';
              }
            }
        }
        
      
      
    </script>

    <script type="text/ecmascript">
        
        function ReceiveServerData(rValue)
        {   
            var DATA=rValue.split('~');  
            if(DATA[0]=="Save")
            {
                if(DATA[1]=="Y")
                {
                    parent.editwinS.close();
                }
                else
                {
                    alert(DATA[1]+' Please Relogin and try!');
                }
            }
            
            if(DATA[0]=="CreateSettlement")
            {
                alert(DATA[1]);
            }
            
        }
    </script>

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
<body class="TableMain100" onload="setInterval('blinkIt()',500)">
    <form id="form1" runat="server">
        <div style="height: 100%; width: 100%; text-align: center; vertical-align: middle;">
            <table class="TableMain" cellpadding="10px" cellspacing="0px">
                <tr>
                    <td>
                        <table border="4" cellpadding="0" cellspacing="0" bordercolor="#ffedb7">
                            <tr>
                                <td>
                                    <table width="100%" cellpadding="5" cellspacing="0" style="border-width: 1px; border-color: #CCCC00;
                                        border-style: solid; background-color: White">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                                    <tr>
                                                        <td>
                                           
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                                                <tr>
                                                                    <td colspan="2" class="">
                                                                        <table width="100%" border="0" cellpadding="0">
                                                                            <tr>
                                                                                <td class="headfont" style="text-align: left;">
                                                                                    <strong>Select Company, Financial Year and Settlement number.</strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr class="maintablerow">
                                                                    <td style="text-align: left; width: 57px;">
                                                                        Company :
                                                                    </td>
                                                                    <td style="text-align: left; width: 175px;">
                                                                        <asp:DropDownList ID="cmbCompany" runat="server" CssClass="EcoheadCon" Width="270px">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr class="maintablerow">
                                                                    <td style="text-align: left; width: 57px;">
                                                                        Fin. Year:
                                                                    </td>
                                                                    <td style="text-align: left; width: 175px;">
                                                                        <asp:DropDownList ID="cmbFinYear" runat="server" CssClass="EcoheadCon" Width="126px">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr class="maintablerow" id="setid" runat="server">
                                                                    <td style="text-align: left; width: 57px;">
                                                                        Sett. No. :
                                                                    </td>
                                                                    <td style="text-align: left; width: 175px;">
                                                                        <asp:TextBox ID="txtSettNo" runat="server" CssClass="EcoheadCon" Width="121px"></asp:TextBox></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" style="display: none;">
                                                                        <asp:TextBox ID="txtSettNo_hidden" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" style="text-align: right">
                                                                        <input id="btnSave" type="button" value="Done" class="btnUpdate" onclick="BtnSave_Click()" />
                                                                        <input id="BtnCancel" type="button" value="Cancel" class="btnUpdate" onclick="BtnCancel_Click()" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" id="Tr_OpenSettlement" style="display:none">
                                                                        <a id="LinkOpenSettlement" onclick="ShowOpenSettlement()" style="cursor:hand;color:Navy;font-weight:bold;text-decoration:underline;">No Settlement Exists For This FinYear/Date.
                                                                        Click Here To Create a New Settlement.</a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <%--<dx:ASPxPopupControl ID="OpenSettlementPopUp" runat="server" ClientInstanceName="cOpenSettlementPopUp"
            Width="750px" Height="350px" CloseAction="CloseButton" HeaderText="Open Settlement" Modal="True">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>--%>
        </div>
    </form>
</body>
</html>
