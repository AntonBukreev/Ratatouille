/**
 * Created with IntelliJ IDEA.
 * User: rem
 * Date: 12.04.15
 * Time: 17:35
 * To change this template use File | Settings | File Templates.
 */
package code.data {
public class UserVO
{

    public var uid:String;
    public var name:String;
    public var secondName:String;
    public var ico:String;
    public var online:Boolean;



    public function UserVO(uid:String, name:String, secondName:String, ico:String, online:String)
    {
        this.uid = uid;
        this.name = name;
        this.secondName = secondName;
        this.ico = ico;
        this.online = online == "1";
    }
}
}
