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
    [Table("ChatDetails",Schema="dbo")]
    public partial class ChatDetail
    {
		#region ChatDetailId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ChatDetailId Annotations

        public int ChatDetailId { get; set; }

		#region MessageContent Annotations

        [Required]
		#endregion MessageContent Annotations

        public string MessageContent { get; set; }

		#region ChatDateTime Annotations

        [Required]
		#endregion ChatDateTime Annotations

        public System.DateTimeOffset ChatDateTime { get; set; }

		#region Status Annotations

        [Required]
		#endregion Status Annotations

        public bool Status { get; set; }

		#region ChatId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Chats","dbo","","ChatId")]
		#endregion ChatId Annotations

        public int ChatId { get; set; }

		#region StoryCommentId Annotations

        [RelationshipTableAttribue("StoryComments","dbo","","StoryCommentId")]
		#endregion StoryCommentId Annotations

        public Nullable<int> StoryCommentId { get; set; }

		#region Chat Annotations

        [ForeignKey(nameof(ChatId))]
        [InverseProperty(nameof(Instagram.Models.Main.Chat.ChatDetails))]
		#endregion Chat Annotations

        public virtual Chat Chat { get; set; }

		#region StoryComment Annotations

        [ForeignKey(nameof(StoryCommentId))]
        [InverseProperty(nameof(Instagram.Models.Main.StoryComment.ChatDetails))]
		#endregion StoryComment Annotations

        public virtual StoryComment StoryComment { get; set; }


        public ChatDetail()
        {
        }
	}
}