import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class StoryTagBase {

//#region storyTagId Prop
        @prop()
        storyTagId : number;
//#endregion storyTagId Prop


//#region storyId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        storyId : number;
//#endregion storyId Prop


//#region taggedUserId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        taggedUserId : number;
//#endregion taggedUserId Prop


//#region tagDateTime Prop
        @required()
        tagDateTime : any;
//#endregion tagDateTime Prop





}