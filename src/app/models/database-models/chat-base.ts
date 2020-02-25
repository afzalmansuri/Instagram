import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class ChatBase {

//#region chatId Prop
        @prop()
        chatId : number;
//#endregion chatId Prop


//#region senderId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        senderId : number;
//#endregion senderId Prop


//#region recieverId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        recieverId : number;
//#endregion recieverId Prop







}