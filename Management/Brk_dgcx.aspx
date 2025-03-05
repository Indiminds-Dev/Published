<%@ page language="C#" autoeventwireup="true" inherits="management_Brk_dgcx, App_Web_bfdn6hbr" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

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
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
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
    function callback()
   {
    grid.PerformCallback();
   }
    
  function CallGroup()
  {
  var d=document.getElementById("rbbrk_VI").value
  if(d=='1')
  {
   document.getElementById('tdcustomer').style.display="none";
   document.getElementById('tdtxtcustomer').style.display="none";
   document.getElementById('tdtxtgroup').style.display="inline";
   document.getElementById('tdgroup').style.display="inline";
   document.getElementById('txtGroup_hidden').style.display="none";
   document.getElementById('txtCustomer_hidden').style.display="none";
    document.getElementById("tdlevelsegment").style.display = "inline";
  }
  else
  
  {
   document.getElementById('tdcustomer').style.display="inline";
   document.getElementById('tdtxtcustomer').style.display="inline";
   document.getElementById('tdtxtgroup').style.display="none";
   document.getElementById('tdgroup').style.display="none";
   document.getElementById('txtGroup_hidden').style.display="none";
   document.getElementById('txtCustomer_hidden').style.display="none";
  document.getElementById("tdlevelsegment").style.display = "inline";
  }
   
 }
    function ShowGroup(obj)
    {
        document.getElementById('txtGroup_hidden').value=''
        document.getElementById('txtGroup').value=''
        document.getElementById('txtCustomer_hidden').value=''
        document.getElementById('txtCustomer').value=''
        document.getElementById('txtBroker_hidden').value=''
        document.getElementById('txtBroker').value=''
        if(obj=='C')
        {
          document.getElementById('tdcustomer').style.display="inline";
          document.getElementById('tdtxtcustomer').style.display="inline";
          document.getElementById('tdtxtgroup').style.display="none";
          document.getElementById('tdgroup').style.display="none";
          document.getElementById('txtGroup_hidden').style.display="none";
          document.getElementById('txtCustomer_hidden').style.display="none";
          document.getElementById('tdtxtbroker').style.display="none";
          document.getElementById('tdbroker').style.display="none";
          document.getElementById('txtBroker_hidden').style.display="none";
//          cmbCompany.SetText('');
//           ddlsegment.SetText('');
        }
        if(obj=='G')
        {
          document.getElementById('tdcustomer').style.display="none";
          document.getElementById('tdtxtcustomer').style.display="none";
          document.getElementById('tdtxtgroup').style.display="inline";
          document.getElementById('tdgroup').style.display="inline";
          document.getElementById('txtGroup_hidden').style.display="none";
          document.getElementById('txtCustomer_hidden').style.display="none";
          document.getElementById('tdtxtbroker').style.display="none";
          document.getElementById('tdbroker').style.display="none";
          document.getElementById('txtBroker_hidden').style.display="none";
//          cmbCompany.SetText('');
//          ddlsegment.SetText('');
        }
        if(obj=='B')
        {
          document.getElementById('tdcustomer').style.display="none";
          document.getElementById('tdtxtcustomer').style.display="none";
          document.getElementById('tdtxtgroup').style.display="none";
          document.getElementById('tdgroup').style.display="none";
          document.getElementById('txtGroup_hidden').style.display="none";
          document.getElementById('txtCustomer_hidden').style.display="none";
          document.getElementById('tdtxtbroker').style.display="inline";
          document.getElementById('tdbroker').style.display="inline";
          document.getElementById('txtBroker_hidden').style.display="none";
//          cmbCompany.SetText('');
//          ddlsegment.SetText('');
        }
    } 
    
    function ReceiveServerData(rValue)
    {   
   
        var DATA=rValue.split('~');  
                  
          if(DATA[0]=="Segment")
        {
      
         if(DATA[1]!="N")
            { 
            
             document.getElementById("tdlevelsegment").style.display = "inline";
           
            }
            
            else
            {
          
            document.getElementById("tdlevelsegment").style.display = "none";
       
            }
            
        }
    }
    
    function CallAjax(obj1,obj2,obj3)
    {
       // FieldName='ctl00_ContentPlaceHolder1_Headermain1_cmbCompany';
       ajax_showOptions(obj1,obj2,obj3);
    }
    FieldName='btnShow';  
   
   function CallBrokerageMain(keyValue)
   {
     var c1=document.getElementById('ddlsegment_VI').value;
 
     var url='BrkMain_dgcx.aspx?id='+keyValue;
     parent.OnMoreInfoClick(url,"Edit BrokerageMain Details",'980px','470px',"N");

    }
    
     function OnAddButtonClick() 
    {

       if(document.getElementById('txtCustomer_hidden').value!='')
         {
         var ch=document.getElementById('txtCustomer_hidden').value;
          och=document.getElementById('txtCustomer').value;
         var type='C';
         }
         if(document.getElementById('txtBroker_hidden').value!='')
         {
         var ch=document.getElementById('txtBroker_hidden').value;
          och=document.getElementById('txtBroker').value;
         var type='C';
         }
      if(document.getElementById('txtGroup_hidden').value!='')
         {
           ch=document.getElementById('txtGroup_hidden').value;
           och=document.getElementById('txtGroup').value;
           type='G';
         }
           
       var cmbc=document.getElementById('cmbCompany_VI').value;
       var cmbs=document.getElementById('ddlsegment_VI').value;
       var cc= cmbCompany.GetText(); 
       var ss= ddlsegment.GetText().toString(); 
        
       if(ch=='')
       {
        alert('Please Insert Above Field To Add Brkg Main Infromation');
       }
   
       else
       {
          var url='';
          var objVal=grid.GetVisibleRowsOnPage();
          
          if(objVal=='0')
          {
//             AddUrl='ADD'+'|'+ch +'|'+cmbc+'|'+cmbs+'|'+och +'|'+cc+'|'+ss+'|'+type;
//             url='BrkBridge_dgcx.aspx?id='+ch+' &Cid='+cmbc+' &Sid='+cmbs+' &Addurl='+AddUrl;
AddUrl='AADD'+'|'+ch +'|'+cmbc+'|'+cmbs+'|'+och +'|'+cc+'|'+ss+'|'+type;
             url='BrkBridge_dgcx.aspx?id='+ch+' &Cid='+cmbc+' &Sid='+cmbs+' &Addurl='+AddUrl; 
           parent.OnMoreInfoClick(url,"Add BrokerageMain Details-General",'470px','250px',"Y");            
         }
         else
         {
         AddUrl='ADD'+'|'+ch +'|'+cmbc+'|'+cmbs+'|'+och +'|'+cc+'|'+ss+'|'+type;
             url='BrkBridge_dgcx.aspx?id='+ch+' &Cid='+cmbc+' &Sid='+cmbs+' &Addurl='+AddUrl; 
           parent.OnMoreInfoClick(url,"Add BrokerageMain Details-General",'470px','250px',"Y");    
             //url='BrkBridge_dgcx.aspx?id='+ch+' &Cid='+cmbc+' &Sid='+cmbs;  
                     
         } 
//AddUrl='ADD'+'|'+ch +'|'+cmbc+'|'+cmbs+'|'+och +'|'+cc+'|'+ss+'|'+type;
//             url='BrkBridge_dgcx.aspx?id='+ch+' &Cid='+cmbc+' &Sid='+cmbs+' &Addurl='+AddUrl; 
//           parent.OnMoreInfoClick(url,"Add BrokerageMain Details-General",'370px','200px',"Y");      

       }

    }
    function FillValues(objVal,objCusID,objCompID,objSegID)
    {
        parent.editwin.close();
        var cmbs=document.getElementById('ddlsegment_VI').value;
        var Grp=document.getElementById('txtGroup_hidden').value;
        if(Grp=='')
            Grp='C'
        else
            Grp='G'
        var objCharge='T'
        var url='BrkMain_dgcx.aspx?id='+objVal+' &charge='+objCharge+' &CusID='+objCusID+' &CompID='+objCompID+' &SegID='+objSegID+' &Grp='+Grp+' &clName='+och;
        parent.OnMoreInfoClick(url,"Edit BrokerageMain Details",'980px','470px',"Y");      

    }
    function FillValuesWithAdd(objVal)
    {
        parent.editwin.close();
        var cmbs=document.getElementById('ddlsegment_VI').value;
        var url='BrkMain_dgcx.aspx?id='+AddUrl;
        parent.OnMoreInfoClick(url,"Edit BrokerageMain Details",'980px','470px',"Y");      

    }
    </script>

    <table class="TableMain100">
        <tr>
            <td class="EHEADER" style="text-align:center;">
                <span style="color: Blue"><strong>Brokerage Setup</strong></span>
            </td>
        </tr>
        <tr>
            <td>
                <table class="TableMain100">
                    <tr>
                        <asp:HiddenField ID="hd1" runat="server" />
                        <td>
                            <dxe:ASPxComboBox ID="cmbCompany" runat="server" Width="230px" DataSourceID="AccessDataSourceCompany"
                                TextField="cmp_Name" ValueField="cmp_internalid" 
                                 Font-Size="10px" 
                                ValueType="System.String" Font-Bold="False" ClientEnabled="false">
                                <ButtonStyle Width="13px">
                                </ButtonStyle>
                                <DropDownButton Text="Company">
                                </DropDownButton>
                            </dxe:ASPxComboBox>
                        </td>
                        <td id="tdlevelsegment" runat="server">
                            <dxe:ASPxComboBox DataSourceID="AccessDataSourceSegment" TextField="segment_name"
                                ValueField="exch_internalId" ClientInstanceName="ddlsegment" ID="ddlsegment"
                                runat="server"  
                                Font-Size="10px"  
                                Font-Bold="False" ClientEnabled="false">
                                <ButtonStyle Width="13px">
                                </ButtonStyle>
                                <DropDownButton Text="Segment">
                                </DropDownButton>
                            </dxe:ASPxComboBox>
                        </td>
                        <td style="width: 100px; text-align:left;">
                            <dxe:ASPxRadioButtonList ID="rbbrk" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px">
                                <Items>
                                    <dxe:ListEditItem Text="Customer" Value="C" />
                                    <dxe:ListEditItem Text="Group" Value="G" />
                                    <dxe:ListEditItem Text="Broker" Value="B" />
                                </Items>
                                <ClientSideEvents ValueChanged="function(s, e) {ShowGroup(s.GetValue());}" />
                                <Border BorderWidth="0px" />
                            </dxe:ASPxRadioButtonList>
                        </td>
                        <td class="gridcellright" style="width: 17px" id="tdcustomer">
                            <span class="Ecoheadtxt" style="color: Blue"><strong>Customer:</strong></span>
                        </td>
                        <td class="gridcellleft" style="width: 80px" id="tdtxtcustomer">
                            <asp:TextBox ID="txtCustomer" runat="server" Width="200px" Font-Size="11px"></asp:TextBox><asp:TextBox
                                ID="txtCustomer_hidden" runat="server" Width="14px" Style="display: none;"></asp:TextBox>
                        </td>
                        <td class="gridcellright" style="width: 17px; display: none;" id="tdgroup">
                            <span class="Ecoheadtxt" style="color: Blue"><strong>Group:</strong></span>
                        </td>
                        <td class="gridcellleft" style="width: 60px; display: none;" id="tdtxtgroup">
                            <asp:TextBox ID="txtGroup" runat="server" Width="200px" Font-Size="11px"></asp:TextBox><asp:TextBox
                                ID="txtGroup_hidden" runat="server" Width="14px"></asp:TextBox>
                        </td>
                        <td class="gridcellright" style="width: 17px; display: none;" id="tdbroker">
                            <span class="Ecoheadtxt" style="color: Blue"><strong>Broker:</strong></span>
                        </td>
                        <td class="gridcellleft" style="width: 60px; display: none;" id="tdtxtbroker">
                            <asp:TextBox ID="txtBroker" runat="server" Width="200px" Font-Size="11px"></asp:TextBox><asp:TextBox
                                ID="txtBroker_hidden" runat="server" Width="14px"></asp:TextBox>
                        </td>
                        <td class="gridcellright" style="width: 94px" id="tdshow" runat="server">
                            <dxe:ASPxButton ID="btnShow" runat="server" Text="Show" 
                                 AutoPostBack="False">
                                <ClientSideEvents Click="function(s, e) {
	grid.PerformCallback();
}"></ClientSideEvents>
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <dxwgv:ASPxGridView ID="BrokerageMainGrid" runat="server" 
                                 KeyFieldName="BrokerageMain_ID" AutoGenerateColumns="False"
                                DataSourceID="BrokerageDataSource" Width="100%" ClientInstanceName="grid" OnCustomCallback="BrokerageMainGrid_CustomCallback" OnRowDeleting="BrokerageMainGrid_RowDeleting" OnCommandButtonInitialize="BrokerageMainGrid_CommandButtonInitialize">
                                  <Templates><TitlePanel>
                                        <table style="width: 100%">
                                            <tr>
                                                <td align="right">
                                                    <table width="200px">
                                                        <tr>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    
