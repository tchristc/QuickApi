using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace QuickApi.Entities.Models
{
    public partial class QuickApiDatabaseContext : DbContext
    {
        public QuickApiDatabaseContext()
        {
        }

        public QuickApiDatabaseContext(DbContextOptions<QuickApiDatabaseContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ApiMetadata> ApiMetadata { get; set; }
        public virtual DbSet<Domain> Domain { get; set; }
        public virtual DbSet<DomainColumn> DomainColumn { get; set; }
        public virtual DbSet<DomainColumnType> DomainColumnType { get; set; }
        public virtual DbSet<DomainEntity> DomainEntity { get; set; }
        public virtual DbSet<DomainType> DomainType { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=.;Database=QuickApi.Database;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.0-rtm-35687");

            modelBuilder.Entity<ApiMetadata>(entity =>
            {
                entity.Property(e => e.ApiMetadataId).ValueGeneratedNever();

                entity.Property(e => e.ApiCodeGenerationTool).HasMaxLength(256);

                entity.Property(e => e.ApiDatabase).HasMaxLength(256);

                entity.Property(e => e.ApiDatabaseConnectionString).HasMaxLength(256);

                entity.Property(e => e.ApiName)
                    .IsRequired()
                    .HasMaxLength(256);
            });

            modelBuilder.Entity<Domain>(entity =>
            {
                entity.Property(e => e.DomainId).ValueGeneratedNever();

                entity.Property(e => e.DomainName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.DomainType)
                    .WithMany(p => p.Domain)
                    .HasForeignKey(d => d.DomainTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("PK_Domain_DomainType");
            });

            modelBuilder.Entity<DomainColumn>(entity =>
            {
                entity.Property(e => e.DomainColumnId).ValueGeneratedNever();

                entity.Property(e => e.DomainColumnName)
                    .IsRequired()
                    .HasMaxLength(256)
                    .IsUnicode(false);

                entity.HasOne(d => d.DomainColumnType)
                    .WithMany(p => p.DomainColumn)
                    .HasForeignKey(d => d.DomainColumnTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("PK_DomainColumn_DomainColumnType");
            });

            modelBuilder.Entity<DomainColumnType>(entity =>
            {
                entity.Property(e => e.DomainColumnTypeId).ValueGeneratedNever();

                entity.Property(e => e.DomainColumnTypeName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<DomainEntity>(entity =>
            {
                entity.Property(e => e.DomainEntityId).ValueGeneratedNever();

                entity.Property(e => e.DomainEntityName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<DomainType>(entity =>
            {
                entity.Property(e => e.DomainTypeId).ValueGeneratedNever();

                entity.Property(e => e.DomainTypeName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });
        }
    }
}
