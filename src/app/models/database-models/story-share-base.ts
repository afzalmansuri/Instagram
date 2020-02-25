import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class StoryShareBase {

//#region storyShareId Prop
        @prop()
        storyShareId : number;
//#endregion storyShareId Prop


//#region shareBy Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        shareBy : number;
//#endregion shareBy Prop


//#region shareTo Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        shareTo : number;
//#endregion shareTo Prop


//#region storyId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        storyId : number;
//#endregion storyId Prop


//#region shareDateTime Prop
        @required()
        shareDateTime : any;
//#endregion shareDateTime Prop


//#region userPrivacyId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        userPrivacyId : number;
//#endregion userPrivacyId Prop









}