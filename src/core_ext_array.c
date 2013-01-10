#include <mruby.h>
#include <mruby/value.h>
#include <mruby/array.h>

mrb_value
mrb_core_ex_ary_try_convert(mrb_state *mrb, mrb_value self)
{
  mrb_value ary;

  mrb_get_args(mrb, "o", &ary);
  return mrb_check_array_type(mrb, ary);
}

void
mrb_init_core_ex_array(mrb_state * mrb)
{
  struct RClass * a = mrb->array_class;
  mrb_define_class_method(mrb, a, "try_convert", mrb_core_ex_ary_try_convert, ARGS_REQ(1));
}
