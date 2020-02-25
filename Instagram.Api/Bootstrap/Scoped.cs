#region Namespace
using Microsoft.Extensions.DependencyInjection;
using Instagram.Infrastructure.Security;
using RxWeb.Core.Data;
using RxWeb.Core.Security;
using RxWeb.Core.Annotations;
using RxWeb.Core;
using Instagram.UnitOfWork.DbEntityAudit;
using Instagram.BoundedContext.Main;
using Instagram.UnitOfWork.Main;
using Instagram.Domain.PostModule;
           
            using Instagram.Domain.PostLikeModule;
            using Instagram.Domain.PostCommentModule;
            using Instagram.Domain.PostShareModule;
            using Instagram.Domain.PostTagModule;
            #endregion Namespace













namespace Instagram.Api.Bootstrap
{
    public static class ScopedExtension
    {

        public static void AddScopedService(this IServiceCollection serviceCollection)
        {
            serviceCollection.AddScoped<IRepositoryProvider, RepositoryProvider>();
            serviceCollection.AddScoped<ITokenAuthorizer, TokenAuthorizer>();
            serviceCollection.AddScoped<IModelValidation, ModelValidation>();
            serviceCollection.AddScoped<IAuditLog, AuditLog>();
            serviceCollection.AddScoped<IApplicationTokenProvider, ApplicationTokenProvider>();
            serviceCollection.AddScoped(typeof(IDbContextManager<>), typeof(DbContextManager<>));

            #region ContextService

            serviceCollection.AddScoped<ILoginContext, LoginContext>();
            serviceCollection.AddScoped<ILoginUow, LoginUow>();
                        serviceCollection.AddScoped<IPostContext, PostContext>();
            serviceCollection.AddScoped<IPostUow, PostUow>();
            #endregion ContextService




            #region DomainService

            
            serviceCollection.AddScoped<IPostDomain, PostDomain>();
            
           
            serviceCollection.AddScoped<IPostDomain, PostDomain>();
            
            serviceCollection.AddScoped<IPostDomain, PostDomain>();
            
            serviceCollection.AddScoped<IPostLikeDomain, PostLikeDomain>();
            
            serviceCollection.AddScoped<IPostCommentDomain, PostCommentDomain>();
            
            serviceCollection.AddScoped<IPostShareDomain, PostShareDomain>();
            
            serviceCollection.AddScoped<IPostTagDomain, PostTagDomain>();
            #endregion DomainService












        }
    }
}




