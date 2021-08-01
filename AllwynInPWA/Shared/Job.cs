using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AllwynInPWA.Shared
{
    public class Job
    {
        public int JobID { get; set; }
        [Required]
        public string JobTitle { get; set; }
        [Required]
        public string JobDesc { get; set; }
        
        public string EduLev { get; set; }
        public int YearsExp { get; set; }
    }
}
