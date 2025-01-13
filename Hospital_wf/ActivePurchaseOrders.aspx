<%@ Page Title="Active Purchase Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActivePurchaseOrders.aspx.cs" Inherits="Hospital_wf.ActivePurchaseOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>
        Department:
        <asp:DropDownList
            ID="departmentDropDownList"
            runat="server"
            DataSourceID="departmentSqlDataSource"
            DataTextField="department_name"
            DataValueField="department_id"
            AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource
            runat="server"
            ID="departmentSqlDataSource"
            ConnectionString='<%$ ConnectionStrings:chdbConnectionString %>'
            SelectCommand="SELECT [department_id], [department_name] FROM [departments] ORDER BY [department_name]">
        </asp:SqlDataSource>
    </p>
    <asp:GridView
        ID="poGridView"
        runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="purchase_order_id"
        DataSourceID="poSqlDataSource"
        CssClass="table table-striped">
        <Columns>
            <asp:BoundField DataField="purchase_order_id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="purchase_order_id">
                <ItemStyle HorizontalAlign="Right"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="order_date" HeaderText="Date" SortExpression="order_date" DataFormatString="{0:d}"></asp:BoundField>
            <asp:BoundField DataField="vendor_name" HeaderText="Vendor" SortExpression="vendor_name"></asp:BoundField>
            <asp:BoundField DataField="total_amount" HeaderText="Total Amount" SortExpression="total_amount" DataFormatString="{0:c}">
                <ItemStyle HorizontalAlign="Right"></ItemStyle>
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource
        runat="server"
        ID="poSqlDataSource"
        ConnectionString='<%$ ConnectionStrings:chdbConnectionString %>'
        SelectCommand="SELECT purchase_orders.purchase_order_id, purchase_orders.order_date, purchase_orders.total_amount, vendors.vendor_name FROM purchase_orders INNER JOIN vendors ON purchase_orders.vendor_id = vendors.vendor_id WHERE (purchase_orders.department_id = @department_id) AND (purchase_orders.order_status = @order_status)">
        <SelectParameters>
            <asp:ControlParameter ControlID="departmentDropDownList" PropertyName="SelectedValue" Name="department_id" Type="Int32"></asp:ControlParameter>
            <asp:Parameter DefaultValue="ACTIVE" Name="order_status" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>