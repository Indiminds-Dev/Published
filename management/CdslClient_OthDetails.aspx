<%@ page language="C#" autoeventwireup="true" inherits="management_CdslClient_OthDetails, App_Web_n2fxndvz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Other Details</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:5;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script language="javascript" type="text/javascript">
    
     function PageLoad()
    {
       FieldName='none';
//        document.getElementById('ASPxPageControl1_txtName').readOnly = true;
//        document.getElementById('ASPxPageControl1_txtName_hidden').style.display="none";
        document.getElementById('ASPxPageControl1_txtBranch_hidden').style.display="none"
//        
          var ID=document.getElementById("ASPxPageControl1_cmbSource");
            if(ID.value=='21' || ID.value=='3' || ID.value=='4' || ID.value=='8' || ID.value=='10' || ID.value=='19' || ID.value=='20' ||ID.value=='14')
            {
                document.getElementById("TdRfferedBy").style.display = 'inline';
                document.getElementById("TdRfferedBy1").style.display = 'inline';
            }
            else
            {
                document.getElementById("TdRfferedBy").style.display = 'none';
                document.getElementById("TdRfferedBy1").style.display = 'none';
            }
            //hide('tdup');

            GetDetails('N');
        
    }
    
    function SourceStatus()
        {
            var sourceID=document.getElementById("ASPxPageControl1_cmbSource");
            if(sourceID.value=='21' || sourceID.value=='3' || sourceID.value=='4' || sourceID.value=='8' || sourceID.value=='10' || sourceID.value=='19' || sourceID.value=='20' || sourceID.value=='14')
            {
                document.getElementById("TdRfferedBy").style.display = 'inline';
                document.getElementById("TdRfferedBy1").style.display = 'inline';
            }
            else
            {
                document.getElementById("TdRfferedBy").style.display = 'none';
                document.getElementById("TdRfferedBy1").style.display = 'none';
            }
        }
        
         function CallList(obj1,obj2,obj3)
        {
            //alert('rrr');
            
            var obj4=document.getElementById("ASPxPageControl1_cmbSource");
            var obj5=obj4.value;
            //alert(obj5);
            ajax_showOptions(obj1,obj2,obj3,obj5);
        }
    
    
        function disp_prompt(name)
    {
        //var ID = document.getElementById(txtID);
        if ( name == "tab0")
        {
            document.location.href="CdslClient_general.aspx"; 
        }
        if ( name == "tab1")
        {
            document.location.href="CdslClient_jointHolders.aspx"; 
        }
        else if ( name == "tab2")
        {
            document.location.href="CdslClient_aditionalHolder.aspx"; 
        }
        else if ( name == "tab3")
        {
            document.location.href="CdslClient_bankDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
            document.location.href="CdslClient_nominee.aspx"; 
        }
        else if ( name == "tab5")
        {
            document.location.href="cdslClientDocuments.aspx"; 
        }
        else if ( name == "tab6")
        {
            document.location.href="cdslClientGroup.aspx"; 
        }
        else if ( name == "tab7")
        {
            document.location.href="cdslClientRemarks.aspx"; 
        }
        else if ( name == "tab8")
        {
             document.location.href="CdslClient_otherDetails.aspx"; 
        }
         else if ( name == "tab9")
        {
   
        }
        else if ( name == "tab10")
        {
         document.location.href="cdslClient_Correspondance.aspx"; 
        }
        else if ( name == "tab11")
        {
            document.location.href="cdslClient_Subcriptions.aspx"; 
        }
    }
    function BrokerageMode(obj)
    {
        if(obj=='0')
        {
            document.getElementById("trScheme").style.display="none";
            document.getElementById("trDate").style.display="inline";
        }
        else    
        {   
            if(obj=='1')
            {
                document.getElementById("div1").style.display="inline";
                document.getElementById("div2").style.display="none";
            }
            else
            {
                document.getElementById("div1").style.display="none";
                document.getElementById("div2").style.display="inline";
            }         
            document.getElementById("trScheme").style.display="inline";
            document.getElementById("trDate").style.display="inline";
        }
    }
    function ShowError(obj)
    {
       if(obj!="")
       {
           ClidtDate.SetEnabled(false);
           BrokerageMode(obj)
       }
       else
       {
          if(ClidtDate.GetDate()==null)
          {
              var currentDate=ChangeDateFormat_SetCalenderValue(new Date());
              ClidtDate.SetDate(currentDate); 
          }
       }               
    }
    function ChangeDateFormat_SetCalenderValue(obj)
    {       
        var SelectedDate = new Date(obj);
        var monthnumber = SelectedDate.getMonth();
        var monthday    = '1';
        var year        = SelectedDate.getYear();            
        var changeDateValue=new Date(year, monthnumber, monthday);
        return changeDateValue;            
    }
    function insert()
    {
 
//    if( document.getElementById('ASPxPageControl1_txtName_hidden').value=='No Record Found')
//      {
//         document.getElementById('ASPxPageControl1_txtName_hidden').value='NA';
//      }
//    if(document.getElementById('ASPxPageControl1_txtName_hidden').value!='NA' )
//    {
//        //xxx.PerformCallback("insert");
//        //alert('Branch Successfully Updated');
//        document.getElementById('ASPxPageControl1_txtName_hidden').value='NA';
//    }
//    else
//    {
//        alert('Please Enter Valid Name or Trade UCC');
//    }
    }

    function ShowTextBox()
    {
        var name=document.getElementById('ASPxPageControl1_txtName');
        name.readOnly = false;
        name.focus(); 
    }
      function ShowTextBox1()
    {
        var name=document.getElementById('ASPxPageControl1_txtBranch');
        name.readOnly = false;
        name.focus(); 
    }

   function CallAjax(obj1,obj2,obj3,obj4)
    {
        
        ajax_showOptions(obj1,obj2,obj3,obj4);
         
    }
    
    function checkValue()
    {
        var cnt= document.getElementById('ASPxPageControl1_txtBranch'); 
        if(cnt.value=="")
        {
           alert('Please Enter Valid Name');
           document.getElementById('ASPxPageControl1_txtBranch').value="";
           xxx.PerformCallback("update");
        }
    }
    
