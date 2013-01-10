#include <mruby.h>
#include <mruby/array.h>

void
mrb_init_core_ex_module(mrb_state * mrb)
{
  struct RClass *core_ex_mod;

  core_ex_mod = mrb_define_module(mrb, "CoreEx");
}
