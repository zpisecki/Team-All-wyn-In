using AllwynInPWA.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace AllwynInPWA.Client.Services
{
    public class JobService : IJobService
    {
        private readonly HttpClient httpClient;

        public JobService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }
        public async Task<Job> AddJob(Job job) => await httpClient.PostAsJsonAsync("/api/jobs", job);

        public Task DeleteJob(int jobId)
        {
            throw new NotImplementedException();
        }

        public Task<Job> GetJob(int jobId)
        {
            throw new NotImplementedException();
        }

        public Task<Job> GetJobByTitle(string jobTit)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<Job>> GetJobs()
        {
            return await httpClient.GetFromJsonAsync<IEnumerable<Job>>("/api/jobs");
        }

        public Task<IEnumerable<Job>> Search(string title, string description)
        {
            throw new NotImplementedException();
        }

        public Task<Job> UpdateJob(Job job)
        {
            throw new NotImplementedException();
        }
    }
}
