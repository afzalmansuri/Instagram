import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class ViewStoryBase {

//#region viewStoryId Prop
        @prop()
        viewStoryId : number;
//#endregion viewStoryId Prop


//#region storyId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        storyId : number;
//#endregion storyId Prop


//#region viewBy Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        viewBy : number;
//#endregion viewBy Prop





}