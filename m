Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC44CE00C2E; Tue, 25 Jul 2017 06:09:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15840E00C2B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 06:09:43 -0700 (PDT)
Received: by mail-lf0-f41.google.com with SMTP id t128so26124463lff.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pMT3qpwsMOtpiqBChUIOKAKNkWKJiNKpAAx/48sqtjY=;
	b=VH5koBafiB9SH55/4Dg+KRhNkbgjH+pHRsKwvCmuRG0nOQRE3b273p++PEsyLB1BAM
	XT/d3MbLKuQ+G/cG8npGpC55cngwGhi0PiA5PuYdFSNSY5DBhbtes0CsHhTkZgBBvy6k
	7LtUVsPPn6Fu/aNHxb/fwFAilkAEqCx5uRrZRriyJVY0TMN/1c69HG6tip6QpHEMNNPe
	m9pDuXDCMnu9CF8ozaS2/bVFSLcWl9gnh/6dE7PkMSfV30UAUq68zFmjT0MSPoHwF2B/
	x62IPafuQh+R/QCwJ86nJLBgE6oQLNN13jI/fj1hALBiqmPkza/9TUT09XHEiW7CGGg5
	72Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pMT3qpwsMOtpiqBChUIOKAKNkWKJiNKpAAx/48sqtjY=;
	b=biPMnxH8t1UzANUN+Wht6ZFT7jC7m2bKjuZ75864VN6+CtWWM+iX1ZBkCkfUjh9vUW
	fVFY6yT6Chsb0xQldm8ymN4jtgLRKKpnZJKtSNDJr0RV+k6MFu4PatuCCgLT0ahTgpRC
	4ZNL23hcAndd4X3/9lryeMbfPGzVrEF12pmwH4CcScJok90m+Izz6UYBs9L8RFDRrsMO
	U0TScQSAhqdwZhUWEVkZjXdw1xizNJSzo5n5IUkKB7otaqlXQxL9+IZGAEzkPCKGAm4H
	F0VD6N2VeZ9KeJV2KkOhmHesqOZ1DwHR2PS3dCrVQ2sTe15YjDxoQKk64ddWF7VfBE1E
	k4GQ==
X-Gm-Message-State: AIVw111ci5nzUwFh5CBccJWGZW7cTehr57Iv17nZu8bTkrne7tZFDHC6
	KcsoR99jcPvHxCTq3fNnfS1eJt0bGA==
X-Received: by 10.46.81.1 with SMTP id f1mr1245714ljb.142.1500988182820; Tue,
	25 Jul 2017 06:09:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.14.2 with HTTP; Tue, 25 Jul 2017 06:09:42 -0700 (PDT)
In-Reply-To: <bd999f08-bffd-3779-6f64-ce45836f3b4a@windriver.com>
References: <1500866837-1666-1-git-send-email-zhe.he@windriver.com>
	<bd999f08-bffd-3779-6f64-ce45836f3b4a@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Jul 2017 09:09:42 -0400
Message-ID: <CADkTA4MfeXYU6+c1t-_+XLZPGYxzFKb0TtC3gVWDpgVCFs9tdg@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] spice: Fix build failures
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
X-List-Received-Date: Tue, 25 Jul 2017 13:09:45 -0000
Content-Type: multipart/alternative; boundary="f403045ff0d872fef00555240b0c"

--f403045ff0d872fef00555240b0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged.

Bruce

On Mon, Jul 24, 2017 at 2:08 AM, He Zhe <zhe.he@windriver.com> wrote:

