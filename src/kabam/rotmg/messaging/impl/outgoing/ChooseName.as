package kabam.rotmg.messaging.impl.outgoing {
import flash.utils.IDataOutput;

public class ChooseName extends OutgoingMessage {

    public function ChooseName(param1:uint, param2:Function) {
        super(param1, param2);
    }
    public var name_:String;

    override public function writeToOutput(param1:IDataOutput):void {
        param1.writeUTF(this.name_);
    }

    override public function toString():String {
        return formatToString("CHOOSENAME", "name_");
    }
}
}
