<%@ page language="C#" autoeventwireup="true" inherits="management_subbrkgsetup1, App_Web_6_wayyot" %>


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
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
               document.getElementById('tdtxtsubbroker').style.display="none";
               document.getElementById('tdtxtpartnerdealer').style.display="inline";
               document.getElementById('txtpartnerdealer_hidden').style.display="none";
               document.getElementById('txtsubbroker_hidden').style.display="none";
               document.getElementById("tdlevelsegment").style.display = "inline";
          }
          else
          
          {
               document.getElementById('tdtxtsubbroker').style.display="inline";
               document.getElementById('tdtxtpartnerdealer').style.display="none";
               document.getElementById('txtpartnerdealer_hidden').style.display="none";
               document.getElementById('txtsubbroker_hidden').style.display="none";
               document.getElementById("tdlevelsegment").style.display = "inline";
      }
   
     }
    function ShowGroup(obj)
    {
        document.getElementById('txtpartnerdealer_hidden').value='';
        document.getElementById('txtpartnerdealer').value='';
        document.getElementById('txtsubbroker_hidden').value='';
        document.getElementById('txtsubbroker').value='';
        if(obj=='S')
        {
          document.getElementById('tdtxtsubbroker').style.display="inline";
          document.getElementById('tdtxtpartnerdealer').style.display="none";
          document.getElementById('txtpartnerdealer_hidden').style.display="none";
          document.getElementById('txtsubbroker_hidden').style.display="none";
        }
        if(obj=='R')
        {
          document.getElementById('tdtxtsubbroker').style.display="none";
          document.getElementById('tdtxtpartnerdealer').style.display="inline";
          document.getElementById('txtpartnerdealer_hidden').style.display="none";
          document.getElementById('txtsubbroker_hidden').style.display="none";

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
    
    function CallAjax(obj1,obj2,obj3,obj4)
    {
       ajax_showOptions(obj1,obj2,obj3,obj4);
    }
    FieldName='btnShow';  
   
   function OnMoreInfoClick(keyValue)
   {
        var clientid;
        var clientname;
       if(document.getElementById('txtsubbroker_hidden').value!='')
         {
            clientid=document.getElementById('txtsubbroker_hidden').value;
            clientname=document.getElementById('txtsubbroker').value;
         }
      else
         {
           clientid=document.getElementById('txtpartnerdealer_hidden').value;
           clientname=document.getElementById('txtpartnerdealer').value;
         }
        
     var url='subbrkgsetup3.aspx?clientid='+clientid+' &clientname='+clientname+' &subbrkgid='+keyValue+' &Addurl='+'Edit';     
     parent.OnMoreInfoClick(url,"Edit Sub-BrokerageMain Details",'980px','470px',"Y");

    }
    
     function OnAddButtonClick() 
    {
        var clientid;
        var clientname;
        var rowcount;
       if(document.getElementById('txtsubbroker_hidden').value!='')
         {
            clientid=document.getElementById('txtsubbroker_hidden').value;
            clientname=document.getElementById('txtsubbroker').value;
         }
      else
         {
           clientid=document.getElementById('txtpartnerdealer_hidden').value;
           clientname=document.getElementById('txtpartnerdealer').value;
         }
        
       if(clientid=='')
       {
        alert('Please Insert Above Field To Add Sub-Brokerage Main  Infromation');
       }
   
       else
       {
          var url='';
          var objVal=grid.GetVisibleRowsOnPage();
          if(objVal=='0')
          {
            rowcount="no";
          }
          else
          {
            rowcount="yes";
          }

          url='subbrkgsetup2.aspx?clientid='+clientid+' &clientname='+clientname+' &Addurl='+'ADD'+' &rowcount='+rowcount ;            
          parent.OnMoreInfoClick(url,"Add Sub-BrokerageMain Details-General",'370px','200px',"Y");      

       }

    }
    function FillValues(objsubbrkgid,objclientid,objclientname,objaddurl,objtype)
    {
        parent.editwin.close();
        var url='subbrkgsetup3.aspx?subbrkgid='+objsubbrkgid+' &clientid='+objclientid+' &clientname='+objclientname+' &clienttype='+objtype+' &Addurl='+objaddurl;
        parent.OnMoreInfoClick(url,"Edit Sub-BrokerageMain Details",'980px','470px',"Y");      

    }
    
  
        </script>

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <span style="color: Blue"><strong>Sub-Brokerage Setup</strong></span>
                </td>
            </tr>

            <tr valign="top">
                <td style="height: 428px">
                    <table class="TableMain100">
                        <tr >
                        
                            <asp:HiddenField ID="hd1" runat="server" />
                            <td>
                                <dxe:ASPxComboBox ID="cmbCompany" runat="server" Width="230px" DataSourceID="AccessDataSourceCompany"
                                    TextField="cmp_Name" ValueField="cmp_internalid" Font-Size="10px" ValueType="System.String"
                                    Font-Bold="False" ClientEnabled="false">
                                    <ButtonStyle Width="13px">
                                    </ButtonStyle>
                                    <DropDownButton Text="Company">
                                    </DropDownButton>
                                </dxe:ASPxComboBox>
                            </td>
                            <td id="tdlevelsegment" runat="server">
                                <dxe:ASPxComboBox DataSourceID="AccessDataSourceSegment" TextField="segment_name"
                                    ValueField="exch_internalId" ClientInstanceName="ddlsegment" ID="ddlsegment"
                                    runat="server" Font-Size="10px" Font-Bold="False" ClientEnabled="false">
                                    <ButtonStyle Width="13px">
                                    </ButtonStyle>
                                    <DropDownButton Text="Segment">
                                    </DropDownButton>
                                </dxe:ASPxComboBox>
                            </td>
                            <td >
                                <dxe:ASPxRadioButtonList ID="rbbrk" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                    RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px">
                                    <Items>
                                        <dxe:ListEditItem Text="Sub Broker" Value="S" />
                                        <dxe:ListEditItem Text="Relationship Partner/Dealer" Value="R" />
                                    </Items>
                                    <ClientSideEvents ValueChanged="function(s, e) {ShowGroup(s.GetValue());}" />
                                    <Border BorderWidth="0px" />
                                </dxe:ASPxRadioButtonList>
                            </td>
                            <td class="gridcellleft" id="tdtxtsubbroker">
                                <asp:TextBox ID="txtsubbroker" runat="server" Width="250px" Font-Size="11px"></asp:TextBox><asp:TextBox
                                    ID="txtsubbroker_hidden" runat="server" Width="14px" Style="display: none;"></asp:TextBox>
                            </td>
                            <td class="gridcellleft" style="display: none;" id="tdtxtpartnerdealer">
                                <asp:TextBox ID="txtpartnerdealer" runat="server" Width="250px" Font-Size="11px"></asp:TextBox><asp:TextBox
                                    ID="txtpartnerdealer_hidden" runat="server" Width="14px"></asp:TextBox>
                            </td>
                            <td class="gridcellright" id="tdshow" runat="server" align="left">
                                <dxe:ASPxButton ID="btnShow" runat="server" Text="Show" AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
	grid.PerformCallback();
}"></ClientSideEvents>
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                            <br />
                                <dxwgv:ASPxGridView ID="BrokerageMainGrid" runat="server" KeyFieldName="subbrokeragemain_ID"
                                    AutoGenerateColumns="False" DataSourceID="BrokerageDataSource" Width="100%" ClientInstanceName="grid"
                                    OnCustomCallback="BrokerageMainGrid_CustomCallback" OnRowDeleting="BrokerageMainGrid_RowDeleting">
                                    <templates><TitlePanel>
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
</templates>
                                    <settingsbehavior allowfocusedrow="True" confirmdelete="True" columnresizemode="NextColumn" />
                                    <styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="gridheader"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</styles>
                                    <settingspager showseparators="True" alwaysshowpager="True" numericbuttoncount="20"
                                        pagesize="20">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</settingspager>
                                    <settingsediting mode="PopupEditForm" popupeditformhorizontalalign="Center" popupeditformmodal="True"
                                        popupeditformverticalalign="WindowCenter" popupeditformwidth="900px" editformcolumncount="3" />
                                    <settingstext popupeditformcaption="Add/ Modify Employee" />
                                    <columns>
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
<dxwgv:GridViewDataTextColumn FieldName="subbrokeragemain_DateFrom" Width="20%" Caption="From Date" VisibleIndex="1">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="subbrokeragemain_DateTo" Width="20%" Caption="To Date" VisibleIndex="2">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Width="15%" Caption="Details" VisibleIndex="3">
<EditFormSettings Visible="False"></EditFormSettings>
<DataItemTemplate>
                                            <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
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
<HeaderStyle HorizontalAlign="Center" />
<DeleteButton Visible="True" ></DeleteButton>
</dxwgv:GridViewCommandColumn>
</columns>
                                    <settings showgrouppanel="True" showstatusbar="Visible" />
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
