using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Instagram.Domain.PostLikeModule;
using Instagram.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace Instagram.Api.Controllers.PostLikeModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class PostLikesController : BaseDomainController<PostLike,PostLike>

    {
        public PostLikesController(IPostLikeDomain domain):base(domain) {}

    }
}
