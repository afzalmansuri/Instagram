import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class PostCommentBase {

//#region postCommentId Prop
        @prop()
        postCommentId : number;
//#endregion postCommentId Prop


//#region postId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        postId : number;
//#endregion postId Prop


//#region comment Prop
        @required()
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





}