#include <mruby.h>
#include <mruby/value.h>
#include <mruby/hash.h>

extern mrb_value mrb_hash_assoc(mrb_state *mrb, mrb_value hash);

/*
 *  call-seq:
 *     Hash.try_convert(obj) -> hash or nil
 *
 *  Try to convert <i>obj</i> into a hash, using to_hash method.
 *  Returns converted hash or nil if <i>obj</i> cannot be converted
 *  for any reason.
 *
 *     Hash.try_convert({1=>2})   # => {1=>2}
 *     Hash.try_convert("1=>2")   # => nil
 */
static mrb_value
mrb_core_ex_hash_try_convert(mrb_state *mrb, mrb_value self)
{
  mrb_value hash;

  mrb_get_args(mrb, "o", &hash);
  return mrb_check_hash_type(mrb, hash);
}

void
mrb_init_core_ex_hash(mrb_state * mrb)
{
  struct RClass *h;

  h = mrb->hash_class;
  mrb_define_class_method(mrb, h, "try_convert", mrb_core_ex_hash_try_convert, ARGS_REQ(1));
  mrb_define_method(mrb, h, "assoc", mrb_hash_assoc, ARGS_REQ(1));
}
