# thrift -gen php:server -out ../ API.thrift
# 文件由后台程序员编辑提供API
namespace php Services.API

/*
 * thrift 与Ipad交互时间规范: 输入输出均为 yyyy-MM-dd HH:mm:ss 输出:1970-01-01 12:00:00为默认时间(未设置时间)
 */

/* 
 * 返回结果(string)
 */
struct Response
{
  1: required i32 errorCode, # 10000 -- 成功; 其他 -- 失败
  2: required string msg,    # 提示消息
  3: optional string data    # 附加数据
}


/*
 * 员工
 */
struct AUser
{
  1: required i32 uid,       # user id
  2: required string name    # 用户姓名
}
/*
 * 返回结果(UserList)
 */
struct ResponseUserList
{
  1: required i32 errorCode, # 10000 -- 成功; 其他 -- 失败
  2: required string msg,    # 提示消息
  3: optional list<AUser>  data,       # 附加数据
}
/*
* 授权信息
*/
struct Auth
{
1: required string AppId,
2: optional i64 uid       # 用户id
}
/*
* 错误信息
*/
exception InvalidOperation {
1: i32 whatOp,    # 错误码
2: string why     # 提示信息
}
service IpadPSR
{
# （1）登录
# 1. 获取验证码
  Response getVerificationWithCode(1: required Auth auth, 2: required string mobile) throws (1:InvalidOperation error),
}
