import {StoryCommentBase} from '../database-models/story-comment-base';
import {StoryBase} from '../database-models/story-base';
import {UserBase} from '../database-models/user-base';
import {ChatDetailBase} from '../database-models/chat-detail-base';
//Generated Imports
export class StoryComment extends StoryCommentBase 
{




//#region Generated Reference Properties
//#region story Prop
        story : StoryBase;
//#endregion story Prop

//#region user Prop
        user : UserBase;
//#endregion user Prop

//#region chatDetails Prop
        chatDetails : ChatDetailBase[];
//#endregion chatDetails Prop

//#endregion Generated Reference Properties
}