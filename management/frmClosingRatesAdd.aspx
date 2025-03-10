<%@ page language="C#" autoeventwireup="true" inherits="management_frmClosingRatesAdd, App_Web_nidspgif" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

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
	
	</style>

    <script language="javascript" type="text/javascript">
	     function showOptions(obj1,obj2,obj3)
         {
              var obj4=document.getElementById('dtTo_hidden').value;
              ajax_showOptions(obj1,obj2,obj3,obj4);
         }
            FieldName='btnSave';
            
    function MaskMoney(evt) 
    {
    if (!(evt.keyCode == 46 || (evt.keyCode >= 48 && evt.keyCode <= 57))) return false;
    var parts = evt.srcElement.value.split('.');
    if (parts.length > 4) return false;
    if (evt.keyCode == 46) return (parts.length == 1);
    if (parts[0].length >= 14) return false;
    if (parts.length == 4 && parts[1].length >= 2) return false;
    }
function Message()
{
alert("Already Exists");

}
    function pageload()
    {
       var txt=document.getElementById('txtSelectionID');
       txt.focus();
    }
       function CallAjax(obj1,obj2,obj3,Query)
         {

        var CombinedQuery=new String(Query);
        ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
       
         }
         function replaceChars(entry) {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out)>-1) {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
            
        }
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
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div align="center">
            <table class="TableMain100">
                <tr>
                    <td align="center" style="padding-left:70px;">
                        <table width="500px">
                            <tr>
                                <td  class="gridcellleft">
                                    Instrument:
                                </td>
                                <td  class="gridcellleft">
                                    <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="250px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSelectionID"
                                        ErrorMessage="Required!."></asp:RequiredFieldValidator>
                                    <asp:HiddenField ID="txtSelectionID_hidden" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    For Date:
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="cmbForDate" runat="server" EditFormat="Custom" Width="250px" ClientEnabled="false"
                                        UseMaskBehavior="True">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                        <DropDownButton Text="">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cmbForDate"
                                        ErrorMessage="Required!."></asp:RequiredFieldValidator>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    Open:
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxTextBox runat="server" width="250px" ID="txtOpen" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999999999999g>.<00..9999999>"  />
                                                              <%-- <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>--%>
                                                          </dxe:ASPxTextBox>
                                  
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    High:
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxTextBox runat="server" width="250px" ID="txtHigh" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999999999999g>.<00..9999999>"  />
                                                              <%-- <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>--%>
                                                          </dxe:ASPxTextBox>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    Low:
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxTextBox runat="server" width="250px" ID="txtLow" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999999999999g>.<00..9999999>"  />
                                                              <%-- <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>--%>
                                                          </dxe:ASPxTextBox>
                                   
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    Close:
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxTextBox runat="server" width="250px" ID="txtClose" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999999999999g>.<00..9999999>"  />
                                                              <%-- <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>--%>
                                                          </dxe:ASPxTextBox>
                                                          
                                  
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    SettlementPrice:
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxTextBox runat="server" width="250px" ID="txtSettPr" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999999999999g>.<00..9999999>"  />
                                                              <%-- <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>--%>
                                                          </dxe:ASPxTextBox>
                                  
                                </td>
                            </tr>
                            <tr id="ShowUnder" runat="server">
                                <td  class="gridcellleft">
                                    Asset/SWAP Price:
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxTextBox runat="server" width="250px" ID="txtUnder" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999999999999g>.<00..9999999>"  />
                                                              <%-- <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>--%>
                                                          </dxe:ASPxTextBox>
                                    
                                </td>
                            </tr>
                            
                            <tr id="ShowdrvdPrice" runat="server">
                                <td  class="gridcellleft">
                                    Derived Price:
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxTextBox runat="server" width="250px" ID="txtDrvdPrice" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999999999999g>.<00..9999999>"  />
                                                          </dxe:ASPxTextBox>
                                    
                                </td>
                            </tr>

                            <tr>
                                <td style="display:none;">
                                <asp:TextBox ID="dtTo_hidden" runat="server" Font-Size="12px" Width="78px"></asp:TextBox>
                                </td>
                                <td  class="gridcellleft">
                                    <asp:Button ID="btnSave" CssClass="btnUpdate" runat="server" Text="Save" OnClick="btnSave_Click" />
                                       <input id="btnClose" type="button" name="Cancel" value="Cancel" onclick="javascript:parent.editwin.close();"
                                        class="btnUpdate" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
