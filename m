Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AC19E00DD7; Thu,  8 Mar 2018 13:15:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E16E9E008FB
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Mar 2018 13:15:56 -0800 (PST)
Received: by mail-lf0-f68.google.com with SMTP id l191-v6so10350621lfe.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 08 Mar 2018 13:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SntiE4BmXvXjnZEpNGrGuJLgwDa0G14NP+Gw9LEye2g=;
	b=SZ5BJkXbnRJDjF1ckPhAbdaKQPYYbkLCq+8I0oBicfvrmU/t10VX/cpCcOCQYBieFJ
	vZjSdFiVou4+85Xraj1PmwkWJeiPmkQ0L5tybVI+T7EjqyY5c9JUqbbXsT/BhPmmBn0X
	4bSMHz9umAwgeu/5sq0o9LQky8HX4PrhI66JEaBzAaALR4ueyrCVblcT64ReQZnH19Lk
	1zaGP2UYlKigIZqlYoGGIgXrJIzKiinJ0ht07116fOnlnRGFUMsoAEMzjvPrgRDATKjc
	aEntGQqGmsYt/tJ/Sl+xRINV5+aA02JF4NH9+RNX3pegMatflmPMqmTJwJS+9NCxWj+8
	ecdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SntiE4BmXvXjnZEpNGrGuJLgwDa0G14NP+Gw9LEye2g=;
	b=ualvGXfpseUw+G7064c4y5kJE22Pb2sknpwH3/P3xV0cyTDVkVAozw1PWCLXtdULQO
	OQ+GWF1VydfBQBGtBhbLFycd+cXTtBHyYmeCmOmsNSs6J7ZwpDRIsd55RRrgkReq++ay
	NZ++G6BqRagnlWFAvKMjxs4uvam0fB+2qgNzwAiLPpbPtT1/R/kdX/0L6OeUyAcnBIrm
	zuKBgGahCQz5j0SYWayflXKDDXWgSSy5kLBSKCPz1V4tA7lRqd9h7AXsSMfOF4qVv0YB
	qjQ6eB6xm3PcNZEvCoezxOYUj8y5LjpgU/pgwLSj+f4cHhXOODC+LftjDXRNUZ68bx/A
	gFzQ==
X-Gm-Message-State: AElRT7HsLkY1gk4PtxNaIgWS6wyqthIDIbY7xv72d6CmgRtUlAZ9yU8v
	vx2DRj8SuCHATVm42ga9afpRgysXPwy32Pod0lc=
X-Google-Smtp-Source: AG47ELsTigOyhIHVLmEMLlAEUfhWxeCo2ZyPYEpHbytEQTwGr5dL+POYKmYpkJcPo8oEdkkiuj6biCSBK/fD5YioTfI=
X-Received: by 10.25.92.1 with SMTP id q1mr20315621lfb.126.1520543755434; Thu,
	08 Mar 2018 13:15:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Thu, 8 Mar 2018 13:15:54 -0800 (PST)
In-Reply-To: <1520027171-22955-1-git-send-email-jason.wessel@windriver.com>
References: <1520027171-22955-1-git-send-email-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Mar 2018 16:15:54 -0500
Message-ID: <CADkTA4ObWkerSUWHOL639RN+_52CBCKbt1fNYSCPSVXH-uJCVw@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] spice: Fix compile errors from gcc 7 with spice 0.12.4
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Mar 2018 21:15:58 -0000
Content-Type: text/plain; charset="UTF-8"

Applied.

I had a reject when working with the patch, so double check that I
resolved things properly.

Bruce

