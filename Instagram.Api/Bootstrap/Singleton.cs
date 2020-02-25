using Microsoft.Extensions.DependencyInjection;
using Instagram.Infrastructure.Singleton;
using Instagram.BoundedContext.Singleton;
using RxWeb.Core.Data;

namespace Instagram.Api.Bootstrap
{
    public static class Singleton
    {
        public static void AddSingletonService(this IServiceCollection serviceCollection)
        {
            #region Singleton
            serviceCollection.AddSingleton<ITenantDbConnectionInfo, TenantDbConnectionInfo>();
            serviceCollection.AddSingleton(typeof(UserAccessConfigInfo));
            #endregion Singleton
        }

    }
}




