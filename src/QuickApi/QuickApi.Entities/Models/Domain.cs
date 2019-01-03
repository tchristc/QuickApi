using System;
using System.Collections.Generic;

namespace QuickApi.Entities.Models
{
    public partial class Domain
    {
        public int DomainId { get; set; }
        public int DomainTypeId { get; set; }
        public string DomainName { get; set; }

        public virtual DomainType DomainType { get; set; }
    }
}
