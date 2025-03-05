<%@ page language="C#" autoeventwireup="true" inherits="Reports_cdslBill_GroupSelection, App_Web_arnfzykg" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title></title>
 <script language="javascript" >
     function OnGridSelectionChanged() 
    {
//        var noofrow=grid.GetSelectedRowCount().toString();
//        alert(noofrow);
        grid.GetSelectedFieldValues('code', OnGridSelectionComplete);
    }
    function OnGridSelectionComplete(values) 
    {
        counter = 'n';
        for(var i = 0; i < values.length; i ++) {
            if(counter != 'n')
                counter += ',' + values[i];
            else
                counter = values[i];
        }
        alert(counter+'test');
    }




 </script>
 
 <script type="text/javascript">
<!--
function readGridCheckBoxes()   
{   
 var gridRef = document.getElementById('<%= chkGroupBox.ClientID %>');   
 var inputElementArray = gridRef.getElementsByTagName('input');    

 var checkedValues = '';

 for(var i=0; i<inputElementArray.length; i++)       
 {
  var elementRef = inputElementArray[i];

  if ( (elementRef.type == 'checkbox') && (elementRef.checked == true) )
  {
   var labelArray = elementRef.parentNode.getElementsByTagName('label');
 // alert(elementRef.parentNode.attributes["mainValue"].value);

    if ( checkedValues.length > 0 )
     checkedValues += ', ';

    checkedValues += "'"+elementRef.parentNode.attributes["mainValue"].value+"'";


  }
 }


return checkedValues;
}   
// -->
  function selectAll()
      {
      var i=0;
      var item;
      while(true)
      {
                item = document.getElementById("chkGroupBox_"+i);
                if(item == null)
                  break;
                item.checked=true;
                i++;
      }
      }


  function invertSelection()
      {
      var i=0;
      var item;
      while(true)
      {
                item = document.getElementById("chkGroupBox_"+i);
                if(item == null)
                  break;
                if(item.checked==true)
                    {
                    item.checked=false;
                    }
                    else
                    {
                         item.checked=true;
                    }
                i++;
      }
      }
      
        function popupClose()
            {
                var s=readGridCheckBoxes();
              //  parent.FillValues(s);
                parent.document.getElementById("IFRAME_ForAllPages").contentWindow.FillValues(s);
            }


            function popupClose2()
            {
            //parent.popupClose2();
            parent.document.getElementById("IFRAME_ForAllPages").contentWindow.popupClose2();
            }



</script>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="font: normal 11px/14px Tahoma,Arial, Helvetica, sans-serif;">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <a href="javascript:void(0);" onclick="selectAll();"><span style="color: #000099; text-decoration: underline; font-size: 10pt;">Select All Records</span></a>
                            </td>
                            <td>
                                <a href="javascript:void(0);" onclick="invertSelection();"><span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">InvertSelection</span></a>
                            </td>
                            <td>
                                <input id="Button1" type="button" value="Done" onclick="popupClose();" style="font: normal 11px/14px Tahoma,Arial, Helvetica, sans-serif;" />
                            </td>
                            <td>
                                <input id="Button2" type="button" value="Cancel" onclick="popupClose2();" style="font: normal 11px/14px Tahoma,Arial, Helvetica, sans-serif;" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBoxList ID="chkGroupBox" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <a href="javascript:void(0);" onclick="selectAll();"><span style="color: #000099; text-decoration: underline; font-size: 10pt;">Select All Records</span></a>
                            </td>
                            <td>
                                <a href="javascript:void(0);" onclick="invertSelection();"><span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">InvertSelection</span></a>
                            </td>
                            <td>
                                <input id="Button3" type="button" value="Done" onclick="popupClose();" style="font: normal 11px/14px Tahoma,Arial, Helvetica, sans-serif;" />
                            </td>
                            <td>
                                <input id="Button4" type="button" value="Cancel" onclick="popupClose2();" style="font: normal 11px/14px Tahoma,Arial, Helvetica, sans-serif;" />
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
