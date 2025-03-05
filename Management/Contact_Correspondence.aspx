    <%@ page language="C#" autoeventwireup="true" inherits="management_Contact_Correspondence, App_Web_rtil2eyr" %>

    <%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
        Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
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
    <%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
        Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
    <%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
        Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
    <%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
        TagPrefix="dxp" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>Untitled Page</title>
        <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

        <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

        <script language="javascript" type="text/javascript">
     function SignOff()
        {
        window.parent.SignOff()
        }
        
    function ul()
    {
           window.opener.document.getElementById('iFrmInformation').setAttribute('src','CallUserInformation.aspx')
    }

    function OnCountryChanged(cmbCountry) 
    {
        gridAddress.GetEditor("City").PerformCallback('0');
        gridAddress.GetEditor("area").PerformCallback('0');
        gridAddress.GetEditor("State").PerformCallback(cmbCountry.GetValue().toString());
        
    }
    function OnStateChanged(cmbState) 
    {
        gridAddress.GetEditor("area").PerformCallback('0');
        gridAddress.GetEditor("City").PerformCallback(cmbState.GetValue().toString());
        
    }
    function OnCityChanged(cmbCity) 
    {
        gridAddress.GetEditor("area").PerformCallback(cmbCity.GetValue().toString());
    }
    function OnChildCall(cmbCity) 
    {
       OnCityChanged(gridAddress.GetEditor("City"));
    }
    function openAreaPage()
        {
            var left = (screen.width-300)/2;
            var top = (screen.height-250)/2;
            var cityid=gridAddress.GetEditor("City").GetValue();
            var cityname=gridAddress.GetEditor("City").GetText();
            var URL= 'AddArea_PopUp.aspx?id='+cityid+'&name='+cityname+'';
            if(cityid != null)
            {
                window.open(URL,'50','resizable=1,height=100px,width=300px,top='+top+',left='+left+'');
            }
            else
            {
                alert('Please select a city first!');
                return false;
            }
        }
    function disp_prompt(name)
        {
            //var ID = document.getElementById(txtID);
            if ( name == "tab0")
            {
            //alert(name);
            document.location.href="Contact_general.aspx"; 
            }
            if ( name == "tab1")
            {
            //alert(name);
            //document.location.href="Contact_Correspondence.aspx"; 
            }
            else if ( name == "tab2")
            {
            //alert(name);
            document.location.href="Contact_BankDetails.aspx"; 
            }
            else if ( name == "tab3")
            {
            //alert(name);
            document.location.href="Contact_DPDetails.aspx"; 
            }
            else if ( name == "tab4")
            {
            //alert(name);
            document.location.href="Contact_Document.aspx"; 
            }
            else if ( name == "tab12")
            {
            //alert(name);
            document.location.href="Contact_FamilyMembers.aspx"; 
            }
            else if ( name == "tab5")
            {
            //alert(name);
            document.location.href="Contact_Registration.aspx"; 
            }
            else if ( name == "tab7")
            {
            //alert(name);
            document.location.href="Contact_GroupMember.aspx"; 
            }
            else if ( name == "tab8")
            {
            //alert(name);
            document.location.href="Contact_Deposit.aspx"; 
            }
            else if ( name == "tab9")
            {
            //alert(name);
            document.location.href="Contact_Remarks.aspx"; 
            }
            else if ( name == "tab10")
            {
            //alert(name);
            document.location.href="Contact_Education.aspx"; 
            }
            else if ( name == "tab11")
            {
            //alert(name);
            document.location.href="contact_brokerage.aspx"; 
            }
            else if ( name == "tab6")
            {
            //alert(name);
                document.location.href="contact_other.aspx"; 
            }
            else if(name=="tab13")
            {
                 document.location.href="contact_Subscription.aspx";
            }
            //New Work 30-12-2021
            else if(name=="tab14")
            {
                 document.location.href="Contact_Nominee.aspx";
            }
            //End of New Work 30-12-2021
        }
        //New Work
         //function OnPhoneClick()
         function OnPhoneClick(KeyValue)
         //End of New Work
        {
            //New Work
              var WhichRights = document.getElementById('hdnRights').value;
              if(WhichRights !="F" && KeyValue!="")
              {
                alert("You have no Rights to Save Data.");
              }
              else
              {
              //End of New Work
                if(gridPhone.GetEditor('phf_phoneNumber').GetValue()==null)
                  {
                            alert('Phone Number Required');
                  }
                else
                 {
                   gridPhone.UpdateEdit();                
                 }
             //New Work
             }
             //End of New Work
        }
        //New Work
        //function OnEmailClick()
        function OnEmailClick(KeyValue)
        //End of New Work        
         {
           //New Work
              var WhichRights = document.getElementById('hdnRights').value;
              if(WhichRights !="F" && KeyValue!="")
              {
                alert("You have no Rights to Save Data.");
              }
              else
              {
              //End of New Work
               if(gridEmail.GetEditor('eml_type').GetValue()=='Web Site')
                {
                  if(gridEmail.GetEditor('eml_website').GetValue()==null)
                   alert('Url Required');
                  else
                   gridEmail.UpdateEdit();     
                }
              else
                {
                  if(gridEmail.GetEditor('eml_email').GetValue()==null)
                     alert('Email Required');
                  else
                     gridEmail.UpdateEdit();                
                }
            //New Work
             }
            //End of New Work
         }
       function Emailcheck(obj)
        {
            if(obj=='c')
            { 
              alert("This emailid has already exists for other contacts.");
            }

        }
        
        
        //-----------For Address Status -------------------
        function btnSave_Click()
        {
           var obj='SaveOld~'+RowID;
           popPanel.PerformCallback(obj);
        }
        
        function OnAddEditClick(e,obj)
        {     
          var data=obj.split('~');
          //New Work
          var WhichRights = document.getElementById('hdnRights').value;
          if(WhichRights !="F")
          {
            alert("You have no Rights to Edit.");
          }
          else
          {
          //End of New Work
            if(data.length>1)
                RowID=data[1];
            popup.Show();
            popPanel.PerformCallback(obj);
            //New Work
            }
            //End of New Work
        }
        //New Work
        function DeleteRowA(keyValue)
        {        
          var WhichRights = document.getElementById('hdnRights').value;
          if(WhichRights !="F")
          {
            alert("You have no Rights to Delete.");
          }
          else
          {
             doIt=confirm('Are You Want To Delete This Record ???');
                if(doIt)
                    {
                       gridAddress.PerformCallback('Delete~'+keyValue);
                       height();
                    }
                else{
                      
                    }
            }
        }
        //End of New Work
       function EndCallBack(obj)
        {
            if(obj=='Y')
            {
             popup.Hide();        
             alert("Successfully Update!..");  
              gridAddress.PerformCallback();       
            }

         
        }
         function btnCancel_Click()
        {
            popup.Hide();
        }
        
        //-----------For Phone Status -------------------
        function btnSave_ClickP()
        {  
           var obj='SaveOld~'+RowIDP;
           popPanelP.PerformCallback(obj);
        }
        
        function OnAddEditClickP(e,obj)
        {          
          var data=obj.split('~');
          //New Work
          var WhichRights = document.getElementById('hdnRights').value;
          if(WhichRights !="F")
          {
            alert("You have no Rights to Edit.");
          }
          else
          {
          //End of New Work
            if(data.length>1)
                RowIDP=data[1];
            popupP.Show();
            popPanelP.PerformCallback(obj);
            //New Work
            }
            //End of New Work
        }
        //New Work
        function DeleteRowP(keyValue)
        {        
          var WhichRights = document.getElementById('hdnRights').value;
          if(WhichRights !="F")
          {
            alert("You have no Rights to Delete.");
          }
          else
          {
             doIt=confirm('Are You Want To Delete This Record ???');
                if(doIt)
                    {
                       gridPhone.PerformCallback('Delete~'+keyValue);
                       height();
                    }
                else{
                      
                    }
            }
        }
        //End of New Work
       function EndCallBackP(obj)
        {
            if(obj=='Y')
            {
             popupP.Hide();        
             alert("Successfully Update!..");  
              gridPhone.PerformCallback();       
            }

         
        }
         function btnCancel_ClickP()
        {
            popupP.Hide();
        }
        
        
          //-----------For Email Status -------------------
        function btnSave_ClickE()
        {  
           var obj='SaveOld~'+RowIDE;
           popPanelE.PerformCallback(obj);
        }
        
        function OnAddEditClickE(e,obj)
        {
          
          var data=obj.split('~');
          //New Work
          var WhichRights = document.getElementById('hdnRights').value;
          if(WhichRights !="F")
          {
            alert("You have no Rights to Edit.");
          }
          else
          {
          //End of New Work
            if(data.length>1)
                RowIDE=data[1];
            popupE.Show();
            popPanelE.PerformCallback(obj);
            //New Work
          }
          //End of New Work
        }
        //New Work
        function DeleteRowE(keyValue)
        {        
          var WhichRights = document.getElementById('hdnRights').value;
          if(WhichRights !="F")
          {
            alert("You have no Rights to Delete.");
          }
          else
          {
             doIt=confirm('Are You Want To Delete This Record ???');
                if(doIt)
                    {
                       gridEmail.PerformCallback('Delete~'+keyValue);
                       height();
                    }
                else{
                      
                    }
            }
        }
        //End of New Work
       function EndCallBackE(obj)
        {
            if(obj=='Y')
            {
             popupE.Hide();        
             alert("Successfully Update!..");  
              gridEmail.PerformCallback();       
            }

         
        }
         function btnCancel_ClickE()
        {
            popupE.Hide();
        }
        //New Work
        //function AddressUpdate()
        function AddressUpdate(keyValue)
        //End of New Work
            {
              //New Work
              var WhichRights = document.getElementById('hdnRights').value;
              if(WhichRights !="F" && keyValue!="")
              {
                alert("You have no Rights to Update Data.");
              }
              else
              {
              //End of New Work
                var countryname=gridAddress.GetEditor('Country').GetText();
                var pin= gridAddress.GetEditor('PinCode').GetText();
                if(gridAddress.GetEditor('PinCode').GetValue()==null)
                {
                    alert('PinCode Can Not Be Blank');
                }
                else
                {
                    if(countryname=='India')
                    {
                        if(pin.length<6 || IsNumeric(pin)==false)
                            {
                                alert('Enter Valid PinCode');
                            }
                         else
                            {
                                gridAddress.UpdateEdit();
                            }
                        
                    }
                    else
                    {
                    gridAddress.UpdateEdit(); 
                    }
                }
                 //New Work
              }
              //End of New Work
            }
            
          function IsNumeric(strString)
               //  check for valid numeric strings	
               {
               var strValidChars = "0123456789";
               var strChar;
               var blnResult = true;

               if (strString.length == 0) return false;

               //  test strString consists of valid characters listed above
               for (i = 0; i < strString.length && blnResult == true; i++)
                  {
                  strChar = strString.charAt(i);
                  if (strValidChars.indexOf(strChar) == -1)
                     {
                     blnResult = false;
                     }
                  }
               return blnResult;
            }
        </script>

    </head>
    <body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
        <form id="form1" runat="server">
            <div>
                <table width="100%">
                    <tr>
                        <td class="EHEADER" style="text-align: center">
                            <asp:Label ID="lblName" runat="server" Font-Size="12px" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table class="TableMain100">
                    <tr>
                        <td>
                            <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" ClientInstanceName="page"
                                OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged">
                                <TabPages>
                                    <dxtc:TabPage Name="General">
                                    <TabTemplate ><span style="font-size:x-small">General</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                        <ContentCollection>
                                            <dxw:ContentControl runat="server">
                                            </dxw:ContentControl>
                                        </ContentCollection>
                                    </dxtc:TabPage>
                                    <dxtc:TabPage  Name="CorresPondence">
                                    <TabTemplate ><span style="font-size:x-small">CorresPondence</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                        <ContentCollection>
                                            <dxw:ContentControl runat="server">
                                                <dxtc:ASPxPageControl ID="ASPxPageControl2" runat="server" ActiveTabIndex="0" ClientInstanceName="page">
                                                    <tabpages>
							                         <dxtc:TabPage Name="Adress">
							                         <TabTemplate ><span style="font-size:x-small">Address</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                                        <ContentCollection>
                                                        <dxw:ContentControl runat="server">  
                                                <dxwgv:ASPxGridView ID="AddressGrid" runat="server" DataSourceID="Address" ClientInstanceName="gridAddress"
                                                    KeyFieldName="Id" AutoGenerateColumns="False" OnCellEditorInitialize="AddressGrid_CellEditorInitialize" 
                                                    Width="100%" Font-Size="10px"  OnCustomCallback="AddressGrid_CustomCallback" OnRowValidating="AddressGrid_RowValidating" >
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Id" Visible="False" VisibleIndex="0" Caption="Id">
                                                            <EditFormSettings Visible="False" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataComboBoxColumn Caption="Address Type" FieldName="Type" Visible="False"
                                                            VisibleIndex="0">
                                                            <PropertiesComboBox ValueType="System.String">
                                                                <Items>
                                                                    <dxe:ListEditItem Text="Registered/Permanent Address" Value="Registered">
                                                                    </dxe:ListEditItem>
                                                                    <dxe:ListEditItem Text="Residence" Value="Residence">
                                                                    </dxe:ListEditItem>
                                                                    <dxe:ListEditItem Text="Office" Value="Office">
                                                                    </dxe:ListEditItem>
                                                                    <dxe:ListEditItem Text="Correspondence" Value="Correspondence">
                                                                    </dxe:ListEditItem>
                                                                </Items>
                                                            </PropertiesComboBox>
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormSettings Visible="True" VisibleIndex="1" />
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataComboBoxColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Type" VisibleIndex="0" Caption="Type">
                                                            <EditFormSettings Visible="False" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Address1" VisibleIndex="1" Caption="Address1">
                                                            <EditFormSettings Visible="True" VisibleIndex="2" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Address2" VisibleIndex="2" Caption="Address2">
                                                            <EditFormSettings Visible="True" VisibleIndex="3" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Address3" VisibleIndex="3" Caption="Address3">
                                                            <EditFormSettings Visible="True" VisibleIndex="4" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="LandMark" VisibleIndex="4" Caption="LandMark" visible="false">
                                                            <EditFormSettings Visible="True" VisibleIndex="5" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataComboBoxColumn Caption="Country" FieldName="Country" Visible="False"
                                                            VisibleIndex="0">
                                                            <PropertiesComboBox DataSourceID="CountrySelect" TextField="Country" ValueField="cou_id"
                                                                EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String">
                                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }"></ClientSideEvents>
                                                            </PropertiesComboBox>
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormSettings Visible="True" VisibleIndex="6" />
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataComboBoxColumn>
                                                        <dxwgv:GridViewDataComboBoxColumn Caption="State" FieldName="State" Visible="False"
                                                            VisibleIndex="0">
                                                            <PropertiesComboBox DataSourceID="StateSelect" TextField="State" ValueField="ID"
                                                                EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String">
                                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { OnStateChanged(s); }"></ClientSideEvents>
                                                            </PropertiesComboBox>
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormSettings Visible="True" VisibleIndex="7" />
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataComboBoxColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Country1" VisibleIndex="5" Caption="Country">
                                                            <EditFormSettings Visible="False" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="State1" VisibleIndex="6" Caption="State">
                                                            <EditFormSettings Visible="False" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="City1" VisibleIndex="8" Caption="City">
                                                            <EditFormSettings Visible="False" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataComboBoxColumn Caption="City" FieldName="City" VisibleIndex="7"
                                                            Visible="False">
                                                            <PropertiesComboBox DataSourceID="SelectCity" TextField="City" ValueField="CityId"
                                                                EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String">
                                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCityChanged(s); }"></ClientSideEvents>
                                                            </PropertiesComboBox>
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                            <EditFormSettings Visible="True" VisibleIndex="8" />
                                                        </dxwgv:GridViewDataComboBoxColumn>
                                                        <dxwgv:GridViewDataComboBoxColumn Caption="Area" FieldName="area" VisibleIndex="7" visible="true">
                                                            <PropertiesComboBox ValueType="System.Int32" DataSourceID="SelectArea" EnableSynchronization="False"
                                                                EnableIncrementalFiltering="True" ValueField="area_id" TextField="area_name">
                                                            </PropertiesComboBox>
                                                            <EditFormSettings Caption="Area" Visible="True" VisibleIndex="9" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataComboBoxColumn>                                                   
                                                                 
                                                        <dxwgv:GridViewDataHyperLinkColumn Visible="false" >
                                                            <EditFormSettings Visible="true" VisibleIndex="10" />
                                                            <EditItemTemplate>
                                                                <a href="#" onclick="javascript:openAreaPage();"><span class="Ecoheadtxt" style="color: Blue">
                                                                    <strong>Add New Area</strong></span></a>
                                                            </EditItemTemplate>
                                                        </dxwgv:GridViewDataHyperLinkColumn>
                                                                                                               
                                                        
                                                         <dxwgv:GridViewDataTextColumn FieldName="PinCode" VisibleIndex="10" Caption="PinCode">
                                                            <EditFormSettings Visible="True" VisibleIndex="12" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <PropertiesTextEdit MaxLength="6">
                                                            </PropertiesTextEdit>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        
                                                        
                                                 <%--       <dxwgv:GridViewDataTextColumn FieldName="status" VisibleIndex="11" Caption="Status">
                                                            <EditFormSettings Visible="false" VisibleIndex="2" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>--%>
                                                        
                                                         <dxwgv:GridViewDataTextColumn FieldName="status" VisibleIndex="12">
                                                        <DataItemTemplate>
                                                            <a href="javascript:void(0);" onclick="OnAddEditClick(this,'Edit~'+'<%# Container.KeyValue %>')">                                                            
                                                                <dxe:ASPxLabel ID="ASPxTextBox2"   runat="server"   Text='<%# Eval("status")%>' Width="100%" ToolTip="Click to Change Status">
                                                    </dxe:ASPxLabel>
                                                                
                                                                </a>
                                                        </DataItemTemplate>
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                        <HeaderTemplate>
                                                          Status                                                         
                                                        </HeaderTemplate>
                                                        <HeaderStyle Wrap="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                    
                                                        <dxwgv:GridViewCommandColumn VisibleIndex="13">
                                                           <%--New Work--%>
                                                           <%-- <DeleteButton Visible="True">
                                                            </DeleteButton>--%>
                                                            <%--End of New Work--%>
                                                            <EditButton Visible="True">
                                                            </EditButton>
                                                            <HeaderTemplate>
                                                                <a href="javascript:void(0);" onclick="gridAddress.AddNewRow();"><span style="color: #000099;
                                                                    text-decoration: underline">Add New</span> </a>
                                                            </HeaderTemplate>
                                                        </dxwgv:GridViewCommandColumn>
                                                        <%--New Work--%>
                                                        <dxwgv:GridViewDataTextColumn Width="60px" Caption="Details" VisibleIndex="14">
                                                            <EditFormSettings Visible="False"></EditFormSettings>
                                                            <DataItemTemplate>
                                                                <a href="javascript:void(0);"  onclick="DeleteRowA('<%# Container.KeyValue %>')">
                                                                                                                        Delete</a>
                                                            </DataItemTemplate>

                                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                                            <CellStyle Wrap="False"></CellStyle>
                                                            <HeaderTemplate>
                                                                     <span style="color: #000099;text-decoration: underline">Delete</span>
                                                            </HeaderTemplate>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <%--End of New Work--%>
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
                                                    <SettingsText PopupEditFormCaption="Add/Modify Address" ConfirmDelete="Are You Want To Delete This Record ???" />
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
                                                                           <%--  <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                                runat="server">
                                                                            </dxwgv:ASPxGridViewTemplateReplacement>--%>
                                                                            <%--New Work--%>
                                                                            <%--<a id="update" href="#" onclick="AddressUpdate()" >Update</a>--%>
                                                                            <a id="update" href="#" onclick="AddressUpdate('<%# Container.KeyValue %>')" >Update</a>
                                                                            <%--End of New Work--%>
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
                                                                        <span class="Ecoheadtxt" style="color: White">Add/Modify Address.</span>
                                                                    </td>
                                                                    <%--  <td align="right">
                                                  <table >
                                                    <tr>                                                 
                                                      <td>
                                                        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"   Height="18px" Width="88px" AutoPostBack="False" Font-Size="10px">
                                                           <clientsideevents click="function(s, e) {gridAddress.AddNewRow();}" />
                                                        </dxe:ASPxButton>
                                                      </td>                                                                                
                                                    </tr>
                                                 </table>
                                              </td>   --%>
                                                                </tr>
                                                            </table>
                                                        </TitlePanel>
                                                    </Templates>
                                                </dxwgv:ASPxGridView>
                                                
                                                
                                                <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="popup" runat="server"
                                        AllowDragging="True" PopupHorizontalAlign="WindowCenter" HeaderText="Set Address Status"
                                        EnableHotTrack="False" BackColor="#DDECFE" Width="400px" CloseAction="CloseButton">
                                        <ContentCollection>
                                            <dxpc:PopupControlContentControl runat="server">
                                                <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="400px" ClientInstanceName="popPanel"
                                                    OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
                                                    <PanelCollection>
                                                        <dxp:PanelContent runat="server">
                                                        
                                                        <table>
                                                        <tr>
                                                        <td>
                                                        Status:
                                                        </td>
                                                        <td>  <asp:DropDownList ID="cmbStatus" runat="server" Width="100px">
                                                                            <asp:ListItem Text="Active" Value="Y"></asp:ListItem>
                                                                            <asp:ListItem Text="Deactive" Value="N"></asp:ListItem>                                                                        
                                                                           </asp:DropDownList>
                                                        
                                                        </td>
                                                        </tr>
                                                        <tr>
                                                        <td>
                                                         Date:
                                                        </td>
                                                        <td>    <dxe:ASPxDateEdit ID="StDate" runat="server" ClientInstanceName="StDate" EditFormat="Custom"
                                                                                                        UseMaskBehavior="True" Width="99px" Font-Size="10px" TabIndex="21">
                                                                                                        <ButtonStyle Width="13px">
                                                                                                        </ButtonStyle>
                                                                                                    </dxe:ASPxDateEdit>
                                                        </td>
                                                        </tr>
                                                        <tr>
                                                        <td>
                                                        Reason:
                                                        </td>
                                                        <td>
                                                        <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Width="250px" ></asp:TextBox>
                                                        </td>
                                                        </tr>
                                                        
                                                         <tr>
                                                                    <td>
                                                                    </td>
                                                                    <td colspan="2" class="gridcellleft">
                                                                        <input id="Button1" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                            style="width: 60px" tabindex="41" />
                                                                        <input id="Button2" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                                                            style="width: 60px" tabindex="42" />
                                                                    </td>
                                                                </tr>
                                                        </table>                                                  
                                                        
                                                         </dxp:PanelContent>
                                                    </PanelCollection>
                                                    <ClientSideEvents EndCallback="function(s, e) {
	                                                        EndCallBack(s.cpLast);
                                                        }" />
                                                </dxcp:ASPxCallbackPanel>
                                            </dxpc:PopupControlContentControl>
                                        </ContentCollection>
                                        <HeaderStyle HorizontalAlign="Left">
                                            <Paddings PaddingRight="6px" />
                                        </HeaderStyle>
                                        <SizeGripImage Height="16px" Width="16px" />
                                        <CloseButtonImage Height="12px" Width="13px" />
                                        <ClientSideEvents CloseButtonClick="function(s, e) {
	     popup.Hide();
    }" />
                                    </dxpc:ASPxPopupControl>
                                                                        </dxw:ContentControl>
                                                                    </ContentCollection>
                                                                </dxtc:TabPage>
                                                                <dxtc:TabPage name="Phone">
                                                                <TabTemplate ><span style="font-size:x-small">Phone</span>&nbsp;<span style="color:Green;">*</span> </TabTemplate>
                                                                    <ContentCollection>
                                                                        <dxw:ContentControl runat="server"> 
                                                <dxwgv:ASPxGridView ID="PhoneGrid" ClientInstanceName="gridPhone" DataSourceID="Phone"
                                                    KeyFieldName="phf_id" runat="server" AutoGenerateColumns="False" Width="100%"
                                                    Font-Size="10px" OnRowValidating="PhoneGrid_RowValidating" OnCustomCallback="PhoneGrid_CustomCallback">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn FieldName="phf_id" ReadOnly="True" VisibleIndex="0"
                                                            Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="phf_cntId" ReadOnly="True" VisibleIndex="0"
                                                            Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="phf_entity" ReadOnly="True" VisibleIndex="0"
                                                            Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataComboBoxColumn Caption="Phone Type" FieldName="phf_type" VisibleIndex="1">
                                                            <PropertiesComboBox ValueType="System.String">
                                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	    var value = s.GetValue();
        if(value == &quot;Mobile&quot;)
        {
             gridPhone.GetEditor(&quot;phf_countryCode&quot;).SetVisible(false);
             gridPhone.GetEditor(&quot;phf_SMSFacility&quot;).SetVisible(true);
             gridPhone.GetEditor(&quot;phf_areaCode&quot;).SetVisible(false);
             gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
             gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
        }
        else
        {
             gridPhone.GetEditor(&quot;phf_countryCode&quot;).SetVisible(true);
             gridPhone.GetEditor(&quot;phf_areaCode&quot;).SetVisible(true);
             gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
             gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
             gridPhone.GetEditor(&quot;phf_SMSFacility&quot;).SetVisible(false);
        }
    }" />
                                                              <ClientSideEvents Init="function(s, e) {
	    var value = s.GetValue();
        if(value == &quot;Mobile&quot;)
        {
             gridPhone.GetEditor(&quot;phf_countryCode&quot;).SetVisible(false);
             gridPhone.GetEditor(&quot;phf_areaCode&quot;).SetVisible(false);
             gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
             gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
             gridPhone.GetEditor(&quot;phf_SMSFacility&quot;).SetVisible(true);
        }
        else
        {
             gridPhone.GetEditor(&quot;phf_countryCode&quot;).SetVisible(true);
             gridPhone.GetEditor(&quot;phf_areaCode&quot;).SetVisible(true);
             gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
             gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
             gridPhone.GetEditor(&quot;phf_SMSFacility&quot;).SetVisible(false);
        }
    }" />
                                                                <Items>
                                                                    <dxe:ListEditItem Text="Residence" Value="Residence">
                                                                    </dxe:ListEditItem>
                                                                    <dxe:ListEditItem Text="Office" Value="Office">
                                                                    </dxe:ListEditItem>
                                                                    <dxe:ListEditItem Text="Correspondence" Value="Correspondence">
                                                                    </dxe:ListEditItem>
                                                                    <dxe:ListEditItem Text="Mobile" Value="Mobile">
                                                                    </dxe:ListEditItem>
                                                                    <dxe:ListEditItem Text="Fax" Value="Fax">
                                                                    </dxe:ListEditItem>
                                                                </Items>
                                                                <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                    <RequiredField ErrorText="Select Phone Type" IsRequired="True" />
                                                                </ValidationSettings>
                                                            </PropertiesComboBox>
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormSettings Visible="True" />
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataComboBoxColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="phf_countryCode" VisibleIndex="2" Visible="False">
                                                            <EditFormSettings Caption="Country Code" Visible="True" />
                                                            <PropertiesTextEdit>
                                                                <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                    <RegularExpression ErrorText="Enter Valid CountryCode" ValidationExpression="[0-9]+" />
                                                                </ValidationSettings>
                                                            </PropertiesTextEdit>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="phf_areaCode" VisibleIndex="3" Visible="False">
                                                            <EditFormSettings Caption="Area Code" Visible="True" />
                                                            <PropertiesTextEdit>
                                                                <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                    <RegularExpression ErrorText="Enter Valid AreaCode" ValidationExpression="[0-9]+" />
                                                                </ValidationSettings>
                                                            </PropertiesTextEdit>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        
                                                        <dxwgv:GridViewDataTextColumn FieldName="phf_phoneNumber" VisibleIndex="4" Caption="Number"
                                                            Visible="False">
                                                            <EditFormSettings Visible="True" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <PropertiesTextEdit>
                                                                <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                    <RequiredField IsRequired="True" ErrorText="Please Enter Phone Number"></RequiredField>
                                                                    <RegularExpression ErrorText="Enter Valid PhoneNumber" ValidationExpression="[0-9]+" />
                                                                </ValidationSettings>
                                                            </PropertiesTextEdit>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Number" VisibleIndex="5" Caption="Phone Number"
                                                            Width="40%">
                                                            <EditFormSettings Visible="False" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                      		
                                                          <dxwgv:GridViewDataTextColumn FieldName="status" VisibleIndex="6" Caption="Status">
                                                            <DataItemTemplate>
                                                            <a href="javascript:void(0);" onclick="OnAddEditClickP(this,'Edit~'+'<%# Container.KeyValue %>')">                                                            
                                                                <dxe:ASPxLabel ID="ASPxLabel1"   runat="server"   Text='<%# Eval("status")%>' Width="100%" ToolTip="Click to Change Status">
                                                    </dxe:ASPxLabel>
                                                                
                                                                </a>
                                                        </DataItemTemplate>
                                                            <EditFormSettings Visible="false" VisibleIndex="3" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        
                                                        
                                                    <dxwgv:GridViewDataTextColumn  VisibleIndex="7" Caption="Change Status" visible="false">                                                      <DataItemTemplate>
                                                         <a href="javascript:void(0);" onclick="OnAddEditClickP(this,'Edit~'+'<%# Container.KeyValue %>')">
                                                                <u>Change Status</u>  </a>
                                                        </DataItemTemplate> 
                                                         <EditFormSettings Visible="false" VisibleIndex="4" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>                                                       
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataComboBoxColumn Caption="Sms alert by Stock Exchange" FieldName="phf_SMSFacility" VisibleIndex="9" Visible="true">
                                                            <PropertiesComboBox ValueType="System.String">
                                                                
	                                    		 <Items>
                                                                    <dxe:ListEditItem Text="Yes" Value="1">
                                                                    </dxe:ListEditItem>
                                                                    <dxe:ListEditItem Text="No" Value="2">
                                                                    </dxe:ListEditItem>
                                                                    
                                                                </Items>
                                                               
                                                            </PropertiesComboBox>
					                                    <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormSettings Visible="True" />
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataComboBoxColumn>
                                                        
                                                        <dxwgv:GridViewDataTextColumn FieldName="phf_extension" VisibleIndex="6" Caption="Extension"
                                                            Visible="False">
                                                            <EditFormSettings Visible="True" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <PropertiesTextEdit>
                                                                <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                    <RegularExpression ErrorText="Enter Valid Extension" ValidationExpression="[0-9]+" />
                                                                </ValidationSettings>
                                                            </PropertiesTextEdit>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                                                                                
                                                        <dxwgv:GridViewCommandColumn VisibleIndex="8">
                                                            <%--New Work--%>
                                                            <%--<DeleteButton Visible="True">
                                                            </DeleteButton>--%>
                                                            <%--End of New Work--%>
                                                            <EditButton Visible="True">
                                                            </EditButton>
                                                            <HeaderTemplate>
                                                                <a href="javascript:void(0);" onclick="gridPhone.AddNewRow();"><span style="color: #000099;
                                                                    text-decoration: underline">Add New</span> </a>
                                                            </HeaderTemplate>
                                                        </dxwgv:GridViewCommandColumn>
                                                        
                                                        <%--New Work--%>
                                                        <dxwgv:GridViewDataTextColumn Width="60px" Caption="Details" VisibleIndex="9">
                                                            <EditFormSettings Visible="False"></EditFormSettings>
                                                            <DataItemTemplate>
                                                                <a href="javascript:void(0);"  onclick="DeleteRowP('<%# Container.KeyValue %>')">
                                                                                                                        Delete</a>
                                                            </DataItemTemplate>

                                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                                            <CellStyle Wrap="False"></CellStyle>
                                                            <HeaderTemplate>
                                                                     <span style="color: #000099;text-decoration: underline">Delete</span>
                                                            </HeaderTemplate>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <%--End of New Work--%>
                                                      
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
                                                    <SettingsText PopupEditFormCaption="Add/Modify Address" ConfirmDelete="Are You Want To Delete This Record ???" />
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
                                                                    <td style="width: 50%" align="center">
                                                                        <controls>
                                                    <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                                    </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                                                  </controls> 
                                                 <hr />
                                                                        <div style="font: 20px; text-align: center; padding: 2px 2px 2px 2px ">
                                                                           <%-- <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                                runat="server">
                                                                            </dxwgv:ASPxGridViewTemplateReplacement>--%>
                                                                            <%--New Work--%>
                                                                            <%--<a id="update"  href="#"onclick="OnPhoneClick()" >Save</a>--%>
                                                                            <a id="update"  href="#"onclick="OnPhoneClick('<%# Container.KeyValue %>')" >Save</a>
                                                                            <%--End of New Work--%>
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                                                        <span class="Ecoheadtxt" style="color: White">Add/Modify Phone.</span>
                                                                    </td>
                                                            
                                                                </tr>
                                                            </table>
                                                        </TitlePanel>
                                                    </Templates>
                                                </dxwgv:ASPxGridView>
                                                
                                                
                                                
                                                
                                                   <dxpc:ASPxPopupControl ID="ASPxPopupControlP" ClientInstanceName="popupP" runat="server"
                                        AllowDragging="True" PopupHorizontalAlign="WindowCenter" HeaderText="Set Phone Status"
                                        EnableHotTrack="False" BackColor="#DDECFE" Width="400px" CloseAction="CloseButton">
                                        <ContentCollection>
                                            <dxpc:PopupControlContentControl runat="server">
                                                <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanelP" runat="server" Width="400px" ClientInstanceName="popPanelP"
                                                    OnCallback="ASPxCallbackPanelP_Callback" OnCustomJSProperties="ASPxCallbackPanelP_CustomJSProperties">
                                                    <PanelCollection>
                                                        <dxp:PanelContent runat="server">
                                                        
                                                        <table>
                                                        <tr>
                                                        <td>
                                                        Status:
                                                        </td>
                                                        <td>  <asp:DropDownList ID="cmbStatusP" runat="server" Width="100px">
                                                                            <asp:ListItem Text="Active" Value="Y"></asp:ListItem>
                                                                            <asp:ListItem Text="Deactive" Value="N"></asp:ListItem>                                                                        
                                                                           </asp:DropDownList>
                                                        
                                                        </td>
                                                        </tr>
                                                        <tr>
                                                        <td>
                                                         Date:
                                                        </td>
                                                        <td>    <dxe:ASPxDateEdit ID="StDateP" runat="server" ClientInstanceName="StDate" EditFormat="Custom"
                                                                                                        UseMaskBehavior="True" Width="99px" Font-Size="10px" TabIndex="21">
                                                                                                        <ButtonStyle Width="13px">
                                                                                                        </ButtonStyle>
                                                                                                    </dxe:ASPxDateEdit>
                                                        </td>
                                                        </tr>
                                                        <tr>
                                                        <td>
                                                        Reason:
                                                        </td>
                                                        <td>
                                                        <asp:TextBox ID="txtReasonP" runat="server" TextMode="MultiLine" Width="250px" ></asp:TextBox>
                                                        </td>
                                                        </tr>
                                                        
                                                         <tr>
                                                                    <td>
                                                                    </td>
                                                                    <td colspan="2" class="gridcellleft">
                                                                        <input id="Button3" type="button" value="Save" class="btnUpdate" onclick="btnSave_ClickP()"
                                                                            style="width: 60px" tabindex="41" />
                                                                        <input id="Button4" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_ClickP()"
                                                                            style="width: 60px" tabindex="42" />
                                                                    </td>
                                                                </tr>
                                                        </table>                                                  
                                                        
                                                         </dxp:PanelContent>
                                                    </PanelCollection>
                                                    <ClientSideEvents EndCallback="function(s, e) {
	                                                        EndCallBackP(s.cpLast);
                                                        }" />
                                                </dxcp:ASPxCallbackPanel>
                                            </dxpc:PopupControlContentControl>
                                        </ContentCollection>
                                        <HeaderStyle HorizontalAlign="Left">
                                            <Paddings PaddingRight="6px" />
                                        </HeaderStyle>
                                        <SizeGripImage Height="16px" Width="16px" />
                                        <CloseButtonImage Height="12px" Width="13px" />
                                        <ClientSideEvents CloseButtonClick="function(s, e) {
	     popup.Hide();
    }" />
                                    </dxpc:ASPxPopupControl>
                                                
                                                                        </dxw:ContentControl>
                                                                    </ContentCollection>
                                                                </dxtc:TabPage>
                                                                <dxtc:TabPage name="Email">
                                                                <TabTemplate ><span style="font-size:x-small">Email</span>&nbsp;<span style="color:Green;">*</span> </TabTemplate>
                                                                    <ContentCollection>
                                                                        <dxw:ContentControl runat="server"> 
                                                <dxwgv:ASPxGridView ID="EmailGrid" runat="server" ClientInstanceName="gridEmail"
                                                    DataSourceID="Email" KeyFieldName="eml_id" AutoGenerateColumns="False" Width="100%" OnCustomCallback="EmailGrid_CustomCallback" 
                                                    Font-Size="10px" OnRowValidating="EmailGrid_RowValidating" OnCustomJSProperties="EmailGrid_CustomJSProperties">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn FieldName="eml_id" VisibleIndex="0" Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataComboBoxColumn Caption="Email Type" FieldName="eml_type" Visible="False"
                                                            VisibleIndex="1">
                                                            <PropertiesComboBox ValueType="System.String">
                                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	    var value = s.GetValue();
	    
        if(value == &quot;Web Site&quot;)
        {
             gridEmail.GetEditor(&quot;eml_email&quot;).SetVisible(false);
             gridEmail.GetEditor(&quot;eml_ccEmail&quot;).SetVisible(false);
             gridEmail.GetEditor(&quot;eml_website&quot;).SetVisible(true);
        }
        else
        {
             gridEmail.GetEditor(&quot;eml_email&quot;).SetVisible(true);
             gridEmail.GetEditor(&quot;eml_ccEmail&quot;).SetVisible(true);
             gridEmail.GetEditor(&quot;eml_website&quot;).SetVisible(false);
        }
        if(value == &quot;Official&quot;)
        {
        gridEmail.GetEditor(&quot;eml_facility&quot;).SetVisible(true);
        }
        else
        {
         gridEmail.GetEditor(&quot;eml_facility&quot;).SetVisible(false);
        }
    }" />
                                                             <ClientSideEvents Init="function(s, e) {
	    var value = s.GetValue();
	    
        if(value == &quot;Web Site&quot;)
        {
             gridEmail.GetEditor(&quot;eml_email&quot;).SetVisible(false);
             gridEmail.GetEditor(&quot;eml_ccEmail&quot;).SetVisible(false);
             gridEmail.GetEditor(&quot;eml_website&quot;).SetVisible(true);
        }
        else
        {
             gridEmail.GetEditor(&quot;eml_email&quot;).SetVisible(true);
             gridEmail.GetEditor(&quot;eml_ccEmail&quot;).SetVisible(true);
             gridEmail.GetEditor(&quot;eml_website&quot;).SetVisible(false);
        }
        if(value == &quot;Official&quot;)
        {
        gridEmail.GetEditor(&quot;eml_facility&quot;).SetVisible(true);
        }
        else
        {
         gridEmail.GetEditor(&quot;eml_facility&quot;).SetVisible(false);
        }
    }" />    
    
                                                                <Items>
                                                                <dxe:ListEditItem Text="Official (For sending Emails)" Value="Official">
                                                                    </dxe:ListEditItem>
                                                                    <dxe:ListEditItem Text="Personal" Value="Personal">
                                                                    </dxe:ListEditItem>
                                                                    
                                                                    <dxe:ListEditItem Text="Web Site" Value="Web Site">
                                                                    </dxe:ListEditItem>
                                                                </Items>
                                                                  <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                    <RequiredField IsRequired="True" ErrorText="Select Type"></RequiredField>
                                                                </ValidationSettings>
                                                            </PropertiesComboBox>
                                                            <EditFormSettings Visible="True" />
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataComboBoxColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="eml_type" VisibleIndex="2" Caption="Type"
                                                            Width="27%">
                                                            <EditFormSettings Caption="Email Type" Visible="False" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="eml_email" VisibleIndex="3" Caption="Email">
                                                            <EditFormSettings Caption="EmailId" Visible="True" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                            <PropertiesTextEdit>
                                                                <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                    <RegularExpression ErrorText="Enetr Valid E-Mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                                </ValidationSettings>
                                                            </PropertiesTextEdit>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="eml_ccEmail" VisibleIndex="4" Visible="False">
                                                            <EditFormSettings Caption="CC Email" Visible="True" />
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                            <PropertiesTextEdit>
                                                                <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                    <RegularExpression ErrorText="Enetr Valid CC EMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                                </ValidationSettings>
                                                            </PropertiesTextEdit>
                                                        </dxwgv:GridViewDataTextColumn>
                                                     
                                                        
                                                        
                                                        
                                                        
                                                        
                                                          <dxwgv:GridViewDataTextColumn FieldName="status" VisibleIndex="5" Caption="Status">
                                                            <DataItemTemplate>
                                                            <a href="javascript:void(0);" onclick="OnAddEditClickE(this,'Edit~'+'<%# Container.KeyValue %>')">                                                            
                                                                <dxe:ASPxLabel ID="ASPxLabel2"   runat="server"   Text='<%# Eval("status")%>' Width="100%" ToolTip="Click to Change Status">
                                                    </dxe:ASPxLabel>
                                                                
                                                                </a>
                                                        </DataItemTemplate>
                                                            <EditFormSettings Visible="false" />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        
                                                           <dxwgv:GridViewDataTextColumn FieldName="eml_website" Caption="WebURL" VisibleIndex="6"
                                                            Visible="true">
                                                            <EditFormSettings Caption="WebURL" Visible="True" />
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataComboBoxColumn Caption="Email alert by Stock Exchange" FieldName="eml_facility" VisibleIndex="9" Visible="true">
                                                            <PropertiesComboBox ValueType="System.String">
                                                                
	                                    		 <Items>
                                                                    <dxe:ListEditItem Text="Yes" Value="1">
                                                                    </dxe:ListEditItem>
                                                                    <dxe:ListEditItem Text="No" Value="2">
                                                                    </dxe:ListEditItem>
                                                                    
                                                                </Items>
                                                               
                                                            </PropertiesComboBox>
					                                    <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormSettings Visible="True" />
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>
                                                        </dxwgv:GridViewDataComboBoxColumn>
                                                         
                                                        <dxwgv:GridViewDataTextColumn  VisibleIndex="7" Caption="Change Status"  Visible="false">
                                                          <DataItemTemplate>
                                                         <a href="javascript:void(0);" onclick="OnAddEditClickE(this,'Edit~'+'<%# Container.KeyValue %>')">
                                                                <u>Change Status</u>  </a>
                                                        </DataItemTemplate> 
                                                         <EditFormSettings Visible="false"  />
                                                            <CellStyle CssClass="gridcellleft">
                                                            </CellStyle>
                                                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                            </EditFormCaptionStyle>                                                       
                                                        </dxwgv:GridViewDataTextColumn>
                                                        
                                                        <dxwgv:GridViewCommandColumn VisibleIndex="8">
                                                            <%--New Work--%>
                                                            <%--<DeleteButton Visible="True">
                                                            </DeleteButton>--%>
                                                            <%--End of New Work--%>
                                                            <EditButton Visible="True">
                                                            </EditButton>
                                                            <HeaderTemplate>
                                                                <a href="javascript:void(0);" onclick="gridEmail.AddNewRow();"><span style="color: #000099;
                                                                    text-decoration: underline">Add New</span> </a>
                                                            </HeaderTemplate>
                                                        </dxwgv:GridViewCommandColumn>
                                                        <%--New Work--%>
                                                        <dxwgv:GridViewDataTextColumn Width="60px" Caption="Details" VisibleIndex="9">
                                                            <EditFormSettings Visible="False"></EditFormSettings>
                                                            <DataItemTemplate>
                                                                <a href="javascript:void(0);"  onclick="DeleteRowE('<%# Container.KeyValue %>')">
                                                                                                                        Delete</a>
                                                            </DataItemTemplate>

                                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                                            <CellStyle Wrap="False"></CellStyle>
                                                            <HeaderTemplate>
                                                                     <span style="color: #000099;text-decoration: underline">Delete</span>
                                                            </HeaderTemplate>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <%--End of New Work--%>
                                                       <%-- <dxwgv:GridViewCommandColumn VisibleIndex="3">
                                                            <EditButton Visible="True">
                                                            </EditButton>
                                                        </dxwgv:GridViewCommandColumn>--%>
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
                                                    <SettingsText PopupEditFormCaption="Add/Modify Address" ConfirmDelete="Are You Want To Delete This Record ???" />
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
                                                     <hr />
                                                                        <div style="font:20px; text-align: center; padding: 2px 2px 2px 2px">
                                                                           <%-- <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                                runat="server">
                                                                            </dxwgv:ASPxGridViewTemplateReplacement>--%>
                                                                               <%--New Work--%>
                                                                               <%--<a id="update1" href="#"onclick="OnEmailClick()" >Save</a>--%>
                                                                               <a id="update1" href="#" onclick="OnEmailClick('<%# Container.KeyValue %>')" >Save</a>
                                                                               <%--End of New Work--%>
                                                                               &nbsp;&nbsp;&nbsp;&nbsp;
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
                                                                        <span class="Ecoheadtxt" style="color: White">Add/Modify Email.</span>
                                                                    </td>
                                                                    <%-- <td align="right">
                                                  <table >
                                                     <tr>
    <td>
                                                           <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"   Height="18px" Width="88px" AutoPostBack="False" Font-Size="10px">
                                                                <clientsideevents click="function(s, e) {gridEmail.AddNewRow();}" />
                                                           </dxe:ASPxButton>
                                                        </td>
                                                    </tr>
                                                  </table>
                                                </td>   --%>
                                                                </tr>
                                                            </table>
                                                        </TitlePanel>
                                                    </Templates>
                                                       <ClientSideEvents EndCallback="function(s, e) {
	    Emailcheck(s.cpHeight);
    }" />
                                                </dxwgv:ASPxGridView>
                                                
                                                
                                                
                                                  <dxpc:ASPxPopupControl ID="ASPxPopupControlE" ClientInstanceName="popupE" runat="server"
                                        AllowDragging="True" PopupHorizontalAlign="WindowCenter" HeaderText="Set Email Status"
                                        EnableHotTrack="False" BackColor="#DDECFE" Width="400px" CloseAction="CloseButton">
                                        <ContentCollection>
                                            <dxpc:PopupControlContentControl runat="server">
                                                <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanelE" runat="server" Width="400px" ClientInstanceName="popPanelE"
                                                    OnCallback="ASPxCallbackPanelE_Callback" OnCustomJSProperties="ASPxCallbackPanelE_CustomJSProperties">
                                                    <PanelCollection>
                                                        <dxp:PanelContent runat="server">
                                                        
                                                        <table>
                                                        <tr>
                                                        <td>
                                                        Status:
                                                        </td>
                                                        <td>  <asp:DropDownList ID="cmbStatusE" runat="server" Width="100px">
                                                                            <asp:ListItem Text="Active" Value="Y"></asp:ListItem>
                                                                            <asp:ListItem Text="Deactive" Value="N"></asp:ListItem>                                                                        
                                                                           </asp:DropDownList>
                                                        
                                                        </td>
                                                        </tr>
                                                        <tr>
                                                        <td>
                                                         Date:
                                                        </td>
                                                        <td>    <dxe:ASPxDateEdit ID="StDateE" runat="server" ClientInstanceName="StDate" EditFormat="Custom"
                                                                                                        UseMaskBehavior="True" Width="99px" Font-Size="10px" TabIndex="21">
                                                                                                        <ButtonStyle Width="13px">
                                                                                                        </ButtonStyle>
                                                                                                    </dxe:ASPxDateEdit>
                                                        </td>
                                                        </tr>
                                                        <tr>
                                                        <td>
                                                        Reason:
                                                        </td>
                                                        <td>
                                                        <asp:TextBox ID="txtReasonE" runat="server" TextMode="MultiLine" Width="250px" ></asp:TextBox>
                                                        </td>
                                                        </tr>
                                                        
                                                         <tr>
                                                                    <td>
                                                                    </td>
                                                                    <td colspan="2" class="gridcellleft">
                                                                        <input id="Button5" type="button" value="Save" class="btnUpdate" onclick="btnSave_ClickE()"
                                                                            style="width: 60px" tabindex="41" />
                                                                        <input id="Button6" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_ClickE()"
                                                                            style="width: 60px" tabindex="42" />
                                                                    </td>
                                                                </tr>
                                                        </table>                                                  
                                                        
                                                         </dxp:PanelContent>
                                                    </PanelCollection>
                                                    <ClientSideEvents EndCallback="function(s, e) {
	                                                        EndCallBackE(s.cpLast);
                                                        }" />
                                                </dxcp:ASPxCallbackPanel>
                                            </dxpc:PopupControlContentControl>
                                        </ContentCollection>
                                        <HeaderStyle HorizontalAlign="Left">
                                            <Paddings PaddingRight="6px" />
                                        </HeaderStyle>
                                        <SizeGripImage Height="16px" Width="16px" />
                                        <CloseButtonImage Height="12px" Width="13px" />
                                        <ClientSideEvents CloseButtonClick="function(s, e) {
	     popup.Hide();
    }" />
                                    </dxpc:ASPxPopupControl>
                                                                                               </dxw:ContentControl>
                                                                    </ContentCollection>
                                                                </dxtc:TabPage>
                                                            </tabpages>
                                                </dxtc:ASPxPageControl>
                                            </dxw:ContentControl>
                                        </ContentCollection>
                                    </dxtc:TabPage>
                                    <dxtc:TabPage Name="Bank Details">
                                    <TabTemplate ><span style="font-size:x-small">Bank</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                        <ContentCollection>
                                            <dxw:ContentControl runat="server">
                                            </dxw:ContentControl>
                                        </ContentCollection>
                                    </dxtc:TabPage>
                                    <dxtc:TabPage Name="DP Details">
                                    <TabTemplate ><span style="font-size:x-small">DP</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    
                                        <ContentCollection>
                                            <dxw:ContentControl runat="server">
                                            </dxw:ContentControl>
                                        </ContentCollection>
                                    </dxtc:TabPage>
                                    <dxtc:TabPage Name="Documents">
                                    <TabTemplate ><span style="font-size:x-small">Documents</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                        <ContentCollection>
                                            <dxw:ContentControl runat="server">
                                            </dxw:ContentControl>
                                        </ContentCollection>
                                    </dxtc:TabPage>
                                   
                                    <dxtc:TabPage Name="Registration">
                                    <TabTemplate ><span style="font-size:x-small">Registration</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                        <ContentCollection>
                                            <dxw:ContentControl runat="server">
                                            </dxw:ContentControl>
                                        </ContentCollection>
                                    </dxtc:TabPage>
                                     <dxtc:TabPage Name="Other">
                                <TabTemplate ><span style="font-size:x-small">Other</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                    <dxtc:TabPage Name="Group Member" Text="Group">
                                        <ContentCollection>
                                            <dxw:ContentControl runat="server">
                                            </dxw:ContentControl>
                                        </ContentCollection>
                                    </dxtc:TabPage>
                                    <dxtc:TabPage Name="Deposit" Text="Deposit">
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
                                    <dxtc:TabPage Name="Education" Text="Education">
                                        <ContentCollection>
                                            <dxw:ContentControl runat="server">
                                            </dxw:ContentControl>
                                        </ContentCollection>
                                    </dxtc:TabPage>
                                    <dxtc:TabPage Name="Trad. Prof." Text="Trad.Prof">
                                    <%--<TabTemplate ><span style="font-size:x-small">Trad.Prof</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>--%>
                                        <ContentCollection>
                                            <dxw:ContentControl runat="server">
                                            </dxw:ContentControl>
                                        </ContentCollection>
                                    </dxtc:TabPage>
                                   <dxtc:TabPage Name="FamilyMembers" Text="Family">
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
                                    <%--New Work 30-12-2021--%>
                                    <dxtc:TabPage Name="Nominee">
                                        <TabTemplate>
                                            <span style="font-size: x-small;color:Blue;font-weight:bold">Nominee</span>&nbsp;<span style="color: Red;">*</span>
                                        </TabTemplate>
                                        <ContentCollection>
                                            <dxw:ContentControl runat="server">
                                            </dxw:ContentControl>
                                        </ContentCollection>
                                    </dxtc:TabPage>
                                    <%--End of New Work 30-12-2021--%>
                                </TabPages>
                                <%--New work Contact_Nominee(Tab14) added 30-12-2021--%>
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
	                                                var Tab10 = page.GetTab(10);
	                                                var Tab11 = page.GetTab(11);
	                                                var Tab12 = page.GetTab(12);
	                                                var Tab13=page.GetTab(13);
	                                                var Tab14=page.GetTab(14);
	                                                
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
	                                                else if(activeTab == Tab12)
	                                                {
	                                                    disp_prompt('tab12');
	                                                }
	                                                else if(activeTab == Tab13)
	                                                {
	                                                   disp_prompt('tab13');
	                                                }
	                                                else if(activeTab == Tab14)
	                                                {
	                                                   disp_prompt('tab14');
	                                                }
	                                                
	                                                }"></ClientSideEvents>
                                <ContentStyle>
                                    <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                                </ContentStyle>
                                <LoadingPanelStyle ImageSpacing="6px">
                                </LoadingPanelStyle>
                                <TabStyle Font-Size="10px">
                                </TabStyle>
                            </dxtc:ASPxPageControl>
                            <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox></td>
                        <td>
                        </td>
                    </tr>
                </table>
            </div>
            <%--New Work 01/02/2022--%>
            <%--UpdateCommand="update tbl_master_address set add_addressType=@Type,add_address1=@Address1,add_address2=@Address2,add_address3=@Address3,add_city=@City,add_landMark=@LandMark,
                add_country=@Country,add_state=@State,add_area=@area,add_pin=@PinCode,LastModifyDate=getdate(),LastModifyUser=@CreateUser where add_id=@Id"--%>
            <%--End of New Work 01/02/2022--%>
            <asp:SqlDataSource ID="Address" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="select DISTINCT  tbl_master_address.add_id AS Id, tbl_master_address.add_addressType AS Type,
                            tbl_master_address.add_address1 AS Address1,  tbl_master_address.add_address2 AS Address2, 
                            tbl_master_address.add_address3 AS Address3,tbl_master_address.add_landMark AS LandMark, 
                            tbl_master_address.add_country AS Country, 
                            tbl_master_address.add_state AS State,tbl_master_address.add_city AS City,
                            CASE add_country WHEN '0' THEN '0' ELSE(SELECT cou_country FROM tbl_master_country WHERE cou_id = add_country) END AS Country1, 
                             CASE add_state WHEN '0' THEN '0' ELSE(SELECT state FROM tbl_master_state WHERE id = add_state) END AS State1,
                            CASE add_city WHEN '0' THEN '0' ELSE(SELECT city_name FROM tbl_master_city WHERE city_id = add_city) END AS City1,
                            CASE add_area WHEN '0' THEN '0' Else(select area_name From tbl_master_area Where area_id = add_area) End AS area,                      
                            tbl_master_address.add_pin AS PinCode, tbl_master_address.add_landMark AS LankMark ,
                            case when add_status='N' then 'Deactive' else 'Active' end as status                     
                            from tbl_master_address where add_cntId=@insuId" DeleteCommand="contactDelete"
                DeleteCommandType="StoredProcedure" InsertCommand="insert_correspondence"                 
                UpdateCommand="Update_correspondence_Address" UpdateCommandType="StoredProcedure"
                InsertCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="insuId" SessionField="KeyVal_InternalID_New" Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="int32" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Type" Type="string" />
                    <asp:Parameter Name="Address1" Type="string" />
                    <asp:Parameter Name="Address2" Type="string" />
                    <asp:Parameter Name="Address3" Type="string" />
                    <asp:Parameter Name="City" Type="int32" />
                    <asp:Parameter Name="area" Type="int32" />
                    <asp:Parameter Name="LandMark" Type="string" />
                    <asp:Parameter Name="Country" Type="int32" />
                    <asp:Parameter Name="State" Type="int32" />
                    <asp:Parameter Name="PinCode" Type="string" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                    <asp:Parameter Name="Id" Type="decimal" />
                   
                </UpdateParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="insuId" SessionField="KeyVal_InternalID_New" Type="String" />
                    <asp:Parameter Name="Type" Type="string" />
                    <asp:SessionParameter Name="contacttype" SessionField="ContactType" Type="string" />
                    <asp:Parameter Name="Address1" Type="string" />
                    <asp:Parameter Name="Address2" Type="string" />
                    <asp:Parameter Name="Address3" Type="string" />
                    <asp:Parameter Name="City" Type="int32" />
                    <asp:Parameter Name="area" Type="int32" />
                    <asp:Parameter Name="LandMark" Type="string" />
                    <asp:Parameter Name="Country" Type="int32" />
                    <asp:Parameter Name="State" Type="int32" />
                    <asp:Parameter Name="PinCode" Type="string" />
                   
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="CountrySelect" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="SELECT cou_id, cou_country as Country FROM tbl_master_country order by cou_country">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="StateSelect" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="SELECT s.id as ID,s.state as State from tbl_master_state s where (s.countryId = @State) ORDER BY s.state">
                <SelectParameters>
                    <asp:Parameter Name="State" Type="string" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SelectCity" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="SELECT c.city_id AS CityId, c.city_name AS City FROM tbl_master_city c where c.state_id=@City order by c.city_name">
                <SelectParameters>
                    <asp:Parameter Name="City" Type="string" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SelectArea" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="SELECT area_id, area_name from tbl_master_area where (city_id = @Area) ORDER BY area_name">
                <SelectParameters>
                    <asp:Parameter Name="Area" Type="string" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;
            <%--New Work 01/02/2022--%>
            <%--UpdateCommand="update tbl_master_phonefax set phf_type=@phf_type,phf_countryCode=@phf_countryCode,phf_areaCode=@phf_areaCode,phf_phoneNumber=@phf_phoneNumber,
                           phf_extension=@phf_extension,LastModifyDate=getdate(),LastModifyUser=@CreateUser,phf_SMSFacility=(case when ltrim(rtrim(@phf_type))='Mobile' 
                           then @phf_SMSFacility else '2' end) where phf_id=@phf_id"--%>
            <%--End of New Work 01/02/2022--%>
            <asp:SqlDataSource ID="Phone" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                DeleteCommand="PhoneDelete" DeleteCommandType="StoredProcedure"
                InsertCommand="insert_correspondence_phone" SelectCommand="select DISTINCT phf_id,phf_cntId,phf_entity,phf_type,phf_countryCode,phf_areaCode,phf_phoneNumber,phf_extension, ISNULL(phf_countryCode, '') + ' ' + ISNULL(phf_areaCode, '') + ' ' + ISNULL(phf_phoneNumber, '') +' '+ ISNULL(phf_extension, '') + ISNULL(phf_faxNumber, '') AS Number , case when phf_Status='N' then 'Deactive' else 'Active' end as status ,isnull(phf_SMSFacility,'') as  phf_SMSFacility
                          from tbl_master_phonefax where phf_cntId=@PhfId" 
                UpdateCommand="Update_correspondence_Phone" UpdateCommandType="StoredProcedure" InsertCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="PhfId" SessionField="KeyVal_InternalID_New" Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="PhfId" SessionField="KeyVal_InternalID_New" Type="String" />
                    <asp:Parameter Name="phf_type" Type="string" />
                    <asp:SessionParameter Name="contacttype" SessionField="ContactType" Type="string" />
                    <asp:Parameter Name="phf_countryCode" Type="string" />
                    <asp:Parameter Name="phf_areaCode" Type="string" />
                    <asp:Parameter Name="phf_phoneNumber" Type="string" />
                    <asp:Parameter Name="phf_extension" Type="string" />
                    <asp:Parameter Name="phf_Availablefrom" Type="string" />
                    <asp:Parameter Name="phf_AvailableTo" Type="string" />
                    <asp:Parameter Name="phf_SMSFacility" Type="int32" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="phf_type" Type="string" />
                    <asp:Parameter Name="phf_countryCode" Type="string" />
                    <asp:Parameter Name="phf_areaCode" Type="string" />
                    <asp:Parameter Name="phf_phoneNumber" Type="string" />
                    <asp:Parameter Name="phf_extension" Type="string" />
                    <asp:Parameter Name="phf_Availablefrom" Type="string" />
                    <asp:Parameter Name="phf_AvailableTo" Type="string" />
                    <asp:Parameter Name="phf_SMSFacility" Type="int32" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                    <asp:Parameter Name="phf_id" Type="decimal" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="phf_id" Type="int32" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <%--New Work 01/02/2022--%>
            <%--UpdateCommand="update tbl_master_email set eml_type=@eml_type,eml_email=@eml_email,eml_ccEmail=@eml_ccEmail,eml_website=@eml_website,LastModifyDate=getdate(),
                LastModifyUser=@CreateUser,eml_facility=(case when ltrim(rtrim(@eml_type))='Official' then @eml_facility else '2' end) where eml_id=@eml_id"--%>
            <%--End of New Work 01/02/2022--%>
            <asp:SqlDataSource ID="Email" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                DeleteCommand="EmailDelete" DeleteCommandType="StoredProcedure"
                InsertCommand="insert_correspondence_email" InsertCommandType="StoredProcedure"
                SelectCommand="select eml_id,eml_cntId,eml_entity,eml_type,eml_email,eml_ccEmail,eml_website,CreateDate,CreateUser,case when eml_Status='N' then 'Deactive' else 'Active' end as status,(case when eml_facility=1 then '1' when eml_facility=2 then '2' else null end) as eml_facility from tbl_master_email where eml_cntId=@EmlId"                
                UpdateCommand="Update_correspondence_Email" UpdateCommandType="StoredProcedure"	>
                <DeleteParameters>
                    <asp:Parameter Name="eml_id" Type="int32" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="eml_type" Type="string" />
                    <asp:Parameter Name="eml_email" Type="string" />
                    <asp:Parameter Name="eml_ccEmail" Type="string" />
                    <asp:Parameter Name="eml_website" Type="string" />
                    <asp:Parameter Name="eml_id" Type="decimal" />
                    <asp:Parameter Name="eml_facility" Type="int32" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="EmlId" SessionField="KeyVal_InternalID_New" Type="string" />
                </SelectParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="EmlId" SessionField="KeyVal_InternalID_New" Type="string" />
                    <asp:Parameter Name="eml_type" Type="string" />
                    <asp:SessionParameter Name="contacttype" SessionField="ContactType" Type="string" />
                    <asp:Parameter Name="eml_email" Type="string" />
                    <asp:Parameter Name="eml_ccEmail" Type="string" />
                    <asp:Parameter Name="eml_website" Type="string" />
                    <asp:Parameter Name="eml_facility" Type="int32" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="hdnRights" runat="server" />
        </form>
    </body>
    </html>
