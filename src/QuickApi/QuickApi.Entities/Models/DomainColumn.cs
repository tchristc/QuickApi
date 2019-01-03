using System;
using System.Collections.Generic;

namespace QuickApi.Entities.Models
{
    public partial class DomainColumn
    {
        public int DomainColumnId { get; set; }
        public int DomainId { get; set; }
        public string DomainColumnName { get; set; }
        public int DomainColumnTypeId { get; set; }

        public virtual DomainColumnType DomainColumnType { get; set; }
    }
}
