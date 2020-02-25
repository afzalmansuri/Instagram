using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Instagram.Domain.PostTagModule;
using Instagram.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace Instagram.Api.Controllers.PostTagModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class PostTagsController : BaseDomainController<PostTag,PostTag>

    {
        public PostTagsController(IPostTagDomain domain):base(domain) {}

    }
}
