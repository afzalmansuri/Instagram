using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using Instagram.UnitOfWork.Main;
using Instagram.Models.Main;
using System.Linq;

namespace Instagram.Domain.PostModule
{
    public class PostDomain : IPostDomain
    {
        public PostDomain(IPostUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(Post parameters)
        {
            return await Uow.Repository<Post>().AllAsync();
            throw new NotImplementedException();
        }

        public async Task<object> GetBy(Post parameters)
        {
            return await Uow.Repository<Post>().FindByAsync(t => t.UserId == parameters.UserId) ;
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Post entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Post entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(Post entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Post entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Post parameters)
        {
            return ValidationMessages;
        }

        public async Task DeleteAsync(Post parameters)
        {
            var UserPost = Uow.Repository<Post>().FindByKey( parameters.PostId);
            await Uow.RegisterDeletedAsync(UserPost);
            await Uow.CommitAsync();
            parameters.Status = "Deactivated";
           // throw new NotImplementedException();
        }

        
        public IPostUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IPostDomain : ICoreDomain<Post,Post> { }
}
