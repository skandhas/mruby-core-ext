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

mrb_value
mrb_core_ex_ary_assoc(mrb_state *mrb, mrb_value ary)
{
  long i;
  mrb_value v, k;

  mrb_get_args(mrb, "o", &k);

  for (i = 0; i < RARRAY_LEN(ary); ++i) {
    v = mrb_check_array_type(mrb, RARRAY_PTR(ary)[i]);
    if (!mrb_nil_p(v) && RARRAY_LEN(v) > 0 &&
        mrb_equal(mrb, RARRAY_PTR(v)[0], k))
      return v;
  }
  return mrb_nil_value();
}

void
mrb_init_core_ex_array(mrb_state * mrb)
{
  struct RClass * a = mrb->array_class;
  mrb_define_class_method(mrb, a, "try_convert", mrb_core_ex_ary_try_convert, ARGS_REQ(1));
  mrb_define_method(mrb, a, "assoc", mrb_core_ex_ary_assoc, ARGS_REQ(1));
}
