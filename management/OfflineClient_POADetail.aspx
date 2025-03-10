<%@ page language="C#" autoeventwireup="true" inherits="management_OfflineClient_POADetail, App_Web_ko_nrypx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<html xmlns="http://www.w3.org/1999/xhtml" >

<head id="Head1" runat="server">
    <title>Offline Client Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
     <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
   
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    <script type="text/javascript">
     FieldName='abc'; 
    function onlyNumbers(evt)
        {
	        var e = event || evt; // for trans-browser compatibility
	        var charCode = e.which || e.keyCode;

	        if (charCode > 31 && (charCode < 48 || charCode > 57))
		        return false;

	        return true;

        }   //numeric keycode is from 45 to 57 --- If not  within that range then return false

    
  function disp_prompt(name)
    {
         if ( name == "tab0")
        {
        //alert(name);
        document.location.href="OfflineClient_General.aspx"; 
        }
        else if ( name == "tab1")
        {
        //alert(name);
        document.location.href="OfflineClient_FirstHolder.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="OfflineClient_SecondHolder.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="OfflineClient_ThirdHolder.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="OfflineClient_Nominee.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="OfflineClient_BankRelated.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="OfflineClient_Address.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="OfflineClient_AuthorisedSignatories.aspx"; 
        }
       /* else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="OfflineClient_POADetail.aspx"; 
        }*/
        else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="OfflineClient_Signature.aspx"; 
        }

    }
    
      function max2Digit(val)
        {
        
        alert(val) ; 
//	  	     if(val.length > 2)
//	  	       {
//	  	       alert("Please enter at most 2 digit number") ; 
//	  	       return false  ;
//	  	       } 
//	  	    return true ;    
        } 


    function SignOff()
        {
             window.parent.SignOff();
        }
        function height()

        {
            if(document.body.scrollHeight>=600)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '600px';
            window.frameElement.Width = document.body.scrollWidth;
        }
        
   </script>

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
		z-index:32767; /*100;*/
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
		/*z-index:900; */
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:3000;
		/*z-index:5;*/
	}
	
	form{
		display:inline;
	}
	
	</style>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE;height:500px; clear:both;" 
onload="clearPreloadPage() ; ">
    <form id="form1" runat="server" >
    <div>
     <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align:center;">
                     <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="8" ClientInstanceName="page" Font-Size="10px" >
                            <LoadingPanelStyle ImageSpacing="6px"></LoadingPanelStyle>
                            <ContentStyle>
<Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#002D96"></Border>
</ContentStyle>

                        <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
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

	                                            }"></ClientSideEvents>

                            <TabPages>
<dxtc:TabPage Name="General" Text="General"><ContentCollection>
<dxw:ContentControl runat="server"></dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="FirstHolder" Text="First Holder"><ContentCollection>
<dxw:ContentControl runat="server">

                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="SecondHolder" Text="Second Holder"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="ThirdHolder" Text="Third Holder"><ContentCollection>
<dxw:ContentControl runat="server"></dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Nominee" Text="Nominee"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="BankRelated" Text="Bank Related"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Address" Text="Address"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="AuthorizedSignatories" Text="Authorized Signatories"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="POADetail" Text="POA Detail"><ContentCollection>
<dxw:ContentControl runat="server">
                                    
            <dxtc:ASPxPageControl ID="ASPxPageControl4" runat="server" ActiveTabIndex="0" ClientInstanceName="page">
                                                <tabpages>
							                     <dxtc:TabPage Text="POA Detail">
                                                    <ContentCollection>
                                                    <dxw:ContentControl runat="server">                                  
  <dxwgv:ASPxGridView ID="POADet" runat="server" DataSourceID="POADetailDataSource" ClientInstanceName="gridPOADetail"   KeyFieldName="Id" AutoGenerateColumns="False" 
  OnCellEditorInitialize="POADetailGrid_CellEditorInitialize" Width="100%" Font-Size="10px">
                                                <Columns>
      <dxwgv:GridViewDataTextColumn FieldName="Id" Visible="False" VisibleIndex="0" Caption="Id">
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
  <dxwgv:GridViewDataComboBoxColumn Caption="Holder Type" FieldName="HolderIndicator" Visible="False"  VisibleIndex="0">
                                                        <PropertiesComboBox ValueType="System.String">
                                    <Items>
                                <dxe:ListEditItem Text="First Holder" Value="11">
                                </dxe:ListEditItem>
                                <dxe:ListEditItem Text="Second Holder" Value="12">
                                </dxe:ListEditItem>
                                <dxe:ListEditItem Text="Third Holder" Value="13">
                                </dxe:ListEditItem>
                                   </Items> 
                                                        </PropertiesComboBox>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormSettings Visible="True" VisibleIndex="1" />
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
      </dxwgv:GridViewDataComboBoxColumn>
 <dxwgv:GridViewDataTextColumn FieldName="HolderIndicator" VisibleIndex="1" Caption="Holder Indicator">
                                                        <EditFormSettings Visible="false" VisibleIndex="1" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
 </dxwgv:GridViewDataTextColumn>                                                          
                                                    
 <dxwgv:GridViewDataComboBoxColumn Caption="POA Type" FieldName="Type" Visible="False"  VisibleIndex="0">
                                     <PropertiesComboBox ValueType="System.String">
                                    <Items>
                                <dxe:ListEditItem Text="Corporate POA" Value="C">
                                </dxe:ListEditItem>
                                <dxe:ListEditItem Text="Individual POA" Value="H">
                                </dxe:ListEditItem>
                                   </Items> 
                                                        </PropertiesComboBox>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormSettings Visible="True" VisibleIndex="1" />
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
 </dxwgv:GridViewDataComboBoxColumn>
                                                    
 <dxwgv:GridViewDataTextColumn FieldName="Type" VisibleIndex="2" Caption="POA Type">
                                                        <EditFormSettings Visible="false" VisibleIndex="2" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    
