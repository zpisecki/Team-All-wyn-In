using AllwynInPWA.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AllwynInPWA.Client.Services
{
    public interface IJobService
    {
        Task<IEnumerable<Job>> Search(string title, string description);
        Task<IEnumerable<Job>> GetJobs();
        Task<Job> GetJob(int jobId);
        Task<Job> GetJobByTitle(string jobTit);
        Task<Job> AddJob(Job job);
        Task<Job> UpdateJob(Job job);
        Task DeleteJob(int jobId);
    }
}
