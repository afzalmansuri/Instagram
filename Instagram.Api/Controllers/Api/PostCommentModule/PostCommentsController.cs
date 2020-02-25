using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Instagram.Domain.PostCommentModule;
using Instagram.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace Instagram.Api.Controllers.PostCommentModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class PostCommentsController : BaseDomainController<PostComment,PostComment>

    {
        public PostCommentsController(IPostCommentDomain domain):base(domain) {}

    }
}
