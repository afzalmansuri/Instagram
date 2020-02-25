using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using Instagram.UnitOfWork.Main;
using Instagram.Models.Main;

namespace Instagram.Domain.PostTagModule
{
    public class PostTagDomain : IPostTagDomain
    {
        public PostTagDomain(IPostUow uow) {
            this.Uow = uow;
        }

        public Task<object> GetAsync(PostTag parameters)
        {
            throw new NotImplementedException();
        }

        public async Task<object> GetBy( PostTag parameters)
        {
            return await Uow.Repository<PostTag>().FindByAsync(t => t.PostId == parameters.PostId);
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(PostTag entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(PostTag entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(PostTag entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(PostTag entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation( PostTag parameters)
        {
            return ValidationMessages;
        }

        public async Task DeleteAsync(PostTag  parameters)
        {
            var PostTagged = Uow.Repository<PostTag>().FindByKey(parameters.PostTagId);
            await Uow.RegisterDeletedAsync(PostTagged);
            await Uow.CommitAsync();
            parameters.TagStatus = "Off";
            //throw new NotImplementedException();
        }

        public IPostUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IPostTagDomain : ICoreDomain<PostTag,PostTag> { }
}
