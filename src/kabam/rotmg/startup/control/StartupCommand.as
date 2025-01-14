package kabam.rotmg.startup.control {
import kabam.lib.tasks.TaskMonitor;

public class StartupCommand {

    public function StartupCommand() {
        super();
    }

    [Inject]
    public var startup:StartupSequence;
    [Inject]
    public var monitor:TaskMonitor;

    public function execute():void {
        this.monitor.add(this.startup);
        this.startup.start();
    }
}
}
