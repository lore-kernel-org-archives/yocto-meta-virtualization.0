Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDF9FE0051D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 14:13:43 -0700 (PDT)
Received: by mail-lb0-f176.google.com with SMTP id x10so3579787lbi.7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 14:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=qyo7YgQqwOvSeIwbmjUxyPY+KPq/0H7lVRhjS29HEkI=;
	b=sM37N8IY10BqOf1I4Bny6uDU822jbhC+5v/rxmmuzVxLmL4E2ZICriqD2k0oo7U8bL
	qzwCvL9X0mCpnOj36hQnZYtUPPboOo2MDVkAP58V74wNZY+DZW6B18MNzUc5sgJfo+Sd
	WWPh0WmdE19QnUoS3Qa3JeLiPVCedKDAyXpTQoUz3wP3BXz9+K0gZ6MniG0FCt4PcwRC
	ajRqYWDbAJ5jBbbuvTXx95fTxMBTaKcahfuBkFcFbFAjLXfe0sZA9P+Eje91wNxQOT4F
	JhQwULjVpMRRNbc6MjOv26pxcjH9hX4cSvJXpxoYQauR+NM/XcubFT0WPHtClbSPv5/Z
	PzbQ==
MIME-Version: 1.0
X-Received: by 10.112.159.10 with SMTP id wy10mr2821245lbb.95.1368738822128;
	Thu, 16 May 2013 14:13:42 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Thu, 16 May 2013 14:13:42 -0700 (PDT)
In-Reply-To: <1368695384-23136-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1368695384-23136-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Thu, 16 May 2013 17:13:42 -0400
Message-ID: <CADkTA4OY01m76Hga0zOxbizmztpZTngbs7+9Vhh9kO742r3GQg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] busybox awk: make -F STR interpret escape sequences
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
X-List-Received-Date: Thu, 16 May 2013 21:13:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 16, 2013 at 5:09 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> Patch implements functionality mentioned in the title and has
> been applied to busybox 1.21.0. This patch is included into the
> meta-virtualization layer since it provides awk functionality to
> the lxc-clone command in the lxc containers package.

I've grabbed and staged this change. I'll push it tomorrow if no one
objects.

Bruce

