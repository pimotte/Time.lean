// ==============================================================================
// # Includes
// ==============================================================================

#include <lean/lean.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

#define TIME int



/**
 * External class for Time.
 * 
 * This class register `TIME *` (which is `int *` on *nix) as a lean external class.
 */
static lean_external_class *g_time_external_class = NULL;

inline static void noop_foreach(void *mod, b_lean_obj_arg fn) {}
inline static void time_finalizer(void *time_ptr)
{
}

/**
 * Initialize socket environment.
 * 
 * This function does the following things:
 * 1. register `Time` class
 * 
 * This function should always be called with `initialize`.
 */
lean_obj_res lean_time_initialize()
{
    g_time_external_class = lean_register_external_class(time_finalizer, noop_foreach);
    return lean_io_result_mk_ok(lean_box(0));
}

lean_obj_res lean_get_time(uint8_t af_obj, lean_obj_arg w)
{
    long cur_time = (unsigned long)time(NULL);
    return lean_io_result_mk_ok(lean_box_uint64(cur_time));
}