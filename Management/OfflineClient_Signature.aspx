<%@ page language="C#" autoeventwireup="true" inherits="management_OfflineClient_Signature, App_Web_n3rnr3dz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxUploadControl"
    TagPrefix="dxuc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    <%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

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

   function OnUpdateClick() 
        {
            SignatureFileUploader.UploadFile(); 
            gridNSDLOfflineAccSig.UpdateEdit();           
        }
        
/* function OnDocumentView( sigFilePath )
 {
     alert(sigFilePath) ; 

        FieldName='Location'; 
 
   window.open('showNSDLOfflineClientSignature.aspx?FName='+sigFilePath,'welcome',
   'width=300,height=200,menubar=yes,status=yes,
   location=yes,toolbar=yes,scrollbars=yes');
   

 } */
 
    function OnCloseButtonClick(s, e) 
    {
        //alert('Hi');
        var parentWindow = window.parent;

        parentWindow.SigPopUp.Hide();

    }
 
     function OnDocumentView(sigFilePath) 
    {
      // alert(sigFilePath) ; 
        var url='viewImage.aspx?id='+sigFilePath;
       // popup.contentUrl=url;
        SigPopUp.SetContentUrl(url);
        SigPopUp.Show();

    }
    
    function OnSigView(sigFilePath) 
    {
    //   alert(sigFilePath) ; 
        var url='viewImage.aspx?id='+sigFilePath;
        //SigPopUp.contentUrl=url;
        SigPopUp.SetContentUrl(url);
        SigPopUp.Show();

    }
    
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
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="OfflineClient_POADetail.aspx"; 
        }
       /* else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="OfflineClient_Signature.aspx"; 
        }
      */
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
        
 
    /*   function AddNewDocument()
            {
       //var url = "frmAddDocuments.aspx?id=Contact_Document.aspx&id1=3%>";
       var url = "frm_AddNSDLOfflineClientSignature.aspx?retPage=OfflineClient_Signature.aspx" ;
        popup.SetContentUrl(url);

        popup.Show();

            } */
            
    </script>

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	            /* Width of box */
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
                    
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="9" ClientInstanceName="page" Font-Size="10px" >
                           <%-- <LoadingPanelStyle ImageSpacing="6px"></LoadingPanelStyle>--%>
                    

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
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Signature" Text="Signature"><ContentCollection>

<dxw:ContentControl runat="server">
 <dxwgv:ASPxGridView ID="NSDLOfflineAccSigGrid" runat="server" AutoGenerateColumns="False"
  ClientInstanceName="gridNSDLOfflineAccSig" KeyFieldName="Id" Width="100%" Font-Size="10px" OnRowDeleting="NSDLOfflineAccSig_RowDeleting" DataSourceID="AccSigDataSource" OnRowInserting="NSDLOfflineAccSig_RowInserting"  OnCustomCallback="NSDLOfflineAccSig_CustomCallback" >
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>

                                                    <dxwgv:GridViewDataTextColumn FieldName="FileName" VisibleIndex="1" Caption="Document Name" Width="25%"><EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>

                                                    <dxwgv:GridViewDataTextColumn  Caption="File Path"   FieldName="FilePath" ReadOnly="True" VisibleIndex="2" Width="25%"><EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <%--<dxwgv:GridViewDataHyperLinkColumn Caption="View" FieldName="Location" VisibleIndex="3" Width="15%"><EditFormSettings Visible="False" />                                                        <DataItemTemplate>

 <a onclick="OnDocumentView('<%#Eval("Location") %>')" style="cursor:pointer;">View</a>
                                                        </DataItemTemplate>
                                                    </dxwgv:GridViewDataHyperLinkColumn>--%>
                                                 
   <dxwgv:GridViewDataHyperLinkColumn Caption="View" FieldName="Src" VisibleIndex="3"
                                                        Width="15%">
                                                        <DataItemTemplate>
                                                           <%-- <a href='viewImage.aspx?id=<%#Eval("Src") %>' target="_blank">View</a>--%>
                                                      <a onclick="OnSigView('<%=("~/")%>viewImage.aspx?id=<%#Eval("Src") %>')" style="cursor:pointer;">View</a>
                                                         <%--<a onclick="OnSigView('<%#Eval("Src") %>')" style="cursor:pointer;">View</a>--%>
                                                        </DataItemTemplate>
                                                    </dxwgv:GridViewDataHyperLinkColumn>                                                 
                                                 <dxwgv:GridViewCommandColumn VisibleIndex="4">
	<DeleteButton Visible="True">	</DeleteButton>

