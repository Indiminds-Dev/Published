<%@ page language="C#" autoeventwireup="true" inherits="management_CorporateActionAdjChangeSymbol, App_Web_lyh0nvfl" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1">
    <title>Change Security Symbol</title>
       <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    
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
   function Page_Load()///Call Into Page Load
            {   
                height();
            }
    function height()
        {
            if(document.body.scrollHeight>=380)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '380px';
            }
            window.frameElement.width = document.body.scrollWidth;
        }
      
   function Hide(obj)
   {
      document.getElementById(obj).style.display='none';
   }
   function Show(obj)
   {
       document.getElementById(obj).style.display='inline';
   }
  
   function AlertGenerate()
    {        
       
        var answer = confirm ("Are You Sure You Want To Change The Symbol From "+document.getElementById("txtPrevSymbol").value+" To "+document.getElementById('txtNewSymbol').value+" ?");
        if (answer==true)
        {
            var answer1 = confirm ("Are You Really Sure You Want To Change The Symbol From "+document.getElementById("txtPrevSymbol").value+" To "+document.getElementById('txtNewSymbol').value+" ?");
            if(answer1==true)
            {
                var answer2 = confirm ("Are You Really Sure You Want To Change The Symbol From "+document.getElementById("txtPrevSymbol").value+" To "+document.getElementById('txtNewSymbol').value+" ?");
                if(answer2==true)
                {
                      document.getElementById('BtnGenerate').click();
                    
                }
            }
        } 
                
    }
  
     function RecordDisplay(obj)
     {
        alert(obj);
        height();
     }
    
       function FunCallAjaxList(objID,objEvent)
        {
               var strQuery_Table = '';
               var strQuery_FieldName = '';
               var strQuery_WhereClause = '';
               var strQuery_OrderBy='';
               var strQuery_GroupBy='';
               var CombinedQuery='';
            
                 strQuery_Table = "master_products";
                 strQuery_FieldName = "distinct top 10 rtrim(products_shortname),rtrim(products_id)";
                 strQuery_WhereClause = " products_producttypeid in (1,5) and (products_name like (\'RequestLetter%') or products_shortname like (\'RequestLetter%')) ";
                 CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
                 ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery));
           
        }

       function replaceChars(entry) 
       {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out)>-1) {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
        }
        


       FieldName='lstSlection'; 
 </script>
     
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server"  autocomplete="off">
    <div>
     <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
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
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Change Security Symbol</span></strong>
                </td>
            </tr>
        </table>
   
        <table>
            <tr>
                <td class="gridcellleft">
                    <table width="100%" style="border: solid 1px Black" border="0" cellpadding="0">
                        <tr>
                            <td style="color: Red;">
                                <b>**Important &nbsp;&nbsp;</b>
                            </td>
                            <td style="color: Red;">
                                Please run this routine before importing any exchange files on the day of effect
                                of change in Symbol
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr valign="top">
                <td class="gridcellleft">
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="gridcellleft" bgcolor="#b7ceec">
                                Existing Symbol :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPrevSymbol" runat="server" Width="150px" onkeyup="FunCallAjaxList(this,event)"
                                    Font-Size="Small"></asp:TextBox></td>
                            <td style="display: none;">
                                <asp:TextBox ID="txtPrevSymbol_hidden" runat="server" Width="5px"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="gridcellleft" bgcolor="#b7ceec">
                                New Symbol :
                            </td>
                            <td>
                                <asp:TextBox ID="txtNewSymbol" runat="server" Width="150px" MaxLength="20" Font-Size="Small"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="gridcellleft" bgcolor="#b7ceec">
                                Change Effective From :
                            </td>
                            <td>
                                <dxe:ASPxDateEdit ID="DtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="DtFrom">
                                    <dropdownbutton text="From">
                                    </dropdownbutton>
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <table>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnGenerateAlert" OnClientClick="javascript:return AlertGenerate();"
                                            runat="server" Text="Generate" CssClass="btnUpdate" Height="23px" Width="101px" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnGenerate" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                          
                          
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="display:none;">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="BtnGenerate" runat="server" Text="Generate" CssClass="btnUpdate"
                                            Height="23px" Width="101px" OnClick="BtnGenerate_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnGenerate" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                   
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
       
    </div>
    </form>
</body>
</html>
