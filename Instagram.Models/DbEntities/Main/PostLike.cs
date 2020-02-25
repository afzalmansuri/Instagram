using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using Instagram.Models.Enums.Main;
using Instagram.BoundedContext.SqlContext;
namespace Instagram.Models.Main
{
    [Table("PostLikes",Schema="dbo")]
    public partial class PostLike
    {
		#region PostLikeId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion PostLikeId Annotations

        public int PostLikeId { get; set; }

		#region PostId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Posts","dbo","","PostId")]
		#endregion PostId Annotations

        public int PostId { get; set; }

		#region LikedById Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Users","dbo","","LikedById")]
		#endregion LikedById Annotations

        public int LikedById { get; set; }

		#region LikeDateTime Annotations

        [Required]
		#endregion LikeDateTime Annotations

        public System.DateTimeOffset LikeDateTime { get; set; }

		#region Post Annotations

        [ForeignKey(nameof(PostId))]
        [InverseProperty(nameof(Instagram.Models.Main.Post.PostLikes))]
		#endregion Post Annotations

        public virtual Post Post { get; set; }

		#region User Annotations

        [ForeignKey(nameof(LikedById))]
        [InverseProperty(nameof(Instagram.Models.Main.User.PostLikes))]
		#endregion User Annotations

        public virtual User User { get; set; }


        public PostLike()
        {
        }
	}
}