>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  recipes-core/busybox/busybox_1.20.2.bbappend       |  4 +-
>  .../busybox-awk-make--F-STR-interpret-escape.patch | 90 ++++++++++++++++++++++
>  2 files changed, 93 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-core/busybox/busybox_1.20.2/busybox-awk-make--F-STR-interpret-escape.patch
>
> diff --git a/recipes-core/busybox/busybox_1.20.2.bbappend b/recipes-core/busybox/busybox_1.20.2.bbappend
> index 43b3524..b04339a 100644
> --- a/recipes-core/busybox/busybox_1.20.2.bbappend
> +++ b/recipes-core/busybox/busybox_1.20.2.bbappend
> @@ -1 +1,3 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}/${MACHINE}:${THISDIR}/${PN}/${MACHINE}:${THISDIR}/${PN}-${PV}:${THISDIR}/${PN}:"
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}_${PV}:${THISDIR}/${PN}-${PV}/${MACHINE}:${THISDIR}/${PN}/${MACHINE}:${THISDIR}/${PN}-${PV}:${THISDIR}/${PN}:"
> +
> +SRC_URI += "file://busybox-awk-make--F-STR-interpret-escape.patch"
> diff --git a/recipes-core/busybox/busybox_1.20.2/busybox-awk-make--F-STR-interpret-escape.patch b/recipes-core/busybox/busybox_1.20.2/busybox-awk-make--F-STR-interpret-escape.patch
> new file mode 100644
> index 0000000..e6a9d7a
> --- /dev/null
> +++ b/recipes-core/busybox/busybox_1.20.2/busybox-awk-make--F-STR-interpret-escape.patch
> @@ -0,0 +1,90 @@
> +From ea664dde87d8e52df7d4003d988352a66562a945 Mon Sep 17 00:00:00 2001
> +From: Denys Vlasenko <vda.linux@googlemail.com>
> +Date: Fri, 22 Jun 2012 16:41:01 +0000
> +Subject: awk: make -F STR interpret escape sequences. Closes 5126
> +
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +---
> +diff --git a/editors/awk.c b/editors/awk.c
> +index 71abca2..d69720d 100644
> +--- a/editors/awk.c
> ++++ b/editors/awk.c
> +@@ -696,6 +696,10 @@ static char nextchar(char **s)
> +       pps = *s;
> +       if (c == '\\')
> +               c = bb_process_escape_sequence((const char**)s);
> ++      /* Example awk statement:
> ++       * s = "abc\"def"
> ++       * we must treat \" as "
> ++       */
> +       if (c == '\\' && *s == pps) { /* unrecognized \z? */
> +               c = *(*s); /* yes, fetch z */
> +               if (c)
> +@@ -704,6 +708,15 @@ static char nextchar(char **s)
> +       return c;
> + }
> +
> ++/* TODO: merge with strcpy_and_process_escape_sequences()?
> ++ */
> ++static void unescape_string_in_place(char *s1)
> ++{
> ++      char *s = s1;
> ++      while ((*s1 = nextchar(&s)) != '\0')
> ++              s1++;
> ++}
> ++
> + static ALWAYS_INLINE int isalnum_(int c)
> + {
> +       return (isalnum(c) || c == '_');
> +@@ -2992,7 +3005,7 @@ static int awk_exit(int r)
> +  * otherwise return 0 */
> + static int is_assignment(const char *expr)
> + {
> +-      char *exprc, *val, *s, *s1;
> ++      char *exprc, *val;
> +
> +       if (!isalnum_(*expr) || (val = strchr(expr, '=')) == NULL) {
> +               return FALSE;
> +@@ -3002,10 +3015,7 @@ static int is_assignment(const char *expr)
> +       val = exprc + (val - expr);
> +       *val++ = '\0';
> +
> +-      s = s1 = val;
> +-      while ((*s1 = nextchar(&s)) != '\0')
> +-              s1++;
> +-
> ++      unescape_string_in_place(val);
> +       setvar_u(newvar(exprc), val);
> +       free(exprc);
> +       return TRUE;
> +@@ -3118,8 +3128,10 @@ int awk_main(int argc, char **argv)
> +       opt = getopt32(argv, "F:v:f:W:", &opt_F, &list_v, &list_f, NULL);
> +       argv += optind;
> +       argc -= optind;
> +-      if (opt & 0x1)
> +-              setvar_s(intvar[FS], opt_F); // -F
> ++      if (opt & 0x1) { /* -F */
> ++              unescape_string_in_place(opt_F);
> ++              setvar_s(intvar[FS], opt_F);
> ++      }
> +       while (list_v) { /* -v */
> +               if (!is_assignment(llist_pop(&list_v)))
> +                       bb_show_usage();
> +diff --git a/testsuite/awk.tests b/testsuite/awk.tests
> +index e671907..d4c390d 100755
> +--- a/testsuite/awk.tests
> ++++ b/testsuite/awk.tests
> +@@ -43,6 +43,11 @@ testing "awk long field sep" "awk -F-- '{ print NF, length(\$NF), \$NF }'" \
> +       "" \
> +       "a--\na--b--\na--b--c--\na--b--c--d--"
> +
> ++testing "awk -F handles escapes" "awk -F'\\x21' '{print \$1}'" \
> ++      "a\n" \
> ++      "" \
> ++      "a!b\n"
> ++
> + # '@(samp|code|file)\{' is an invalid extended regex (unmatched '{'),
> + # but gawk 3.1.5 does not bail out on it.
> + testing "awk gsub falls back to non-extended-regex" \
> +--
> +cgit v0.9.1
> --
> 1.7.11.7
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

