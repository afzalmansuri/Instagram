import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class ChatDetailBase {

//#region chatDetailId Prop
        @prop()
        chatDetailId : number;
//#endregion chatDetailId Prop


//#region messageContent Prop
        @required()
        messageContent : string;
//#endregion messageContent Prop


//#region chatDateTime Prop
        @required()
        chatDateTime : any;
//#endregion chatDateTime Prop


//#region status Prop
        @required()
        status : boolean;
//#endregion status Prop


//#region chatId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        chatId : number;
//#endregion chatId Prop


//#region storyCommentId Prop
        @prop()
        storyCommentId : number;
//#endregion storyCommentId Prop





}