package kabam.rotmg.dialogs.model {
import org.osflash.signals.Signal;

public class PopupQueueEntry {

    public function PopupQueueEntry(param1:String, param2:Signal, param3:int, param4:Object) {
        super();
        this._name = param1;
        this._signal = param2;
        this._showingPerDay = param3;
        this._paramObject = param4;
    }

    private var _name:String;

    public function get name():String {
        return this._name;
    }

    public function set name(param1:String):void {
        this._name = param1;
    }

    private var _signal:Signal;

    public function get signal():Signal {
        return this._signal;
    }

    public function set signal(param1:Signal):void {
        this._signal = param1;
    }

    private var _showingPerDay:int;

    public function get showingPerDay():int {
        return this._showingPerDay;
    }

    public function set showingPerDay(param1:int):void {
        this._showingPerDay = param1;
    }

    private var _paramObject:Object;

    public function get paramObject():Object {
        return this._paramObject;
    }

    public function set paramObject(param1:Object):void {
        this._paramObject = param1;
    }
}
}
