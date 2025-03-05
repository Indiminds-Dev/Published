<%@ page language="C#" autoeventwireup="true" inherits="management_Config_DpCharges, App_Web_e81qjzgk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
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
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
	<script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js" ></script>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <script language="javascript" type="text/javascript">
   function callback()
   {
     grid.PerformCallback();
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
    function ShowGroup(obj)
    {
        if(obj=='A')
        {
          document.getElementById('tdaccount').style.display="inline";
          document.getElementById('tdtxtaccount').style.display="inline";
          document.getElementById('tdtxtgroup').style.display="none";
          document.getElementById('tdgroup').style.display="none";
          document.getElementById('txtGroup_hidden').style.display="none";
          document.getElementById('txtAccount_hidden').style.display="none";
        }
        if(obj=='G')
        {
          document.getElementById('tdaccount').style.display="none";
          document.getElementById('tdtxtaccount').style.display="none";
          document.getElementById('tdtxtgroup').style.display="inline";
          document.getElementById('tdgroup').style.display="inline";
          document.getElementById('txtGroup_hidden').style.display="none";
          document.getElementById('txtAccount_hidden').style.display="none";
        }
    }
   function CallAjax(obj1,obj2,obj3)
    {
        var obj4='';
        var o = cmbDp.GetText();
        if(o=="NSDL")
        {
         obj4='1'; 
        }
        else
        obj4='2';
        FieldName='Headermain1_cmbSegment';
        ajax_showOptions(obj1,obj2,obj3,obj4);
    } 
    function OnAddButtonClick() 
    { 
         
           
           if(document.getElementById('txtAccount_hidden').value!='')
         {
         var ch=document.getElementById('txtAccount_hidden').value;
          och=document.getElementById('txtAccount').value;
         var type='C';
         }
      else
         {
           ch=document.getElementById('txtGroup_hidden').value;
           och=document.getElementById('txtGroup').value;
           type='G';
         }    
         
          var cmbc=document.getElementById('cmbDp_VI').value;
          var cmbs=document.getElementById('cmbCompany_VI').value;
          var cc= cmbDp.GetText(); 
          var ss= cmbDp.GetText().toString();   
           var RadVal=rbdp1.GetValue(); 
           if(ch=='')
           {
            alert('Please Insert Above Field To Add DP Charge Infromation');
           } 
//////////////////////////           else
//////////////////////////           {
//////////////////////               if(RadVal =='G')
//////////////////////                 {
//////////////////////                   var ch=document.getElementById('txtGroup_hidden').value;
//////////////////////                   var  och=document.getElementById('txtGroup').value; 
//////////////////////                       
//////////////////////                   var url='DpChargeMain.aspx?id='+'ADD'+'/'+ch+'/'+cc +'/'+cmbc;
//////////////////////                }
//////////////////////                 else
//////////////////////                 {
//////////////////////                   var ch=document.getElementById('txtAccount_hidden').value;
//////////////////////                   var och=document.getElementById('txtAccount').value;
//////////////////////                  
//////////////////////                   var url='DpChargeMain.aspx?id='+'ADD'+'/'+ch +'/'+och+'/'+cc +'/'+cmbc;
//////////////////////                  }
//////////////////////             parent.OnMoreInfoClick(url,"Add DPChargeMain-General",'980px','520px',"Y");
//////////////////////          }
 else
       {
          var url='';
          var objVal=grid.GetVisibleRowsOnPage();
           //alert(objVal);
//          if(objVal=='0')
          //          {




       
                 
             AddUrl='ADD'+'/'+ch +'/'+och +'/'+cc+'/'+cmbc;//+ss+'/'+type;
             url='BrokerageBrideDp.aspx?id='+ch+' &Cid='+cmbc+' &Addurl='+AddUrl;    
             //alert (url);
             //url='BrokerageBrideDp.aspx?id='+'ADD'+'/'+ch +'/'+och+'/'+cc +'/'+cmbc+'/'+cmbs;                    
         //}
//         else
//         {
//             url='BrokerageBrideDp.aspx?id='+ch+' &Cid='+cmbc;//+' &Sid='+cmbs;  
//
             //         }

          
    parent.OnMoreInfoClick(url,"Add DPChargeMain Details",'470px','300px',"Y");      

       }

    }
    
    function FillValues(objVal,objCusID,objSegID)
    {
        parent.editwin.close();
        var cmbs=document.getElementById('cmbDp_VI').value;
        var Grp=document.getElementById('txtGroup_hidden').value;
//        if(Grp=='')
//            Grp='G'
//        else
//            Grp='C'
   
        var objCharge='T'
        var url='DpChargeMain.aspx?id='+objVal+' &charge='+objCharge+' &CusID='+objCusID+'  &SegID='+objSegID+' &Grp='+Grp+' &clName='+och;
        //var url='DpChargeMain.aspx?id='+AddUrl;
        //alert(url);
        
        parent.OnMoreInfoClick(url,"Edit DPChargeMain Details",'980px','470px',"Y");      

    }
    function FillValuesWithAdd(objVal)
    {
        parent.editwin.close();
        var cmbs=document.getElementById('cmbDp_VI').value;
        var url='DpChargeMain.aspx?id='+AddUrl;
        parent.OnMoreInfoClick(url,"Edit DPChargeMain Details",'980px','470px',"Y");      
        //alert(url);
    }
    
    function OnMoreInfoClick(keyValue)
    { 
        var url='DpChargeMain.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Edit DPChargeMain Details",'980px','520px',"Y");
    }
      
     function CallGroup()
     {
      var d=document.getElementById("rbdp").value
      if(d=='1')
      {
       document.getElementById('tdaccount').style.display="none";
       document.getElementById('tdtxtaccount').style.display="none";
       document.getElementById('tdtxtgroup').style.display="inline";
       document.getElementById('tdgroup').style.display="inline";
       document.getElementById('txtGroup_hidden').style.display="none";
       document.getElementById('txtAccount_hidden').style.display="none";
       document.getElementById("tdcdp").style.display = "inline";
      }
      else
      
      {
       document.getElementById('tdaccount').style.display="inline";
       document.getElementById('tdtxtaccount').style.display="inline";
       document.getElementById('tdtxtgroup').style.display="none";
       document.getElementById('tdgroup').style.display="none";
       document.getElementById('txtGroup_hidden').style.display="none";
       document.getElementById('txtAccount_hidden').style.display="none";
     document.getElementById("tdcdp").style.display = "inline";
      } 
    }
    function ReceiveServerData(rValue)
       { 
        var DATA=rValue.split('~');  
          if(DATA[0]=="DP")
        { 
         if(DATA[1]!="N")
            {  
             document.getElementById("tdcdp").style.display = "inline"; 
            } 
            else
            { 
            document.getElementById("tdcdp").style.display = "none"; 
            } 
        }
    }
 </script>
  <table  class="TableMain100">
       <tr>
            <td class="EHEADER" >
                <span style="color:Blue"> <strong>DP Charge Setup</strong></span>
            </td>
        </tr>
        <tr>
            <td>
              <table class="TableMain100">
                <tr>
                 <asp:HiddenField id="hd1" runat="server"/>
                 
                          <td>
                            <dxe:ASPxComboBox ID="cmbCompany" runat="server" width="230px" Enabled="false" DataSourceID="AccessDataSourceCompany" TextField="cmp_Name" ValueField="cmp_internalid"   Font-Size="10px"  ValueType="System.String" Font-Bold="False">
                                <ButtonStyle Width="13px">
                                </ButtonStyle>
                                <DropDownButton Text="Company">
                                </DropDownButton>
                            </dxe:ASPxComboBox>
                        </td>
                        
                         <td id="tdcdp" runat="server">
                            <dxe:ASPxComboBox ID="cmbDp"  runat="server" width="150px" DataSourceID="AccessDataSourceDP" TextField="dp_depository" ValueField="dp_dpid"   Font-Size="10px"  ValueType="System.String" Font-Bold="False"
                            EnableSynchronization="False" ClientInstanceName="cmbDp" ReadOnly="true" EnableIncrementalFiltering="True">
                                <ButtonStyle Width="13px">
                                </ButtonStyle>
                                <DropDownButton Text="DP">
                                </DropDownButton>
                            </dxe:ASPxComboBox>
                        </td>
                    <td style="width: 136px">
                     <dxe:ASPxRadioButtonList ID="rbdp" runat="server" ClientInstanceName="rbdp1" SelectedIndex="0" ItemSpacing="10px" RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px">
                    <Items>
                      <dxe:ListEditItem Text="Account" Value="A" />
                      <dxe:ListEditItem Text="Group" Value="G" />
                    </Items>
                     <ClientSideEvents ValueChanged="function(s, e) {ShowGroup(s.GetValue());}" />
                     <Border BorderWidth="0px" />
                  </dxe:ASPxRadioButtonList>
                </td>
                         <td class="gridcellright" style="width: 17px" id="tdaccount">
                            <span class="Ecoheadtxt" style="color:Blue"><strong>Account:</strong></span>
                        </td>
                        <td class="gridcellleft" style="width:80px" id="tdtxtaccount">
                            <asp:TextBox ID="txtAccount" runat="server" Width="250px" Font-Size="11px"></asp:TextBox><asp:TextBox  ID="txtAccount_hidden" runat="server" Width="14px" style="display:none;"></asp:TextBox>
                        </td>
                         <td class="gridcellright" style="width:17px;display:none;" id="tdgroup">
                            <span class="Ecoheadtxt" style="color:Blue"><strong>Group:</strong></span>
                        </td>
                        <td class="gridcellleft" style="width: 60px;display:none;" id="tdtxtgroup">
                            <asp:TextBox ID="txtGroup" runat="server" Width="250px" Font-Size="11px"></asp:TextBox><asp:TextBox  ID="txtGroup_hidden" runat="server" Width="14px"></asp:TextBox>
                        </td>
                        
                   
                        
                           <td class="gridcellright" style="width: 54px" id="tdshow" runat="server">
                            <dxe:ASPxButton ID="btnShow" runat="server" Text="Show"   AutoPostBack="False" >
                                <clientsideevents click="function(s, e) {
	grid.PerformCallback();
}"></clientsideevents>
                            </dxe:ASPxButton>
                        </td>
                </tr>
              
               <tr>
                   <td colspan="6">
                   
                      <dxwgv:ASPxGridView ID="DPChargeMainGrid" runat="server"   KeyFieldName="DPChargeMain_ID"
         AutoGenerateColumns="False" DataSourceID="DPChargeDataSource"  Width="100%" ClientInstanceName="grid" OnCustomCallback="DPChargeMainGrid_CustomCallback" OnRowDeleting="DPChargeMainGrid_RowDeleting">
        <Columns>
           <dxwgv:GridViewDataTextColumn FieldName="DPChargeMain_ID" Caption="ID" VisibleIndex="0"  Visible="false">
                <CellStyle CssClass="gridcellleft">
                </CellStyle>
                <EditFormCaptionStyle HorizontalAlign="Right">
                </EditFormCaptionStyle>
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
          
             <dxwgv:GridViewDataTextColumn Caption="From Date" FieldName="DPChargeMain_DateFrom" VisibleIndex="1" Width="20%">
                <CellStyle CssClass="gridcellleft">
                </CellStyle>
                <EditFormCaptionStyle HorizontalAlign="Right">
                </EditFormCaptionStyle>
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
               <dxwgv:GridViewDataTextColumn Caption="To Date" FieldName="DPChargeMain_DateTo" VisibleIndex="2" Width="20%">
                <CellStyle CssClass="gridcellleft">
                </CellStyle>
                <EditFormCaptionStyle HorizontalAlign="Right">
                </EditFormCaptionStyle>
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
 
             
            <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="3" Width="20%">
                <DataItemTemplate>
                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">More Info...</a>
                </DataItemTemplate>
                <EditFormSettings Visible="False" />
                <CellStyle Wrap="False">
                </CellStyle>
                                         
                        <HeaderStyle HorizontalAlign="Center" />
                        <HeaderTemplate>
                           <%-- <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd"){ %>--%>
                            <a href="javascript:void(0);" onclick="OnAddButtonClick( )">
                              <span style="color: #000099; text-decoration: underline">Add New</span>
                            </a>
                           <%-- <%} %>--%>
                        </HeaderTemplate>
            </dxwgv:GridViewDataTextColumn>
        <dxwgv:GridViewCommandColumn VisibleIndex="4" Caption="Delete">
                <DeleteButton Visible="True">
                </DeleteButton>
            </dxwgv:GridViewCommandColumn>
        </Columns>
        <Styles  >
            <LoadingPanel ImageSpacing="10px">
            </LoadingPanel>
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
        </Styles>
        <Settings ShowGroupPanel="True" ShowTitlePanel="True" ShowFooter="True" ShowStatusBar="Visible" />
        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" ConfirmDelete="True" />
        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
        <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20" PageSize="20">
            <FirstPageButton Visible="True">
            </FirstPageButton>
            <LastPageButton Visible="True">
            </LastPageButton>
        </SettingsPager>
    </dxwgv:ASPxGridView>
    
     <asp:SqlDataSource ID="DPChargeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
    <%-- DeleteCommand="DpChargeMain_Delete" DeleteCommandType="StoredProcedure">
       <DeleteParameters>
            <asp:Parameter Name="DPChargeMain_ID" Type="String" />
        </DeleteParameters>--%>
         </asp:SqlDataSource>
    <br />
    
                   </td>
               
               </tr>
              </table>
           </td>
        </tr>
    </table> 
  
  <br />

  <asp:SqlDataSource ID="AccessDataSourceCompany" runat="server"  ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
    
        SelectCommand="SELECT cmp_internalid,cmp_Name FROM [tbl_master_company]"></asp:SqlDataSource> 
        
           <asp:SqlDataSource ID="AccessDataSourceDP" runat="server"  ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
       SelectCommand="select exch_TMCode as dp_dpid,exch_membershipType as dp_depository from tbl_master_companyexchange  where exch_compid=@CompId and len(isnull(exch_exchid,''))=0">
               <SelectParameters>
               <asp:SessionParameter Name="CompId" SessionField="LastCompany" Type="string" />
        </SelectParameters></asp:SqlDataSource> 
    </form>
</body>
</html>
