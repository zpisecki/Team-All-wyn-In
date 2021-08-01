using AllwynInPWA.Server.Models;
using AllwynInPWA.Shared;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AllwynInPWA.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JobsController : ControllerBase
    {
        private readonly IJobRepository jobRepository;
        public JobsController(IJobRepository jobRepository)
        {
            this.jobRepository = jobRepository;
        }
        
        [HttpGet("{search}")]
        public async Task<ActionResult<IEnumerable<Job>>> Search(string title, string description)
        {
            try
            {
                var result = await jobRepository.Search(title, description);

                if (result.Any())
                {
                    return Ok(result);
                }

                return NotFound();
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError,
                    "Error retrieving data from the database");
                
            }
        }

        [HttpGet]
        public async Task<ActionResult> GetJobs()
        {
            try
            {
                return Ok(await jobRepository.GetJobs());
            }
            catch (Exception)
            {

                return StatusCode(StatusCodes.Status500InternalServerError,
                    "Error retrieving data from the database");
            }
            
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<Job>> GetJob(int id)
        {
            try
            {
                var result = await jobRepository.GetJob(id);

                if (result == null)
                {
                    return NotFound();
                }
                return result;
            }
            catch (Exception)
            {

                return StatusCode(StatusCodes.Status500InternalServerError,
                    "Error retrieving data from the database");
            }

        }

        [HttpPost]
        public async Task<ActionResult<Job>> CreateJob(Job job)
        {
            try
            {
                if (job == null)
                    return BadRequest();

                var jo = await jobRepository.GetJobByTitle(job.JobTitle);

                if(jo != null)
                {
                    ModelState.AddModelError("Job Title", "Job Title already exists");
                    return BadRequest(ModelState);
                }

                var createdJob = await jobRepository.AddJob(job);

                return CreatedAtAction(nameof(GetJob),
                    new { id = createdJob.JobID }, createdJob);
            }
            catch (Exception)
            {

                return StatusCode(StatusCodes.Status500InternalServerError,
                    "Error creating new job record");
            }

        }

        [HttpPut("{id:int}")]
        public async Task<ActionResult<Job>> UpdateJob(int id, Job job)
        {
            try
            {
                if (id != job.JobID)
                    return BadRequest("Job ID mismatch");

                var jobToUpdate = await jobRepository.GetJob(id);

                if (jobToUpdate == null)
                {
                    return NotFound($"Job with Id = {id} not found");
                }

                return await jobRepository.UpdateJob(job);

                
            }
            catch (Exception)
            {

                return StatusCode(StatusCodes.Status500InternalServerError,
                    "Error updating job record");
            }

        }

        [HttpDelete("{id:int}")]
        public async Task<ActionResult> DeleteJob(int id)
        {
            try
            {
                var jobToDelete = await jobRepository.GetJob(id);

                if (jobToDelete == null)
                {
                    return NotFound($"Job with Id = {id} not found");
                }

                await jobRepository.DeleteJob(id);

                return Ok($"Job with Id = {id} deleted");


            }
            catch (Exception)
            {

                return StatusCode(StatusCodes.Status500InternalServerError,
                    "Error deleting job record");
            }

        }
    }
}
