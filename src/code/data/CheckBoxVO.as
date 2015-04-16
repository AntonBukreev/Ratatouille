/**
 * Created with IntelliJ IDEA.
 * User: rem
 * Date: 12.04.15
 * Time: 19:24
 * To change this template use File | Settings | File Templates.
 */
package code.data {
public class CheckBoxVO
{
    public var user:UserVO;
    public var selected:Boolean = false;

    public function CheckBoxVO(user:UserVO)
    {
        this.user = user;
    }
}
}