</dxwgv:GridViewDataTextColumn>
                                                    
                                                    
  <dxwgv:GridViewDataTextColumn FieldName="POAID" VisibleIndex="3" Caption="POA ID">
                                                        <EditFormSettings Visible="True" VisibleIndex="3" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
 </dxwgv:GridViewDataTextColumn>
                                                 

                                                    <dxwgv:GridViewCommandColumn VisibleIndex="4">
                                                        <DeleteButton Visible="True">
                                                        </DeleteButton>
                                                        <EditButton Visible="True">
                                                        </EditButton>
            <HeaderTemplate>
                <a href="javascript:void(0);" onclick="gridPOADetail.AddNewRow();"><span style="color: #000099;
                    text-decoration: underline">Add New</span> </a>
            </HeaderTemplate>
                                                    </dxwgv:GridViewCommandColumn>
                                     <dxwgv:GridViewCommandColumn VisibleIndex="12" Visible="False">
                                                    </dxwgv:GridViewCommandColumn>
                                                </Columns>
                                                <Settings ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="350px" PopupEditFormHorizontalAlign="Center"
                                                    PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px"
                                                    EditFormColumnCount="1" />
                                                <Styles>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                </Styles>
                                                <SettingsText PopupEditFormCaption="Add/Modify POA" ConfirmDelete="Do You Really Want To Delete This Record ???" />
                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                                <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                <Templates>
                                                    <EditForm>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="width: 25%">
                                                                </td>
                                                                <td style="width: 50%">
                                                                    <controls>
                                                   <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                                   </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                                                 </controls>
<div style="text-align: right; padding: 2px 2px 2px 2px">
<dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
    runat="server">
</dxwgv:ASPxGridViewTemplateReplacement>
<dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
    runat="server">
</dxwgv:ASPxGridViewTemplateReplacement>
</div>
                                                                </td>
                                                                <td style="width: 25%">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </EditForm>
                                                    <TitlePanel>
                                                        <table style="width: 100%">
                                                            <tr>
                            <td align="center" style="width: 50%">
     <span class="Ecoheadtxt" style="color: White">Add/Modify Authorised Signatory.</span>
                            </td>                                                      
                                                            </tr>
                                                        </table>
                                                    </TitlePanel>
                                                </Templates>
                                            </dxwgv:ASPxGridView>
   </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>


</tabpages>
</dxtc:ASPxPageControl>
</dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>

<dxtc:TabPage Name="Signature" Text="Signature"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
</TabPages>
                        </dxtc:ASPxPageControl>
                    </td></tr>
                    <tr>
                    <td>
                    
                   <%-- <table style="width: 100%;">
                            <tr>
                                <td align="right">
                                    <table>
                                        <tr>
                                            <td>
                                                <dxe:ASPxButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="a" TabIndex="62">
                                                </dxe:ASPxButton>
                                            </td>
                                            <td>
                                                <dxe:ASPxButton ID="btnSaveDB" runat="server" Text="Save Data To DataBase" OnClick="btnSaveDB_Click" ValidationGroup="a"
                                                    TabIndex="63">
                                                </dxe:ASPxButton>
                                            </td>
                                            <td>
                                                <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                                                    TabIndex="64">
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>--%>
                    </td>
                    </tr>              
            </table>
 <%-- <asp:TextBox ID="sessKey"  Width="900px"  TextMode="MultiLine" runat="server" ></asp:TextBox>--%>
    </div>
<asp:SqlDataSource ID="POADetailDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" 
SelectCommand="select NsdlOfflinePOA_ID as Id, 
case (NsdlOfflinePOA_HolderIndicator) 
when '11' then 'First Holder'
when '12' then 'Second Holder'
when '13' then 'Third Holder'
end
as HolderIndicator , 
case(NsdlOfflinePOA_Type)  
when 'C' then 'Corporate POA'
when 'H' then 'Individual POA'
end 
as  Type  ,  NsdlOfflinePOA_POAID as POAID,
NsdlOfflinePOA_CreateUser as  CreateUser, NsdlOfflinePOA_CreateDateTime  as  CreateDateTime From Trans_NSDLOfflinePOA where NsdlOfflinePOA_AccountID = @AccId" DeleteCommand="Delete_OfflineContactPOA"  DeleteCommandType="StoredProcedure" InsertCommand="Insert_OfflineContactPOA" UpdateCommand="update Trans_NSDLOfflinePOA set 
NsdlOfflinePOA_HolderIndicator  = @HolderIndicator , 
NsdlOfflinePOA_Type  = @Type  , 
NsdlOfflinePOA_POAID  = @POAID  ,  

NsdlOfflinePOA_ModifyUser = @ModifyUser,  NsdlOfflinePOA_ModifyDateTime = getdate() where 
NsdlOfflinePOA_ID = @Id" InsertCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="AccId" SessionField="KeyVal" Type="int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="decimal" />
            
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id" Type="decimal" />
                <asp:Parameter Name="HolderIndicator" Type="string" />
                <asp:Parameter Name="Type" Type="string" />
                <asp:Parameter Name="POAID" Type="string" />
    
                <asp:SessionParameter Name="ModifyUser" SessionField="userid" Type="Decimal" />
                <asp:SessionParameter Name="AccId" SessionField="KeyVal" Type="int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter Name="AccId" SessionField="KeyVal" Type="int32" />
                <asp:Parameter Name="HolderIndicator" Type="string" />
                <asp:Parameter Name="Type" Type="string" />
                <asp:Parameter Name="POAID" Type="string" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>    
    
    </form>
</body>
</html>
