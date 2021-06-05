package kabam.rotmg.core.service {
import com.company.assembleegameclient.parameters.Parameters;

import flash.net.SharedObject;

import kabam.lib.tasks.BaseTask;
import kabam.rotmg.account.core.Account;
import kabam.rotmg.account.web.signals.LoginSuccessSignal;
import kabam.rotmg.account.web.view.WebLoginDialog;
import kabam.rotmg.appengine.api.AppEngineClient;
import kabam.rotmg.core.StaticInjectorContext;
import kabam.rotmg.dialogs.control.OpenDialogSignal;

public class ExtendAccessTokenTaskLauncher extends BaseTask {
   [Inject]
   public var client:AppEngineClient;
   [Inject]
   public var account:Account;
   [Inject]
   public var loginSuccess:LoginSuccessSignal;
   [Inject]
   public var webLoginDialog:WebLoginDialog;
   [Inject]
   public var openDialog:OpenDialogSignal;

   public function ExtendAccessTokenTaskLauncher() {
      super();
   }

   override protected function startTask() : void {
      this.client.setMaxRetries(2);
      this.client.complete.addOnce(this.onComplete);
      this.client.sendRequest("/account/extendAccessToken",{
         "clientToken":Parameters.data.clientToken,
         "currentToken":this.account.getAccessToken(),
         "game_net":"Unity",
         "play_platform":"Unity",
         "game_net_user_id":""
      },true);
   }

   private function onComplete(success:Boolean, response:*) : void {
      if (success) {
         var xml:XML = XML(response);
         this.account.updateUser(this.account.getUserId(), this.account.getPassword(),
                 this.account.getToken(), this.account.getSecret(),
                 xml.AccessToken,
                 xml.AccessTokenTimestamp + xml.AccessTokenExpiration * 1000);
      } else {
         SharedObject.getLocal("login", "/").clear();

         openDialog.dispatch(webLoginDialog);
         this.loginSuccess.add(this.onComplete);
      }

      completeTask(success, response);
   }
}
}
