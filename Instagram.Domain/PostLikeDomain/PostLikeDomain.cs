using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using Instagram.UnitOfWork.Main;
using Instagram.Models.Main;

namespace Instagram.Domain.PostLikeModule
{
    public class PostLikeDomain : IPostLikeDomain
    {
        public PostLikeDomain(IPostUow uow) {
            this.Uow = uow;
        }

        public Task<object> GetAsync( PostLike parameters)
        {
            throw new NotImplementedException();
        }

        public async Task<object> GetBy(PostLike parameters)
        {
            return await Uow.Repository<PostLike>().FindByAsync(t => t.PostId == parameters.PostId);
            //throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(PostLike entity)
        {
            return ValidationMessages;
        }

      
        public async Task AddAsync(PostLike entity)
        {
            var count = Uow.Repository<PostLike>().Count(a => a.LikedById == entity.LikedById && a.PostId==entity.PostId);

            if (count == 0)
            {
                await Uow.RegisterNewAsync(entity);
                await Uow.CommitAsync();
            } 
            
        }

        public HashSet<string> UpdateValidation(PostLike entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(PostLike entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation( PostLike parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(PostLike parameters)
        {
            throw new NotImplementedException();
        }

        public IPostUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IPostLikeDomain : ICoreDomain<PostLike,PostLike> { }
}
