import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class UserPrivacyBase {

//#region userPrivacyId Prop
        @prop()
        userPrivacyId : number;
//#endregion userPrivacyId Prop


//#region accountPrivacyType Prop
        @required()
        @maxLength({value:20})
        accountPrivacyType : string;
//#endregion accountPrivacyType Prop



}