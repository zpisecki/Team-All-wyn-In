using AllwynInPWA.Shared;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace AllwynInPWA.Server.Models
{
    public class AppDbContext : DbContext
    {
        
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {

        }
        public DbSet<Job> Jobs { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Job>().HasData(
                new Job { JobID = 1, JobTitle = "Senior Data Scientist", JobDesc = "Data Scientist will have necessary statistical modelling, mathematical, big data analytics and predictive modelling skills to build the required algorithms necessary to ask right questions and build objective visualizations and findings from it.Data Scientist will have knowledge of integrating multiple systems and datasets to provide new insights.Examples of required skillset: Prior experience working as a data architect and managing information schema for large organizations â€¢ Experience with big data analytic tools such as Hadoop, Hive, MapReduce, SPLUNK, Elastic Search â€¢ Understanding and good working knowledge of SQL and NoSQL; Experience in machine learning, statistical modelling, and predictive analysis; Extensive experience with a statistical programming language", EduLev = "Bachelor", YearsExp = 7 });
        }
    }
}
