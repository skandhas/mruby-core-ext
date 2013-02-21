#include <mruby.h>
#include <mruby/value.h>
#include <mruby/array.h>

void mrb_init_core_ex_array(mrb_state * mrb);
void mrb_init_core_ex_hash(mrb_state * mrb);
void mrb_init_core_ex_string(mrb_state * mrb);

void
mrb_mruby_core_ext_gem_init(mrb_state * mrb)
{
  mrb_init_core_ex_array(mrb);
  mrb_init_core_ex_hash(mrb);
  mrb_init_core_ex_string(mrb);
}

void
mrb_mruby_core_ext_gem_final(mrb_state * mrb)
{
}
