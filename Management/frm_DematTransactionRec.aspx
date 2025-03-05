<%@ page language="C#" autoeventwireup="true" inherits="management_frm_DematTransactionRec, App_Web_g1t3n0jz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
       <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

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
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="load()">
<script language="javascript" type="text/javascript">

        function PageLoad()
         {
             FieldName='btnImport';   
             document.getElementById('txtAccName_hidden').style.display="none";
             
             if (combo.GetValue()== '3')
                document.getElementById('trAcc').style.display='none';
             else 
                document.getElementById('trAcc').style.display='inline';
                
             if (combo.GetValue()== '1')
                document.getElementById('trVersion').style.display='inline';
             else 
                document.getElementById('trVersion').style.display='none';
            
             height();           
         } 
         function SignOff()
        {
            window.parent.SignOff();
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
            window.frameElement.width = document.body.scrollWidth;
        }
        function CallAjax(obj1,obj2,obj3)
         { 
//             document.getElementById('cmbFileType').style.display="none";
             ajax_showOptions(obj1,obj2,obj3,'','Sub');
                 
         }
//         function keyVal(obj)
//         {
//             document.getElementById('cmbFileType').style.display="inline";
//         }
         function notCdslAlert()
         {
         alert('You have entered CDSL Account, but selected File Type is not CDSL-DPC9. \nThe Account and File Type must be of same type.\nPlease check the error.');
         }
         function notNsdlAlert()
         {
         alert('You have entered NSDL Account, but selected File Type is not NSDL-Trn.\nThe Account and File Type must be of same type.\nPlease check the error.');
         }
         function notCdslFileAlert()
         {
         alert('The file you have selected is not a CDSL-DPC9 file.\nPlease select CDSL-DPC9 file.');
         }
         function notNsdlFileAlert()
         {
         alert('The file you have selected is not a NSDL-Trn file.\nPlease select NSDL-Trn file.');
         }
         function notDfrsFileAlert()
         {
          alert('The file you have selected is not a DFRS file.\nPlease select DFRS file.');

         }
         function notRCBDLFileAlert()
         {
          alert('The file you have selected is not a RCBDL file.\nPlease select RCBDL file.');
         }
         function onIndexChange(s)
         {
             if (combo.GetValue()== '1')
                document.getElementById('trVersion').style.display='inline';
             else 
                document.getElementById('trVersion').style.display='none';

             if ((s.GetValue()== '3')||(s.GetValue()== '5'))
                document.getElementById('trAcc').style.display='none';
             else 
                document.getElementById('trAcc').style.display='inline';
         
         }
        function importResult()        
        {
//        alert('<%=trn_type %>');
//        alert('<%=FileName %>');
        
            if (('<%=trn_type %>' == 'NSDLTrn')||('<%=trn_type %>' == 'CDSLDPC9'))
            {
           
                alert('File <%=FileName %> has been imported successfully.\nNo. of total records = <%=tot_rows %>.\nNo. of records inserted = <%=rows_inserted %>.\nNo. of records already existing = <%=rows_skipped %>.');
            }
            else if (('<%=trn_type %>' == 'DFRS')||('<%=trn_type %>' == 'RCBDL'))
            {
            
                alert('File <%=FileName %> has been imported successfully.\nNo. of records inserted = <%=rows_inserted %>.');
            }
        }
        
</script>
 
    <form id="form1" runat="server" autocomplete="off">   
    
    <div align="center">
    <table id="tbl_main" class="login" width="55%">       
        <tr>
            <td class="lt1" style="height: 40px" colspan="2" >
                <h5>
                    Import Demat Transactions For Reconciliation
                </h5>
                &nbsp;</td>
        </tr>  
        
        <tr>
                <td style="width: 20%; text-align: left;" align="left">
                    Select File Type :
                </td>
                <td align="left">                     
                    <dxe:ASPxComboBox id="cmbFileType" clientinstancename="combo" selectedindex="0" runat="server" ValueType="System.String">
                        <items>
                            <dxe:ListEditItem Value="1" Text="NSDL-Trn"></dxe:ListEditItem>
                            <dxe:ListEditItem Value="2" Text="CDSL-DPC9"></dxe:ListEditItem>
                            <dxe:ListEditItem Value="3" Text="DFRS"></dxe:ListEditItem>
                            <dxe:ListEditItem Value="4" Text="Speady"></dxe:ListEditItem>
                            <dxe:ListEditItem Value="5" Text="RCBDL"></dxe:ListEditItem>
                        </items>
                        <clientsideevents selectedindexchanged="function(s, e) {onIndexChange(s);}"  >
                        </clientsideevents>
               
                    </dxe:ASPxComboBox>
                </td>
            
        </tr> 
         <tr id="trAcc">
                <td style="width: 20%; text-align: left;" >
                    Enter Account :
                </td>
                <td align="left">
                    <asp:TextBox ID="txtAccName" runat="server" TabIndex="0" Width="250px" Font-Size="12px"></asp:TextBox>
                    <asp:TextBox ID="txtAccName_hidden" runat="server" Width="14px"></asp:TextBox>
                </td>
        </tr>   
        <tr>
        <td >
            
            </td>
            <td style="width: auto; height: 14px;" align="left">
                <asp:Label ID="lblImportStatus" runat="server" Font-Size="X-Small" Font-Names="Arial"
                    Font-Bold="True" ForeColor="Red" /></td>
        </tr>
         <tr id="trVersion">
            <td align="left">Select Version : </td>
            <td align="left">
                <asp:DropDownList ID="ddlVersion" runat="server" OnSelectedIndexChanged="ddlVersion_SelectedIndexChanged">
                    <asp:ListItem Text="E-DPM" Value="E-DPM"></asp:ListItem>
                    <asp:ListItem Text="DPM (Old)" Value="DPM(Old)"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr align ="left">            
            <td style="width: 20%; text-align: left;" align="left">
                Select File :
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" width="340px" TabIndex="2"/>
            </td>
        </tr>                                            
        <tr>                                                    
            <td colspan="2" valign="top" align="center" style="height: 19px" >
                <asp:Button ID="btnImport" runat="server" Text="Import File" CssClass="btn" 
                    Width="84px" TabIndex="3" OnClick="btnImport_Click"  Visible="false" /> &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnRecon" runat="server" Text="Reconcile Transaction" CssClass="btn" 
                    Width="140px" TabIndex="4" OnClick="btnRecon_Click"/>
            </td>                        
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
