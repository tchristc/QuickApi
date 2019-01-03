using System;
using System.Collections.Generic;

namespace QuickApi.Entities.Models
{
    public partial class ApiMetadata
    {
        public int ApiMetadataId { get; set; }
        public string ApiName { get; set; }
        public int ApiMajorVersion { get; set; }
        public int ApiMinorVersion { get; set; }
        public int ApiPatchVersion { get; set; }
        public string ApiDatabase { get; set; }
        public string ApiDatabaseConnectionString { get; set; }
        public string ApiCodeGenerationTool { get; set; }
    }
}