//    function checkValue1()
//    {
//        var cnt= document.getElementById('ASPxPageControl1_txtName'); 
//        if(cnt.value=="")
//    {
//       alert('Please Enter Valid Name');
//       document.getElementById('ASPxPageControl1_txtName').value="";
//       xxx.PerformCallback("update");
//    }
//   
//   
//    }
    
    function insertCheck(s)
    {    
        var a= s.split(',');
        if(a[0].length>0)
        {
           document.getElementById('ASPxPageControl1_txtucc').value=a[1];
           document.getElementById('ASPxPageControl1_txtBranch').value=a[2];
           document.getElementById('ASPxPageControl1_txtReferedBy').value=a[3];
           document.getElementById('ASPxPageControl1_txtReferedBy_hidden').value=a[4];
        }   
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
   function SignOff()
    {
     window.parent.SignOff();
 }




 //-----------------------------------


 function VarificationOn() {
     document.getElementById("ASPxPageControl1_trVarDt").style.display = "inline";
     //document.getElementById("ASPxPageControl1_trRemark").style.display="inline";
 }
 function VarificationOff() {
     document.getElementById("ASPxPageControl1_trVarDt").style.display = "none";
     //  document.getElementById("ASPxPageControl1_trRemark").style.display="none";
 }
 function GetDetails(obj) {

     // alert(obj);
     //var cmb=document.getElementById('cmbVerify');
     if (obj == 'Y') {
         VarificationOn();
     }
     else {
         VarificationOff();
     }
 }


 //------------------------------------
    
    
    
    
    </script>

    <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
                var j=rValue.split('~');
                
                if(j[0]=='Branch')
                    document.getElementById('HiddenField_Branch').value = j[1];
                if(j[0]=='Group')
                    document.getElementById('HiddenField_Group').value = j[1];
                if(j[0]=='Clients')
                    document.getElementById('HiddenField_Client').value = j[1];
                
                
        }
        
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    
     <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>
    
    
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="9" ClientInstanceName="page"
                            Width="100%" Font-Size="10px">
                            <tabpages>
                                <dxtc:TabPage Name="General" Text="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="JointHolders" Text="Joint Holders">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="AdditionalHolders" Text="Additional Holders">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="BankDetail" Text="Bank Detail">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Nominee_POA" Text="Nominee &amp; POA">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Documents" Text="Documents">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Groups" Text="Groups">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Remarks" Text="Remarks">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="AdditionalDetail" Text="Additional Detail">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="OtherDetail" Text="Other Detail">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <table class="TableMain100">
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <table>
                                                                        <tr>
                                                                            <td bgcolor="#b7ceec" class="gridcellleft" style="text-align: left; width: 15%">
                                                                                Name
                                                                            </td>
                                                                            <td>
                                                                                <table>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <strong><span id="txtName" runat="server" style="color: Maroon"></span></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table>
                                                                        <%-- <td id="td1">
                                                                                <dxe:ASPxButton ID="btnChnage1" runat="server" AutoPostBack="False" ClientInstanceName="change"
                                                                                    Text="Change">
                                                                                    <ClientSideEvents Click="function(s, e) {
                                                                                             show('tdup');
                                                                                            ShowTextBox1();
                                                                                            hide('td1');
                                                                                            }" CheckedChanged="function(s, e) {
                                                                                             
                                                                                            }" />
                                                                                </dxe:ASPxButton>
                                                                            </td>--%>
                                                                        <tr>
                                                                            <td bgcolor="#b7ceec" class="gridcellleft" 
                                                                                style="text-align: right; width: 10%; padding-right: 5px">
                                                                                Branch</td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtBranch_hidden" runat="server" Width="14px"></asp:TextBox>
                                                                                <asp:TextBox ID="txtBranch" runat="server" CssClass="gridcellleft" 
                                                                                    Width="280px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table>
                                                                        <tr>
                                                                            <td bgcolor="#b7ceec" class="gridcellleft" style="width: 15%; text-align: left">
                                                                                Source</td>
                                                                            <td>
                                                                                <asp:DropDownList ID="cmbSource" runat="server" TabIndex="7" Width="160px">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td id="TdRfferedBy" bgcolor="#b7ceec" class="gridcellleft" 
                                                                                style="padding-right: 5px; width: 15%; text-align: left">
                                                                                Refered By
                                                                            </td>
                                                                            <td id="TdRfferedBy1">
                                                                                <asp:TextBox ID="txtReferedBy" runat="server" TabIndex="8" Width="260px"></asp:TextBox>
                                                                                <asp:TextBox ID="txtReferedBy_hidden" runat="server" BackColor="#DDECFE" 
                                                                                    BorderColor="#DDECFE" BorderStyle="None" ForeColor="#DDECFE"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                            </td>
                                                                            <td id="tdup">
                                                                                <table cellpadding="0" cellspacing="0" style="vertical-align: middle;">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <dxe:ASPxButton ID="btnUpdate2" runat="server" AutoPostBack="False" 
                                                                                                ClientInstanceName="update" OnClick="btnUpdate2_Click" Text="Update" 
                                                                                                ValidationGroup="a">
                                                                                                <clientsideevents click="function(s, e) {insert();}" />
                                                                                            </dxe:ASPxButton>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                                                        </td>
                                                                                        <td>
                                                                                            <dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" 
                                                                                                ClientInstanceName="cancel" Text="Cancel" ValidationGroup="a">
                                                                                                <clientsideevents checkedchanged="function(s, e) {
                                                                                        	 
                                                                                        }" click="function(s, e) {
                                                                                         hide('tdup');
                                                                                         show('tdchange');
                                                                                        }" />
                                                                                            </dxe:ASPxButton>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" ClientInstanceName="xxx" Width="300px"
                                                                        ValueType="System.String" EnableIncrementalFiltering="True" EnableSynchronization="False"
                                                                        OnCallback="ASPxComboBox1_Callback">
                                                                        <ClientSideEvents EndCallback="function(s, e) {insertCheck(xxx.cpDataExists);}" />
                                                                    </dxe:ASPxComboBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dxwgv:ASPxGridView ID="gridBrokerage" ClientInstanceName="gridBrokerage" KeyFieldName="DPChargeMembers_ID"
                                                            DataSourceID="sqlBrokerage" runat="server" Width="100%" AutoGenerateColumns="False"
                                                            OnRowInserting="gridBrokerage_RowInserting" OnStartRowEditing="gridBrokerage_StartRowEditing"
                                                            OnRowUpdating="gridBrokerage_RowUpdating" OnCustomJSProperties="gridBrokerage_CustomJSProperties"
                                                            OnRowValidating="gridBrokerage_RowValidating">
                                                            <ClientSideEvents EndCallback="function(s,e) { ShowError(s.cpInsertError);
                                                                                                 }" />
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn FieldName="DPChargeMembers_ID" Caption="ID" Visible="False">
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn FieldName="SegmentID" Caption="CompanyName" Visible="False"
                                                                    VisibleIndex="0">
                                                                    <PropertiesComboBox DataSourceID="SqlComp" TextField="cmp_name" ValueField="cmp_internalid"
                                                                        ValueType="System.String">
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn FieldName="GroupCode" Caption="GroupCode" VisibleIndex="0">
                                                                    <PropertiesComboBox DataSourceID="SqlCode" TextField="ChargeGroup_Name" ValueField="ChargeGroup_Code"
                                                                        ValueType="System.String">
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn FieldName="DPChargeMembers_SegmentID" Caption="Segment"
                                                                    Visible="False" VisibleIndex="1">
                                                                    <PropertiesComboBox ValueType="System.String">
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn FieldName="DPChargeMembers_GroupType" Caption="Type"
                                                                    VisibleIndex="1">
                                                                    <PropertiesComboBox ValueType="System.String">
                                                                        <Items>
                                                                            



