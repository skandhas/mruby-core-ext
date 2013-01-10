#include <mruby.h>
#include <mruby/value.h>
#include <mruby/array.h>

/*
 *  call-seq:
 *     Array.try_convert(obj) -> array or nil
 *
 *  Try to convert <i>obj</i> into an array, using +to_ary+ method.
 *  Returns converted array or +nil+ if <i>obj</i> cannot be converted
 *  for any reason. This method can be used to check if an argument is an
 *  array.
 *
 *     Array.try_convert([1])   #=> [1]
 *     Array.try_convert("1")   #=> nil
 *
 *     if tmp = Array.try_convert(arg)
 *       # the argument is an array
 *     elsif tmp = String.try_convert(arg)
 *       # the argument is a string
 *     end
 *
 */

static mrb_value
mrb_core_ex_ary_try_convert(mrb_state *mrb, mrb_value self)
{
  mrb_value ary;

  mrb_get_args(mrb, "o", &ary);
  return mrb_check_array_type(mrb, ary);
}

/*
 *  call-seq:
 *     ary.assoc(obj)   -> new_ary  or  nil
 *
 *  Searches through an array whose elements are also arrays
 *  comparing _obj_ with the first element of each contained array
 *  using obj.==.
 *  Returns the first contained array that matches (that
 *  is, the first associated array),
 *  or +nil+ if no match is found.
 *  See also <code>Array#rassoc</code>.
 *
 *     s1 = [ "colors", "red", "blue", "green" ]
 *     s2 = [ "letters", "a", "b", "c" ]
 *     s3 = "foo"
 *     a  = [ s1, s2, s3 ]
 *     a.assoc("letters")  #=> [ "letters", "a", "b", "c" ]
 *     a.assoc("foo")      #=> nil
 */

static mrb_value
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

/*
 *  call-seq:
 *     ary.rassoc(obj) -> new_ary or nil
 *
 *  Searches through the array whose elements are also arrays. Compares
 *  _obj_ with the second element of each contained array using
 *  <code>==</code>. Returns the first contained array that matches. See
 *  also <code>Array#assoc</code>.
 *
 *     a = [ [ 1, "one"], [2, "two"], [3, "three"], ["ii", "two"] ]
 *     a.rassoc("two")    #=> [2, "two"]
 *     a.rassoc("four")   #=> nil
 */

static mrb_value
mrb_core_ex_ary_rassoc(mrb_state *mrb, mrb_value ary)
{
  long i;
  mrb_value v, value;

  mrb_get_args(mrb, "o", &value);

  for (i = 0; i < RARRAY_LEN(ary); ++i) {
    v = RARRAY_PTR(ary)[i];
    if (mrb_type(v) == MRB_TT_ARRAY &&
        RARRAY_LEN(v) > 1 &&
        mrb_equal(mrb, RARRAY_PTR(v)[1], value))
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
  mrb_define_method(mrb, a, "rassoc", mrb_core_ex_ary_rassoc, ARGS_REQ(1));
}
