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
    [Table("Followers",Schema="dbo")]
    public partial class Follower
    {
		#region FollowerId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion FollowerId Annotations

        public int FollowerId { get; set; }

		#region FollowBy Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Users","dbo","","FollowBy")]
		#endregion FollowBy Annotations

        public int FollowBy { get; set; }

		#region FollowTo Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Users","dbo","","FollowTo")]
		#endregion FollowTo Annotations

        public int FollowTo { get; set; }

		#region FollowDateTime Annotations

        [Required]
		#endregion FollowDateTime Annotations

        public System.DateTimeOffset FollowDateTime { get; set; }

		#region User Annotations

        [ForeignKey(nameof(FollowBy))]
        [InverseProperty(nameof(Instagram.Models.Main.User.Followers))]
		#endregion User Annotations

        public virtual User User { get; set; }

		#region User1 Annotations

        [ForeignKey(nameof(FollowTo))]
        [InverseProperty(nameof(Instagram.Models.Main.User.Followers1))]
		#endregion User1 Annotations

        public virtual User User1 { get; set; }

		#region ViewStorys Annotations

        [InverseProperty("Follower")]
		#endregion ViewStorys Annotations

        public virtual ICollection<ViewStory> ViewStorys { get; set; }


        public Follower()
        {
			ViewStorys = new HashSet<ViewStory>();
        }
	}
}