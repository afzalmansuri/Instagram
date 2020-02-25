using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Instagram.Domain.PostModule;
using Instagram.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace Instagram.Api.Controllers.PostModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class PostsController : BaseDomainController<Post,Post>

    {
        public PostsController(IPostDomain domain):base(domain) {}

    }
}
