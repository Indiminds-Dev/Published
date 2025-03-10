<%@ page language="C#" autoeventwireup="true" inherits="management_DPChargeDetail, App_Web_hnfc-rlk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
   
    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
    <style type="text/css">
       a:hover {background:#ffffff; text-decoration:none;} /*BG color is a must for IE6*/
       a.tooltip span {display:none; padding:2px 3px; font-size:smaller; margin-left:1px; width:100px;}
       a.tooltip:hover span{display:inline; position:horizontal; background:#ffffff; border:1px solid #cccccc; color:#6c6c6c; width:100px}
    
    </style>

    <script language="javascript" type="text/javascript">
   
      
      function CallAjax(obj1,obj2,obj3)
        {
          
           ajax_showOptions(obj1,obj2,obj3);
        }
        FieldName='btnSave';

     function noNumbers(e)
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
    </script>

</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
    <div>
      <table class="TableMainB">
                <tr>
                    <td class="EHEADER1">
                    </td>
                </tr>
                <tr>
                
                    <td>
            
                            <table width="95%" >
                            <tr>
                            <td>
                            <table style="background-color:#FFF3DF;">
                                 <tr >
                                        <td class="Ecoheadtxt"  >
                                        <dxe:ASPxLabel id="lbl1" runat="server" Text="DPCharge Detail Of:" width="110px"></dxe:ASPxLabel>
                                        </td>
                                              <td>
                                          <dxe:ASPxLabel ID="lblname" runat="server" width="250px"  ForeColor="Brown"></dxe:ASPxLabel>
                                        </td>
                                        </tr>
                                
                            </table>
                            </td>
                            </tr>
                                <tr>
                                    <td>
                                        <table style="width:70%; z-index:101">
                                 
                                               <tr>
                                     
                                        
                                            <td class="Ecoheadtxt"  ><dxe:ASPxLabel ID="lbl21" width="80px" runat="server" Text="Charge Type:"></dxe:ASPxLabel></td>
                                          <td class="Ecoheadtxt" style="text-align:left;"colspan="3" >
                                             <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceType" TextField="DPCharge_Name" ValueField="DPCharge_Code" Width="250px" ID="cmbDpchargetype" TabIndex="0">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {OnTypeChanged(s); }"></ClientSideEvents>
                                                </dxe:ASPxComboBox>
                                          </td>
                                          <td></td>
                                        </tr>
                                                                           
                                      <tr >
                                       
                                                                       
                                          <td class="Ecoheadtxt"><dxe:ASPxLabel ID="lbl23" runat="server" Text="Fixed Amount:"  ></dxe:ASPxLabel></td>
                                          <td class="Ecoheadtxt" style="text-align:left;width:100px;" >
                                           <dxe:ASPxTextBox runat="server"  ID="txtfixedamt" width="100px" onkeypress="return noNumbers(event)">
                                           <MaskSettings Mask="<0..99999999g>.<00..99>"  />
                                          <ValidationSettings ErrorDisplayMode="None"></ValidationSettings> 
                                          </dxe:ASPxTextBox>
                                          </td>
                                           <td class="Ecoheadtxt"  width="5px" >
                                           <dxe:ASPxLabel ID="lbl22" width="20px" runat="server" Text="Per:" ></dxe:ASPxLabel>
                                          </td>
                                          <td class="Ecoheadtxt" style="text-align:left;" width="110px" >
                                            <dxe:ASPxComboBox runat="server" Width="100px" ID="ddlfixedamtper" style="text-align:left;" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                               <ClientSideEvents SelectedIndexChanged="function(s, e) { OnBrokerageForChange(s); }"></ClientSideEvents>
                                               <Items>
                                                  <dxe:ListEditItem Text="Unit" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="ISIN" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Instruction" Value="3">
                                                  </dxe:ListEditItem>
                                                     <dxe:ListEditItem Text="Certificate" Value="4">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Day" Value="5">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Month" Value="6">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="100 Units" Value="7">
                                                  </dxe:ListEditItem>
                                                </Items>
                                                                    
                                             </dxe:ASPxComboBox>
                                          </td>
                                              <td colspan="2"></td>
                                           </tr>
                                           <tr>
                                             <td class="Ecoheadtxt" ><dxe:ASPxLabel ID="lbl53" runat="server" Text="Rate:" ></dxe:ASPxLabel></td>
                                          <td class="Ecoheadtxt" style="text-align:left;width:100px;">
                                              <dxe:ASPxTextBox runat="server"  ID="txtrate" width="100px"  onkeypress="return noNumbers(event)">
                                                                      <MaskSettings Mask="<0..9999g>.<00..9999>"  />
                                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings> 
                                                                       </dxe:ASPxTextBox>
                                          </td>
                                            <td class="Ecoheadtxt" width="5px">
                                            <dxe:ASPxLabel ID="lbl25"  runat="server" Text="Per:" width="20px" ></dxe:ASPxLabel>
                                            </td>
                                          <td class="Ecoheadtxt" style="text-align:left;" width="110px">
                                             <dxe:ASPxComboBox runat="server" ID="ddlrateper" style="text-align:left;" width="100px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                   <ClientSideEvents SelectedIndexChanged="function(s, e) { OnBrokerageForChange(s); }"></ClientSideEvents>
                                                <Items>
                                                <dxe:ListEditItem Text="Unit" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="ISIN" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Instruction" Value="3">
                                                  </dxe:ListEditItem>
                                                     <dxe:ListEditItem Text="Certificate" Value="4">
                                                  </dxe:ListEditItem>
                                                     <dxe:ListEditItem Text="Day" Value="5">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Month" Value="6">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="100 Units" Value="7">
                                                  </dxe:ListEditItem>
                                                </Items>
                                             </dxe:ASPxComboBox>
                                          </td>
                                             <td colspan="2"></td>
                                            
                                           </tr>
                                             <tr >
                                         
                                                          
      
                                          <td class="Ecoheadtxt"><dxe:ASPxLabel ID="lbl56"  runat="server" Text="Minimum Amount:" ></dxe:ASPxLabel></td>
                                          <td class="Ecoheadtxt" style="text-align:left;">
                                              <dxe:ASPxTextBox runat="server"  ID="txtminamt" width="100px"  onkeypress="return noNumbers(event)">
                                                 <MaskSettings Mask="<0..99999999g>.<00..99>"  />
                                             <ValidationSettings ErrorDisplayMode="None"></ValidationSettings> 
                                            </dxe:ASPxTextBox>
                                          </td>
                                             <td class="Ecoheadtxt" ><dxe:ASPxLabel ID="lbl29"  runat="server" Text="Per:" ></dxe:ASPxLabel></td>
                                            <td class="Ecoheadtxt" style="text-align:left;" width="110px">
                                              <dxe:ASPxComboBox runat="server" ID="ddlminamtper" width="100px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                   <ClientSideEvents SelectedIndexChanged="function(s, e) { OnBrokerageForChange(s); }"></ClientSideEvents>
                                                <Items>
                                                <dxe:ListEditItem Text="Unit" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="ISIN" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Instruction" Value="3">
                                                  </dxe:ListEditItem>
                                                     <dxe:ListEditItem Text="Certificate" Value="4">
                                                  </dxe:ListEditItem>
                                                     <dxe:ListEditItem Text="Day" Value="5">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Month" Value="6">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="100 Units" Value="7">
                                                  </dxe:ListEditItem>
                                                </Items>
                                             </dxe:ASPxComboBox>
                                            </td>
                                            <td colspan="2"></td>
                                          </tr>
                                           
                                              <tr>
                                                  
                                            <td class="Ecoheadtxt" ><dxe:ASPxLabel ID="lbl31"  runat="server" Text="Maximum Amount:" width="110px"></dxe:ASPxLabel></td>
                                            <td class="Ecoheadtxt"  style="text-align:left;">
                                            <dxe:ASPxTextBox runat="server"  ID="txtmaxamt" width="100px"  onkeypress="return noNumbers(event)">
                                             <MaskSettings Mask="<0..99999999g>.<00..99>"  />
                                               <ValidationSettings ErrorDisplayMode="None"></ValidationSettings> 
                                            </dxe:ASPxTextBox>
                                            </td>
                                            
                                          <td class="Ecoheadtxt" ><dxe:ASPxLabel ID="lbl72"  runat="server" Text="Per:" ></dxe:ASPxLabel></td>
                                          <td class="Ecoheadtxt" style="text-align:left;" width="110px">
                                            <dxe:ASPxComboBox runat="server" Width="100px" ID="ddlmaxamtper" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                               <ClientSideEvents SelectedIndexChanged="function(s, e) { OnBrokerageForChange(s); }"></ClientSideEvents>
                                               <Items>
                                                  <dxe:ListEditItem Text="Unit" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="ISIN" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Instruction" Value="3">
                                                  </dxe:ListEditItem>
                                                     <dxe:ListEditItem Text="Certificate" Value="4">
                                                  </dxe:ListEditItem>
                                                     <dxe:ListEditItem Text="Day" Value="5">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Month" Value="6">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="100 Units" Value="7">
                                                  </dxe:ListEditItem>
                                                </Items>
                                                                    
                                             </dxe:ASPxComboBox>
                                          </td>
                                          <td colspan="2"></td>
                                              </tr>                      
                                        
                                       <tr>
                                
                                            <td class="Ecoheadtxt"  style="text-align:right;"colspan="8">
                                              <asp:Button id="btnSave" runat="server" style="cursor:pointer" Text="Save" OnClick="btnSave_Click" OnClientClick="return aa();"/>
                                            </td>
                                        </tr>
                                        
                                        </table>
                                        
                                        
                                            </td>
                                </tr>
            
                            </table>
          
                    </td>
                </tr>
       
            </table>
    </div>
         <asp:SqlDataSource ID="AccessDataSourceType" runat="server"  ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
    
        SelectCommand="SELECT DPCharge_Name,DPCharge_Code FROM [Master_DPCharge] where DPCharge_Code!='ACOP'
        and DPCharge_Code!='DOCM' and DPCharge_Code!='AMC' and DPCharge_Code!='INBK' and DPCharge_Code!='DEPO'and DPCharge_Code!='LATE'"></asp:SqlDataSource> 
    </form>
</body>
</html>