<HeaderTemplate>
<a href="javascript:void(0);" onclick="gridNSDLOfflineAccSig.AddNewRow();"><span style="color: #000099;
text-decoration: underline">Add New</span> </a>
</HeaderTemplate>
</dxwgv:GridViewCommandColumn>                             
                                                </Columns>
                                                <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                                                <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center"
                                                    PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px"
                                                    EditFormColumnCount="1" />
                                                <Styles>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                </Styles>
                                                <SettingsText PopupEditFormCaption="Add/Modify Signature Documents" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                                    <FirstPageButton Visible="True">
                                                    </FirstPageButton>
                                                    <LastPageButton Visible="True">
                                                    </LastPageButton>
                                                </SettingsPager>
   <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
   
  <Templates>
                                <EditForm>
                                     <table style="width: 100%; background-color: #ffdead;" border="0" id="main">
                                         <tr style="height:40px;">
                                                <td style="text-align:left; width:40%">
                                                     <span class="Ecoheadtxt" style="text-align: left;color: Black">&nbsp;</span>
                                                </td>
                                                <td style="text-align:left">
                                                     &nbsp;
                                                </td>
                                                                                   
                                         </tr>
                                         <tr>
                                                
                                                 <td style="text-align:left; width:40%">
                                                     <span class="Ecoheadtxt" style="text-align: left;color: Black">Location :</span>
                                                </td>
                                                <td style="text-align:left">
                                                  <dxuc:ASPxUploadControl ID="selectSignatureFile" ClientInstanceName="SignatureFileUploader" OnFileUploadComplete="selectSignatureFile_uploadComplete" runat="server">
                                                  <ClientSideEvents FileUploadComplete="function(s, e) { if (e.isValid) { NSDLOfflineAccSigGrid.UpdateEdit(); }}" />
                                                  </dxuc:ASPxUploadControl>
                                                  
                                                </td>
                                         
                                         </tr>
                                         <tr>
                                            <td colspan="2" style="text-align: center">
                                                <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                   <a href="#" onclick="OnUpdateClick()">Update</a>
                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                        runat="server">
                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                </div>
                                            </td>
                                        </tr>
                                     </table>
                                 </EditForm>
                                <TitlePanel>
                                    <table style="width: 100%">
                                        <tr>
                                            <td align="right">
                                                <table width="200">
                                                    <tr>
                                                        <td>
                                <%-- <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data" Height="18px" Width="88px"   Font-Size="10px" AutoPostBack="False">
                               <clientsideevents click="function(s, e) {gridDp.AddNewRow();}" />
                            </dxe:ASPxButton>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </TitlePanel>
                            </Templates>                           
                                            </dxwgv:ASPxGridView>
                                     <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="viewImage.aspx"  CloseAction="CloseButton" Top="100" Left="300" ClientInstanceName="SigPopUp" Height="200px"   Width="500px" HeaderText="View Signature" >
                                 <%-- <ClientSideEvents Shown="OnCloseButtonClick" />--%>
                    <ContentCollection>
                        <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                        </dxpc:PopupControlContentControl>
                    </ContentCollection>
                                         <HeaderStyle BackColor="Blue" Font-Bold="True" ForeColor="White" />
                                            </dxpc:ASPxPopupControl>
<!----- Sudeshna Kundu ------->


                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
</TabPages>
                        </dxtc:ASPxPageControl>
                    </td></tr>
                    <tr>
                    <td>
                    
                 <%--   <table style="width: 100%;">
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
<%--<asp:TextBox ID="sessKey"  Width="900px"  TextMode="MultiLine" runat="server" ></asp:TextBox>--%>
    </div>
    
    
<asp:SqlDataSource ID="AccSigDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" InsertCommandType="StoredProcedure" SelectCommand="Select NsdlOfflineSignature_ID as Id, 
'../Documents/OfflneSignatures/NSDL/' as FilePath ,
NsdlOfflineSignature_Location as FileName ,
NsdlOfflineSignature_Location as Location ,
NsdlOfflineSignature_Location as Src,
NsdlOfflineSignature_Size as Size 
From  Trans_NSDLOfflineSignature where NsdlOfflineSignature_AccountID = @AccId" 
DeleteCommand="Delete from Trans_NSDLOfflineSignature where NsdlOfflineSignature_ID = @Id" >
 <SelectParameters>
    <asp:SessionParameter Name="AccId" SessionField="KeyVal" Type="int32" />
</SelectParameters>
<DeleteParameters> 
  <asp:Parameter Name="Id" Type="decimal" />
</DeleteParameters>
        </asp:SqlDataSource>        
    </form>
</body>
</html>

