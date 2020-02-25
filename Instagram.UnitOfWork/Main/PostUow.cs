using RxWeb.Core.Data;
using Instagram.BoundedContext.Main;

namespace Instagram.UnitOfWork.Main
{
    public class PostUow : BaseUow, IPostUow
    {
        public PostUow(IPostContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IPostUow : ICoreUnitOfWork { }
}