On Fri, Mar 2, 2018 at 4:46 PM, Jason Wessel <jason.wessel@windriver.com> wrote:
> ../../git/server/red_parse_qxl.c:367:18: error: 'BITMAP_FMT_IS_RGB' defined but not used [-Werror=unused-const-variable=]
>  static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1};
>                   ^~~~~~~~~~~~~~~~~
> ../../git/server/inputs_channel.c: In function 'inputs_channel_handle_parsed':
> ../../git/server/inputs_channel.c:317:38: error: this statement may fall through [-Werror=implicit-fallthrough=]
>      case SPICE_MSGC_INPUTS_KEY_DOWN: {
>                                       ^
> ../../git/server/inputs_channel.c:324:5: note: here
>      case SPICE_MSGC_INPUTS_KEY_UP: {
>      ^~~~
> ../../git/server/reds.c: In function 'vdi_port_read_one_msg_from_device':
> ../../git/server/reds.c:797:31: error: this statement may fall through [-Werror=implicit-fallthrough=]
>              state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
>              ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../../git/server/reds.c:798:9: note: here
>          case VDI_PORT_READ_STATE_GET_BUFF: {
>          ^~~~
> ../../git/server/reds.c:807:31: error: this statement may fall through [-Werror=implicit-fallthrough=]
>              state->read_state = VDI_PORT_READ_STATE_READ_DATA;
>              ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../../git/server/reds.c:809:9: note: here
>          case VDI_PORT_READ_STATE_READ_DATA:
>          ^~~~
>
> This patch just adds the fallthrough comments which are already
> checked in upstream along with the removal of the static variable
> which is not used.
>
> The newer versions of spice already have this fixed, so there is no
> need to further upstream this patch.  It gets dropped in the future.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  ...ompile-problems-against-spice-0.12.4-with.patch | 88 ++++++++++++++++++++++
>  recipes-support/spice/spice_git.bb                 |  1 +
>  2 files changed, 89 insertions(+)
>  create mode 100644 recipes-support/spice/files/v0.12.4_0001-spice-Fix-compile-problems-against-spice-0.12.4-with.patch
>
> diff --git a/recipes-support/spice/files/v0.12.4_0001-spice-Fix-compile-problems-against-spice-0.12.4-with.patch b/recipes-support/spice/files/v0.12.4_0001-spice-Fix-compile-problems-against-spice-0.12.4-with.patch
> new file mode 100644
> index 0000000..cd5eb85
> --- /dev/null
> +++ b/recipes-support/spice/files/v0.12.4_0001-spice-Fix-compile-problems-against-spice-0.12.4-with.patch
> @@ -0,0 +1,88 @@
> +From 26ae6be2c1ac03e6ea017f58d0b126c9eebae5f9 Mon Sep 17 00:00:00 2001
> +From: Jason Wessel <jason.wessel@windriver.com>
> +Date: Fri, 2 Mar 2018 10:47:09 -0600
> +Subject: [PATCH] spice: Fix compile problems against spice 0.12.4 with gcc 7
> +
> +These errors are generated by gcc 7.
> +
> +../../git/server/red_parse_qxl.c:367:18: error: 'BITMAP_FMT_IS_RGB' defined but not used [-Werror=unused-const-variable=]
> + static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1};
> +                  ^~~~~~~~~~~~~~~~~
> +../../git/server/inputs_channel.c: In function 'inputs_channel_handle_parsed':
> +../../git/server/inputs_channel.c:317:38: error: this statement may fall through [-Werror=implicit-fallthrough=]
> +     case SPICE_MSGC_INPUTS_KEY_DOWN: {
> +                                      ^
> +../../git/server/inputs_channel.c:324:5: note: here
> +     case SPICE_MSGC_INPUTS_KEY_UP: {
> +     ^~~~
> +../../git/server/reds.c: In function 'vdi_port_read_one_msg_from_device':
> +../../git/server/reds.c:797:31: error: this statement may fall through [-Werror=implicit-fallthrough=]
> +             state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
> +             ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +../../git/server/reds.c:798:9: note: here
> +         case VDI_PORT_READ_STATE_GET_BUFF: {
> +         ^~~~
> +../../git/server/reds.c:807:31: error: this statement may fall through [-Werror=implicit-fallthrough=]
> +             state->read_state = VDI_PORT_READ_STATE_READ_DATA;
> +             ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +../../git/server/reds.c:809:9: note: here
> +         case VDI_PORT_READ_STATE_READ_DATA:
> +         ^~~~
> +
> +This patch just adds the fallthrough comments which are already
> +checked in upstream along with the removal of the static variable
> +which is not used.
> +---
> + server/inputs_channel.c | 1 +
> + server/red_parse_qxl.c  | 4 ----
> + server/reds.c           | 2 ++
> + spice-common            | 2 +-
> + 4 files changed, 4 insertions(+), 5 deletions(-)
> +
> +diff --git a/server/inputs_channel.c b/server/inputs_channel.c
> +index 931dac1..d6805c4 100644
> +--- a/server/inputs_channel.c
> ++++ b/server/inputs_channel.c
> +@@ -321,6 +321,7 @@ static int inputs_channel_handle_parsed(RedChannelClient *rcc, uint32_t size, ui
> +             activate_modifiers_watch();
> +         }
> +     }
> ++    /* fallthrough */
> +     case SPICE_MSGC_INPUTS_KEY_UP: {
> +         SpiceMsgcKeyDown *key_down = (SpiceMsgcKeyDown *)buf;
> +         for (i = 0; i < 4; i++) {
> +diff --git a/server/red_parse_qxl.c b/server/red_parse_qxl.c
> +index 6c0b065..c361e6b 100644
> +--- a/server/red_parse_qxl.c
> ++++ b/server/red_parse_qxl.c
> +@@ -362,10 +362,6 @@ static int bitmap_consistent(SpiceBitmap *bitmap)
> +     return TRUE;
> + }
> +
> +-// This is based on SPICE_BITMAP_FMT_*, copied from server/red_worker.c
> +-// to avoid a possible unoptimization from making it non static.
> +-static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1};
> +-
> + static SpiceImage *red_get_image(RedMemSlotInfo *slots, int group_id,
> +                                  QXLPHYSICAL addr, uint32_t flags, int is_mask)
> + {
> +diff --git a/server/reds.c b/server/reds.c
> +index 6f262b0..4246170 100644
> +--- a/server/reds.c
> ++++ b/server/reds.c
> +@@ -795,6 +795,7 @@ static SpiceCharDeviceMsgToClient *vdi_port_read_one_msg_from_device(SpiceCharDe
> +             }
> +             state->message_recive_len = state->vdi_chunk_header.size;
> +             state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
> ++            /* fallthrough */
> +         case VDI_PORT_READ_STATE_GET_BUFF: {
> +             if (!(state->current_read_buf = vdi_port_read_buf_get())) {
> +                 return NULL;
> +@@ -806,6 +807,7 @@ static SpiceCharDeviceMsgToClient *vdi_port_read_one_msg_from_device(SpiceCharDe
> +             state->message_recive_len -= state->recive_len;
> +             state->read_state = VDI_PORT_READ_STATE_READ_DATA;
> +         }
> ++        /* fallthrough */
> +         case VDI_PORT_READ_STATE_READ_DATA:
> +             n = sif->read(vdagent, state->recive_pos, state->recive_len);
> +             if (!n) {
> diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/spice_git.bb
> index 828087a..ac30de9 100644
> --- a/recipes-support/spice/spice_git.bb
> +++ b/recipes-support/spice/spice_git.bb
> @@ -35,6 +35,7 @@ SRC_URI += " \
>          file://spice-fix-CVE-2013-4282.patch \
>          file://configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.patch \
>          file://build-allow-separated-src-and-build-dirs.patch \
> +        file://v0.12.4_0001-spice-Fix-compile-problems-against-spice-0.12.4-with.patch \
>          "
>
>  S = "${WORKDIR}/git"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

