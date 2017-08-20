<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="share._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    
<div>
    <br /><br />
    <table style="font-size: large;">
        <tr><td style="width: 46px;"></td><td style="width:139px;">Date</td><td style="width:139px;">Pigmi</td><td style="width:139px;">Expences</td><td style="width:139px;">DF</td><td style="width:139px;">Expences</td><td style="width:139px;">Remarks</td></tr>
    </table>
<asp:GridView ID="gridView" DataKeyNames="id" runat="server"
        AutoGenerateColumns="false" ShowFooter="true" HeaderStyle-Font-Bold="true"
        onrowcancelingedit="gridView_RowCancelingEdit"
        onrowdeleting="gridView_RowDeleting"
        onrowediting="gridView_RowEditing"
        onrowupdating="gridView_RowUpdating"
        onrowcommand="gridView_RowCommand"
        OnRowDataBound="gridView_RowDataBound">
<Columns>

    
 <asp:TemplateField HeaderText="SL No">
        <ItemTemplate>
             <%#Container.DataItemIndex+1 %>
        </ItemTemplate>
    </asp:TemplateField>
 <asp:TemplateField HeaderText="Date">
     <HeaderTemplate>
         <asp:TextBox ID="inDate"  width="120px" CssClass="example1" runat="server"/>
         <asp:RequiredFieldValidator ID="vname" runat="server" ControlToValidate="inDate" Text="?" ValidationGroup="validaiton"/>
     </HeaderTemplate>
      <ItemTemplate>
         <asp:Label ID="lblDate" width="120px" runat="server" Text='<%#Eval("Date", "{0:yyyy/MM/dd}") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtDate" width="120px" CssClass="example1"  runat="server" Text='<%#Eval("Date") %>'/>
     </EditItemTemplate>
    <FooterTemplate>
        <asp:Label ID="lbltotal" width="120px" Font-Bold="true" runat="server" Text="Total" />
    </FooterTemplate> 
 </asp:TemplateField>
    
    <asp:TemplateField HeaderText="Pigmi">
        <HeaderTemplate>
            <asp:TextBox ID="inPigmi" width="120px"  runat="server"/>
        <asp:RequiredFieldValidator ID="vcity" runat="server" ControlToValidate="inPigmi" Text="?" ValidationGroup="validaiton"/>
        </HeaderTemplate>
       <ItemTemplate>
         <asp:Label ID="lblPigmi" width="120px" runat="server" Text='<%#Eval("Pigmi") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtPigmi" width="120px"   runat="server" Text='<%#Eval("Pigmi") %>'/>
     </EditItemTemplate>
    <FooterTemplate>
        <asp:Label ID="lblpigmi" width="120px" Font-Bold="true"  runat="server"/>
    </FooterTemplate>
 </asp:TemplateField>
    <asp:TemplateField HeaderText="Expences">
        <HeaderTemplate>
            <asp:TextBox ID="inExpences1" width="120px" Font-Bold="true"  runat="server"/>
        <asp:RequiredFieldValidator ID="vstate" runat="server" ControlToValidate="inExpences1" Text="?" ValidationGroup="validaiton"/>
        </HeaderTemplate>
     <ItemTemplate>
         <asp:Label ID="lblExpences1" width="120px" runat="server" Text='<%#Eval("Expences1") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtExpences1" width="120px"  runat="server" Text='<%#Eval("Expences1") %>'/>
     </EditItemTemplate>
    <FooterTemplate>
        <asp:Label ID="lblexpences1" width="120px" Font-Bold="true"  runat="server"/>
    </FooterTemplate>
 </asp:TemplateField>
    <asp:TemplateField HeaderText="DF">
        <HeaderTemplate>
            <asp:TextBox ID="inDF" width="120px"   runat="server"/>
        <asp:RequiredFieldValidator ID="vstate1" runat="server" ControlToValidate="inDF" Text="?" ValidationGroup="validaiton"/>
        </HeaderTemplate>
     <ItemTemplate>
         <asp:Label ID="lblDF" width="120px" runat="server" Text='<%#Eval("DF") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtDF" width="120px"  runat="server" Text='<%#Eval("DF") %>'/>
     </EditItemTemplate>
    <FooterTemplate>
        <asp:Label ID="lbldf" width="120px" Font-Bold="true" runat="server"/>
    </FooterTemplate>
 </asp:TemplateField>
       <asp:TemplateField HeaderText="Expences2">
           <HeaderTemplate>
               <asp:TextBox ID="inExpences2" width="120px"   runat="server"/>
        <asp:RequiredFieldValidator ID="vstate2" runat="server" ControlToValidate="inExpences2" Text="?" ValidationGroup="validaiton"/>
           </HeaderTemplate>
     <ItemTemplate>
         <asp:Label ID="lblExpences2" width="120px" runat="server" Text='<%#Eval("Expences2") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtExpences2" width="120px"  runat="server" Text='<%#Eval("Expences2") %>'/>
     </EditItemTemplate>
    <FooterTemplate>
        <asp:Label ID="lblExpences2" width="120px" Font-Bold="true"  runat="server"/>
    </FooterTemplate>
 </asp:TemplateField>
 <asp:TemplateField HeaderText="Remarks">
     <HeaderTemplate>
         <asp:TextBox ID="inRemarks" width="120px"  runat="server"/>
        <asp:RequiredFieldValidator ID="vaddress" runat="server" ControlToValidate="inRemarks" Text="?" ValidationGroup="validaiton"/>
     </HeaderTemplate>
     <ItemTemplate>
         <asp:Label ID="lblRemarks" width="120px" runat="server" Text='<%#Eval("Remarks") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtRemarks" width="120px"  runat="server" Text='<%#Eval("Remarks") %>'/>
     </EditItemTemplate>
    <FooterTemplate>
    </FooterTemplate>
 </asp:TemplateField>
 <asp:TemplateField HeaderText="Action">
     <HeaderTemplate>
         <asp:Button ID="ButtonAdd" runat="server" CssClass="btn btn-primary btn-large" CommandName="AddNew"  Text="Add New Row" ValidationGroup="validaiton" />
     </HeaderTemplate>
    <EditItemTemplate>
        <asp:Button ID="ButtonUpdate" CssClass="btn btn-primary btn-large" runat="server" CommandName="Update"  Text="Update"  />
        <asp:Button ID="ButtonCancel" CssClass="btn btn-primary btn-large" runat="server" CommandName="Cancel"  Text="Cancel" />
    </EditItemTemplate>
    <ItemTemplate>
        <asp:Button ID="ButtonEdit" CssClass="btn btn-primary btn-large" runat="server" CommandName="Edit"  Text="Edit"  />
        <asp:Button ID="ButtonDelete" CssClass="btn btn-primary btn-large" runat="server" CommandName="Delete"  Text="Delete"  />
    </ItemTemplate>
    <FooterTemplate>
        
    </FooterTemplate>
 </asp:TemplateField>
 </Columns>
</asp:GridView>
    </div>
<div >
<br />&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblmsg" runat="server"></asp:Label>
</div>
    
    <script src="js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        // When the document is ready
        $(document).ready(function () {

            $('.example1').datepicker({
                format: "yyyy-mm-dd"
            });

        });
    </script>

    </asp:Content>

