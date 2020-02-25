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
    [Table("PostShares",Schema="dbo")]
    public partial class PostShare
    {
		#region PostShareId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion PostShareId Annotations

        public int PostShareId { get; set; }

		#region ShareBy Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Users","dbo","","ShareBy")]
		#endregion ShareBy Annotations

        public int ShareBy { get; set; }

		#region ShareTo Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Users","dbo","","ShareTo")]
		#endregion ShareTo Annotations

        public int ShareTo { get; set; }

		#region PostId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Posts","dbo","","PostId")]
		#endregion PostId Annotations

        public int PostId { get; set; }

		#region ShareDateTime Annotations

        [Required]
		#endregion ShareDateTime Annotations

        public System.DateTimeOffset ShareDateTime { get; set; }

		#region Post Annotations

        [ForeignKey(nameof(PostId))]
        [InverseProperty(nameof(Instagram.Models.Main.Post.PostShares))]
		#endregion Post Annotations

        public virtual Post Post { get; set; }

		#region User Annotations

        [ForeignKey(nameof(ShareBy))]
        [InverseProperty(nameof(Instagram.Models.Main.User.PostShares))]
		#endregion User Annotations

        public virtual User User { get; set; }

		#region User1 Annotations

        [ForeignKey(nameof(ShareTo))]
        [InverseProperty(nameof(Instagram.Models.Main.User.PostShares1))]
		#endregion User1 Annotations

        public virtual User User1 { get; set; }


        public PostShare()
        {
        }
	}
}