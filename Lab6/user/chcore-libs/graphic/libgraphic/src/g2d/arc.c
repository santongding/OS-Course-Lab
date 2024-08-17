/*
 * Copyright (c) 2023 Institute of Parallel And Distributed Systems (IPADS), Shanghai Jiao Tong University (SJTU)
 * Licensed under the Mulan PSL v2.
 * You can use this software according to the terms and conditions of the Mulan PSL v2.
 * You may obtain a copy of Mulan PSL v2 at:
 *     http://license.coscl.org.cn/MulanPSL2
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT, MERCHANTABILITY OR FIT FOR A PARTICULAR
 * PURPOSE.
 * See the Mulan PSL v2 for more details.
 */

/*
 * Implementation of arc functions.
 */
#include "arc.h"

#include "dc.h"

int _draw_arc(const PDC dc, int x1, int y1, int x2, int y2, int x3, int y3,
              int x4, int y4)
{
        dc_gfx(dc)->draw_arc(dc, x1, y1, x2, y2, x3, y3, x4, y4);
        return 0;
}

int _draw_ellipse(const PDC dc, int l, int t, int r, int b)
{
        dc_gfx(dc)->draw_ellipse(dc, l, t, r, b);
        return 0;
}