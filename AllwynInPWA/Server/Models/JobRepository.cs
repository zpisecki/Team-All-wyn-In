using AllwynInPWA.Shared;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AllwynInPWA.Server.Models
{
    public class JobRepository : IJobRepository
    {
        private readonly AppDbContext appDbContext;

        public JobRepository(AppDbContext appDbContext)
        {
            this.appDbContext = appDbContext;
        }

        public async Task<Job> AddJob(Job job)
        {
            var result = await appDbContext.Jobs.AddAsync(job);
            await appDbContext.SaveChangesAsync();
            return result.Entity;

        }

        public async Task DeleteJob(int jobId)
        {
            var result = await appDbContext.Jobs.FirstOrDefaultAsync(j => j.JobID == jobId);

            if (result != null)
            {
                appDbContext.Jobs.Remove(result);
                await appDbContext.SaveChangesAsync();
            }
        }

        public async Task<Job> GetJob(int jobId)
        {
            return await appDbContext.Jobs
                .FirstOrDefaultAsync(j => j.JobID == jobId);
        }

        public async Task<IEnumerable<Job>> GetJobs()
        {
            return await appDbContext.Jobs
                .ToListAsync();
        }

        public async Task<IEnumerable<Job>> Search(string title, string description)
        {
            IQueryable<Job> query = appDbContext.Jobs;

            if (!string.IsNullOrEmpty(title))
            {
                query = query.Where(j => j.JobTitle.Contains(title));
            }

            if (!string.IsNullOrEmpty(description))
            {
                query = query.Where(j => j.JobDesc.Contains(description));
            }
            return await query.ToListAsync();
        }

        public async Task<Job> UpdateJob(Job job)
        {
            var result = await appDbContext.Jobs
                .FirstOrDefaultAsync(j => j.JobID == job.JobID);
            if(result != null)
            {
                result.JobTitle = job.JobTitle;
                result.JobDesc = job.JobDesc;
                result.YearsExp = job.YearsExp;
                result.EduLev = job.EduLev;

                await appDbContext.SaveChangesAsync();

                return result;
            }

            return null;
        }
    }
}
