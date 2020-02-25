using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Instagram.BoundedContext.SqlContext;
using Instagram.Models.Main;
using Instagram.Models;
using Instagram.BoundedContext.Singleton;
using RxWeb.Core.Data;
using RxWeb.Core.Data.Models;
using RxWeb.Core.Data.BoundedContext;

namespace Instagram.BoundedContext.Main
{
    public class PostContext : BaseBoundedContext, IPostContext
    {
        public PostContext(MainSqlDbContext sqlDbContext,  IOptions<DatabaseConfig> databaseConfig, IHttpContextAccessor contextAccessor,ITenantDbConnectionInfo tenantDbConnection): base(sqlDbContext, databaseConfig.Value, contextAccessor,tenantDbConnection){ }

            #region DbSets
            		public DbSet<Post> Posts { get; set; }
		public DbSet<PostLike> PostLikes { get; set; }
		public DbSet<PostComment> PostComments { get; set; }
		public DbSet<PostShare> PostShares { get; set; }
		public DbSet<PostTag> PostTags { get; set; }
            #endregion DbSets


    }


    public interface IPostContext : IDbContext
    {
    }
}

