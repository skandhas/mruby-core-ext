#include <mruby.h>
#include <mruby/value.h>
#include <mruby/string.h>

/*
 *  call-seq:
 *     String.try_convert(obj) -> string or nil
 *
 *  Try to convert <i>obj</i> into a String, using to_str method.
 *  Returns converted string or nil if <i>obj</i> cannot be converted
 *  for any reason.
 *
 *     String.try_convert("str")     #=> "str"
 *     String.try_convert(/re/)      #=> nil
 */

static mrb_value
mrb_core_ex_str_try_convert(mrb_state *mrb, mrb_value self)
{
  mrb_value o;

  mrb_get_args(mrb, "o", &o);
  return mrb_check_string_type(mrb, o);
}

void
mrb_init_core_ex_string(mrb_state * mrb)
{
  struct RClass *s;

  s = mrb->string_class;
  mrb_define_class_method(mrb, s, "try_convert", mrb_core_ex_str_try_convert, ARGS_REQ(1));
}

