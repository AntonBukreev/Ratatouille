/**
 * Created with IntelliJ IDEA.
 * User: rem
 * Date: 11.04.15
 * Time: 20:45
 * To change this template use File | Settings | File Templates.
 */
package code.events {
import flash.events.Event;

public class GameEvent extends Event
{
    public static const EVENT_SOCIAL_CONNECT:String = "EVENT_SOCIAL_CONNECT";

    public var data:Object;

    public function GameEvent(type:String, data:Object = null)
    {
        this.data = data;
        super(type, false, false);
    }
}
}
