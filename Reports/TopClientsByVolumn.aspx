<%@ page language="C#" autoeventwireup="true" inherits="Reports_TopClientsByVolumn, App_Web_aaw4c9up" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Top Clients By volumn</title>
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
	  .grid_scroll
    {
        overflow-y: no;  
        overflow-x: scroll; 
        width:90%;
        scrollbar-base-color: #C0C0C0;
    
    }
	</style>

    <script language="javascript" type="text/javascript">
  
    function Page_Load()///Call Into Page Load
            {
               FieldName='btnshow';
               Hide('filter');
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
            window.frameElement.width = document.body.scrollwidth;
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
            
    function AllowNumericOnly(e)
    {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (event) keycode = event.keyCode;
        else if(e) keycode = e.which;
        else return true;
        if( (keycode > 47 && keycode <= 57) )
        {
          return true;
        }
        else
        {
          return false;
        }
      return true;  
    }
    function line()
   {
     Show('tblDisplay');
     Show('filter');
     Hide('tab2');
     height();
   }
    function filter() 
        {
          
          Hide('filter');
          Hide('tblDisplay');
          Show('tab2');
          height();
        }     

  function NORECORD(obj)
  {
      
      if(obj=='1')
          alert('No Record Found!!');
      else if (obj=='2')
          alert('Please Select Type!!');
      height();
  }
 function selecttion()
        {
            var combo=document.getElementById('ddlExport');
            combo.value='0';
        }  

  
    </script>

    <script type="text/ecmascript">   
    
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
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

        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                        <strong><span id="SpanHeader" style="color: #000099">Top Clients By Volumn</span></strong></td>
                        
                         <td class="EHEADER" width="25%" id="filter">
                        <a href="javascript:void(0);" onclick="filter();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a> || <asp:DropDownList
                                ID="ddlExport" Font-Size="Smaller" runat="server" AutoPostBack="True" 
                                Height="16px" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                                <asp:ListItem Value="E">Excel</asp:ListItem>
                                </asp:DropDownList>
                        </td>
                </tr>
            </table>
            <table id="tab2" border="0" cellpadding="0" cellspacing="0">
            <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                <tr valign="top">
                    <td style="height: 184px">
                        <table>
                        
                            <tr>
                                <td colspan="5" class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td bgcolor="#B7CEEC">
                                                <strong>Date :</strong>
                                            </td>
                               <td class="gridcellleft">
                                <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dtFrom">
                                    <dropdownbutton text="From">
                                        </dropdownbutton>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td class="gridcellleft">
                                <dxe:ASPxDateEdit ID="dtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dtTo">
                                    <dropdownbutton text="To">
                                        </dropdownbutton>
                                </dxe:ASPxDateEdit>
                            </td>
                                          
                                        </tr>
                                  
                                        <tr>
                                            <td bgcolor="#B7CEEC">
                                                <strong>Select Top :</strong></td>
                                            <td>
                                                <asp:TextBox ID="txtNo" runat="server" Width="50px" onkeypress="return AllowNumericOnly(this);"></asp:TextBox>
                                                <strong>Clients</strong></td>
                                          <td>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNo"
                                                  ErrorMessage='This Field Can"T be Blank' ValidationGroup="a"></asp:RequiredFieldValidator></td>
                                           
                                        </tr>
                                        <tr>
                            <td bgcolor="#B7CEEC">
                                <strong>Segment :</strong></td>
                            <td>
                                <asp:RadioButton ID="rdbSegAll" runat="server" GroupName="e" onclick="fn_Segment('a')" />
                                All
                            </td>
                            <td>
                                <asp:RadioButton ID="rdbSegSelected" runat="server" Checked="True" GroupName="e"
                                    onclick="fn_Segment('b')" />
                                Current
                            </td>
                              <td> [ <span id="litSegment" runat="server" style="color: Maroon"></span> ]

                              </td>
                           
                        </tr>
                                    </table>
                                 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <table>
                        <tr>
                            <td id="td_btnshow">
                                <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                    Width="120px" ValidationGroup="a" OnClick="btnshow_Click" OnClientClick=" selecttion();" />
                            </td>
                             <td id="td_export" class="gridcellleft">
                                 <asp:Button ID="btnexport" runat="server" CssClass="btnUpdate" Height="20px" Text="Export To Excel"
                                 Width="120px" ValidationGroup="a" OnClick="btnexport_Click" />
                            </td>
                            
                        </tr>
                    </table>
                                </td>
                            </tr>
                            
                        </table>
                    </td>
                   
                </tr>
               
            </table>
     
           <div id="tblDisplay" style="display: none;" width="100%">
            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
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
                    <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </div>
        </div>
    </form>
</body>
</html>
