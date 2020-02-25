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
    [Table("StoryTags",Schema="dbo")]
    public partial class StoryTag
    {
		#region StoryTagId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion StoryTagId Annotations

        public int StoryTagId { get; set; }

		#region StoryId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Stories","dbo","","StoryId")]
		#endregion StoryId Annotations

        public int StoryId { get; set; }

		#region TaggedUserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Users","dbo","","TaggedUserId")]
		#endregion TaggedUserId Annotations

        public int TaggedUserId { get; set; }

		#region TagDateTime Annotations

        [Required]
		#endregion TagDateTime Annotations

        public System.DateTimeOffset TagDateTime { get; set; }

		#region Story Annotations

        [ForeignKey(nameof(StoryId))]
        [InverseProperty(nameof(Instagram.Models.Main.Story.StoryTags))]
		#endregion Story Annotations

        public virtual Story Story { get; set; }

		#region User Annotations

        [ForeignKey(nameof(TaggedUserId))]
        [InverseProperty(nameof(Instagram.Models.Main.User.StoryTags))]
		#endregion User Annotations

        public virtual User User { get; set; }


        public StoryTag()
        {
        }
	}
}