</TitlePanel>
<EditForm>
                                    
</EditForm>
</Templates>
                                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" columnresizemode="NextColumn" />
                                <Styles  >
<Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="gridheader"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
                                <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                                    PageSize="20">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
                                <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                    PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
                                <SettingsText PopupEditFormCaption="Add/ Modify Employee" />
                                <Columns>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageMain_ID" Caption="ID" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Segment" Width="20%" Caption="Segment" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageMain_FromDate" Width="20%" Caption="From Date" VisibleIndex="1">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageMain_UntilDate" Width="20%" Caption="To Date" VisibleIndex="2">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Width="15%" Caption="Details" VisibleIndex="3">
<EditFormSettings Visible="False"></EditFormSettings>
<DataItemTemplate>
                                            <a href="javascript:void(0);" onclick="CallBrokerageMain('<%# Container.KeyValue %>')">
                                                More Info...</a>
                                        
</DataItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
                                     
                                            <a href="javascript:void(0);" onclick="OnAddButtonClick( )"><span style="color: #000099;
                                                text-decoration: underline">Add New</span> </a>
                                           
                                        
</HeaderTemplate>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn Caption="Delete" VisibleIndex="4">
<DeleteButton Visible="True"></DeleteButton>
</dxwgv:GridViewCommandColumn>
</Columns>
                                <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                            </dxwgv:ASPxGridView>
                            <asp:SqlDataSource ID="BrokerageDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                                
                            </asp:SqlDataSource>
                            <br />
                            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                            </dxwgv:ASPxGridViewExporter>
                            &nbsp;&nbsp;
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        </tr>
    </table>
    <br />
    <asp:SqlDataSource ID="AccessDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
        SelectCommand="select cmp_internalID,cmp_name from tbl_master_company where cmp_internalid in(select distinct exch_compid from tbl_master_companyExchange)">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="AccessDataSourceSegment" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
        SelectCommand="SELECT MCE.exch_internalId, (ME.exh_shortName+'-'+ MCE.exch_segmentId)as segment_name FROM [tbl_master_exchange]ME
         left outer join [tbl_master_companyExchange]as MCE on MCE.exch_exchId=ME.exh_cntId WHERE ( MCE.exch_compId=@CompId) ">
        <SelectParameters>
            <asp:SessionParameter Name="CompId" SessionField="LastCompany" Type="string" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