> Actually this is for =EF=BD=8D=EF=BD=85=EF=BD=94=EF=BD=81-cloud-services.
>
> On 2017=E5=B9=B407=E6=9C=8824=E6=97=A5 11:27, zhe.he@windriver.com wrote:
> > From: He Zhe <zhe.he@windriver.com>
> >
> > Backport 3cb746329ea4846bd9c65e0198e69423379b6f62 "Use PRI macros in
> printf to
> > keep compatibility between 32/64bit system" from upstream to fix the
> following
> > errors:
> >
> > server/jpeg_encoder.c:639:17: error: format '%lu' expects argument of
> type 'long
> > unsigned int', but argument 12 has type 'uint64_t {aka long long
> unsigned int}'
> > [-Werror=3Dformat=3D]
> >
> > server/mjpeg_encoder.c:639:17: error: format '%lu' expects argument of
> type
> > 'long unsigned int', but argument 13 has type 'uint64_t {aka long long
> unsigned
> > int}' [-Werror=3Dformat=3D]
> >
> > server/mjpeg_encoder.c:706:21: error: format '%lu' expects argument of
> type
> > 'long unsigned int', but argument 6 has type 'uint64_t {aka long long
> unsigned
> > int}' [-Werror=3Dformat=3D]
> >
> > server/mjpeg_encoder.c:706:21: error: format '%lu' expects argument of
> type
> > 'long unsigned int', but argument 7 has type 'uint64_t {aka long long
> unsigned
> > int}' [-Werror=3Dformat=3D]
> >
> > server/mjpeg_encoder.c:936:75: error: integer overflow in expression
> > [-Werror=3Doverflow]
> >
> > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > ---
> >  ...ros-in-printf-to-keep-compatibility-betwe.patch | 72
> ++++++++++++++++++++++
> >  recipes-support/spice/spice_git.bb                 |  1 +
> >  2 files changed, 73 insertions(+)
> >  create mode 100644 recipes-support/spice/files/
> 0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch
> >
> > diff --git a/recipes-support/spice/files/0001-Use-PRI-macros-in-printf-
> to-keep-compatibility-betwe.patch b/recipes-support/spice/files/
> 0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch
> > new file mode 100644
> > index 0000000..18fa8fa
> > --- /dev/null
> > +++ b/recipes-support/spice/files/0001-Use-PRI-macros-in-printf-
> to-keep-compatibility-betwe.patch
> > @@ -0,0 +1,72 @@
> > +From 3cb746329ea4846bd9c65e0198e69423379b6f62 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?=3DEC=3D86=3D8C=3DEB=3DB3=3D91=3DEC=3DB2=3DA0?=3D <b=
yungchul.so@samsung.com
> >
> > +Date: Thu, 24 Apr 2014 12:26:32 +0000
> > +Subject: [PATCH] Use PRI macros in printf to keep compatibility betwee=
n
> > + 32/64bit system
> > +
> > +gcc's some integer type definitions are different between 32/64bit
> system.
> > +This causes platform dependency problem with printf function. However,
> > +we can avoid this problem by using PRI macros that supports platform
> > +independent printf.
> > +---
> > + server/mjpeg_encoder.c | 7 ++++---
> > + server/red_worker.c    | 4 ++--
> > + 2 files changed, 6 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/server/mjpeg_encoder.c b/server/mjpeg_encoder.c
> > +index aea4964..f465d88 100644
> > +--- a/server/mjpeg_encoder.c
> > ++++ b/server/mjpeg_encoder.c
> > +@@ -23,6 +23,7 @@
> > + #include "mjpeg_encoder.h"
> > + #include <jerror.h>
> > + #include <jpeglib.h>
> > ++#include <inttypes.h>
> > +
> > + #define MJPEG_MAX_FPS 25
> > + #define MJPEG_MIN_FPS 1
> > +@@ -66,7 +67,7 @@ static const int mjpeg_quality_samples[MJPEG_QUALITY=
_SAMPLE_NUM]
> =3D {20, 30, 40,
> > +  * are not necessarily related to mis-estimation of the bit rate, and
> we would
> > +  * like to wait till the stream stabilizes.
> > +  */
> > +-#define MJPEG_WARMUP_TIME 3000L // 3 sec
> > ++#define MJPEG_WARMUP_TIME 3000LL // 3 sec
> > +
> > + enum {
> > +     MJPEG_QUALITY_EVAL_TYPE_SET,
> > +@@ -638,7 +639,7 @@ static void mjpeg_encoder_adjust_params_to_bit_rat=
e(MJpegEncoder
> *encoder)
> > +
> > +     spice_debug("cur-fps=3D%u new-fps=3D%u (new/old=3D%.2f) |"
> > +                 "bit-rate=3D%.2f (Mbps) latency=3D%u (ms) quality=3D%=
d |"
> > +-                " new-size-avg %lu , base-size %lu, (new/old=3D%.2f) =
",
> > ++                " new-size-avg %"PRIu64" , base-size %"PRIu64",
> (new/old=3D%.2f) ",
> > +                 rate_control->fps, new_fps, ((double)new_fps)/rate_
> control->fps,
> > +                 ((double)rate_control->byte_rate*8)/1024/1024,
> > +                 latency,
> > +@@ -703,7 +704,7 @@ static void mjpeg_encoder_adjust_fps(MJpegEncoder
> *encoder, uint64_t now)
> > +
> > +         avg_fps =3D ((double)rate_control->adjusted_fps_num_frames*10=
00)
> /
> > +                   adjusted_fps_time_passed;
> > +-        spice_debug("#frames-adjust=3D%lu #adjust-time=3D%lu
> avg-fps=3D%.2f",
> > ++        spice_debug("#frames-adjust=3D%"PRIu64" #adjust-time=3D%"PRIu=
64"
> avg-fps=3D%.2f",
> > +                     rate_control->adjusted_fps_num_frames,
> adjusted_fps_time_passed, avg_fps);
> > +         spice_debug("defined=3D%u old-adjusted=3D%.2f", rate_control-=
>fps,
> rate_control->adjusted_fps);
> > +         fps_ratio =3D avg_fps / rate_control->fps;
> > +diff --git a/server/red_worker.c b/server/red_worker.c
> > +index 619f7bc..1871e13 100644
> > +--- a/server/red_worker.c
> > ++++ b/server/red_worker.c
> > +@@ -2594,8 +2594,8 @@ static void red_print_stream_stats(DisplayChanne=
lClient
> *dcc, StreamAgent *agent
> > +         mjpeg_encoder_get_stats(agent->mjpeg_encoder, &encoder_stats)=
;
> > +     }
> > +
> > +-    spice_debug("stream=3D%ld dim=3D(%dx%d) #in-frames=3D%lu
> #in-avg-fps=3D%.2f #out-frames=3D%lu "
> > +-                "out/in=3D%.2f #drops=3D%lu (#pipe=3D%lu #fps=3D%lu)
> out-avg-fps=3D%.2f "
> > ++    spice_debug("stream=3D%"PRIdPTR" dim=3D(%dx%d) #in-frames=3D%"PRI=
u64"
> #in-avg-fps=3D%.2f #out-frames=3D%"PRIu64" "
> > ++                "out/in=3D%.2f #drops=3D%"PRIu64" (#pipe=3D%"PRIu64"
> #fps=3D%"PRIu64") out-avg-fps=3D%.2f "
> > +                 "passed-mm-time(sec)=3D%.2f size-total(MB)=3D%.2f
> size-per-sec(Mbps)=3D%.2f "
> > +                 "size-per-frame(KBpf)=3D%.2f avg-quality=3D%.2f "
> > +                 "start-bit-rate(Mbps)=3D%.2f end-bit-rate(Mbps)=3D%.2=
f",
> > +--
> > +2.10.2
> > +
> > diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice=
/
> spice_git.bb
> > index 6f1be3a..cf5c569 100644
> > --- a/recipes-support/spice/spice_git.bb
> > +++ b/recipes-support/spice/spice_git.bb
> > @@ -36,6 +36,7 @@ SRC_URI +=3D " \
> >          file://configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.pat=
ch
> \
> >          file://build-allow-separated-src-and-build-dirs.patch \
> >          file://0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-no=
t-.patch
> \
> > +        file://0001-Use-PRI-macros-in-printf-to-keep-compatibility-bet=
we.patch
> \
> >          "
> >
> >  S =3D "${WORKDIR}/git"
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f403045ff0d872fef00555240b0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jul 24, 2017 at 2:08 AM=
, He Zhe <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" targ=
et=3D"_blank">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Actually this is for =EF=BD=8D=EF=BD=85=EF=BD=94=EF=BD=81-c=
loud-services.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On 2017=E5=B9=B407=E6=9C=8824=E6=97=A5 11:27, <a href=3D"mailto:zhe.he@wind=
river.com">zhe.he@windriver.com</a> wrote:<br>
&gt; From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windri=
ver.com</a>&gt;<br>
&gt;<br>
&gt; Backport 3cb746329ea4846bd9c65e0198e694<wbr>23379b6f62 &quot;Use PRI m=
acros in printf to<br>
&gt; keep compatibility between 32/64bit system&quot; from upstream to fix =
the following<br>
&gt; errors:<br>
&gt;<br>
&gt; server/jpeg_encoder.c:639:17: error: format &#39;%lu&#39; expects argu=
ment of type &#39;long<br>
&gt; unsigned int&#39;, but argument 12 has type &#39;uint64_t {aka long lo=
ng unsigned int}&#39;<br>
&gt; [-Werror=3Dformat=3D]<br>
&gt;<br>
&gt; server/mjpeg_encoder.c:639:17: error: format &#39;%lu&#39; expects arg=
ument of type<br>
&gt; &#39;long unsigned int&#39;, but argument 13 has type &#39;uint64_t {a=
ka long long unsigned<br>
&gt; int}&#39; [-Werror=3Dformat=3D]<br>
&gt;<br>
&gt; server/mjpeg_encoder.c:706:21: error: format &#39;%lu&#39; expects arg=
ument of type<br>
&gt; &#39;long unsigned int&#39;, but argument 6 has type &#39;uint64_t {ak=
a long long unsigned<br>
&gt; int}&#39; [-Werror=3Dformat=3D]<br>
&gt;<br>
&gt; server/mjpeg_encoder.c:706:21: error: format &#39;%lu&#39; expects arg=
ument of type<br>
&gt; &#39;long unsigned int&#39;, but argument 7 has type &#39;uint64_t {ak=
a long long unsigned<br>
&gt; int}&#39; [-Werror=3Dformat=3D]<br>
&gt;<br>
&gt; server/mjpeg_encoder.c:936:75: error: integer overflow in expression<b=
r>
&gt; [-Werror=3Doverflow]<br>
&gt;<br>
&gt; Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.=
he@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...ros-in-printf-to-keep-<wbr>compatibility-betwe.patch | 72 +++=
+++++++++++++++++++<br>
&gt;=C2=A0 recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">spice_<wbr>git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 73 insertions(+)<br>
&gt;=C2=A0 create mode 100644 recipes-support/spice/files/<wbr>0001-Use-PRI=
-macros-in-printf-<wbr>to-keep-compatibility-betwe.<wbr>patch<br>
&gt;<br>
&gt; diff --git a/recipes-support/spice/files/<wbr>0001-Use-PRI-macros-in-p=
rintf-<wbr>to-keep-compatibility-betwe.<wbr>patch b/recipes-support/spice/f=
iles/<wbr>0001-Use-PRI-macros-in-printf-<wbr>to-keep-compatibility-betwe.<w=
br>patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..18fa8fa<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-support/spice/files/<wbr>0001-Use-PRI-macros-in-printf-<=
wbr>to-keep-compatibility-betwe.<wbr>patch<br>
&gt; @@ -0,0 +1,72 @@<br>
&gt; +From 3cb746329ea4846bd9c65e0198e694<wbr>23379b6f62 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: =3D?UTF-8?q?=3DEC=3D86=3D8C=3DEB=3DB3=3D91=3D<wbr>EC=3DB2=3DA0?=
=3D &lt;<a href=3D"mailto:byungchul.so@samsung.com">byungchul.so@samsung.co=
m</a>&gt;<br>
&gt; +Date: Thu, 24 Apr 2014 12:26:32 +0000<br>
&gt; +Subject: [PATCH] Use PRI macros in printf to keep compatibility betwe=
en<br>
&gt; + 32/64bit system<br>
&gt; +<br>
&gt; +gcc&#39;s some integer type definitions are different between 32/64bi=
t system.<br>
&gt; +This causes platform dependency problem with printf function. However=
,<br>
&gt; +we can avoid this problem by using PRI macros that supports platform<=
br>
&gt; +independent printf.<br>
&gt; +---<br>
&gt; + server/mjpeg_encoder.c | 7 ++++---<br>
&gt; + server/red_worker.c=C2=A0 =C2=A0 | 4 ++--<br>
&gt; + 2 files changed, 6 insertions(+), 5 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/server/mjpeg_encoder.c b/server/mjpeg_encoder.c<br>
&gt; +index aea4964..f465d88 100644<br>
&gt; +--- a/server/mjpeg_encoder.c<br>
&gt; ++++ b/server/mjpeg_encoder.c<br>
&gt; +@@ -23,6 +23,7 @@<br>
&gt; + #include &quot;mjpeg_encoder.h&quot;<br>
&gt; + #include &lt;jerror.h&gt;<br>
&gt; + #include &lt;jpeglib.h&gt;<br>
&gt; ++#include &lt;inttypes.h&gt;<br>
&gt; +<br>
&gt; + #define MJPEG_MAX_FPS 25<br>
&gt; + #define MJPEG_MIN_FPS 1<br>
&gt; +@@ -66,7 +67,7 @@ static const int mjpeg_quality_samples[MJPEG_<wbr>Q=
UALITY_SAMPLE_NUM] =3D {20, 30, 40,<br>
&gt; +=C2=A0 * are not necessarily related to mis-estimation of the bit rat=
e, and we would<br>
&gt; +=C2=A0 * like to wait till the stream stabilizes.<br>
&gt; +=C2=A0 */<br>
&gt; +-#define MJPEG_WARMUP_TIME 3000L // 3 sec<br>
&gt; ++#define MJPEG_WARMUP_TIME 3000LL // 3 sec<br>
&gt; +<br>
&gt; + enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MJPEG_QUALITY_EVAL_TYPE_SET,<br>
&gt; +@@ -638,7 +639,7 @@ static void mjpeg_encoder_adjust_params_<wbr>to_b=
it_rate(MJpegEncoder *encoder)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spice_debug(&quot;cur-fps=3D%u new-fps=3D%u (new/=
old=3D%.2f) |&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;b=
it-rate=3D%.2f (Mbps) latency=3D%u (ms) quality=3D%d |&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; new-s=
ize-avg %lu , base-size %lu, (new/old=3D%.2f) &quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; new-s=
ize-avg %&quot;PRIu64&quot; , base-size %&quot;PRIu64&quot;, (new/old=3D%.2=
f) &quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rate_co=
ntrol-&gt;fps, new_fps, ((double)new_fps)/rate_<wbr>control-&gt;fps,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((doubl=
e)rate_control-&gt;byte_<wbr>rate*8)/1024/1024,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0latency=
,<br>
&gt; +@@ -703,7 +704,7 @@ static void mjpeg_encoder_adjust_fps(<wbr>MJpegEn=
coder *encoder, uint64_t now)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avg_fps =3D ((double)rate_control-&=
gt;<wbr>adjusted_fps_num_frames*1000) /<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
adjusted_fps_time_passed;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 spice_debug(&quot;#frames-adjust=3D%<wbr=
>lu #adjust-time=3D%lu avg-fps=3D%.2f&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 spice_debug(&quot;#frames-adjust=3D%&quo=
t;<wbr>PRIu64&quot; #adjust-time=3D%&quot;PRIu64&quot; avg-fps=3D%.2f&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0rate_control-&gt;adjusted_fps_<wbr>num_frames, adjusted_fps_time_pas=
sed, avg_fps);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spice_debug(&quot;defined=3D%u old-=
adjusted=3D%.2f&quot;, rate_control-&gt;fps, rate_control-&gt;adjusted_fps)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fps_ratio =3D avg_fps / rate_contro=
l-&gt;fps;<br>
&gt; +diff --git a/server/red_worker.c b/server/red_worker.c<br>
&gt; +index 619f7bc..1871e13 100644<br>
&gt; +--- a/server/red_worker.c<br>
&gt; ++++ b/server/red_worker.c<br>
&gt; +@@ -2594,8 +2594,8 @@ static void red_print_stream_stats(<wbr>Display=
ChannelClient *dcc, StreamAgent *agent<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mjpeg_encoder_get_stats(agent-<wbr>=
&gt;mjpeg_encoder, &amp;encoder_stats);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 spice_debug(&quot;stream=3D%ld dim=3D(%dx%d) #in-frame=
s=3D%lu #in-avg-fps=3D%.2f #out-frames=3D%lu &quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;out/in=
=3D%.2f #drops=3D%lu (#pipe=3D%lu #fps=3D%lu) out-avg-fps=3D%.2f &quot;<br>
&gt; ++=C2=A0 =C2=A0 spice_debug(&quot;stream=3D%&quot;PRIdPTR&quot; dim=3D=
(%dx%d) #in-frames=3D%&quot;PRIu64&quot; #in-avg-fps=3D%.2f #out-frames=3D%=
&quot;PRIu64&quot; &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;out/in=
=3D%.2f #drops=3D%&quot;PRIu64&quot; (#pipe=3D%&quot;PRIu64&quot; #fps=3D%&=
quot;PRIu64&quot;) out-avg-fps=3D%.2f &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;p=
assed-mm-time(sec)=3D%.2f size-total(MB)=3D%.2f size-per-sec(Mbps)=3D%.2f &=
quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;s=
ize-per-frame(KBpf)=3D%.2f avg-quality=3D%.2f &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;s=
tart-bit-rate(Mbps)=3D%.2f end-bit-rate(Mbps)=3D%.2f&quot;,<br>
&gt; +--<br>
&gt; +2.10.2<br>
&gt; +<br>
&gt; diff --git a/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=
=3D"noreferrer" target=3D"_blank">spice_<wbr>git.bb</a> b/recipes-support/s=
pice/<a href=3D"http://spice_git.bb" rel=3D"noreferrer" target=3D"_blank">s=
pice_<wbr>git.bb</a><br>
&gt; index 6f1be3a..cf5c569 100644<br>
&gt; --- a/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">spice_<wbr>git.bb</a><br>
&gt; +++ b/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">spice_<wbr>git.bb</a><br>
&gt; @@ -36,6 +36,7 @@ SRC_URI +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure.ac-add-<wbr>subdir-=
objects-to-AM_INIT_<wbr>AUTOMAKE.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://build-allow-separated-<wbr>sr=
c-and-build-dirs.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-red_parse_qxl-Fix-<wbr>B=
ITMAP_FMT_IS_RGB-defined-but-<wbr>not-.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-PRI-macros-in-<wbr>printf=
-to-keep-compatibility-<wbr>betwe.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
--<br>
</div></div><div class=3D"HOEnZb"><div class=3D"h5">_______________________=
_______<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div>

--f403045ff0d872fef00555240b0c--
