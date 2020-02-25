using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using Instagram.UnitOfWork.Main;
using Instagram.Models.Main;

namespace Instagram.Domain.PostCommentModule
{
    public class PostCommentDomain : IPostCommentDomain
    {
        public PostCommentDomain(IPostUow uow) {
            this.Uow = uow;
        }

        public Task<object> GetAsync( PostComment parameters)
        {
            throw new NotImplementedException();
        }

        public async Task<object> GetBy(PostComment parameters)
        {
            return await Uow.Repository<PostComment>().FindByAsync(t => t.PostId == parameters.PostId);
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(PostComment entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(PostComment entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(PostComment entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(PostComment entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(PostComment parameters)
        {
            return ValidationMessages;
        }

        public async  Task DeleteAsync(PostComment parameters)
        {
            var UserComment = Uow.Repository<PostComment>().FindByKey(parameters.PostCommentId);
            await Uow.RegisterDeletedAsync(UserComment);
            await Uow.CommitAsync();
           // throw new NotImplementedException();
        }

        public IPostUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IPostCommentDomain : ICoreDomain<PostComment,PostComment> { }
}
