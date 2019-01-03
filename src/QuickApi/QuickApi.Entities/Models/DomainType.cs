using System;
using System.Collections.Generic;

namespace QuickApi.Entities.Models
{
    public partial class DomainType
    {
        public DomainType()
        {
            Domain = new HashSet<Domain>();
        }

        public int DomainTypeId { get; set; }
        public string DomainTypeName { get; set; }

        public virtual ICollection<Domain> Domain { get; set; }
    }
}
