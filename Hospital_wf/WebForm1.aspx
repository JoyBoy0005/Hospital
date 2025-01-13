<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Hospital_wf.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" runat="server" href="~/">Community Hospital</a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                    <ul class="navbar-nav flex-grow-1">
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Medications">Medications</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/ActivePurchaseOrders">Active Purchase Orders</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/WebForm1">Web Form 1</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/About">About</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="container body-content">
            <div>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="medicationsSqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="medication_id" CssClass="table table-striped">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="medication_id" HeaderText="medication_id" InsertVisible="False" ReadOnly="True" SortExpression="medication_id" />
                        <asp:BoundField DataField="medication_description" HeaderText="medication_description" SortExpression="medication_description" />
                        <asp:BoundField DataField="medication_cost" HeaderText="medication_cost" SortExpression="medication_cost" />
                        <asp:BoundField DataField="package_size" HeaderText="package_size" SortExpression="package_size" />
                        <asp:BoundField DataField="strength" HeaderText="strength" SortExpression="strength" />
                        <asp:BoundField DataField="sig" HeaderText="sig" SortExpression="sig" />
                        <asp:BoundField DataField="units_used_ytd" HeaderText="units_used_ytd" SortExpression="units_used_ytd" />
                        <asp:BoundField DataField="last_prescribed_date" HeaderText="last_prescribed_date" SortExpression="last_prescribed_date" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="medicationsSqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:chdbConnectionString2 %>" DeleteCommand="DELETE FROM [medications] WHERE [medication_id] = @medication_id" InsertCommand="INSERT INTO [medications] ([medication_description], [medication_cost], [package_size], [strength], [sig], [units_used_ytd], [last_prescribed_date]) VALUES (@medication_description, @medication_cost, @package_size, @strength, @sig, @units_used_ytd, @last_prescribed_date)" ProviderName="<%$ ConnectionStrings:chdbConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [medications]" UpdateCommand="UPDATE [medications] SET [medication_description] = @medication_description, [medication_cost] = @medication_cost, [package_size] = @package_size, [strength] = @strength, [sig] = @sig, [units_used_ytd] = @units_used_ytd, [last_prescribed_date] = @last_prescribed_date WHERE [medication_id] = @medication_id">
                    <DeleteParameters>
                        <asp:Parameter Name="medication_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="medication_description" Type="String" />
                        <asp:Parameter Name="medication_cost" Type="Decimal" />
                        <asp:Parameter Name="package_size" Type="String" />
                        <asp:Parameter Name="strength" Type="String" />
                        <asp:Parameter Name="sig" Type="String" />
                        <asp:Parameter Name="units_used_ytd" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="last_prescribed_date" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="medication_description" Type="String" />
                        <asp:Parameter Name="medication_cost" Type="Decimal" />
                        <asp:Parameter Name="package_size" Type="String" />
                        <asp:Parameter Name="strength" Type="String" />
                        <asp:Parameter Name="sig" Type="String" />
                        <asp:Parameter Name="units_used_ytd" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="last_prescribed_date" />
                        <asp:Parameter Name="medication_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="medicationsSqlDataSource" runat="server"></asp:SqlDataSource>
            </div>
        </div>
    </form>
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/Scripts/bootstrap.js") %>
    </asp:PlaceHolder>
</body>
</html>
