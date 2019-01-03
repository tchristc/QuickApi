using System;
using System.Collections.Generic;

namespace QuickApi.Entities.Models
{
    public partial class DomainColumnType
    {
        public DomainColumnType()
        {
            DomainColumn = new HashSet<DomainColumn>();
        }

        public int DomainColumnTypeId { get; set; }
        public string DomainColumnTypeName { get; set; }

        public virtual ICollection<DomainColumn> DomainColumn { get; set; }
    }
}
