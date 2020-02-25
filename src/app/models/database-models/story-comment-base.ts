import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class StoryCommentBase {

//#region storyCommentId Prop
        @prop()
        storyCommentId : number;
//#endregion storyCommentId Prop


//#region comment Prop
        @required()
        @maxLength({value:50})
        comment : string;
//#endregion comment Prop


//#region commentUserId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        commentUserId : number;
//#endregion commentUserId Prop


//#region commentDateTime Prop
        @required()
        commentDateTime : any;
//#endregion commentDateTime Prop


//#region storyId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        storyId : number;
//#endregion storyId Prop







}