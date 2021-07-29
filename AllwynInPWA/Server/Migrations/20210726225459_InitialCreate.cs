using Microsoft.EntityFrameworkCore.Migrations;

namespace AllwynInPWA.Server.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Jobs",
                columns: table => new
                {
                    JobID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    JobTitle = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    JobDesc = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    EduLev = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    YearsExp = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Jobs", x => x.JobID);
                });

            migrationBuilder.InsertData(
                table: "Jobs",
                columns: new[] { "JobID", "EduLev", "JobDesc", "JobTitle", "YearsExp" },
                values: new object[] { 1, "Bachelor", "Data Scientist will have necessary statistical modelling, mathematical, big data analytics and predictive modelling skills to build the required algorithms necessary to ask right questions and build objective visualizations and findings from it.Data Scientist will have knowledge of integrating multiple systems and datasets to provide new insights.Examples of required skillset: Prior experience working as a data architect and managing information schema for large organizations â€¢ Experience with big data analytic tools such as Hadoop, Hive, MapReduce, SPLUNK, Elastic Search â€¢ Understanding and good working knowledge of SQL and NoSQL; Experience in machine learning, statistical modelling, and predictive analysis; Extensive experience with a statistical programming language", "Senior Data Scientist", 7 });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Jobs");
        }
    }
}