<dxe:ListEditItem Text="Specific" Value="1">
                                                                            </dxe:ListEditItem>
                                                                            



<dxe:ListEditItem Text="Scheme" Value="2">
                                                                            </dxe:ListEditItem>
                                                                            



<dxe:ListEditItem Text="Prepaid Card" Value="3">
                                                                            </dxe:ListEditItem>
                                                                        



</Items>
                                                                    



</PropertiesComboBox>
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn FieldName="DPChargeMembers_GroupCode" Caption="Code"
                                                                    Visible="False" VisibleIndex="1">
                                                                    <PropertiesComboBox DataSourceID="SqlCode" TextField="ChargeGroup_Name" ValueField="ChargeGroup_Code"
                                                                        ValueType="System.String">
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="DPChargeMembers_FromDate" Caption="From Date"
                                                                    Visible="False" VisibleIndex="4">
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="DPChargeMembers_UntilDate" Caption="Untill Date"
                                                                    Visible="False" VisibleIndex="5">
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="DPChargeMembers_FromDate1" Caption="From Date"
                                                                    VisibleIndex="2">
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="DPChargeMembers_UntilDate1" Caption="Untill Date"
                                                                    VisibleIndex="3">
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="4">
                                                                    <EditButton Visible="True">
                                                                    </EditButton>
                                                                    <DeleteButton Visible="True">
                                                                    </DeleteButton>
                                                                    <HeaderTemplate>
                                                                        <a href="javascript:void(0);" onclick="gridBrokerage.AddNewRow()"><span style="color: #000099;
                                                                            text-decoration: underline">Add New</span></a>
                                                                    </HeaderTemplate>
                                                                </dxwgv:GridViewCommandColumn>
                                                            </Columns>
                                                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                                                <FirstPageButton Visible="True">
                                                                </FirstPageButton>
                                                                <LastPageButton Visible="True">
                                                                </LastPageButton>
                                                            </SettingsPager>
                                                            <Settings ShowTitlePanel="True" />
                                                            <SettingsText ConfirmDelete="Are You Want To Delete This Record ???" />
                                                            <Styles>
                                                                <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                                                </Header>
                                                                <FocusedGroupRow CssClass="gridselectrow">
                                                                </FocusedGroupRow>
                                                                <FocusedRow CssClass="gridselectrow">
                                                                </FocusedRow>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                            </Styles>
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                            <Templates>
                                                                <TitlePanel>
                                                                    <table style="width: 100%">
                                                                        <tr>
                                                                            <td align="center" style="width: 50%">
                                                                                <span style="font-size: 14px; color: #222;"><b>DP Charges.</b></span>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </TitlePanel>
                                                                <EditForm>
                                                                    <table style="text-align: center">
                                                                        <tr>
                                                                            <td style="width: 30%">
                                                                            </td>
                                                                            <td class="gridcellleft" style="text-align: left; width: 10%">
                                                                                Mode :
                                                                            </td>
                                                                            <td style="text-align: left">
                                                                                <dxe:ASPxComboBox ID="compMode" runat="server" EnableIncrementalFiltering="true"
                                                                                    EnableSynchronization="False" ValueType="System.String" SelectedIndex="1" Enabled="false">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="Specific" Value="1" />
                                                                                        <dxe:ListEditItem Text="Scheme" Value="2" />
                                                                                        <dxe:ListEditItem Text="Prepaid Card" Value="3" />
                                                                                    </Items>
                                                                                    <ClientSideEvents ValueChanged="function(s,e){
                                                                                                       var indexr = s.GetSelectedIndex();
                                                                                                       BrokerageMode(indexr)
                                                                                                       }" />
                                                                                    <ButtonStyle Width="13px">
                                                                                    </ButtonStyle>
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr id="trScheme">
                                                                            <td style="width: 30%">
                                                                            </td>
                                                                            <td class="gridcellleft" style="text-align: left; width: 10%">
                                                                                <div id="div1" class="gridcellleft" style="text-align: left; margin-left:-8px;">
                                                                                    Group Code :</div>
                                                                                <div id="div2" class="gridcellleft" style="display: none">
                                                                                    Code Scheme :</div>
                                                                            </td>
                                                                            <td style="text-align: left">
                                                                                <dxe:ASPxComboBox ID="comboCode" runat="server" DataSourceID="SqlCode" ValueField="ChargeGroup_Code"
                                                                                    TextField="ChargeGroup_Name" EnableIncrementalFiltering="true" EnableSynchronization="False"
                                                                                    ValueType="System.String">
                                                                                    <ButtonStyle Width="13px">
                                                                                    </ButtonStyle>
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr id="trDate">
                                                                            <td style="width: 30%">
                                                                            </td>
                                                                            <td class="gridcellleft" style="text-align: left; width: 10%">
                                                                                Effective From :
                                                                            </td>
                                                                            <td style="text-align: left">
                                                                                <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" ClientInstanceName="ClidtDate"
                                                                                    EditFormatString="dd-MM-yyyy" UseMaskBehavior="True">
                                                                                    <ButtonStyle Width="13px">
                                                                                    </ButtonStyle>
                                                                                </dxe:ASPxDateEdit>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 30%">
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                                <dxe:ASPxButton ID="btnUpdate1" runat="server" Text="Update" ToolTip="Update Data"
                                                                                    Height="18px" Width="88px" AutoPostBack="False">
                                                                                    <ClientSideEvents Click="function(s, e) {gridBrokerage.UpdateEdit();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                            <td style="text-align: left;" colspan="2">
                                                                                <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel Data"
                                                                                    Height="18px" Width="88px" AutoPostBack="False">
                                                                                  <ClientSideEvents Click="function(s, e) {gridBrokerage.CancelEdit();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </EditForm>
                                                            </Templates>
                                                        </dxwgv:ASPxGridView>
                                                    </td>
                                                </tr>
                                            </table>
                                            
                                              <%-- -------------------------- CDSL Investement & Verification  Start---------------------- --%>
                                            <table class="TableMain100">
                                            
                                            <tr>
                                            
                                            <td>
                                            
                                                            <asp:Panel runat="server" Width="100%" ID="Panel1" __designer:wfdid="w1">
                                                                <table width="100%">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>
                                                                                <table width="100%">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table>
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td class="mylabel1">
                                                                                                                <span style="font-size: 8pt">Select Investment: </span>
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpdatePanel2" __designer:wfdid="w2">
                                                                                                                    <ContentTemplate>
                                                                                                                        <asp:DropDownList ID="cmbFinYear" runat="server" Width="200px" __designer:wfdid="w3"
                                                                                                                            AutoPostBack="true" OnSelectedIndexChanged="cmbFinYear_SelectedIndexChanged">
                                                                                                                        </asp:DropDownList>
                                                                                                                    </ContentTemplate>
                                                                                                                    <Triggers>
                                                                                                                        <%--<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>--%>
                                                                                                                    </Triggers>
                                                                                                                </asp:UpdatePanel>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpdatePanel1" __designer:wfdid="w4">
                                                                                    <ContentTemplate>
                                                                                        <table class="TableMain100" width="100%" border="1">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td style="background-color: #a9d4fa; text-align: center" colspan="2">
                                                                                                        <span style="font-size: 8pt"><strong>Investment</strong></span>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td colspan="2">
                                                                                                        <table>
                                                                                                            <tbody>
                                                                                                                <tr>
                                                                                                                    <td class="mylabel1">
                                                                                                                        <span style="font-size: 8pt">Financial Year:</span>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        <asp:DropDownList ID="drpFinyear" runat="server" Width="200px" __designer:wfdid="w5"
                                                                                                                            OnSelectedIndexChanged="drpFinyear_SelectedIndexChanged" AutoPostBack="true">
                                                                                                                        </asp:DropDownList>
                                                                                                                    </td>
                                                                                                                    <td class="mylabel1">
                                                                                                                        <span style="font-size: 8pt">Effective Date:</span>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        <dxe:ASPxDateEdit ID="dtEffect" TabIndex="21" runat="server" ClientInstanceName="dtEffect"
                                                                                                                            Width="99px" __designer:wfdid="w6" Font-Size="10px" EditFormat="Custom" UseMaskBehavior="True">
                                                                                                                            <ButtonStyle Width="13px">
                                                                                                                            </ButtonStyle>
                                                                                                                        </dxe:ASPxDateEdit>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </tbody>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td style="width: 45%" valign="top">
                                                                                                        <table width="100%">
                                                                                                            <tbody>
                                                                                                                <tr>
                                                                                                                    <td class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">Gross Annual Salary Range </span>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        :
                                                                                                                    </td>
                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtgrossannualsalary" runat="server"
                                                                                                                            __designer:wfdid="w7" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">To&nbsp;&nbsp;&nbsp;&nbsp;Rs.</span><asp:TextBox ID="txtgrossannualsalary2"
                                                                                                                            runat="server" __designer:wfdid="w8" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="width: 154px; text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">Annual Trunover Range </span>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        :
                                                                                                                    </td>
                                                                                                                    <td class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtannualTrunover" runat="server"
                                                                                                                            __designer:wfdid="w9" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">To&nbsp;&nbsp;&nbsp;&nbsp;Rs.</span><asp:TextBox ID="txtannualTrunover2"
                                                                                                                            runat="server" __designer:wfdid="w10" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="width: 154px; text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">Gross Profit Range </span>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        :
                                                                                                                    </td>
                                                                                                                    <td class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtGrossProfit" runat="server"
                                                                                                                            __designer:wfdid="w11" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">To&nbsp;&nbsp;&nbsp;&nbsp;Rs.</span><asp:TextBox ID="txtGrossProfit2"
                                                                                                                            runat="server" __designer:wfdid="w12" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="width: 154px; text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">Approx. Expenses (PM) Range</span>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        :
                                                                                                                    </td>
                                                                                                                    <td class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtPMExpenses" runat="server"
                                                                                                                            __designer:wfdid="w13" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">To&nbsp;&nbsp;&nbsp;&nbsp;Rs.</span><asp:TextBox ID="txtPMExpenses2"
                                                                                                                            runat="server" __designer:wfdid="w14" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="width: 154px; text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">Approx. Saving (PM) Range </span>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        :
                                                                                                                    </td>
                                                                                                                    <td class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtPMSaving" runat="server"
                                                                                                                            __designer:wfdid="w15" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">To&nbsp;&nbsp;&nbsp;&nbsp;Rs.</span><asp:TextBox ID="txtPMSaving2"
                                                                                                                            runat="server" __designer:wfdid="w16" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="width: 150px; text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">6 Month Bank Blnc Statement</span>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        :
                                                                                                                    </td>
                                                                                                                    <td class="mylabel1">
                                                                                                                        <span style="font-size: 6pt; text-align: left">High</span><asp:TextBox ID="txtbank1"
                                                                                                                            runat="server" __designer:wfdid="w17" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Low</span><asp:TextBox
                                                                                                                            ID="txtbank2" runat="server" __designer:wfdid="w18" ForeColor="Black" Font-Size="12px"
                                                                                                                            Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </tbody>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td style="width: 60%">
                                                                                                        <table width="100%">
                                                                                                            <tbody>
                                                                                                                <tr>
                                                                                                                    <td style="width: 260px">
                                                                                                                        <table>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td style="width: 128px; text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Annual Income Range</span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <asp:DropDownList Style="font-size: 10px; width: 130px" ID="ddlIncomeRange" runat="server"
                                                                                                                                            __designer:wfdid="w19">
                                                                                                                                        </asp:DropDownList>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td style="width: 118px; text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Equity</span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtequity" runat="server"
                                                                                                                                            __designer:wfdid="w20" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td style="width: 118px; text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Mutual Fund</span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtMutalFund" runat="server"
                                                                                                                                            __designer:wfdid="w21" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td style="width: 118px; text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Bank FD's</span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtBankFD" runat="server"
                                                                                                                                            __designer:wfdid="w22" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td style="width: 118px; text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Debt's Instruments</span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtDebtsInstruments" runat="server"
                                                                                                                                            __designer:wfdid="w23" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td style="width: 118px; text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">NSS's</span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtNSS" runat="server" __designer:wfdid="w24"
                                                                                                                                            ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        <table>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Networth</span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Rs.</span>
                                                                                                                                        <asp:TextBox ID="txtNetworth" onkeypress="return validate(event)" runat="server"
                                                                                                                                            __designer:wfdid="w25" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Life Insurance</span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Rs.</span>
                                                                                                                                        <asp:TextBox ID="txtLifeInsurance" runat="server" __designer:wfdid="w26" ForeColor="Black"
                                                                                                                                            Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Health Insurance</span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtHealthInsurance" runat="server"
                                                                                                                                            __designer:wfdid="w27" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Real Estate</span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtRealEstate" runat="server"
                                                                                                                                            __designer:wfdid="w28" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Precious Metals/Stones</span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtPreciousMetals" runat="server"
                                                                                                                                            __designer:wfdid="w29" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Other's</span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Rs.</span><asp:TextBox ID="txtOthers" runat="server"
                                                                                                                                            __designer:wfdid="w30" ForeColor="Black" Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </tbody>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <table>
                                                                                                            <tbody>
                                                                                                                <tr>
                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">Has Fund For Investment </span>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        :
                                                                                                                    </td>
                                                                                                                    <td style="color: blue">
                                                                                                                        <asp:CheckBox ID="chkHasFundInvestment" runat="server" __designer:wfdid="w31" ForeColor="Blue"
                                                                                                                            Font-Size="10px" OnCheckedChanged="chkHasFundInvestment_CheckedChanged"></asp:CheckBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">If Yes Then Availabe Funds </span>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        :
                                                                                                                    </td>
                                                                                                                    <td class="mylabel1">
                                                                                                                        <asp:TextBox ID="txtAvailableFund" runat="server" __designer:wfdid="w32" ForeColor="Black"
                                                                                                                            Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="text-align: left" class="mylabel1">
                                                                                                                        <span style="font-size: 6pt">If Yes Then Investment Horizon </span>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        :
                                                                                                                    </td>
                                                                                                                    <td class="mylabel1">
                                                                                                                        <asp:TextBox ID="txtInvestmentHorizon" runat="server" __designer:wfdid="w33" ForeColor="Black"
                                                                                                                            Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </tbody>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <table>
                                                                                                            <tbody>
                                                                                                                <tr>
                                                                                                                    <td>
                                                                                                                        <table>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td style="width: 225px; text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">Ready to Transfer Existing Portfoilio </span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <asp:CheckBox ID="chkPortFoilio" runat="server" __designer:wfdid="w34" ForeColor="Blue"
                                                                                                                                            Font-Size="10px" OnCheckedChanged="chkPortFoilio_CheckedChanged"></asp:CheckBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td style="width: 119px; text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">If Yes Then Amount </span>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td style="color: black">
                                                                                                                                        <asp:TextBox ID="TxtPortFoilioAmount" runat="server" __designer:wfdid="w35" ForeColor="Black"
                                                                                                                                            Font-Size="12px" Width="50px"></asp:TextBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        <table>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td style="width: 138px; text-align: left">
                                                                                                                                        <span style="font-size: 6pt" class="mylabel1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                                                                            Own House </span>
                                                                                                                                    </td>
                                                                                                                                    <td style="width: 3px">
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <asp:CheckBox ID="chkhouse" runat="server" __designer:wfdid="w36" ForeColor="Black"
                                                                                                                                            Font-Size="10px"></asp:CheckBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td style="width: 138px; text-align: left" class="mylabel1">
                                                                                                                                        <span style="font-size: 6pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Own Vehicle
                                                                                                                                        </span>
                                                                                                                                    </td>
                                                                                                                                    <td style="width: 3px">
                                                                                                                                        :
                                                                                                                                    </td>
                                                                                                                                    <td class="mylabel1">
                                                                                                                                        <asp:CheckBox ID="chkVehicle" runat="server" __designer:wfdid="w37" ForeColor="Blue"
                                                                                                                                            Font-Size="10px"></asp:CheckBox>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </tbody>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td style="text-align: left" align="center" colspan="2">
                                                                                                        <%--<asp:Button ID="Button1" OnClick="btn_Finance_Save_Click" runat="server" __designer:wfdid="w38"
                                                                                                            Text="Save" CssClass="btnUpdate"></asp:Button>--%>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </ContentTemplate>
                                                                                    <Triggers>
                                                                                        <asp:AsyncPostBackTrigger ControlID="cmbFinYear" EventName="SelectedIndexChanged">
                                                                                        </asp:AsyncPostBackTrigger>
                                                                                        <asp:AsyncPostBackTrigger ControlID="drpFinyear" EventName="SelectedIndexChanged">
                                                                                        </asp:AsyncPostBackTrigger>
                                                                                    </Triggers>
                                                                                </asp:UpdatePanel>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </asp:Panel>
                                                       
                                            
                                            
                                            </td>
                                            
                                            </tr>
                                            
                                           <%-- ----------------Others Start --------------------%>
                                            
                                            <tr>
                                            
                                            <td>
                                            
                                             <asp:UpdatePanel runat="server"  ID="UpdatePanel3" __designer:wfdid="w4">
                                                                                    <ContentTemplate>
                                            
                                            
                                            <table class="TableMain100">
                                                                                       
                                             <tr>
                                             <td>
                                             <table style="text-align: left; background-color: #FFF8C6" width="100%">
                                              <tr>
                                              <td style="text-align: left;">Special Category : </td>
                                              <td style="text-align: left;">
                                              <asp:DropDownList ID="cmbCategory" runat="server" Width="150px">
                                              <asp:ListItem Value="None">None</asp:ListItem>
                                                <asp:ListItem Value="Politician">Politician</asp:ListItem>
                                                <asp:ListItem Value="NRI">NRI</asp:ListItem>
                                                <asp:ListItem Value="Foreign National">Foreign National</asp:ListItem>
                                                <asp:ListItem Value="HNI">HNI</asp:ListItem>
                                                <asp:ListItem Value="TRUST">TRUST</asp:ListItem>
                                                <asp:ListItem Value="CHARITIES">CHARITIES</asp:ListItem>
                                                <asp:ListItem Value="NGO">NGO</asp:ListItem>
                                         </asp:DropDownList>
                                         </td>
                                         <td style="text-align: left;">PEP : </td>
                                         <td style="text-align: left;">
                                         <asp:DropDownList ID="ddlpep" runat="server" Width="150px"></asp:DropDownList></td>
                                         <td style="text-align: left;">Risk Category : </td>
                                         <td style="text-align: left;">
                                         <asp:DropDownList ID="cmbRisk" runat="server" Width="150px">
                                                <asp:ListItem Value="Low">Low</asp:ListItem>
                                                <asp:ListItem Value="Medium">Medium</asp:ListItem>
                                                <asp:ListItem Value="High">High</asp:ListItem>
                                                </asp:DropDownList>
                                        </td>
                                        <td></td>
                                        </tr>
                                       </table>
                                       </td></tr>
                                   <tr><td>
                                   <table width="100%" style="text-align: left; background-color:#E3E4FA";>
                                   <tr><td style="text-align: left;" >In Person Verification Done : </td>
                                   <td colspan="5" align="left" style="color:Red; font-size:medium;">* <asp:DropDownList ID="cmbVerify" runat="server" onchange="GetDetails(this.value)">
                                   <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                   <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                    </asp:DropDownList>
                                 </td></tr>
                                 <tr id="trVarDt" runat="server"><td style="text-align: left;">Verification Done in : </td>
                                 <td><dxe:ASPxDateEdit ID="StDate" runat="server" ClientInstanceName="StDate" EditFormat="Custom"
                                    UseMaskBehavior="True" Width="100px" Font-Size="10px" TabIndex="21">
                                   <ButtonStyle Width="13px">
                                   </ButtonStyle>
                                  </dxe:ASPxDateEdit>
                                  </td>
                                <td style="text-align: left;">Verification Done By: </td>
                                <td><asp:TextBox ID="txtVerify" runat="server" Width="250px"></asp:TextBox>
                                 </td>
                                <td><asp:HiddenField ID="txtVerify_hidden" runat="server" />
                                 </td>
                                <td></td>
                                </tr>
                         <tr id="trRemark" runat="server">
                         <td style="text-align: left;" valign="top">Remarks : </td>
                         <td colspan="5"><asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Width="300px" Height="40px"></asp:TextBox>
                         
                         <br />
                         <br />
                                                 
                         <span style="margin-left:50px; margin-top:50px; ">
                         
                          <dxe:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" 
                                                                                                ClientInstanceName="update" OnClick="btnUpdate2_Click" Text="Update" 
                                                                                                ValidationGroup="a">
                                                                                                <clientsideevents click="function(s, e) {insert();}" />
                                                                                            </dxe:ASPxButton>
                         
                         </span>
                                 </td>
                                 
                                 
                                
                                 
                                 
                                 
                                 
                                </tr>
                        <%-- <tr><td colspan="4" style="text-align: right;">
                         <input id="btnSave" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                        style="width: 68px; height: 23px" /> </td><td colspan="2" style="display: none">
                                                                        <dxe:ASPxComboBox ID="compInsert" runat="server" ClientInstanceName="compSegment"
                                                                        Width="175px" OnCallback="compInsert_Callback" OnCustomJSProperties="compInsert_CustomJSProperties">
                                                       <ClientSideEvents EndCallback="function(s,e){ShowMessage(s.cpUpdate);}" />
                                                  </dxe:ASPxComboBox>
                                   </td></tr>--%>
                                   
                                   <tr><td colspan="2" align="left">
                                  </td></tr></table></td></tr>
                                            
                                            </table>
                                            
                                            
                                            </ContentTemplate>
                                            </asp:UpdatePanel>
                                                                                                                                  
                                            </td>
                                            
                                            
                                            </tr>
                                            
                                           <%-- ------------ Others  End--------%>
                                            
                                            </table>
                                            
                                            
                                           <%-- -------------------------- CDSL Investement & Verification  End----------------------------------------------------------------------%>
                                            
                                            
                                            
                                            <table>
                                                <tr style="display: none;">
                                                    <td>
                                                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                                                        <asp:TextBox ID="txtClientID1_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                                                        <asp:HiddenField ID="HiddenField_Group" runat="server" />
                                                        <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                                                        <asp:HiddenField ID="HiddenField_Client" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Correspondance" Text="Correspondance">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Subscription" Text="Subscription">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                            </tabpages>
                            <clientsideevents activetabchanged="function(s, e) {
	                                            var activeTab = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            var Tab2 = page.GetTab(2);
	                                            var Tab3 = page.GetTab(3);
	                                            var Tab4 = page.GetTab(4);
	                                            var Tab5 = page.GetTab(5);
	                                            var Tab6 = page.GetTab(6);
	                                            var Tab7 = page.GetTab(7);
	                                            var Tab8 = page.GetTab(8);
	                                            var Tab9 = page.GetTab(9);
	                                            var Tab10 = page.GetTab(10);
	                                            var Tab11=page.GetTab(11);
	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                            if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
	                                            }
	                                            else if(activeTab == Tab2)
	                                            {
	                                                disp_prompt('tab2');
	                                            }
	                                            else if(activeTab == Tab3)
	                                            {
	                                                disp_prompt('tab3');
	                                            }
	                                            else if(activeTab == Tab4)
	                                            {
	                                                disp_prompt('tab4');
	                                            }
	                                            else if(activeTab == Tab5)
	                                            {
	                                                disp_prompt('tab5');
	                                            }
	                                            else if(activeTab == Tab6)
	                                            {
	                                                disp_prompt('tab6');
	                                            }
	                                            else if(activeTab == Tab7)
	                                            {
	                                                disp_prompt('tab7');
	                                            }
	                                            else if(activeTab == Tab8)
	                                            {
	                                                disp_prompt('tab8');
	                                            }
	                                            else if(activeTab == Tab9)
	                                            {
	                                                disp_prompt('tab9');
	                                            }
	                                               else if(activeTab == Tab10)
	                                            {
	                                                disp_prompt('tab10');
	                                            }
	                                            else if(activeTab == Tab11)
	                                            {
	                                                disp_prompt('tab11');
	                                            } 
                                                }" />
                        </dxtc:ASPxPageControl>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="sqlBrokerage" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="SELECT *,case DPChargeMembers_FromDate when '1/1/1900 12:00:00 AM' then null else convert(varchar(11),DPChargeMembers_FromDate,113) end as DPChargeMembers_FromDate1,convert(varchar(11),DPChargeMembers_UntilDate,113) as DPChargeMembers_UntilDate1,DPChargeMembers_CompanyID+','+cast(DPChargeMembers_SegmentID as varchar(10)) as SegmentID,(select ChargeGroup_Name+' ['+ltrim(rtrim(ChargeGroup_Code))+']' from Master_ChargeGroup where ltrim(rtrim(ChargeGroup_Code))=Trans_DPChargeMembers.DPChargeMembers_GroupCode and ChargeGroup_Type=3) as GroupCode FROM [Trans_DPChargeMembers] where DPChargeMembers_BenAccountNumber=@DPChargeMembers_BenAccountNumber"
                DeleteCommand="delete_DpCharges" DeleteCommandType="StoredProcedure" InsertCommand="insertDpBrokerage"
                InsertCommandType="StoredProcedure" UpdateCommand="UPDATE [Trans_DPChargeMembers] SET [DPChargeMembers_BenAccountNumber] = @DPChargeMembers_BenAccountNumber, [DPChargeMembers_CompanyID] = @DPChargeMembers_CompanyID, [DPChargeMembers_SegmentID] = @DPChargeMembers_SegmentID, [DPChargeMembers_GroupType] = @DPChargeMembers_GroupType, [DPChargeMembers_GroupCode] = @DPChargeMembers_GroupCode, [DPChargeMembers_FromDate] = @DPChargeMembers_FromDate, [DPChargeMembers_ModifyUser] = @DPChargeMembers_ModifyUser, [DPChargeMembers_ModifyDateTime] = getdate() WHERE [DPChargeMembers_ID] = @DPChargeMembers_ID">
                <DeleteParameters>
                    <asp:Parameter Name="DPChargeMembers_ID" Type="Int64" />
                    <asp:SessionParameter Name="DPChargeMembers_BenAccountNumber" SessionField="KeyVal_InternalID"
                        Type="string" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="DPChargeMembers_BenAccountNumber" SessionField="KeyVal_InternalID"
                        Type="string" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="DPChargeMembers_BenAccountNumber" SessionField="KeyVal_InternalID"
                        Type="string" />
                    <asp:SessionParameter Name="DPChargeMembers_CompanyID" SessionField="LastCompany"
                        Type="string" />
                    <asp:Parameter Name="DPChargeMembers_SegmentID" Type="Int64" />
                    <asp:Parameter Name="DPChargeMembers_GroupType" Type="Byte" />
                    <asp:Parameter Name="DPChargeMembers_GroupCode" Type="String" />
                    <asp:Parameter Name="DPChargeMembers_FromDate" Type="DateTime" />
                    <asp:SessionParameter Name="DPChargeMembers_ModifyUser" SessionField="userid" Type="Int32" />
                    <asp:Parameter Name="DPChargeMembers_ID" Type="Int64" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="DPChargeMembers_BenAccountNumber" SessionField="KeyVal_InternalID"
                        Type="string" />
                    <asp:SessionParameter Name="DPChargeMembers_CompanyID" SessionField="LastCompany"
                        Type="string" />
                    <asp:Parameter Name="DPChargeMembers_SegmentID" Type="Int64" />
                    <asp:Parameter Name="DPChargeMembers_GroupType" Type="Byte" />
                    <asp:Parameter Name="DPChargeMembers_GroupCode" Type="String" />
                    <asp:Parameter Name="DPChargeMembers_FromDate" Type="DateTime" />
                    <asp:SessionParameter Name="DPChargeMembers_CreateUser" SessionField="userid" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlComp" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="select dp_companyId+','+cast(dp_internalId as varchar(10)) as cmp_internalid,(select cmp_name from tbl_master_company where cmp_internalid=tbl_master_companyDP.dp_CompanyID)+' ['+dp_dpId+']' as cmp_Name from tbl_master_companyDP where dp_depository in(select seg_name from tbl_master_segment where seg_id=@seg_id)">
                <SelectParameters>
                    <asp:SessionParameter Name="seg_id" SessionField="userlastsegment" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <%--<asp:SqlDataSource ID="SqlComp1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" 
                    SelectCommand="select dp_companyId as cmp_internalid,(select cmp_name from tbl_master_company where cmp_internalid=tbl_master_companyDP.dp_CompanyID)+' ['+dp_dpId+']' as cmp_Name from tbl_master_companyDP">
                </asp:SqlDataSource>--%>
            <asp:SqlDataSource ID="SqlCode" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                ConflictDetection="CompareAllValues" SelectCommand="select ltrim(rtrim(ChargeGroup_Code)) as ChargeGroup_Code,ChargeGroup_Name+' ['+ltrim(rtrim(ChargeGroup_Code))+']' as ChargeGroup_Name from Master_ChargeGroup where ChargeGroup_Type=3">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
