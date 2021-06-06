package kabam.rotmg.messaging.impl.outgoing {
import flash.utils.IDataOutput;

public class ActivePetUpdateRequest extends OutgoingMessage {

    public function ActivePetUpdateRequest(param1:uint, param2:Function) {
        super(param1, param2);
    }
    public var commandtype:uint;
    public var instanceid:uint;

    override public function writeToOutput(param1:IDataOutput):void {
        param1.writeByte(this.commandtype);
        param1.writeInt(this.instanceid);
    }
}
}
